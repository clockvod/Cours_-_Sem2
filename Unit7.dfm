object Form7: TForm7
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 181
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 115
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 66
    Width = 178
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1074#1086' '#1087#1088#1086#1087#1091#1097#1077#1085#1099#1093' '#1095#1072#1089#1086#1074
  end
  object lbName: TLabeledEdit
    Left = 16
    Top = 24
    Width = 233
    Height = 24
    EditLabel.Width = 27
    EditLabel.Height = 16
    EditLabel.Caption = #1060#1048#1054
    Enabled = False
    TabOrder = 3
  end
  object spinHours: TSpinEdit
    Left = 73
    Top = 88
    Width = 121
    Height = 26
    MaxValue = 14
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object btnOK: TButton
    Left = 16
    Top = 136
    Width = 105
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 144
    Top = 136
    Width = 105
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
