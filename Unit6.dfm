object fTodayOmissions: TfTodayOmissions
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1087#1091#1089#1082#1080
  ClientHeight = 467
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 115
  TextHeight = 16
  object lvOmissions: TListView
    Left = 185
    Top = 0
    Width = 448
    Height = 467
    Align = alClient
    Columns = <
      item
        Caption = #1060#1048#1054
        Width = 300
      end
      item
        Caption = #1055#1088#1086#1087#1091#1089#1082#1080
        Width = -2
        WidthType = (
          -2)
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 467
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object btnEdit: TButton
      Left = 16
      Top = 32
      Width = 145
      Height = 33
      Action = actEditBtn
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 16
      Top = 104
      Width = 145
      Height = 24
      Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1077#1085#1100' '#1076#1083#1103' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      Date = 43979.000000000000000000
      Time = 0.587212858794373500
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 16
      Top = 134
      Width = 75
      Height = 25
      Action = actChooseDate
      Caption = 'OK'
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    object actEditBtn: TAction
      Caption = 'actEditBtn'
      OnExecute = actEditBtnExecute
    end
    object actChooseDate: TAction
      Caption = 'actChooseDate'
      OnExecute = actChooseDateExecute
    end
  end
end
