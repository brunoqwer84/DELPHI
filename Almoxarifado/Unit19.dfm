object filtra_entrada: Tfiltra_entrada
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FILTRA ENTRADA'
  ClientHeight = 124
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 12
    Width = 20
    Height = 14
    Caption = 'DE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 191
    Top = 12
    Width = 13
    Height = 14
    Caption = 'A:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 55
    Width = 85
    Height = 14
    Caption = 'FORNECEDOR:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bt_ok: TButton
    Left = 32
    Top = 95
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = bt_okClick
  end
  object bt_cancelar: TButton
    Left = 221
    Top = 95
    Width = 75
    Height = 25
    Caption = 'CANCELAR'
    TabOrder = 1
    OnClick = bt_cancelarClick
  end
  object data_inicio: TDateTimePicker
    Left = 103
    Top = 8
    Width = 82
    Height = 21
    Date = 45090.000000000000000000
    Time = 0.428495092593948400
    TabOrder = 2
  end
  object data_fim: TDateTimePicker
    Left = 214
    Top = 8
    Width = 82
    Height = 21
    Date = 45090.000000000000000000
    Time = 0.428495092593948400
    TabOrder = 3
  end
  object box_fornecedor: TDBLookupComboBox
    Left = 103
    Top = 48
    Width = 193
    Height = 21
    KeyField = 'NOME'
    ListField = 'NOME'
    ListSource = DM.ds_for
    TabOrder = 4
  end
end
