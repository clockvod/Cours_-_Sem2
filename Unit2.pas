unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, ActnList, ShellAPI,
  System.Actions;

type
  TMissingHours = record
    Day : string;
    Hours : integer;
  end;

  TStudentInfo = record
    Name : string;
    Home : string;
    Phone : string;
    Birthday : TDateTime;
    Omission : array of TMissingHours;
  end;
  TfFull = class(TForm)
    panelButtons: TPanel;
    btnAddItem: TButton;
    btnEditItem: TButton;
    btnRemoveItem: TButton;
    lvStudents: TListView;
    ActionList1: TActionList;
    actAddStudent: TAction;
    actEditStudent: TAction;
    actRemoveStudent: TAction;
    procedure actAddStudentExecute(Sender: TObject);
    procedure actEditStudentExecute(Sender: TObject);
    procedure actRemoveStudentExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure LoadArrayFromFile;
    procedure View_UpdateList;
    function CheckSize : integer;
    procedure SaveArrayToFile;
    function ArrayName (i : integer) : string;
    function ArrayHome (i : integer) : string;
    function ArrayPhone (i : integer) : string;
    function ArrayBirthday (i : integer) : TDateTime;
    procedure SortStudent;
    function SendHours (k : integer; i : integer) : integer;
    procedure AddDay (Day : string; k : integer);
    function CheckSizeOfOmission : integer;
    function SendDay (i : integer) : string;
    procedure AssignHours(i, j, x : integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvStudentsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvStudentsCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
    FStudent: array of TStudentInfo;
    procedure Model_AddItem(const Name, Home, Phone: string; Birthday: TDateTime);
    procedure Model_EditItem(Index: Integer; const Name, Home, Phone: string; Birthday: TDateTime);
    procedure Model_RemoveItem(Index: Integer);
  public
    { Public declarations }
  end;

var
  fFull: TfFull;
  ColumnToSort: integer;

implementation

uses Unit4, Unit6;

{$R *.dfm}

function TfFull.CheckSize : integer;
begin
  Result := Length(FStudent);
end;

function TfFull.CheckSizeOfOmission : integer;
begin
  Result := Length(FStudent[0].Omission);
end;

procedure TfFull.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveArrayToFile;
end;

function TfFull.SendHours (k, i : integer) : integer;
begin
  Result := FStudent[i].Omission[k].Hours;
end;

function TfFull.SendDay (i : integer) : string;
begin
  Result := FStudent[0].Omission[i].Day;
end;

procedure TfFull.AddDay (Day : string; k : integer);
var
  i : integer;
begin
  for i := 0 to Length(FStudent)-1 do
  begin
    SetLength(FStudent[i].Omission, k+1);
    FStudent[i].Omission[k].Day := Day;
    FStudent[i].Omission[k].Hours := 0;
  end;
end;

procedure TfFull.LoadArrayFromFile;
var
  a, b : string;
  main, miss : textFile;
  i, j : integer;
begin
  i := 0;
  assignFile(main, 'Full.txt');
  reset(main);
  a := '';

  while not EoF(main) do
  begin
    setLength(FStudent, i+1);
    readln(main, FStudent[i].Name);
    readln(main, FStudent[i].Home);
    readln(main, FStudent[i].Phone);
    readln(main, a);
    FStudent[i].Birthday := StrToDate(a);
    inc(i);
  end;
  closeFile(main);



  j := 0;
  assignFile(miss, 'Omissions.txt');
  reset(miss);

  while not EoF(miss) do
  begin
    for i := 0 to Length(FStudent)-1 do
    begin
      setLength(FStudent[i].Omission, j+1);
    end;

    readln(miss, a);

    for i := 0 to Length(FStudent)-1 do
    begin
      FStudent[i].Omission[j].Day := a;
      readln(miss, b);
      FStudent[i].Omission[j].Hours := StrToInt(b);
    end;

    inc(j);
  end;
  closeFile(miss);
end;

procedure TfFull.lvStudentsColumnClick(Sender: TObject; Column: TListColumn);
begin
  ColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TfFull.lvStudentsCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  i : integer;
begin
  if ColumnToSort = 0 then
  Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  begin
    i := ColumnToSort - 1;
    Compare := CompareText(Item1.SubItems[i], Item2.SubItems[i]);
  end;
end;

procedure TfFull.SaveArrayToFile;
var
  main, miss : textFile;
  i, j : integer;
begin
  assignFile(main, 'Full.txt');
  rewrite(main);

  for i := 0 to Length(FStudent)-1 do
  begin
    writeln(main, FStudent[i].Name);
    writeln(main, FStudent[i].Home);
    writeln(main, FStudent[i].Phone);
    writeln(main, DateToStr(FStudent[i].Birthday));
  end;
  closeFile(main);


  assignFile(miss,'Omissions.txt');
  rewrite(miss);

  for i := 0 to Length(FStudent[0].Omission)-1 do
  begin
    writeln(miss, FStudent[0].Omission[i].Day);
    for j := 0 to Length(FStudent)-1 do
    begin
      writeln(miss, IntToStr(FStudent[j].Omission[i].Hours));
    end;
  end;
  closeFile(miss);
end;

procedure TfFull.AssignHours(i, j, x : integer);
begin
  FStudent[i].Omission[j].Hours := x;
end;

function TfFull.ArrayName (i : integer) : string;
begin
  Result := FStudent[i].Name;
end;

function TfFull.ArrayHome (i : integer) : string;
begin
  Result := FStudent[i].Home;
end;

function TfFull.ArrayPhone (i : integer) : string;
begin
  Result := FStudent[i].Phone;
end;

function TfFull.ArrayBirthday (i : integer) : TDateTime;
begin
  Result := FStudent[i].Birthday;
end;

procedure TfFull.SortStudent;
var i, k, j : integer;
    temp : TStudentInfo;
begin
  k := Length(FStudent)-1;
  for i := 0 to k do
    for j := i+1 to k do
      if FStudent[i].Name > FStudent[j].Name then
      begin
        temp := FStudent[i];
        FStudent[i] := FStudent[j];
        FStudent[j] := temp;
      end;
end;

procedure TfFull.Model_AddItem(const Name, Home, Phone: string; Birthday: TDateTime);
var
  Index, i, Size: Integer;
begin
  Index := Length(FStudent);
  SetLength(FStudent, Index + 1);
  FStudent[Index].Name := Name;
  FStudent[Index].Home := Home;
  FStudent[Index].Phone := Phone;
  FStudent[Index].Birthday := Birthday;
  Size := Length(FStudent[0].Omission);
  SetLength(FStudent[Index].Omission, Size);
  for i := 0 to (Size - 1) do
  begin
    FStudent[Index].Omission[i].Day := FStudent[0].Omission[i].Day;
    FStudent[Index].Omission[i].Hours := 0;
  end;
end;

procedure TfFull.Model_EditItem(Index: Integer; const Name, Home, Phone: string; Birthday: TDateTime);
begin
  FStudent[Index].Name := Name;
  FStudent[Index].Home := Home;
  FStudent[Index].Phone := Phone;
  FStudent[Index].Birthday := Birthday;
end;

procedure TfFull.Model_RemoveItem(Index: Integer);
var
  I: Integer;
begin
  for I := Index to High(FStudent) - 1 do
    FStudent[I] := FStudent[I + 1];
  SetLength(FStudent, Length(FStudent) - 1);
end;

procedure TfFull.View_UpdateList;
var
  Item: TListItem;
  I: Integer;
begin
  lvStudents.Items.Clear;
  for I := Low(FStudent) to High(FStudent) do
  begin
    Item := lvStudents.Items.Add;
    Item.Caption := FStudent[I].Name;
    Item.SubItems.Add(FStudent[I].Home);
    Item.SubItems.Add(FStudent[I].Phone);
    Item.SubItems.Add(DateToStr(FStudent[I].Birthday));
  end;
end;

procedure TfFull.actAddStudentExecute(Sender: TObject);
var
  Res: TModalResult;
begin
  Res := Form4.ShowNewStudent;
  if Res <> mrOk then Exit;

  with Form4 do
    Model_AddItem(Name, Home, Phone, Birthday);
  SortStudent;
  View_UpdateList;
end;

procedure TfFull.actEditStudentExecute(Sender: TObject);
var
  Res: TModalResult;
  Index: Integer;
begin
  Index := lvStudents.ItemIndex;

  Res := Form4.ShowEditStudent(
    FStudent[Index].Name,
    FStudent[Index].Home,
    FStudent[Index].Phone,
    FStudent[Index].Birthday);
  if Res <> mrOk then Exit;

  with Form4 do
    Model_EditItem(Index, Name, Home, Phone, Birthday);
  View_UpdateList;
end;

procedure TfFull.actRemoveStudentExecute(Sender: TObject);
begin
  Model_RemoveItem(lvStudents.ItemIndex);
  View_UpdateList;
end;

procedure TfFull.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  actAddStudent.Enabled := True;
  actEditStudent.Enabled := (lvStudents.ItemIndex <> -1);
  actRemoveStudent.Enabled := (lvStudents.ItemIndex <> -1);
end;


end.
