unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls;

type

  TForm3 = class(TForm)
    lvSubgroup1: TListView;
    procedure View_UpdateList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm3.View_UpdateList;
var
  Item: TListItem;
  i: Integer;
begin
  lvSubgroup1.Items.Clear;
  for I := 0 to ((fFull.CheckSize-1) div 2) do
  begin
    Item := lvSubgroup1.Items.Add;
    Item.Caption := fFull.ArrayName(i);
    Item.SubItems.Add(fFull.ArrayHome(i));
    Item.SubItems.Add(fFull.ArrayPhone(i));
    Item.SubItems.Add(DateToStr(fFull.ArrayBirthday(i)));
  end;
end;

end.
