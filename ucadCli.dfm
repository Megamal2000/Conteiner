object cadCli: TcadCli
  Left = 214
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 382
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label18: TLabel
    Left = 16
    Top = 360
    Width = 19
    Height = 13
    Caption = 'Obs'
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 606
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [sbAllowDrag, sbFlatBtns, sbGrayedBtns]
    BtnOffsetHorz = 3
    BtnOffsetVert = 6
    BtnWidth = 54
    BtnHeight = 53
    Images = ImageList1
    Color = 13297644
    TabOrder = 0
    InternalVer = 1
    object Label14: TLabel
      Left = 622
      Top = 48
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbID: TLabel
      Left = 594
      Top = 8
      Width = 3
      Height = 13
      Alignment = taRightJustify
    end
    object JvSpeedBarSection1: TJvSpeedBarSection
      Caption = 'Normal'
    end
    object JvSpeedBarSection2: TJvSpeedBarSection
      Caption = 'Outros'
    end
    object btNovo: TJvSpeedItem
      BtnCaption = 'Novo'
      Caption = 'btNovo'
      Hint = 'btNovo|'
      ImageIndex = 1
      Spacing = 1
      Left = 12
      Top = 6
      Visible = True
      OnClick = btNovoClick
      SectionName = 'Normal'
    end
    object btSalvar: TJvSpeedItem
      BtnCaption = 'Salvar'
      Caption = 'btSalvar'
      Hint = 'btSalvar|'
      ImageIndex = 0
      Spacing = 1
      Left = 84
      Top = 6
      Visible = True
      OnClick = btSalvarClick
      SectionName = 'Normal'
    end
    object btApagar: TJvSpeedItem
      BtnCaption = 'Apagar'
      Caption = 'btApagar'
      Hint = 'btApagar|'
      ImageIndex = 5
      Spacing = 1
      Left = 156
      Top = 6
      OnClick = btApagarClick
      SectionName = 'Normal'
    end
    object btPesq: TJvSpeedItem
      BtnCaption = 'Pesquisar'
      Caption = 'btPesq'
      Hint = 'btPesq|'
      ImageIndex = 4
      Spacing = 1
      Left = 264
      Top = 6
      Visible = True
      OnClick = btPesqClick
      SectionName = 'Outros'
    end
    object btped: TJvSpeedItem
      BtnCaption = 'Pedido'
      Caption = 'btped'
      Glyph.Data = {
        16080000424D160800000000000036000000280000001B000000180000000100
        180000000000E0070000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FBFBFBF000000BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBF00
        0000BFBFBF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00
        FFFFFFFFFF00FFFF00000000000000000000FFFFFFFFFF00FFFFFFFFFF00FFFF
        FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007F7F
        7F7F7F7FBFBFBF000000BFBFBF00000000FFFFFFFFFF00FFFF00000000000000
        FF0000000000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7FBFBFBF000000BFBF
        BF000000FFFFFF00FFFF00000000000000000000FF0000000000000000000000
        FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
        FFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF00000000FFFF0000000000
        0000000000FF0000FF0000FF0000000000000000000000FFFFFFFFFF00FFFFFF
        FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7F
        BFBFBF000000BFBFBF000000FFFFFF00000000000000FF0000FF0000FF0000FF
        0000FF00000000000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
        FFFFFFFFFF00FFFFFFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000
        00FFFF00000000FF0000FF0000000000FF0000000000FF0000FF0000000000FF
        FFFFFFFF00FFFF00007F00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00
        00007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00000000FF0000FF00
        00000000FF0000000000FF0000FF00000000FFFFFF00007F00007F0000FF0000
        FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007F7F7F7F7F7FBFBFBF00
        0000BFBFBF00000000FFFF00000000000000000000000000FF0000FF0000FF00
        00FF0000000000007F0000FF0000FF0000FF0000FFFFFFFF00FFFFFFFFFF00FF
        FFFFFFFF00FFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00
        FFFF00000000000000FF0000FF0000FF0000FF0000007F00007F0000FF0000FF
        0000FF0000FF0000FF0000FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007F7F
        7F7F7F7FBFBFBF000000BFBFBF00000000FFFF00000000000000FF0000FF0000
        FF0000007F00007F0000FF0000FF0000FF0000FF0000FFFFFFFF0000FF0000FF
        00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7FBFBFBF000000BFBF
        BF000000FFFFFF00000000FF0000FF0000FF0000FF000000000000FF0000FF00
        00FF0000FF0000FFFFFFFF00FFFFFFFFFF0000FF0000FF00FFFFFFFFFF00FFFF
        FFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF00000000FFFF00000000FF
        0000FF0000000000FF000000000000000000000000FF0000FFFFFFFF00FFFFFF
        FFFF00FFFF0000FF0000FFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7F
        BFBFBF000000BFBFBF000000FFFFFF00000000FF0000FF0000000000FF000000
        0000FF0000FF00000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF00
        00FFFFFFFF00FFFFFFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000
        00FFFF00000000000000FF0000FF0000FF0000FF0000FF0000000000000000FF
        FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF0000FFFFFFFF00FFFF00
        00007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00FFFF000000000000
        00FF0000FF0000FF0000000000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
        FF00FFFFFFFFFF00FFFF0000FF0000FFFFFFFF0000007F7F7F7F7F7FBFBFBF00
        0000BFBFBF00000000FFFFFFFFFF00FFFF00000000000000FF00000000000000
        00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
        FF0000FF0000FF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00
        FFFFFFFFFF00FFFF00000000FF0000000000FFFFFFFFFF00FFFFFFFFFF00FFFF
        FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF0000FF7F7F
        7F7F7F7FBFBFBF000000BFBFBF00000000FFFFFFFFFF00FFFFFFFFFF00000000
        0000000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF0000FF7F7F7FBFBFBF000000BFBF
        BF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
        FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
        FFFFFF0000007F7F7F0000FFBFBFBF000000BFBFBF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000BFBFBFBFBFBF
        BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000}
      Hint = 'Inicia Consulta / Pedido'
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      Left = 381
      Top = 6
      SectionName = 'Outros'
    end
    object bthist: TJvSpeedItem
      BtnCaption = 'Hist'#243'rico'
      Caption = 'bthist'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000BFBFBFBFBFBFBFBFBF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000BFBFBFBFBFBF000000000000
        000000FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFF000000000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BF000000000000000000000000FFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFFF0000FF0000FF0000FF0000FF0000FF0000FF0000BFBF
        BF000000FFFFFFFFFFFF000000FFFFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF000000000000BFBFBFBFBFBF000000000000
        000000FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFF000000000000000000BFBFBFFFFFFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Hint = 'Hist'#243'rico do Cliente'
      Spacing = 1
      Left = 453
      Top = 6
      SectionName = 'Outros'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 89
    Width = 601
    Height = 264
    ActivePage = TabSheet1
    TabOrder = 1
    object tsContato: TTabSheet
      Caption = 'Dados Principais'
      object Label2: TLabel
        Left = 16
        Top = 25
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 16
        Top = 98
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object Label5: TLabel
        Left = 16
        Top = 124
        Width = 16
        Height = 13
        Caption = 'RG'
      end
      object Label6: TLabel
        Left = 16
        Top = 150
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label7: TLabel
        Left = 16
        Top = 64
        Width = 35
        Height = 13
        Caption = 'Pessoa'
      end
      object Label31: TLabel
        Left = 16
        Top = 176
        Width = 70
        Height = 13
        Caption = 'Inscr. Estadual'
      end
      object edNome: TEdit
        Left = 104
        Top = 22
        Width = 441
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 0
        Text = 'edNome'
        OnKeyDown = edNomeKeyDown
      end
      object edRG: TEdit
        Left = 144
        Top = 120
        Width = 137
        Height = 21
        MaxLength = 24
        TabOrder = 2
        Text = 'edRG'
        OnKeyDown = edRGKeyDown
      end
      object rbFisica: TRadioButton
        Left = 104
        Top = 62
        Width = 57
        Height = 17
        Caption = 'F'#237'sica'
        TabOrder = 4
        OnClick = rbFisicaClick
      end
      object rbJuridica: TRadioButton
        Left = 176
        Top = 64
        Width = 113
        Height = 17
        Caption = 'Jur'#237'dica'
        TabOrder = 5
        OnClick = rbJuridicaClick
      end
      object edCNPJ: TMaskEdit
        Left = 144
        Top = 145
        Width = 137
        Height = 21
        EditMask = '00\.000\.000\/0000\-00;'
        MaxLength = 18
        TabOrder = 3
        Text = '  .   .   /    -  '
        OnKeyDown = edCNPJKeyDown
      end
      object edCPF: TMaskEdit
        Left = 144
        Top = 95
        Width = 137
        Height = 21
        EditMask = '000\.000\.000\-00;'
        MaxLength = 14
        TabOrder = 1
        Text = '   .   .   -  '
        OnKeyDown = edCPFKeyDown
      end
      object edIE: TEdit
        Left = 144
        Top = 170
        Width = 137
        Height = 21
        TabOrder = 6
        Text = 'edIE'
      end
      object ckAtivo: TCheckBox
        Left = 488
        Top = 216
        Width = 97
        Height = 17
        Caption = 'Ativo'
        TabOrder = 7
      end
    end
    object tsEnder: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object Label8: TLabel
        Left = 16
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label9: TLabel
        Left = 16
        Top = 114
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label10: TLabel
        Left = 16
        Top = 144
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label11: TLabel
        Left = 16
        Top = 172
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label12: TLabel
        Left = 16
        Top = 16
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object procCEP: TSpeedButton
        Left = 208
        Top = 11
        Width = 97
        Height = 22
        Caption = 'Pesquisa CEP'
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333300003333333333333333333300003333333330033003300300003333
          3333300330033003000033303333333333333333000033000333333333333333
          000030F000333333333333330000330F000333333333333300003330F0000000
          73333333000033330F0078887033333300003333300788FF8703333300003333
          30788888F877333300003333308888888F80333300003333307888888F803333
          000033333078FF8888803333000033333777FF88887733330000333333077888
          8703333300003333333077777033333300003333333370007333333300003333
          33333333333333330000}
        OnClick = procCEPClick
      end
      object Label19: TLabel
        Left = 16
        Top = 83
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label21: TLabel
        Left = 144
        Top = 83
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label34: TLabel
        Left = 16
        Top = 201
        Width = 43
        Height = 13
        Caption = 'C'#243'd Mun'
      end
      object btCodM: TSpeedButton
        Left = 157
        Top = 196
        Width = 145
        Height = 24
        Caption = 'Pesquisar C'#243'd Munic'#237'pio'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333300003333333333333333333300003333333330033003300300003333
          3333300330033003000033303333333333333333000033000333333333333333
          000030F000333333333333330000330F000333333333333300003330F0000000
          73333333000033330F0078887033333300003333300788FF8703333300003333
          30788888F877333300003333308888888F80333300003333307888888F803333
          000033333078FF8888803333000033333777FF88887733330000333333077888
          8703333300003333333077777033333300003333333370007333333300003333
          33333333333333330000}
        OnClick = btCodMClick
      end
      object edEnder: TEdit
        Left = 76
        Top = 53
        Width = 381
        Height = 21
        MaxLength = 80
        TabOrder = 1
        Text = 'edEnder'
        OnKeyDown = edEnderKeyDown
      end
      object edBairro: TEdit
        Left = 76
        Top = 112
        Width = 213
        Height = 21
        MaxLength = 25
        TabOrder = 4
        Text = 'edBairro'
        OnKeyDown = edBairroKeyDown
      end
      object edCidade: TEdit
        Left = 76
        Top = 140
        Width = 381
        Height = 21
        MaxLength = 30
        TabOrder = 5
        Text = 'edCidade'
        OnKeyDown = edCidadeKeyDown
      end
      object edCEP: TEdit
        Left = 76
        Top = 12
        Width = 121
        Height = 21
        Color = 15662065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentFont = False
        TabOrder = 0
        Text = 'edCEP'
        OnKeyDown = edCEPKeyDown
      end
      object cbUF: TComboBox
        Left = 76
        Top = 168
        Width = 85
        Height = 21
        TabOrder = 6
        Text = 'UF'
        OnKeyDown = cbUFKeyDown
      end
      object edNum: TJvValidateEdit
        Left = 76
        Top = 79
        Width = 53
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 2
        OnKeyDown = edNumKeyDown
      end
      object edComp: TEdit
        Left = 224
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'edComp'
        OnKeyDown = edCompKeyDown
      end
      object edCmun: TJvValidateEdit
        Left = 75
        Top = 197
        Width = 78
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 7
      end
    end
    object tsTels: TTabSheet
      Caption = 'Telefones'
      ImageIndex = 2
      object Label13: TLabel
        Left = 16
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object lbTels: TLabel
        Left = 88
        Top = 16
        Width = 35
        Height = 13
        Caption = 'lbTels'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 16
        Top = 48
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label1: TLabel
        Left = 408
        Top = 48
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label26: TLabel
        Left = 200
        Top = 48
        Width = 42
        Height = 13
        Caption = 'Detalhes'
      end
      object edTel: TEdit
        Left = 456
        Top = 43
        Width = 113
        Height = 21
        MaxLength = 24
        TabOrder = 1
        Text = 'edTel'
        OnKeyDown = edTelKeyDown
      end
      object cbDesc: TComboBox
        Left = 72
        Top = 44
        Width = 105
        Height = 21
        TabOrder = 0
        Text = 'cbDesc'
        OnKeyDown = cbDescKeyDown
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 80
        Width = 465
        Height = 129
        DataSource = DataSource1
        FixedColor = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DETALHE'
            Title.Caption = 'Detalhes'
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero'
            Width = 86
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 520
        Top = 81
        Width = 49
        Height = 130
        TabOrder = 3
        object Label24: TLabel
          Left = 16
          Top = 8
          Width = 20
          Height = 13
          Caption = 'Tels'
        end
        object btSubNovo: TSpeedButton
          Left = 16
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Inserir um novo telefone'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
            8888880FFFFFF008888888000000008888888888888888888888}
          ParentShowHint = False
          ShowHint = True
          OnClick = btSubNovoClick
        end
        object btSubSalvar: TSpeedButton
          Left = 16
          Top = 62
          Width = 23
          Height = 22
          Hint = 'Salvar o telefone'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777770000000000007770330770000330777033077000033077703307700003
            30777033000000033077703333333333307770330000000330777030FFFFFFF0
            30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
            8077777CCC777700007777CCC77777777777777C777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = btSubSalvarClick
        end
        object btSubApagar: TSpeedButton
          Left = 16
          Top = 96
          Width = 23
          Height = 22
          Hint = 'Apagar um telefone'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777777777777777777700000000007777770FFFFFFFF07777770FFFFFFF
            F077771F0F888888F077711F0F85BFB8F0777711F11BFBF8F077777151788888
            F077777511FFFFFFF07775111F1FFF00007771570FF1FF0F077777770FFFFF00
            7777777700000007777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = btSubApagarClick
        end
      end
      object edDetalhes: TEdit
        Left = 248
        Top = 43
        Width = 147
        Height = 21
        TabOrder = 4
        Text = 'edDetalhes'
      end
    end
    object tsTelefone: TTabSheet
      Caption = 'Telefone'
      ImageIndex = 4
      object Label22: TLabel
        Left = 16
        Top = 48
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label23: TLabel
        Left = 288
        Top = 48
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object cbDesc2: TComboBox
        Left = 88
        Top = 44
        Width = 169
        Height = 21
        TabOrder = 0
        Text = 'Escolha'
        OnKeyDown = cbDesc2KeyDown
      end
      object edTel2: TEdit
        Left = 352
        Top = 43
        Width = 161
        Height = 21
        MaxLength = 24
        TabOrder = 1
        Text = 'edTel'
        OnKeyDown = edTel2KeyDown
      end
    end
    object tsWeb: TTabSheet
      Caption = 'Comunica'#231#227'o Web'
      ImageIndex = 4
      object lbQtweb: TLabel
        Left = 88
        Top = 16
        Width = 39
        Height = 13
        Caption = 'lbWEB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 16
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label17: TLabel
        Left = 17
        Top = 47
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label25: TLabel
        Left = 272
        Top = 48
        Width = 25
        Height = 13
        Caption = 'WEB'
      end
      object edDescricao: TEdit
        Left = 56
        Top = 43
        Width = 201
        Height = 21
        Hint = 'Descri'#231#227'o exemplo: e-mail do Jos'#233
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'edDescricao'
        OnKeyPress = edDescricaoKeyPress
      end
      object edWEB: TEdit
        Left = 304
        Top = 43
        Width = 265
        Height = 21
        Hint = 'exemplo: jose@yahoo.com.br'
        MaxLength = 24
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = 'edWEB'
        OnKeyPress = edWEBKeyPress
      end
      object DBGrid2: TDBGrid
        Left = 16
        Top = 80
        Width = 465
        Height = 129
        DataSource = DataSource2
        FixedColor = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WEB'
            Title.Caption = 'Agente WEB'
            Width = 249
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 520
        Top = 81
        Width = 49
        Height = 130
        TabOrder = 3
        object Label27: TLabel
          Left = 16
          Top = 8
          Width = 25
          Height = 13
          Caption = 'WEB'
        end
        object btiWEB: TSpeedButton
          Left = 16
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Inserir um novo Tipo de Contato'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
            8888880FFFFFF008888888000000008888888888888888888888}
          ParentShowHint = False
          ShowHint = True
          OnClick = btiWEBClick
        end
        object btsWEB: TSpeedButton
          Left = 16
          Top = 62
          Width = 23
          Height = 22
          Hint = 'Salvar o Contato'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777770000000000007770330770000330777033077000033077703307700003
            30777033000000033077703333333333307770330000000330777030FFFFFFF0
            30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
            8077777CCC777700007777CCC77777777777777C777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = btsWEBClick
        end
        object btaWEB: TSpeedButton
          Left = 16
          Top = 96
          Width = 23
          Height = 22
          Hint = 'Apagar um Contato'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777777777777777777700000000007777770FFFFFFFF07777770FFFFFFF
            F077771F0F888888F077711F0F85BFB8F0777711F11BFBF8F077777151788888
            F077777511FFFFFFF07775111F1FFF00007771570FF1FF0F077777770FFFFF00
            7777777700000007777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = btaWEBClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Cobran'#231'a'
      ImageIndex = 5
      object Label3: TLabel
        Left = 32
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Frete Peso'
      end
      object Label16: TLabel
        Left = 32
        Top = 64
        Width = 41
        Height = 13
        Caption = 'Taxa (%)'
      end
      object Label28: TLabel
        Left = 32
        Top = 96
        Width = 42
        Height = 13
        Caption = 'Entregas'
      end
      object Label29: TLabel
        Left = 32
        Top = 128
        Width = 29
        Height = 13
        Caption = 'Sa'#237'da'
      end
      object Label30: TLabel
        Left = 32
        Top = 160
        Width = 40
        Height = 13
        Caption = 'Contrato'
      end
      object Label32: TLabel
        Left = 408
        Top = 32
        Width = 52
        Height = 13
        Caption = 'Carro Extra'
      end
      object btPeso: TBitBtn
        Left = 312
        Top = 27
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 0
        OnClick = btPesoClick
      end
      object GroupBox1: TGroupBox
        Left = 112
        Top = 8
        Width = 49
        Height = 185
        Caption = 'SP'
        TabOrder = 1
        object sp1: TRadioButton
          Left = 16
          Top = 24
          Width = 20
          Height = 17
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object sp2: TRadioButton
          Left = 16
          Top = 56
          Width = 20
          Height = 17
          TabOrder = 1
        end
        object sp3: TRadioButton
          Left = 16
          Top = 88
          Width = 20
          Height = 17
          TabOrder = 2
        end
        object sp4: TRadioButton
          Left = 16
          Top = 120
          Width = 20
          Height = 17
          TabOrder = 3
        end
        object sp5: TRadioButton
          Left = 16
          Top = 152
          Width = 20
          Height = 17
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 184
        Top = 8
        Width = 49
        Height = 185
        Caption = 'GSP'
        TabOrder = 2
        object gsp1: TRadioButton
          Left = 16
          Top = 24
          Width = 20
          Height = 17
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object gsp2: TRadioButton
          Left = 16
          Top = 56
          Width = 20
          Height = 17
          TabOrder = 1
        end
        object gsp3: TRadioButton
          Left = 16
          Top = 88
          Width = 20
          Height = 17
          TabOrder = 2
        end
        object gsp4: TRadioButton
          Left = 16
          Top = 120
          Width = 20
          Height = 17
          TabOrder = 3
        end
        object gsp5: TRadioButton
          Left = 16
          Top = 152
          Width = 20
          Height = 17
          TabOrder = 4
        end
      end
      object GroupBox3: TGroupBox
        Left = 254
        Top = 8
        Width = 49
        Height = 185
        Caption = 'INT'
        TabOrder = 3
        object int1: TRadioButton
          Left = 16
          Top = 24
          Width = 20
          Height = 17
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object int2: TRadioButton
          Left = 16
          Top = 56
          Width = 20
          Height = 17
          TabOrder = 1
        end
        object int3: TRadioButton
          Left = 16
          Top = 88
          Width = 20
          Height = 17
          TabOrder = 2
        end
        object int4: TRadioButton
          Left = 16
          Top = 120
          Width = 20
          Height = 17
          TabOrder = 3
        end
        object int5: TRadioButton
          Left = 16
          Top = 152
          Width = 20
          Height = 17
          TabOrder = 4
        end
      end
      object btTaxa: TBitBtn
        Left = 312
        Top = 59
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 4
        OnClick = btTaxaClick
      end
      object btEnt: TBitBtn
        Left = 312
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 5
        OnClick = btEntClick
      end
      object btSaida: TBitBtn
        Left = 312
        Top = 124
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 6
        OnClick = btSaidaClick
      end
      object btContrato: TBitBtn
        Left = 312
        Top = 156
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 7
        OnClick = btContratoClick
      end
      object btSalvCo: TBitBtn
        Left = 488
        Top = 168
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 8
        OnClick = btSalvCoClick
      end
      object ckSaida: TCheckBox
        Left = 32
        Top = 200
        Width = 137
        Height = 17
        Caption = 'N'#227'o sobrepor Sa'#237'da'
        TabOrder = 9
      end
      object vCarroExtra: TJvValidateEdit
        Left = 468
        Top = 30
        Width = 81
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 10
      end
      object btOutras: TBitBtn
        Left = 488
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Outras'
        TabOrder = 11
        OnClick = btOutrasClick
      end
      object btEnviaFrete: TBitBtn
        Left = 254
        Top = 199
        Width = 133
        Height = 25
        Caption = 'Enviar Frete para WEB'
        TabOrder = 12
        OnClick = btEnviaFreteClick
      end
    end
    object tsOutros: TTabSheet
      Caption = 'Outros'
      ImageIndex = 6
      object Label33: TLabel
        Left = 24
        Top = 24
        Width = 411
        Height = 13
        Caption = 
          'EXTRA - valor que ser'#225' pago ao Motorista quando a Mercadoria ent' +
          'rar em outro carro  '
      end
      object Label35: TLabel
        Left = 24
        Top = 56
        Width = 269
        Height = 13
        Caption = 'Valor Padr'#227'o do n'#250'mero de s'#233'rie das Notas deste Cliente'
      end
      object Label36: TLabel
        Left = 24
        Top = 80
        Width = 93
        Height = 13
        Caption = 'Prazo para entrega '
      end
      object btSalvaOut: TBitBtn
        Left = 472
        Top = 203
        Width = 111
        Height = 25
        Caption = 'Salvar'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888000088877777777777777778000088000000000000000778000080BF
          B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
          000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
          FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
          BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
          000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
          F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
          88888888888888880000}
        TabOrder = 0
        OnClick = btSalvaOutClick
      end
      object vExtra: TJvValidateEdit
        Left = 456
        Top = 21
        Width = 105
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 1
      end
      object ckRecibos: TCheckBox
        Left = 24
        Top = 112
        Width = 369
        Height = 17
        Caption = 'Imprimir Recibo Flaydel com C'#243'digo de Barras para este Cliente'
        TabOrder = 2
      end
      object ckEstoque: TCheckBox
        Left = 24
        Top = 136
        Width = 169
        Height = 17
        Caption = 'Este Cliente utiliza Estoque'
        TabOrder = 3
        OnClick = ckEstoqueClick
      end
      object btEstoqueC: TBitBtn
        Left = 24
        Top = 160
        Width = 129
        Height = 25
        Caption = 'Contrato Estoque'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777770000777770000000FFF0777708F00FFFFFFF07770F0708FF000F
          07770F080000FFFFF0777000708FF000F07770C7C7000FFFFF07770C7C08FF00
          0F077707C7C000FFFFF077707C708FFF00007770C7C70000777777770C7C0777
          7777777707C70777777777777000777777777777777777777777}
        TabOrder = 4
        OnClick = btEstoqueCClick
      end
      object vSerie: TJvValidateEdit
        Left = 311
        Top = 53
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object ckSMS: TCheckBox
        Left = 24
        Top = 192
        Width = 193
        Height = 17
        Caption = 'Enviar SMS para este Cliente'
        TabOrder = 6
      end
      object vPrazo: TJvValidateEdit
        Left = 135
        Top = 77
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object ckCTe: TCheckBox
        Left = 460
        Top = 112
        Width = 97
        Height = 17
        Caption = 'Emite CTe'
        TabOrder = 8
        OnClick = ckCTeClick
      end
      object cbCte: TComboBox
        Left = 460
        Top = 135
        Width = 105
        Height = 21
        TabOrder = 9
        Text = '<Escolha>'
        Items.Strings = (
          'Tributado'
          'Isento '
          'N'#227'o Tributado '
          'Simples Nacional')
      end
      object cbIE: TComboBox
        Left = 460
        Top = 162
        Width = 105
        Height = 21
        TabOrder = 10
        Text = '<Escolha>'
        Items.Strings = (
          'Contrinuinte IE'
          'Isento IE'
          'N'#227'o Contribuinte IE')
      end
      object ckOCcli: TCheckBox
        Left = 24
        Top = 216
        Width = 177
        Height = 17
        Caption = 'Usa outros C'#243'digos de OCOREN'
        TabOrder = 11
        OnClick = ckOCcliClick
      end
      object btOC: TBitBtn
        Left = 207
        Top = 211
        Width = 75
        Height = 25
        Caption = 'Editar C'#243'd'
        TabOrder = 12
        OnClick = btOCClick
      end
    end
  end
  object edObs: TEdit
    Left = 48
    Top = 358
    Width = 513
    Height = 21
    MaxLength = 150
    TabOrder = 2
    OnKeyDown = edObsKeyDown
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 606
    Height = 24
    Align = alTop
    TabOrder = 3
    object lbAtual: TLabel
      Left = 24
      Top = 5
      Width = 329
      Height = 13
      AutoSize = False
      Caption = 'lbAtual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDTcad: TLabel
      Left = 368
      Top = 5
      Width = 225
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbDTcad'
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 56
    Bitmap = {
      494C010106000900380010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000080808000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000000000BF00FFFF
      FF0000000000FFFFFF0080808000808080008080800080808000808080008080
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008080
      800000000000000000000000000000000000000000000000BF000000BF00FFFF
      FF0000000000FFFFFF0080808000BF00BF0000FFFF00FFFFFF0000FFFF008080
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800000000000FFFF0000000000000000000000000000FFFFFF00000000000000
      00000000000080808000000000000000000000000000000000000000BF000000
      BF00FFFFFF000000BF000000BF0000FFFF00FFFFFF0000FFFF00FFFFFF008080
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      BF00BF00BF000000BF0000000000808080008080800080808000808080008080
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000BF00
      BF000000BF000000BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000BF00BF000000BF000000
      BF000000BF00FFFFFF000000BF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000000000000000000000000000BF00BF00BF000000
      000000000000FFFFFF00FFFFFF000000BF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000808080000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000000000000000000000BFBF0000BF
      BF000000000000000000000000000000000000000000000000000000000000BF
      BF0000BFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000080808000000000000000000000000000000000000000000000BFBF0000BF
      BF000000000000000000000000000000000000000000000000000000000000BF
      BF0000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000BFBF0000BF
      BF000000000000000000000000000000000000000000000000000000000000BF
      BF0000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF0000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF000000
      FF000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF00000000000000C0C0C00000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000000000000000000000BFBF0000BF
      BF000000000000000000000000000000000000000000000000000000000000BF
      BF0000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FF000000
      00000000000000000000000000000000000000000000BF000000FFFFFF00FFFF
      FF00FFFFFF0000000000C0C0C00000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000000000000000000000BFBF0000BF
      BF0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF0000BF
      BF0000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FF000000
      FF000000000000000000000000000000000000000000BF000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000BFBF0000BF
      BF000000000000000000000000000000000000000000000000000000000000BF
      BF0000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      FF000000000000000000000000000000000000000000BF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C0000000
      000000000000000000000000000000000000000000000000000000BFBF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000BF000000FFFFFF008080
      800080808000FFFFFF008080800000000000000000008080800080808000FFFF
      FF0000000000000000000000000000000000000000000000000000BFBF000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      000000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      FF000000000000000000000000000000000000000000BF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000BFBF000000
      0000FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF000000
      000000BFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF000000000000000000000000000000
      FF000000000000000000000000000000000000000000BF000000FFFFFF008080
      800080808000FFFFFF008080800000000000000000008080800080808000FFFF
      FF0000000000000000000000000000000000000000000000000000BFBF000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF00000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000BF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BF0000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FFFFFF00FF000000FFFFFF00FFFFFF000000
      000080808000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF00
      0000BF000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000BF000000C0C0C000BF00
      0000BF000000C0C0C000BF000000BF000000C0C0C000BF000000BF000000C0C0
      C000BF0000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF00
      0000BF000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00803FFFFF00000000803EFFFF00000000
      9F3CF003000000009F38F003000000009C11F003000000009803C00300000000
      90078003000000008013C00300000000801BE20300000000801BE00300000000
      801B800300000000E013900700000000F3E7F00F00000000F9CFF01F00000000
      FC1FFFFF00000000FFFFFFFF00000000FFFFFFFFFFF9F8F8C003FFFFFFF3F8F8
      8603C007FFE3F8708603C007F847F8008603C007E00F80008003C007C01F8000
      8003C007C00F80008003C007C02F80018003C007C02F80038003C007C02F8003
      8003C007C06F80039003C007C0EF8007B003C00FC1CF8007E3C3C01FC3DF8007
      C7FFC03FEFFF8007EFFFFFFFF03FFFFF00000000000000000000000000000000
      000000000000}
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsTel
    Left = 476
    Top = 57
  end
  object DataSource2: TDataSource
    DataSet = DM1.cdsWEB
    Left = 520
    Top = 56
  end
end
