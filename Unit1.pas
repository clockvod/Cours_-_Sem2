unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TfMainPage = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ActionList1: TActionList;
    actInformation: TAction;
    actSubgroup1: TAction;
    actSubgroup2: TAction;
    actMissingHours: TAction;
    procedure actInformationExecute(Sender: TObject);
    procedure actSubgroup1Execute(Sender: TObject);
    procedure actSubgroup2Execute(Sender: TObject);
    procedure actMissingHoursExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMainPage: TfMainPage;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit5, Unit6;


procedure TfMainPage.actInformationExecute(Sender: TObject);
begin
  if fFull.CheckSize < 1 then
    fFull.LoadArrayFromFile;

  fFull.View_UpdateList;
  fFull.ShowModal;
end;


procedure TfMainPage.actMissingHoursExecute(Sender: TObject);
begin
  if fFull.CheckSize < 1 then
    fFull.LoadArrayFromFile;

  fTodayOmissions.ShowModal;
end;

procedure TfMainPage.actSubgroup1Execute(Sender: TObject);
begin
  if fFull.CheckSize < 1 then
    fFull.LoadArrayFromFile;

  Form3.View_UpdateList;
  Form3.ShowModal;
end;

procedure TfMainPage.actSubgroup2Execute(Sender: TObject);
begin
  if fFull.CheckSize < 1 then
    fFull.LoadArrayFromFile;

  Form5.View_UpdateList;
  Form5.ShowModal;
end;


end.
