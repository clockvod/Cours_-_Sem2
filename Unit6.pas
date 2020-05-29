unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfTodayOmissions = class(TForm)
    lvOmissions: TListView;
    Panel1: TPanel;
    btnEdit: TButton;
    ActionList1: TActionList;
    DateTimePicker1: TDateTimePicker;
    btnOK: TButton;
    actEditBtn: TAction;
    actChooseDate: TAction;
    procedure actChooseDateExecute(Sender: TObject);
    procedure View_UpdateList (k : integer);
    procedure actEditBtnExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Model_EditItem(Index: Integer; const Hours : integer);
  public
    { Public declarations }
  end;

var
  fTodayOmissions: TfTodayOmissions;
  pointer : integer;

implementation

{$R *.dfm}

uses Unit2, Unit7;

procedure TfTodayOmissions.View_UpdateList (k : integer);
var
  Item: TListItem;
  i: Integer;
begin
  lvOmissions.Items.Clear;
  for i := 0 to fFull.CheckSize-1 do
  begin
    Item := lvOmissions.Items.Add;
    Item.Caption := fFull.ArrayName(i);
    Item.SubItems.Add(IntToStr(fFull.SendHours(k, i)));
  end;
end;



procedure TfTodayOmissions.actChooseDateExecute(Sender: TObject);
var
  ChosenDay : string;
  i : integer;
  isExist : Boolean;
begin
  ChosenDay := DateToStr(DateTimePicker1.DateTime);
  isExist := False;
  i := 0;

  while (not isExist) and (i <= fFull.CheckSizeOfOmission-1) do
  begin
    if ChosenDay = fFull.SendDay(i) then
    begin
      pointer := i;
      View_UpdateList(pointer);
      isExist := True;
    end;
    inc(i);
  end;

  if not isExist then
  begin
    pointer := i;
    fFull.AddDay(ChosenDay, i);
    View_UpdateList(i);
  end;

end;

procedure TfTodayOmissions.Model_EditItem(Index: Integer; const Hours : integer);
begin
  fFull.AssignHours(Index, pointer, Hours);
end;


procedure TfTodayOmissions.actEditBtnExecute(Sender: TObject);
var
  Res: TModalResult;
  Index: Integer;
begin
  Index := lvOmissions.ItemIndex;

  Res := Form7.ShowEditStudent(
    fFull.ArrayName(Index),
    fFull.SendHours(pointer, Index+1));
  if Res <> mrOk then Exit;

  with Form7 do
    Model_EditItem(Index, Hours);
  View_UpdateList(pointer);
end;

procedure TfTodayOmissions.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  actChooseDate.Enabled := True;
  actEditBtn.Enabled := (lvOmissions.ItemIndex <> -1);
end;

procedure TfTodayOmissions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fFull.SaveArrayToFile;
end;

end.
