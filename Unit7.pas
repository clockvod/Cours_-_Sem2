unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ExtCtrls;

type
  TForm7 = class(TForm)
    lbName: TLabeledEdit;
    spinHours: TSpinEdit;
    Label1: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
  private
    function GetName: string;
    function GetHours: integer;
  public
    property Name: string read GetName;
    property Hours: integer read GetHours;
    function ShowEditStudent(const Name : string; Hours : integer): Integer;
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.FormShow(Sender: TObject);
begin
  spinHours.SetFocus;
end;

function TForm7.GetName: string;
begin
  Result := lbName.Text;
end;

function TForm7.GetHours: integer;
begin
  Result := spinHours.Value;
end;

function TForm7.ShowEditStudent(const Name : string; Hours : integer): Integer;
begin
  lbName.Text := Name;
  spinHours.Value := Hours;
  Result := ShowModal;
end;

end.
