unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TForm5 = class(TForm)
    lvSubgroup2: TListView;
    procedure View_UpdateList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm5.View_UpdateList;
var
  Item: TListItem;
  i: Integer;
begin
  lvSubgroup2.Items.Clear;
  for I := (((fFull.CheckSize-1) div 2) + 1) to (fFull.CheckSize-1) do
  begin
    Item := lvSubgroup2.Items.Add;
    Item.Caption := fFull.ArrayName(i);
    Item.SubItems.Add(fFull.ArrayHome(i));
    Item.SubItems.Add(fFull.ArrayPhone(i));
    Item.SubItems.Add(DateToStr(fFull.ArrayBirthday(i)));
  end;
end;

end.
