program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {fMainPage},
  Unit2 in 'Unit2.pas' {fFull},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {fTodayOmissions},
  Unit7 in 'Unit7.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMainPage, fMainPage);
  Application.CreateForm(TfFull, fFull);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TfTodayOmissions, fTodayOmissions);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
