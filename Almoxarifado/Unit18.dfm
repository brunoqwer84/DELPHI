object Form18: TForm18
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'BUSCA PRODUTOS'
  ClientHeight = 330
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = 'BUSCAR:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object campo: TEdit
    Left = 8
    Top = 24
    Width = 409
    Height = 21
    TabOrder = 0
    OnChange = campoChange
  end
  object grid_src: TDBGrid
    Left = 8
    Top = 55
    Width = 409
    Height = 267
    DataSource = DM.dsprd
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMEPRD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Visible = True
      end>
  end
end
