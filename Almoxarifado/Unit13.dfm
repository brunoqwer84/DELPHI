object edita_mov: Tedita_mov
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'EDITAR ITENS DE MOVIMENTO'
  ClientHeight = 212
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 71
    Height = 13
    Caption = 'MOVIMENTO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 260
    Top = 8
    Width = 30
    Height = 13
    Caption = 'FCFO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 22
    Top = 80
    Width = 57
    Height = 13
    Caption = 'PRODUTO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 413
    Top = 80
    Width = 69
    Height = 13
    Caption = 'QTD. ATUAL:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 417
    Top = 124
    Width = 65
    Height = 13
    Caption = 'NOVA QTD. :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 168
    Top = 8
    Width = 30
    Height = 13
    Caption = 'TIPO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MOV: TEdit
    Left = 85
    Top = 5
    Width = 60
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object nomecfo: TEdit
    Left = 296
    Top = 5
    Width = 249
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object nome_prd: TEdit
    Left = 85
    Top = 77
    Width = 284
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object qtd_atual: TEdit
    Left = 488
    Top = 77
    Width = 57
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object qtd_prd: TEdit
    Left = 488
    Top = 121
    Width = 57
    Height = 21
    TabOrder = 4
    OnKeyPress = qtd_prdKeyPress
  end
  object Button1: TButton
    Left = 70
    Top = 180
    Width = 75
    Height = 25
    Caption = 'SALVAR'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 398
    Top = 180
    Width = 75
    Height = 25
    Caption = 'CANCELAR'
    TabOrder = 6
    OnClick = Button2Click
  end
  object tipo: TEdit
    Left = 205
    Top = 5
    Width = 36
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object ENTRADA: TButton
    Left = 168
    Top = 124
    Width = 75
    Height = 25
    Caption = 'ENTRADA'
    TabOrder = 8
    Visible = False
    OnClick = ENTRADAClick
  end
  object SAIDA: TButton
    Left = 288
    Top = 124
    Width = 75
    Height = 25
    Caption = 'SAIDA'
    TabOrder = 9
    Visible = False
    OnClick = SAIDAClick
  end
end
