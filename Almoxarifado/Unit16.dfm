object filtros_consumo: Tfiltros_consumo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FILTROS'
  ClientHeight = 235
  ClientWidth = 261
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
    Left = 44
    Top = 8
    Width = 185
    Height = 13
    Caption = 'Filtros para gera'#231#227'o do relat'#243'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 36
    Top = 40
    Width = 37
    Height = 13
    Caption = 'SETOR:'
  end
  object Label3: TLabel
    Left = 35
    Top = 118
    Width = 38
    Height = 13
    Caption = 'IN'#205'CIO:'
  end
  object Label4: TLabel
    Left = 51
    Top = 151
    Width = 22
    Height = 13
    Caption = 'FIM:'
  end
  object Label5: TLabel
    Left = 30
    Top = 80
    Width = 43
    Height = 13
    Caption = 'PESSOA:'
  end
  object sel_data2: TDateTimePicker
    Left = 79
    Top = 113
    Width = 145
    Height = 21
    Date = 44824.000000000000000000
    Time = 0.695178148147533600
    TabOrder = 0
  end
  object sel_data3: TDateTimePicker
    Left = 79
    Top = 148
    Width = 145
    Height = 21
    Date = 44824.000000000000000000
    Time = 0.695178148147533600
    TabOrder = 1
  end
  object Button1: TButton
    Left = 23
    Top = 206
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 171
    Top = 206
    Width = 75
    Height = 25
    Caption = 'CANCELAR'
    TabOrder = 3
    OnClick = Button2Click
  end
  object box_setor: TDBLookupComboBox
    Left = 79
    Top = 35
    Width = 145
    Height = 21
    KeyField = 'SETOR'
    ListField = 'SETOR'
    ListSource = DM.ds_setor
    TabOrder = 4
  end
  object box_pessoa: TDBLookupComboBox
    Left = 79
    Top = 75
    Width = 145
    Height = 21
    KeyField = 'NOME'
    ListField = 'NOME'
    ListSource = DM.ds_clifor
    TabOrder = 5
    OnClick = box_pessoaClick
  end
end
