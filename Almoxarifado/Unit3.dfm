object load: Tload
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'load'
  ClientHeight = 97
  ClientWidth = 408
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
    Left = 121
    Top = 63
    Width = 157
    Height = 13
    Caption = 'Carregando Sistema, Aguarde...'
  end
  object pb: TProgressBar
    Left = 32
    Top = 32
    Width = 361
    Height = 17
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 344
    Top = 8
  end
end
