object fFull: TfFull
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  ClientHeight = 503
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object panelButtons: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 503
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnAddItem: TButton
      Left = 10
      Top = 34
      Width = 169
      Height = 33
      Action = actAddStudent
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object btnEditItem: TButton
      Left = 10
      Top = 80
      Width = 169
      Height = 34
      Action = actEditStudent
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnRemoveItem: TButton
      Left = 10
      Top = 128
      Width = 169
      Height = 33
      Action = actRemoveStudent
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object lvStudents: TListView
    Left = 185
    Top = 0
    Width = 890
    Height = 503
    Align = alClient
    Columns = <
      item
        Caption = #1060#1048#1054
        MinWidth = 50
        Width = 300
      end
      item
        Caption = #1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
        MinWidth = 50
        Width = 300
      end
      item
        Caption = #1053#1086#1084#1077#1088
        MinWidth = 50
        Width = 150
      end
      item
        Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
        MinWidth = 50
        Width = -2
        WidthType = (
          -2)
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnColumnClick = lvStudentsColumnClick
    OnCompare = lvStudentsCompare
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 8
    Top = 192
    object actAddStudent: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = actAddStudentExecute
    end
    object actEditStudent: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = actEditStudentExecute
    end
    object actRemoveStudent: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = actRemoveStudentExecute
    end
  end
end
