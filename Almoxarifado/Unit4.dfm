object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'CADASTRO DE PRODUTOS'
  ClientHeight = 547
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadprd: TPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 43
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnClick = pnl_cadprdClick
    object Label1: TLabel
      Left = 346
      Top = 8
      Width = 198
      Height = 20
      Caption = 'CADASTRO DE PRODUTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 9
      Top = 5
      Width = 33
      Height = 36
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000001
        154944415478DA63641860C038EA8041E580FF2B75031818191703993C34B2EF
        0B03E3FF18C6D0CB1BB13B6095DE0A20154E532FFF6758C1187E29128703F457
        01C9509A3A8081713563D8C5B05107E07080AE25C3EF4F8E0CBFBFF8D0C46E56
        9E2D0CAC7CFB19C32E1FC7EA00B0236632840213CA2ADA789E218C319D6135AA
        D0A803461D30EA8051070C27075C7C0A34F03F03839E0C03C3D79F0C0C3BAE31
        30041BD2C901200BDB7742D8156E0C0CCBCE3030DC79C5C010630671105D4260
        C929080DB2F4D21308BF2B888E5130A00EF8F89D81E1E15B4C71012E060639A1
        21E580190CA0405B4BAA038804C18C190CEBF03B603A831850F42090A94155AB
        1919AE33B032D8332631BCC6EB007A8351070CB803003F76A5211F53CA600000
        000049454E44AE426082}
      Proportional = True
    end
    object bt_fechar: TSpeedButton
      Left = 883
      Top = 5
      Width = 20
      Height = 20
      Flat = True
      Glyph.Data = {
        C6030000424DC60300000000000042000000280000000F0000000F0000000100
        20000300000084030000000000000000000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000AB00000061000000000000000000000000000000000000
        000000000061000000AA00000000000000000000000000000000000000000000
        000000000062000000FC00000063000000000000000000000000000000630000
        00FC000000610000000000000000000000000000000000000000000000000000
        000000000062000000FC000000690000000000000062000000FC000000690000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000063000000FC000000A2000000FC0000006300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000A1000000FF000000A1000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000630000
        00FC000000A2000000FC00000063000000000000000000000000000000000000
        00000000000000000000000000000000000000000062000000FC000000690000
        000000000062000000FC00000069000000000000000000000000000000000000
        0000000000000000000000000061000000FC0000006300000000000000000000
        000000000063000000FC00000061000000000000000000000000000000000000
        000000000000000000A700000060000000000000000000000000000000000000
        000000000061000000A600000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      OnClick = bt_fecharClick
    end
    object bt_minimize: TSpeedButton
      Left = 857
      Top = 5
      Width = 20
      Height = 20
      Flat = True
      Glyph.Data = {
        C6030000424DC60300000000000042000000280000000F0000000F0000000100
        20000300000084030000000000000000000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000400000020000000200000
        0020000000200000002000000020000000200000002000000020000000200000
        002000000004000000000000000000000020000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        0020000000000000000000000004000000200000002000000020000000200000
        0020000000200000002000000020000000200000002000000020000000040000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      OnClick = bt_minimizeClick
    end
  end
  object pnl_baixo: TPanel
    Left = 0
    Top = 43
    Width = 903
    Height = 504
    Align = alClient
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 1
    OnClick = pnl_baixoClick
    object Label2: TLabel
      Left = 9
      Top = 18
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
    object grid_prd: TDBGrid
      Left = 6
      Top = 66
      Width = 887
      Height = 431
      BiDiMode = bdLeftToRight
      DataSource = DM.dsprd
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grid_prdDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDPRD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTMIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAMOD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLUNIT'
          Visible = True
        end>
    end
    object buscaprd: TEdit
      Left = 6
      Top = 37
      Width = 629
      Height = 21
      TabOrder = 1
      OnChange = buscaprdChange
    end
    object botoes: TDBNavigator
      Left = 290
      Top = 6
      Width = 240
      Height = 25
      DataSource = DM.dsprd
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
      TabOrder = 2
      Visible = False
    end
    object pnl_cad: TPanel
      Left = 233
      Top = 144
      Width = 441
      Height = 214
      BorderStyle = bsSingle
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Label3: TLabel
        Left = 160
        Top = 16
        Width = 129
        Height = 13
        Caption = 'CADASTRO DE PRODUTOS'
      end
      object Label4: TLabel
        Left = 23
        Top = 75
        Width = 35
        Height = 13
        Caption = 'IDPRD:'
      end
      object Label5: TLabel
        Left = 4
        Top = 102
        Width = 53
        Height = 13
        Caption = 'NOMEPRD:'
      end
      object Label7: TLabel
        Left = 9
        Top = 139
        Width = 49
        Height = 13
        Caption = 'UNIDADE:'
      end
      object Label8: TLabel
        Left = 150
        Top = 139
        Width = 68
        Height = 13
        Caption = 'EST. MINIMO:'
      end
      object Label9: TLabel
        Left = 287
        Top = 139
        Width = 67
        Height = 13
        Caption = 'VALOR UNIT :'
      end
      object Label6: TLabel
        Left = 284
        Top = 75
        Width = 42
        Height = 13
        Caption = 'STATUS:'
      end
      object Edit1: TDBEdit
        Left = 64
        Top = 72
        Width = 58
        Height = 21
        DataField = 'IDPRD'
        DataSource = DM.dsprd
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object Edit2: TDBEdit
        Left = 63
        Top = 99
        Width = 361
        Height = 21
        DataField = 'NOMEPRD'
        DataSource = DM.dsprd
        TabOrder = 1
      end
      object Edit3: TDBEdit
        Left = 64
        Top = 136
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UNIDADE'
        DataSource = DM.dsprd
        TabOrder = 2
      end
      object Edit5: TDBEdit
        Left = 224
        Top = 136
        Width = 41
        Height = 21
        DataField = 'ESTMIN'
        DataSource = DM.dsprd
        TabOrder = 3
      end
      object Edit6: TDBEdit
        Left = 360
        Top = 136
        Width = 65
        Height = 21
        DataField = 'VLUNIT'
        DataSource = DM.dsprd
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object Button1: TButton
        Left = 296
        Top = 171
        Width = 75
        Height = 25
        Caption = 'CANCELAR'
        TabOrder = 6
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 64
        Top = 171
        Width = 75
        Height = 25
        Caption = 'SALVAR'
        TabOrder = 5
        OnClick = Button2Click
      end
      object box_status: TComboBox
        Left = 328
        Top = 72
        Width = 97
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        Items.Strings = (
          'ATIVO'
          'INATIVO')
      end
    end
    object Button3: TButton
      Left = 665
      Top = 35
      Width = 104
      Height = 25
      Caption = 'CADASTRAR NOVO'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 788
      Top = 35
      Width = 105
      Height = 25
      Caption = 'EDITAR SELE'#199#195'O'
      TabOrder = 5
      OnClick = Button4Click
    end
  end
end
