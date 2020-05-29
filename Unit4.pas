unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ExtCtrls, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    editName: TLabeledEdit;
    editHome: TLabeledEdit;
    labelBirthday: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    dateBirthday: TDateTimePicker;
    editPhone: TLabeledEdit;
    procedure FormShow(Sender: TObject);
  private
    function GetBirthday: TDateTime;
    function GetPhone: string;
    function GetName: string;
    function GetHome: string;
    { Private declarations }
  public
    property Name: string read GetName;
    property Home: string read GetHome;
    property Birthday: TDateTime read GetBirthday;
    property Phone: string read GetPhone;
    function ShowNewStudent: Integer;
    function ShowEditStudent(const Name, Home, Phone: string; Birthday: TDateTime): Integer;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}


procedure TForm4.FormShow(Sender: TObject);
begin
  editName.SetFocus;
end;

function TForm4.GetBirthday: TDateTime;
begin
  Result := dateBirthday.DateTime;
end;

function TForm4.GetPhone: string;
begin
  Result := editPhone.Text
end;

function TForm4.GetName: string;
begin
  Result := editName.Text;
end;

function TForm4.GetHome: String;
begin
  Result := editHome.Text;
end;

function TForm4.ShowEditStudent(const Name, Home, Phone : string;
  Birthday : TDateTime): Integer;
begin
  editName.Text := Name;
  editHome.Text := Home;
  dateBirthday.DateTime := Birthday;
  editPhone.Text := Phone;
  Result := ShowModal;
end;

function TForm4.ShowNewStudent: Integer;
begin
  editName.Text := '';
  editHome.Text := '';
  dateBirthday.DateTime := StrToDate('20.05.2020');
  editPhone.Text := '';
  Result := ShowModal;
end;

end.
