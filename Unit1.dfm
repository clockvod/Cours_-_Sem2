object fMainPage: TfMainPage
  Left = 0
  Top = 0
  Caption = 'Main Page'
  ClientHeight = 292
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 115
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 243
    Height = 292
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 88
    ExplicitTop = 64
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Button1: TButton
      Left = 24
      Top = 32
      Width = 190
      Height = 50
      Action = actInformation
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1090#1091#1076#1077#1085#1090#1072#1093
      TabOrder = 0
    end
    object Button2: TButton
      Left = 24
      Top = 95
      Width = 190
      Height = 50
      Action = actSubgroup1
      Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 1'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 24
      Top = 158
      Width = 190
      Height = 50
      Action = actSubgroup2
      Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 1'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 24
      Top = 219
      Width = 190
      Height = 50
      Action = actMissingHours
      Caption = #1055#1088#1086#1087#1091#1089#1082#1080
      TabOrder = 3
    end
  end
  object ActionList1: TActionList
    Top = 56
    object actInformation: TAction
      Caption = 'actInformation'
      OnExecute = actInformationExecute
    end
    object actSubgroup1: TAction
      Caption = 'actSubgroup1'
      OnExecute = actSubgroup1Execute
    end
    object actSubgroup2: TAction
      Caption = 'actSubgroup2'
      OnExecute = actSubgroup2Execute
    end
    object actMissingHours: TAction
      Caption = 'actMissingHours'
      OnExecute = actMissingHoursExecute
    end
  end
end
