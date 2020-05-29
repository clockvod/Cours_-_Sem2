object Form4: TForm4
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 215
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labelBirthday: TLabel
    Left = 8
    Top = 140
    Width = 80
    Height = 13
    Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object editName: TLabeledEdit
    Left = 8
    Top = 24
    Width = 233
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1048#1054
    TabOrder = 0
  end
  object editHome: TLabeledEdit
    Left = 7
    Top = 64
    Width = 235
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = #1052#1077#1089#1090#1086' '#1046#1080#1090#1077#1083#1100#1089#1090#1074#1072
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 8
    Top = 176
    Width = 106
    Height = 25
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 136
    Top = 176
    Width = 104
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object dateBirthday: TDateTimePicker
    Left = 104
    Top = 140
    Width = 136
    Height = 21
    Date = 43971.000000000000000000
    Time = 0.865665416669799000
    TabOrder = 3
  end
  object editPhone: TLabeledEdit
    Left = 8
    Top = 105
    Width = 232
    Height = 22
    EditLabel.Width = 86
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
