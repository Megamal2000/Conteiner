object cadFuncs: TcadFuncs
  Left = 232
  Top = 144
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 374
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 617
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
    Color = 15395783
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
    object lbid: TLabel
      Left = 554
      Top = 8
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = '00000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
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
    Left = 4
    Top = 90
    Width = 601
    Height = 248
    ActivePage = tsOutros
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
        Top = 61
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object Label5: TLabel
        Left = 16
        Top = 87
        Width = 16
        Height = 13
        Caption = 'RG'
      end
      object Label6: TLabel
        Left = 16
        Top = 117
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
      end
      object Label34: TLabel
        Left = 363
        Top = 197
        Width = 61
        Height = 13
        Caption = 'Renovar em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label36: TLabel
        Left = 16
        Top = 143
        Width = 52
        Height = 13
        Caption = 'Data Ficha'
      end
      object Label45: TLabel
        Left = 16
        Top = 168
        Width = 38
        Height = 13
        Caption = 'RNTRC'
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
        Top = 84
        Width = 137
        Height = 21
        MaxLength = 24
        TabOrder = 2
        Text = 'edRG'
        OnKeyDown = edRGKeyDown
      end
      object edCPF: TMaskEdit
        Left = 144
        Top = 58
        Width = 134
        Height = 21
        EditMask = '000\.000\.000\-00;'
        MaxLength = 14
        TabOrder = 1
        Text = '   .   .   -  '
        OnKeyDown = edCPFKeyDown
      end
      object GroupBox1: TGroupBox
        Left = 320
        Top = 56
        Width = 225
        Height = 129
        Caption = 'Carteira de Habilita'#231#227'o '
        TabOrder = 3
        object Label7: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label15: TLabel
          Left = 16
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Validade'
        end
        object Label16: TLabel
          Left = 16
          Top = 72
          Width = 45
          Height = 13
          Caption = 'Categoria'
        end
        object Label43: TLabel
          Left = 16
          Top = 96
          Width = 45
          Height = 13
          Caption = #218'lt Ajuste'
        end
        object edCH: TEdit
          Left = 72
          Top = 21
          Width = 145
          Height = 21
          MaxLength = 18
          TabOrder = 0
          Text = 'edCH'
          OnKeyDown = edCHKeyDown
        end
        object edCHvalid: TDateTimePicker
          Left = 72
          Top = 46
          Width = 97
          Height = 21
          Date = 40364.685727546300000000
          Time = 40364.685727546300000000
          TabOrder = 1
          OnKeyDown = edCHvalidKeyDown
        end
        object edCHcateg: TEdit
          Left = 72
          Top = 71
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 4
          TabOrder = 2
          Text = 'EDCHCATEG'
          OnKeyDown = edCHcategKeyDown
        end
        object edDTajuste: TDateTimePicker
          Left = 72
          Top = 95
          Width = 96
          Height = 21
          Date = 41763.389336655090000000
          Time = 41763.389336655090000000
          TabOrder = 3
        end
      end
      object edDTnasc: TDateTimePicker
        Left = 144
        Top = 111
        Width = 137
        Height = 22
        Date = 40364.676662268520000000
        Time = 40364.676662268520000000
        TabOrder = 4
        OnKeyDown = edDTnascKeyDown
      end
      object cbSeguro: TCheckBox
        Left = 291
        Top = 196
        Width = 59
        Height = 17
        Caption = 'Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = cbSeguroClick
      end
      object dtValSeguro: TDateTimePicker
        Left = 432
        Top = 191
        Width = 113
        Height = 21
        Date = 40888.611656168990000000
        Format = 'dd/MM/yyyy ddd'
        Time = 40888.611656168990000000
        TabOrder = 6
        Visible = False
      end
      object edDTficha: TDateTimePicker
        Left = 144
        Top = 138
        Width = 136
        Height = 21
        Date = 41155.720414305560000000
        Time = 41155.720414305560000000
        TabOrder = 7
      end
      object ckAtivo: TCheckBox
        Left = 16
        Top = 192
        Width = 97
        Height = 17
        Caption = 'Ativo'
        TabOrder = 8
      end
      object edRNTRC: TEdit
        Left = 144
        Top = 164
        Width = 136
        Height = 21
        TabOrder = 9
        Text = 'edRNTRC'
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
        Left = 432
        Top = 48
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label33: TLabel
        Left = 208
        Top = 48
        Width = 42
        Height = 13
        Caption = 'Detalhes'
      end
      object edTel: TEdit
        Left = 472
        Top = 43
        Width = 105
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 1
        Text = 'edTel'
        OnKeyDown = edTelKeyDown
      end
      object cbDesc: TComboBox
        Left = 88
        Top = 44
        Width = 113
        Height = 21
        TabOrder = 0
        Text = 'cbDesc'
        OnKeyDown = cbDescKeyDown
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 80
        Width = 401
        Height = 129
        DataSource = dsTel
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
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero'
            Width = 107
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 432
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
        Left = 264
        Top = 43
        Width = 161
        Height = 21
        TabOrder = 4
        Text = 'edDetalhes'
        OnKeyPress = edDetalhesKeyPress
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
    object tsBanco: TTabSheet
      Caption = 'Banco'
      ImageIndex = 5
      object Label27: TLabel
        Left = 16
        Top = 14
        Width = 86
        Height = 13
        Caption = 'N'#250'mero do Banco'
      end
      object Label28: TLabel
        Left = 208
        Top = 15
        Width = 31
        Height = 13
        Caption = 'Banco'
      end
      object Label29: TLabel
        Left = 16
        Top = 43
        Width = 39
        Height = 13
        Caption = 'Ag'#234'ncia'
      end
      object Label30: TLabel
        Left = 208
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Conta'
      end
      object Label31: TLabel
        Left = 16
        Top = 72
        Width = 53
        Height = 13
        Caption = 'Favorecido'
      end
      object Label32: TLabel
        Left = 312
        Top = 72
        Width = 73
        Height = 13
        Caption = 'CPF favorecido'
      end
      object Panel4: TPanel
        Left = 528
        Top = 81
        Width = 49
        Height = 130
        TabOrder = 0
        object Label26: TLabel
          Left = 9
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Banco'
        end
        object btBco1: TSpeedButton
          Left = 16
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Inserir um novo banco'
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
          OnClick = btBco1Click
        end
        object btBco2: TSpeedButton
          Left = 16
          Top = 62
          Width = 23
          Height = 22
          Hint = 'Salvar o banco'
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
          OnClick = btBco2Click
        end
        object btBco3: TSpeedButton
          Left = 16
          Top = 96
          Width = 23
          Height = 22
          Hint = 'Apagar um banco'
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
          OnClick = btBco3Click
        end
      end
      object edBconum: TEdit
        Left = 112
        Top = 12
        Width = 65
        Height = 21
        MaxLength = 4
        TabOrder = 1
        Text = 'edBconum'
        OnKeyDown = edBconumKeyDown
      end
      object edAgencia: TEdit
        Left = 112
        Top = 40
        Width = 81
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
        Text = 'edAgencia'
        OnKeyDown = edAgenciaKeyDown
      end
      object edFavorecido: TEdit
        Left = 88
        Top = 69
        Width = 201
        Height = 21
        MaxLength = 40
        TabOrder = 5
        Text = 'edFavorecido'
        OnKeyDown = edFavorecidoKeyDown
      end
      object edCPFfavor: TMaskEdit
        Left = 400
        Top = 69
        Width = 101
        Height = 21
        EditMask = '000\.000\.000\-00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 6
        Text = '   .   .   -  '
        OnKeyDown = edCPFfavorKeyDown
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 112
        Width = 497
        Height = 96
        DataSource = dsBco
        FixedColor = clTeal
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid3DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'BCONUM'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCONOME'
            Title.Caption = 'Banco'
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGENCIA'
            Title.Caption = 'Ag'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTA'
            Title.Caption = 'Conta'
            Width = 127
            Visible = True
          end>
      end
      object edBcoNome: TEdit
        Left = 256
        Top = 12
        Width = 249
        Height = 21
        MaxLength = 20
        TabOrder = 2
        Text = 'edBcoNome'
        OnKeyDown = edBcoNomeKeyDown
      end
      object edConta: TEdit
        Left = 256
        Top = 40
        Width = 249
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 4
        Text = 'edConta'
        OnKeyDown = edContaKeyDown
      end
      object cbConta: TComboBox
        Left = 517
        Top = 40
        Width = 52
        Height = 21
        TabOrder = 8
        Text = 'cbConta'
        Items.Strings = (
          'CC'
          'Poup')
      end
    end
    object tsCarro: TTabSheet
      Caption = 'Carro'
      ImageIndex = 4
      object Label3: TLabel
        Left = 24
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Placa'
      end
      object Label17: TLabel
        Left = 24
        Top = 64
        Width = 37
        Height = 13
        Caption = 'Ve'#237'culo'
      end
      object Label18: TLabel
        Left = 378
        Top = 64
        Width = 19
        Height = 13
        Caption = 'Ano'
      end
      object Label44: TLabel
        Left = 248
        Top = 24
        Width = 72
        Height = 13
        Caption = 'C'#243'd. Libera'#231#227'o'
      end
      object edPlaca: TEdit
        Left = 72
        Top = 18
        Width = 121
        Height = 28
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'EDIT1'
        OnKeyDown = edPlacaKeyDown
      end
      object edVeiculo: TEdit
        Left = 72
        Top = 61
        Width = 281
        Height = 21
        TabOrder = 1
        Text = 'edVeiculo'
        OnKeyDown = edVeiculoKeyDown
      end
      object edAno: TJvValidateEdit
        Left = 416
        Top = 61
        Width = 65
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 2
        OnKeyDown = edAnoKeyDown
      end
      object DBGrid2: TDBGrid
        Left = 32
        Top = 96
        Width = 473
        Height = 105
        DataSource = dsCar
        FixedColor = clTeal
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PLACA'
            Title.Caption = 'Placa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VEICULO'
            Title.Caption = 'Ve'#237'culo'
            Width = 268
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANO'
            Title.Caption = 'Ano'
            Width = 56
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 520
        Top = 73
        Width = 49
        Height = 130
        TabOrder = 4
        object Label25: TLabel
          Left = 16
          Top = 8
          Width = 25
          Height = 13
          Caption = 'Carro'
        end
        object btCar1: TSpeedButton
          Left = 16
          Top = 29
          Width = 23
          Height = 22
          Hint = 'Inserir um novo Carro'
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
          OnClick = btCar1Click
        end
        object btCar2: TSpeedButton
          Left = 16
          Top = 62
          Width = 23
          Height = 22
          Hint = 'Salvar o Carro'
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
          OnClick = btCar2Click
        end
        object btCar3: TSpeedButton
          Left = 16
          Top = 96
          Width = 23
          Height = 22
          Hint = 'Apagar um Carro'
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
          OnClick = btCar3Click
        end
      end
      object edLibera: TEdit
        Left = 336
        Top = 21
        Width = 137
        Height = 21
        TabOrder = 5
        TextHint = 'Libera'#231#227'o do Seguro'
      end
    end
    object tsOutros: TTabSheet
      Caption = 'Outros'
      ImageIndex = 6
      object Label35: TLabel
        Left = 32
        Top = 24
        Width = 184
        Height = 13
        Caption = 'Pagamento Personalizado [ENTREGA]'
      end
      object Label37: TLabel
        Left = 32
        Top = 56
        Width = 164
        Height = 13
        Caption = 'Pagamento Personalizado [SA'#205'DA]'
      end
      object Label38: TLabel
        Left = 32
        Top = 112
        Width = 157
        Height = 13
        Caption = 'Valor do ponto pago ao Motorista'
      end
      object Label42: TLabel
        Left = 32
        Top = 160
        Width = 193
        Height = 13
        Caption = 'Sal'#225'rio Pago ao Motorista (0 = agregado)'
      end
      object LbREST: TLabel
        Left = 208
        Top = 189
        Width = 3
        Height = 13
      end
      object btPag: TBitBtn
        Left = 224
        Top = 19
        Width = 105
        Height = 25
        Caption = 'Configurar Entrega'
        TabOrder = 0
        OnClick = btPagClick
      end
      object btPag2: TBitBtn
        Left = 224
        Top = 48
        Width = 107
        Height = 25
        Caption = 'Configurar Sa'#237'da'
        TabOrder = 1
        OnClick = btPag2Click
      end
      object vPonto: TJvValidateEdit
        Left = 368
        Top = 104
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 2
      end
      object vSalario: TJvValidateEdit
        Left = 368
        Top = 157
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object btRest: TBitBtn
        Left = 32
        Top = 184
        Width = 157
        Height = 25
        Caption = 'Cadastrar no Portal'
        TabOrder = 4
        OnClick = btRestClick
      end
    end
    object tsDigito: TTabSheet
      Caption = 'D'#237'gito'
      ImageIndex = 7
      object Label39: TLabel
        Left = 40
        Top = 56
        Width = 73
        Height = 13
        Caption = 'Dedo Indicador'
      end
      object Image1: TImage
        Left = 40
        Top = 104
        Width = 73
        Height = 81
        Picture.Data = {
          0A544A504547496D6167654D0C0000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1EFFC00011080075006B03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FB2E
          8A28A0028A28A00283D28A0F4A00E6751D7754B8D62E74AF0E69F69752D985FB
          65C5DDCB45144EC372C6BB518BBE3048E000C3939C55AF0C6B936A2F7561A8D8
          FD8355B32A2E6DC4BE626D6CEC911F0372360E0900E4104022AA7C3442FA05CD
          F30F9EFF0052BBB92DFDE0667543FF007C2A0FA014E9E116FF0012AD6E1703ED
          9A4CB1BFB98A58CAFF00E8D7FCE803A5A2AB6AB7B0E9DA65D5FDC1221B685E69
          31FDD5524FE82B95B6D27C51269BFDAE7C4F791EA724626FB134509B3438CF93
          8D9BF6F6DDBB777CF6A00ECE8AA3A06A116ADA2596A9002B15DDBA4E8A7A80EA
          1803F9D5EA0028A28A0028A28A0028ACAF16DFCBA5F86B51D420DBE6C16CEF1E
          E1950C0719F6CE2BF3C747F8D9E30B3F884BE226D5EED2D5EEC3491B24734AB6
          FBDCEC2D843230121EA5436D40DC2A81ED6519162736551D0B7B893D7ADEF64B
          CF466752AC69DAFD4FD23A490ED8D98F604D607C3CF12DA78BBC2561AEDA602D
          CC48EE9823692A1870403820AB0C804AB29C0CD6DDE826CE603AF96DFCABC694
          5C5B4D6A68637C3B50BE05D1368E1AC627FF00BE941FEB507891CC1E33F0BCC0
          712C9736C4E7FBD097FF00DA42A4F868E5FE1E787598004E996F9C7FD735A3C6
          584BDF0ECE7FE59EAC833E9BE2953F9B0A403FC7C164F0C5C5B31C0BA78AD4E3
          AE259563FF00D9AB740C2E2B9EF17BACBA9787B4E2031B8D4848CBFECC51BCB9
          FC1953F3AE85880A49E806680307E1C2ECF00E8283A2E9F028FC100ADFAE7FE1
          BEE3E00D00BFDE3A7404FE31835D01E94005159DA6EBBA3EA775736BA76A7657
          93DAB6DB88E0B8591A239230C01254F07AFA1AD1A0028A28A00CFF0012E9ABAC
          787F51D25DCA2DE5AC90161D5772919FD6BF2EFE23E8BFF08F78E757D20430C0
          B05C12B045233881580611166E4B20608739E54F27A9FD543D2BE77F88BF01B4
          4F19FC7DB5D6B5ED62E9749B8B513FF66246009CC6C7CD89650418D4B3AB9C02
          CDBE4C32F047D67096754B2AC4D49577684A3E7BADBE7BAD6CB5DCC3114DCD2B
          1C9FEC4579E36D3BC3B25EEA5A7A2782A4945ADB5CB8D8E653231DEAA07CF1AB
          B15690E305F19608447F59B00C841E8462AA7F6669E9A42E93159DBC5A7A402D
          D2DA38C2C49105DA1028E0281C003A0AA3E1CB99621368F792192EECB1891BAC
          D09CEC93DCE0107FDA53D88AF0F34C6C71D8BA9888C14799DECBFADDEEFCCD21
          1E58A452F853C7C38D05718DB64898F4C0C7F4A6FC4E0A9E1B8AE8B6D36BA8D9
          4F9F40B731E7F4CD3BE14EEFF857FA4EFEA62623E9BDB1FA629DF146DE5B9F87
          DAEC702EE956CA496303BB20DE3F55AF3CB06537BF12237C029A669671CFF1DC
          49FCC2C07FEFAAD5F134E6D7C37A9DD03830D9CB20FC109FE958DE01B84D50EA
          DAF44E1E0BDBCDB6EC390D1C48B1F07D37AC87F1AB1F11E510F8175A63D1ACA4
          43FF000252BFD68034BC3D6A2C741B0B35FBB05B4718FF0080A81FD2B23C54F2
          6ABA941E17B691E359E3F3B5192362AD1DB6480808E4348C0A823F8564208205
          6FDD4F059584D757322C56F044D248EDC04451924FB002B0BC096D33E9F3EBB7
          B13C77DABCBF6A911C7CD14780228BDB6A05C8E9B8B9EF4015759B682D7C69E1
          3B6D3A28E0745B95748D428166B100CA00E804A6DF8F6AEBAB8FF0D93AB78FB5
          DD67ADBE9EA9A4DA9EC586259D87D59910FBC35D85001451450015CDFC418255
          D262D66D63692EB469D6FA3551F33A2822541EED1B381EE4574948C032904020
          8C10680196D3C5736F1CF0BABC52287465390C08C822B27C4FA65EDDAC37BA45
          C436DAA5AE7C992642D1BAB63746E010769C0E9D0853CE306B781645B6B4BDD0
          09F9B48B936E809FF96240787F008CABF5435D1D0065F8534C3A3786F4FD25A5
          12B5A5BA44CE060310304E3B64D69BAABA95600A91820F714B450055D2F4FB2D
          2EC21B0D3AD20B4B48576C50C1184441E814702B33C7D6935EF83357B6B68DA5
          9DAD2468A35192EEA0B2A8FA9007E35BB45007133EA36BE395B7D3749945C68E
          4A4DA95CA728EBC32DB83D0B31C6F1D94153CB0AEAB55BDB7D2B49BBD42E98AC
          16B03CD2103A2A824FF2AB6A028C0000F6AC0F178FB6DC697A18E45E5C89671F
          F4C2121DBF02DE5A11E8E68026F04E9D2697E1AB4B6B8005DB869EEC8E733CAC
          6494FE2ECD5B548062968002400492001D49AE6E4F1E782A399A17F16E82B221
          DAEADA8C4369F43F3706A1F1ABC573ADF87F43BE40DA7EA33CA2556FBB33C719
          912161DD4ED6623A1F2F0720915D3C31470C4B1448A88A30AAA3000F40280196
          5776D7B6C973677115C4120CA4B1387461EA08E0D4D58173E13D24DCC97BA7AC
          BA45EB9DCF71A7B7945CFABAE0A487FDF56A85A7F15E9876BD95B6BD6E3A496F
          20B7B9FA1473E5B1FF00683A0FF6680208435B7C58B945FF00577DA347230C7F
          143332E7F2947E55D65735E1CB4D4AF35CB9F10EAFA72E9B335BADA5B5B19965
          748C31666765F972C48E01206D1C9CF1D2D00141E9451400018A28A28003D2B9
          CD294DF78D755D409262B18A3B08411C06204B2303EFBE35FF008057413C890C
          124D2B048D14B331E8001926B2BC1B0BC7E1F826990A4D76CF772A9EAAD2B172
          BF86EC7D05006C5145140191E2CD02D7C45A57D8AE659ADDE39167B6B981B6CB
          6F321CA4884E4641F5041048208245602F887C41E1A51178AB4A9750B25E9ABE
          950348A07ACD6E33221F529BD7B9DA38AEDA8A00A5A2EADA66B7A7A6A1A4DFDB
          5F5A3FDD9A0903A9F5191DFDAAED713E25F01C336A8FE21F0BDEB787FC42797B
          981730DDE3F86E22E920FF006B861D9855FF0005F89DF5696E749D56C8E9BAFD
          8806F2CCBEE52A7EECB137F1C4D8383D4743822803A7A28A2800A28A2800A28A
          0F4A00C3F1A48C74816318064D4254B403A7CAE7F79F9461CFE15B51A8450A06
          00E00AC4794EA1E2D4814030E9B179921EBFBE9010A3EA1327FEDA0ADDA0028A
          28A0028A28A002B9FF00187879B5536DA8E9F702C75AB025ACAEF6E40CFDE8E4
          1FC51B60061F42304035D05140189E16D7A3D5E29609A0367A9DA304BDB276CB
          C2C7A11FDE46C655BA11EE081B75CFF8A3C331EAD2C5A859DE4BA5EB16CA56DE
          FA0505803C94753C49193D54FD410706B162F1ADF6804DBF8EB469B4E54E9AAD
          9A34F6320FEF12A0B43F47181FDE3401DD5159FA36B7A46B36E2E348D4ECB508
          4F3E65B4EB2AFE6A4D5E92448D4BBB2AA8192CC7000A007551D77528749D365B
          C9959C2801234FBD23938545F724803EB581AB7C45F08594CD670EAD16A77FD0
          5969A3ED5393E8523CEDFAB607BD3FC3F63AA6AF7F16BFE22B71666224D869BB
          837D981183248470D29048E321412013924AB81B1E1EB296D6C4C97454DE5C39
          9AE59791BDB1C0F600051ECA2B4A8A2980514514005145140051451400504646
          28A28039DD53C0DE0ED52733DFF867489E63FF002D5AD1049FF7D019FD6A97FC
          2B1F00975693C2BA6CFB7EE89E2F342FD03640A28A968773A4D3B4DD3F4D8041
          A7D95B5A443A24112A28FC00AB74514D0828A28A60145145007FFFD9}
        Stretch = True
      end
      object imgDig1: TImage
        Left = 120
        Top = 72
        Width = 73
        Height = 113
        Picture.Data = {
          0A544A504547496D616765840C0000FFD8FFE000104A46494600010101006000
          600000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1EFFC00011080081005303012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FB2E
          8A2B1F55F14F86B49BAFB26A9E20D2EC6E31BBCAB8BA48DB1EB8620E38349B4B
          72E14E751DA0AEFC8D8A4C573BFF0009E7823FE86FD07FF06117FF00155BF6D3
          C3736F1DC5BCA934322868E446CAB29E841EE292927B32AA51A94D7BF16BD512
          629302968AA320C5141200249C01D4D73F378DFC1B0CCF0CDE2BD1239118ABA3
          DF461948E08209E0D2724B76694E8D4A9F045BF447414564E91E26F0EEAF70D6
          FA4EBBA6DFCCABB9A3B6B949180CE324293C648AD6A134F614E9CE9BB4D59F98
          514514C80AF03FDB13C09FDB5E168BC5D6116EBDD2462E028E5EDC9E7FEF93CF
          D3757BE5437F6B05F58CF65751ACB04F198E446190CA460822B2AF4956A6E0FA
          9E8657984F2FC5C3110FB2FEF5D57DC7E6457D87FB1DF8E3FB6BC212F852F66D
          D7BA47306E3CBDB93C7FDF272BEC36D7CD7F17FC1D3F81BC7DA8684EAFF6757F
          36D1DBF8E16E579EE472A7DC1A8FE1378BA7F0478F34DD7E32C618E4D9748BFC
          70B70E3EB8E47B815F3986AAF0D5BDEF467ECF9DE069E77963F65AB6B9A2FCFF
          00E0EC7E895150D95CC379670DDDBC8B24332092375390CA464115357D41F84B
          4D3B3383F8EFE315F04FC38D43544755BC957ECF6609EB2B700FE1CB7D14D7C0
          0ECCEECEEC5998E4927249AF6FFDAFFC69FDBDE3A8FC3B692EEB2D1D76C98E8D
          3B7DEFFBE4607B1DD5C27C13F064BE39F88361A418CB59A379F7ADD844A46467
          B6E385FC6BE771D51D7AFC91E9A1FB2F0B60E194E54F135B4725CCFD3A2FBB5F
          99F4D7EC8FE06FF8477C0DFDBF7B0EDD4358C4A370E521FE01F8825BFE043D2B
          DB6A3B5823B6B78EDE15548E350AAA060003DAA4AF768D254A0A0BA1F93E658E
          9E3F153C44F793FB9745F241451456A7080A2917A52D007887ED73E046F11F82
          57C456106FD43460D23ED1CBC07EF8F7C6037E07D6BE31AFD3AB88A39E078654
          578E452ACAC32083ED5F9FDF1C7C1327813E20DEE92A8C2C653F68B263DE2627
          03FE0272BF867BD7879A61ECD555D773F54E03CDF9E9CB0351EB1D63E9D57C9E
          BF367D1FFB1F78E3FB77C1927862F66DD7DA3E045B8F2F6E7EE9FF00809CAFB0
          DB5E9BF153C556FE0CF026A7AFCE54BC10910A13FEB243C22FE248FC335F0CFC
          1FF184DE07F1F69DAEAB37D9D5FCABB41FC70B70DC7723861EE057A9FED81F10
          6D75FD434DF0CE8D7D0DD585B20BBB892170C8F2B0F90647076A927FE05ED574
          71DCB8577F8969FE472E65C2CEAE7B0E55FBA9FBCFCADF12F9F4F53C12FAEAE2
          FAF67BDBB95A5B89E4696576392CCC7249FC4D7D95FB24781BFE11CF027F6F5E
          C3B750D6712FCC394847FAB1F8825BFE043D2BE65F825E0C93C73F10EC347646
          3648DF68BD61D042A46467FDA385FF008157E815B431DBDBC70448A91C6A1555
          460003DAA32BA1CD2755FC8E9E3CCD552A51C0537BEB2F45B2FD7E48928A28AF
          70FCB028A28A0045E94B40A2800AF1DFDAB3C083C57E007D56CA0DFAA68FBA78
          F68F99E2C7EF13DF81BBEAB8EF5EC548EAAE85186411822B3AB4D558383EA766
          5F8DA981C4C3114F78BBFF009AF9AD0FCC3A2BB5F8E3A069FE19F8A5ADE93A5C
          F1C968930923543C45BC06F2FF00E039C7E55C7DA491C3770CD2C2B3C6922B34
          6C701C0392A71EBD2BE4A7170938BE87F43E1F111C4518D686D249AF9AB9F66F
          EC91E06FF846FC07FDBD7B0EDD4759C4DF30E5201FEAC7E2096FF810F4AF6BAC
          6F04EB1A76BFE13D3358D2768B2B9B75789571F20C7DDE3A107823B62B66BEB2
          8538D3A6A31D8FE7CCD71557178CA95AB2B49B7A76E96F96C1451456A79E1451
          450022F4A5A45E94B4005739F12FC516DE0EF046A7E20B92A7ECD09312138F32
          43C22FE2C40AE8EBE4CFDB43C6DF6FD72CFC17633E60B102E2F029E0CAC3E453
          F4524FFC0C7A57362EBFB1A4E5D7A1ED70FE58F33C7428FD9DDFA2DFEFDBE67C
          FDAADF5D6A9A9DCEA57D2B4D75752B4D348DD5998E49FCCD56AEB3E12784E4F1
          AFC40D2F40556F225977DD30FE18579739F5C703DC8AECFF006A2F87B6FE09F1
          9C579A45A2DBE8DA9C7BA18D07C9148A00741FA37E27D2BE6D519CA9BABD0FDB
          A59961E9632181BDA4D5D7A2E9F9FDC771FB1878EFC9BABAF02EA13FC92E6E34
          EDC7A37FCB48C7FE8407FBD5F5357E68F87B56BCD0B5CB2D674F93CBBAB39966
          89BDD4E707D8F43EC6BF443E1FF896CFC5FE10D3BC43627F75770862B9C946E8
          CA7DC1047E15ECE5988E787B37BAFC8FCCF8EB28FABE256329AF767BFF008BFE
          0AFC6E6F514515EA1F0614514500028A45E94B40187E3CF11D9F84FC23A8F882
          F9B10D9C25F6E705DBA2A8F72481F8D7E75EBBA9DDEB5ACDE6AD7F2196EAF266
          9A563DD98E4D7D11FB69F8D84F7B63E07B2972B062EAFB69FE223F7687F025BF
          15AF01F0768577E26F1469DA0D90266BD9D620719D80FDE63EC0649FA57CFE63
          59D5AAA9C7A7E67EC1C1796C703809632AE8E7AFA457F9EFF71F4FFEC5DE0C36
          1E1DBCF18DDC589F516F26D723910A1E4FFC0987FE382BD2FE3C782E3F1C7C3A
          BFD31101BE857ED164D8E44AA0E07E232BFF0002AEB7C39A4DA685A159691611
          08ADAD2158635F40A303F1E2AF9008208C835EBD2C3C6347D933F39C767356BE
          64F1D17669DD7925B2FBB73F311D591D91D4AB29C10460835F43FEC69E3B3A7E
          B971E09BF9B16D7D99ECB71E16503E65FC5467FE027D6B95FDAABC0E7C2BF10E
          4D4ED21DBA76B3BAE23C0E165FF968BF990DFF0002F6AF2AD2AFEEB4BD4EDB52
          B199A1BAB5956589C755653906BE7A2E585AFE87EC55E9D0CFF2BD369ABAF27F
          F01E8CFD33A2B98F85DE2CB4F1AF8234ED7ED59774F1013203CC720E194FD0E7
          EBD6BA7AFA88C949292EA7E115A8CE854952A8ACD3B3F9051451546420ACAF18
          EBB65E19F0C6A1AF6A0FB6DECA0695B9E4E070A3DC9C01EE456B0AF01FDAE25F
          16EB3A6D8F853C35A0EA97D6D237DA2FA6B6B6674383F247903D72C47B2D6388
          AAE9D3725B9E9651828E37190A33768B7ABDB45BFF00C03E52F146B379E21F11
          5FEB97EDBAE6F67699FD064F007B01803D857D07FB157833CEBDBFF1B5DC5F24
          39B4B2247F11C19187E185FC5ABC660F865F10659E388783B5A52EC1433DA3AA
          8C9EA491C0F7AFBB3E1BF86ADBC21E0AD3340B60316B00576031BDCF2CDF8B12
          7F1AF1B2FC3CA7579E6B6FCCFD2F8C337A387CBD6170F24DCF4D1ED15BEDF25E
          973A2A28A2BDF3F223CEBF685F05FF00C26BF0E2F6CEDE20FA85AFFA4D99C73E
          62E7E51FEF0CAFE39ED5F04329562AC0820E083DABF4ED80652AC3208C115F19
          7ED05F093C4167F116EEF3C33A0DF6A1A7EA1FE923ECB03388A427E75381C64F
          CC3FDEC76AF1F33C3B95AA457A9FA4702E730A5CF83AD2B2DE37FC57EBF796FF
          0063EF1D8D0FC572F84EFE5C596AA775B963C24E074FF81018FAA81DEBEC3AFC
          F4B1F87FF122CAF20BCB4F08EBF0DC4122C9148B64E0AB29C8238EC457DD3F0E
          357D435BF06E9D7DABE9D71A76A2D081736F3C4636471C1E0F624123DB15A659
          525CAE9C96DB1C7C7182A1EDE38CA124F9B4959A7AAD9FCD7E4745451457A87C
          1851451400514514005145140051451400514514005145140051451400514514
          0051451400514514005145140051451401FFD9}
        Stretch = True
      end
      object Bevel1: TBevel
        Left = 31
        Top = 48
        Width = 170
        Height = 153
      end
      object Label40: TLabel
        Left = 272
        Top = 56
        Width = 58
        Height = 13
        Caption = 'Dedo M'#233'dio'
      end
      object Image3: TImage
        Left = 272
        Top = 104
        Width = 73
        Height = 81
        Picture.Data = {
          0A544A504547496D6167654C0C0000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1EFFC00011080075006B03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FB2E
          8A28A0028A28A00283D28A0F4A00F19F8EBF1DB49F867776D6474B9F51B99642
          8FB1CA88C850C4038C3101A3C8C8C09171BB9C759F073E22E9DF11FC296FAD59
          DACB652BA8692DE424ED1B99721B0372EE475CFAA91D813F06FED2BAB5C6ABF1
          83596B88A15FB3CAC913A021A58D9DA5566C939389428C63E555E33927DB3FE0
          9F9A9DAFDA759D2234945D00F3CEC40D8C8DE4AC401CE720ACD9E3F89793CE3E
          D71DC354B0F91D3C726F9DD9BED696DF9AFEB6E68D66EAB8F43EC0A2AAEAB790
          E9DA65D5FDC710DB42F3498FEEAA927F415CADB693E28934EFED73E27BC8F539
          23137D89A284D9A1C67C9C6CDFB7B6EDDBBBE7B57C51D27694550D07508B56D1
          6CB5480158AEEDD27453D40750C01FCEAFD00145145001451450014564F8B6FE
          4D2FC35A8EA106DF360B6778F70CA86038CFB671592FE0CB28AC43D84D2DBEB3
          18DC9AA33169A493D6439F9D09EA87E5C7000C0C007594D90ED8D98F604D6578
          5F537D534B12CF0FD9AF22730DDDBE73E4CCBF7973DC7420F752A7BD68DEE4DA
          4C075F2DBF95007E5D7C58D5D75CF883AADF2DB7D9C2B476BB37EECF911A43BB
          381F7BCBDD8ED9C64E335EB7FB095FDEDAFC5896D63B52D63776E527B8D8D88E
          408ED1A6EE8370121C1E4ECE3A1AFA9BC05F0F3E1F6A5E09D1350D43C07E16B9
          BBB9B08659E6974881DE4764059998A649249249EB5A37DE17F0C7862F7459FC
          3DE1CD2346F3756884E6C2CA383CCCC5322EED806EC190E33D327D6BEEF1DC5B
          86C4655F508526BDD8C55DE9A5BE7D0E58D06A7CED9B5E3D0B27862E6D98E05D
          3C56A71D712CAB1FFECD5BC061715CEF8B9D25D4BC3DA71018DC6A42465FF662
          8DE5CFE0CA9F9D742C40524F40335F0875183F0E542780B4141D174F8147E080
          57415CF7C382C7C03A017FBC74E809FC6306BA13D2800A2B334CD7348D4AE6E2
          D74ED52CAF27B56DB711C170B2344724618024A9E0F5F435A7400514514019DE
          25D35758F0FEA3A4BB945BCB59202C3AAEE5233FAD43E12D464D57C3B657B3AF
          9770D1ECB94FEE4CA76C8BF83861F856B9E95CB699FF00129F1A5EE9A485B6D5
          53EDF6C3B09570B3A8FAFEEDF1DC973400FD5226D1BC4B16B31E7EC57C12DB50
          5EC8F9C4537E67637B3293C2D748C032107A118A8AF2DA1BBB596DAE63592195
          0A488C321948C106B2BC3D7134426D22F25325DD963123759A139D927B9C020F
          FB4A7B114014FE1571F0E7415C636D92263D3031FD293E26854F0DC5745B69B5
          D46CA7CFA05B98F3FA6697E14EFF00F857FA4EFEA62623E9BDB1FA629DF142DE
          5B9F87BAEC702EE956CA496303BB20DE3F55A00194DEFC478DF00A699A59C73F
          C77127F30B01FF00BEAB57C4D39B5F0E6A7740E0C3672C83F0427FA563780AE1
          3546D5B5E89C3C17B79B6DD8721A389163E0FA6F590FE3567E23CA21F02EB4C7
          A3594887FE04A57FAD0068F87AD458E836166BF760B68E31FF0001503FA563F8
          A249355D461F0C5B3BC6B3C7E76A3246C55A3B6C901011C8691815047F0AC841
          040ADFBA9EDEC6C66BAB99162B7822692476E02228C927D801587E05B699F4F9
          F5DBD89E3BED5E5FB5488E3E68A3C01145EDB502E474DC5CF7A00ABABDBC16BE
          33F09DB69D14703A2DCABA46A140B3588065007402536FC7B575F5C7F86C9D5B
          C7DAEEB3D6DF4F54D26D4F62C312CEC3EACC887DE1AEC2800A28A2800AE6BE20
          412AE9316B36B1992EB469D6FA3551F33A2822541EED1B381EE4574B4D601948
          2010460834011DB4F15CDBC73C2EAF148A1D194E43023208AC9F12E997B7421B
          CD22E21B6D52D73E4C932168DD5B1BA370083B4E074E8429E71835FC0CEB6F69
          7BA093F3691726DD013FF2C480F0FE011957EA86BA4A00CAF0AE98746F0E69FA
          4B4AB2B5A5BA44CE060310304E3B64D69BAABA95600A91820F714EA28029E97A
          7D9697610D869D6905A5AC2BB628608C2220F40A38159BE3DB49AF7C19ABDB5B
          46D2CED6923451A8C9775059547D4803F1ADEA280388B8D46D3C70B6FA6E9328
          B8D1D8A4DA95CA728EBC32DB83D0B31C6F1D94153CB0AEAB55BEB7D2F49BBD42
          E5B6C16B03CD2103A2A824FF002AB8A028C0000F6AE7FC5A3EDB71A668639179
          72259C7FD3084876FC0B796847A39A009BC15A749A5F86AD2DAE00176E1A7BB2
          39CCF2B19253F8BB356DD2018A5A0042400492001D49AE6E4F1DF82A399A17F1
          7682B221DAEADA8C4369F43F3706A0F19BC573ADE81A1DF461B4FD467944AADF
          76678E332242C3BA9DACC4743E5E0E4122BA78628E189628915114615546001E
          8050032CAEADAF6D52E6CEE22B886419496270E8C3D411C1AB15CFDCF85349FB
          4C97BA7ACBA45EB9DCF71A7B7945CFABAE0A487FDF56A81A7F16698487B3B6D7
          ADC7492DE416F73F428E7CB63FED0741FECD0045086B6F8AF728BFEAEFB468E4
          618FE286665CFE528FCABACAE63C3B6BA9DDEB771E21D5F4E5D3A66B75B4B6B6
          332CAE91862CCCECBF2E5891C0240DA3939E3A7A00283D28A280003145145000
          7A5737A529BDF1AEABA8124C56314761082380C40964607DF7C6BFF00ADF9E54
          8619269582468A5998F4000C93595E0F85E3D0209A642935DBBDDCAA7AAB4AC5
          CAFE1BB1F41401B545145006378AF41B6F11697F62B9966B778E459EDAE606DB
          2DBCC8729221391907D410412082091581FF000907883C36045E2AD2E5BFB25F
          F98BE950348A07ACD6E33221F529BD7B9DA38AEE28A00A1A2EADA66B5A7A6A1A
          4DF5B5F5A3FDD9A0903A9F5191DFDAAFD711E25F024136A8FE21F0BDE3787FC4
          2797B981730DDE3F86E22E920FF6B861D9855EF06789A4D5A4B9D2755B43A6EB
          F6201BCB32FB94A9FBB2C4DFC71360E0F51D0E08A00EA68A28A0028A28A0028A
          283D28030BC67231D1C58C6019350952D00E9F2B9FDE7E51873F856DC6A11428
          1803802B0DE537FE2C4814030E9B179921EBFBE9010A3EA1327FEDA0ADEA0028
          A28A0028A28A002B9CF17787DB556B6D42C2E458EB5604B595DEDC819FBD1C83
          F8A36C00C3E8460806BA3A28030BC2FAEC7ABC52C33406CF53B46097B66ED978
          58F423FBC8D8CAB7423DC10376B9DF13F86A3D5E58AFECEEE5D2F58B652B6F7D
          0282C01E4A3A9E248C9EAA7EA0838358D178D6FB41CDBF8E7469B4E54E9AAD9A
          34F6320FEF12A0B43F47181FDE3401DDD159DA36B7A46B16E2E348D4ECB5084F
          3E65B4EB2AFE6A4D5E92448D4BBB2AA8192CC7000A007D67EB7A8C3A4E9B2DE4
          CACE140091A7DE91C9C2A2FB92401F5AC1D57E227842CA66B387568B53BFE82C
          B4D1F6A9C9F4291E76FD5B03DE9FA058EA9ABDFC5AFF0088AD8599889361A6EE
          0DF660460C9211C34A41238C8504804E492AE06BF87ECE5B4B22F7454DE5C399
          AE594E46F6C703D800147B28AD4A28A601451450014514500145145001484646
          28A28039CD57C11E0ED4EE7CDD43C31A44F31FF96A6D103FFDF4067F5AA5FF00
          0ACFC026553278574D9F6FDD13C5E685FA06C8145150C674961A6D869900834F
          B2B6B4887448225451F8015768A2A90828A28A60145145007FFFD9}
        Stretch = True
      end
      object imgDig2: TImage
        Left = 352
        Top = 72
        Width = 73
        Height = 113
        Picture.Data = {
          0A544A504547496D616765840C0000FFD8FFE000104A46494600010101006000
          600000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1EFFC00011080081005303012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FB2E
          8A2B1F55F14F86B49BAFB26A9E20D2EC6E31BBCAB8BA48DB1EB8620E38349B4B
          72E14E751DA0AEFC8D8A4C573BFF0009E7823FE86FD07FF06117FF00155BF6D3
          C3736F1DC5BCA934322868E446CAB29E841EE292927B32AA51A94D7BF16BD512
          629302968AA320C5141200249C01D4D73F378DFC1B0CCF0CDE2BD1239118ABA3
          DF461948E08209E0D2724B76694E8D4A9F045BF447414564E91E26F0EEAF70D6
          FA4EBBA6DFCCABB9A3B6B949180CE324293C648AD6A134F614E9CE9BB4D59F98
          514514C80AF03FDB13C09FDB5E168BC5D6116EBDD2462E028E5EDC9E7FEF93CF
          D3757BE5437F6B05F58CF65751ACB04F198E446190CA460822B2AF4956A6E0FA
          9E8657984F2FC5C3110FB2FEF5D57DC7E6457D87FB1DF8E3FB6BC212F852F66D
          D7BA47306E3CBDB93C7FDF272BEC36D7CD7F17FC1D3F81BC7DA8684EAFF6757F
          36D1DBF8E16E579EE472A7DC1A8FE1378BA7F0478F34DD7E32C618E4D9748BFC
          70B70E3EB8E47B815F3986AAF0D5BDEF467ECF9DE069E77963F65AB6B9A2FCFF
          00E0EC7E895150D95CC379670DDDBC8B24332092375390CA464115357D41F84B
          4D3B3383F8EFE315F04FC38D43544755BC957ECF6609EB2B700FE1CB7D14D7C0
          0ECCEECEEC5998E4927249AF6FFDAFFC69FDBDE3A8FC3B692EEB2D1D76C98E8D
          3B7DEFFBE4607B1DD5C27C13F064BE39F88361A418CB59A379F7ADD844A46467
          B6E385FC6BE771D51D7AFC91E9A1FB2F0B60E194E54F135B4725CCFD3A2FBB5F
          99F4D7EC8FE06FF8477C0DFDBF7B0EDD4358C4A370E521FE01F8825BFE043D2B
          DB6A3B5823B6B78EDE15548E350AAA060003DAA4AF768D254A0A0BA1F93E658E
          9E3F153C44F793FB9745F241451456A7080A2917A52D007887ED73E046F11F82
          57C456106FD43460D23ED1CBC07EF8F7C6037E07D6BE31AFD3AB88A39E078654
          578E452ACAC32083ED5F9FDF1C7C1327813E20DEE92A8C2C653F68B263DE2627
          03FE0272BF867BD7879A61ECD555D773F54E03CDF9E9CB0351EB1D63E9D57C9E
          BF367D1FFB1F78E3FB77C1927862F66DD7DA3E045B8F2F6E7EE9FF00809CAFB0
          DB5E9BF153C556FE0CF026A7AFCE54BC10910A13FEB243C22FE248FC335F0CFC
          1FF184DE07F1F69DAEAB37D9D5FCABB41FC70B70DC7723861EE057A9FED81F10
          6D75FD434DF0CE8D7D0DD585B20BBB892170C8F2B0F90647076A927FE05ED574
          71DCB8577F8969FE472E65C2CEAE7B0E55FBA9FBCFCADF12F9F4F53C12FAEAE2
          FAF67BDBB95A5B89E4696576392CCC7249FC4D7D95FB24781BFE11CF027F6F5E
          C3B750D6712FCC394847FAB1F8825BFE043D2BE65F825E0C93C73F10EC347646
          3648DF68BD61D042A46467FDA385FF008157E815B431DBDBC70448A91C6A1555
          460003DAA32BA1CD2755FC8E9E3CCD552A51C0537BEB2F45B2FD7E48928A28AF
          70FCB028A28A0045E94B40A2800AF1DFDAB3C083C57E007D56CA0DFAA68FBA78
          F68F99E2C7EF13DF81BBEAB8EF5EC548EAAE85186411822B3AB4D558383EA766
          5F8DA981C4C3114F78BBFF009AF9AD0FCC3A2BB5F8E3A069FE19F8A5ADE93A5C
          F1C968930923543C45BC06F2FF00E039C7E55C7DA491C3770CD2C2B3C6922B34
          6C701C0392A71EBD2BE4A7170938BE87F43E1F111C4518D686D249AF9AB9F66F
          EC91E06FF846FC07FDBD7B0EDD4759C4DF30E5201FEAC7E2096FF810F4AF6BAC
          6F04EB1A76BFE13D3358D2768B2B9B75789571F20C7DDE3A107823B62B66BEB2
          8538D3A6A31D8FE7CCD71557178CA95AB2B49B7A76E96F96C1451456A79E1451
          450022F4A5A45E94B4005739F12FC516DE0EF046A7E20B92A7ECD09312138F32
          43C22FE2C40AE8EBE4CFDB43C6DF6FD72CFC17633E60B102E2F029E0CAC3E453
          F4524FFC0C7A57362EBFB1A4E5D7A1ED70FE58F33C7428FD9DDFA2DFEFDBE67C
          FDAADF5D6A9A9DCEA57D2B4D75752B4D348DD5998E49FCCD56AEB3E12784E4F1
          AFC40D2F40556F225977DD30FE18579739F5C703DC8AECFF006A2F87B6FE09F1
          9C579A45A2DBE8DA9C7BA18D07C9148A00741FA37E27D2BE6D519CA9BABD0FDB
          A59961E9632181BDA4D5D7A2E9F9FDC771FB1878EFC9BABAF02EA13FC92E6E34
          EDC7A37FCB48C7FE8407FBD5F5357E68F87B56BCD0B5CB2D674F93CBBAB39966
          89BDD4E707D8F43EC6BF443E1FF896CFC5FE10D3BC43627F75770862B9C946E8
          CA7DC1047E15ECE5988E787B37BAFC8FCCF8EB28FABE256329AF767BFF008BFE
          0AFC6E6F514515EA1F0614514500028A45E94B40187E3CF11D9F84FC23A8F882
          F9B10D9C25F6E705DBA2A8F72481F8D7E75EBBA9DDEB5ACDE6AD7F2196EAF266
          9A563DD98E4D7D11FB69F8D84F7B63E07B2972B062EAFB69FE223F7687F025BF
          15AF01F0768577E26F1469DA0D90266BD9D620719D80FDE63EC0649FA57CFE63
          59D5AAA9C7A7E67EC1C1796C703809632AE8E7AFA457F9EFF71F4FFEC5DE0C36
          1E1DBCF18DDC589F516F26D723910A1E4FFC0987FE382BD2FE3C782E3F1C7C3A
          BFD31101BE857ED164D8E44AA0E07E232BFF0002AEB7C39A4DA685A159691611
          08ADAD2158635F40A303F1E2AF9008208C835EBD2C3C6347D933F39C767356BE
          64F1D17669DD7925B2FBB73F311D591D91D4AB29C10460835F43FEC69E3B3A7E
          B971E09BF9B16D7D99ECB71E16503E65FC5467FE027D6B95FDAABC0E7C2BF10E
          4D4ED21DBA76B3BAE23C0E165FF968BF990DFF0002F6AF2AD2AFEEB4BD4EDB52
          B199A1BAB5956589C755653906BE7A2E585AFE87EC55E9D0CFF2BD369ABAF27F
          F01E8CFD33A2B98F85DE2CB4F1AF8234ED7ED59774F1013203CC720E194FD0E7
          EBD6BA7AFA88C949292EA7E115A8CE854952A8ACD3B3F9051451546420ACAF18
          EBB65E19F0C6A1AF6A0FB6DECA0695B9E4E070A3DC9C01EE456B0AF01FDAE25F
          16EB3A6D8F853C35A0EA97D6D237DA2FA6B6B6674383F247903D72C47B2D6388
          AAE9D3725B9E9651828E37190A33768B7ABDB45BFF00C03E52F146B379E21F11
          5FEB97EDBAE6F67699FD064F007B01803D857D07FB157833CEBDBFF1B5DC5F24
          39B4B2247F11C19187E185FC5ABC660F865F10659E388783B5A52EC1433DA3AA
          8C9EA491C0F7AFBB3E1BF86ADBC21E0AD3340B60316B00576031BDCF2CDF8B12
          7F1AF1B2FC3CA7579E6B6FCCFD2F8C337A387CBD6170F24DCF4D1ED15BEDF25E
          973A2A28A2BDF3F223CEBF685F05FF00C26BF0E2F6CEDE20FA85AFFA4D99C73E
          62E7E51FEF0CAFE39ED5F04329562AC0820E083DABF4ED80652AC3208C115F19
          7ED05F093C4167F116EEF3C33A0DF6A1A7EA1FE923ECB03388A427E75381C64F
          CC3FDEC76AF1F33C3B95AA457A9FA4702E730A5CF83AD2B2DE37FC57EBF796FF
          0063EF1D8D0FC572F84EFE5C596AA775B963C24E074FF81018FAA81DEBEC3AFC
          F4B1F87FF122CAF20BCB4F08EBF0DC4122C9148B64E0AB29C8238EC457DD3F0E
          357D435BF06E9D7DABE9D71A76A2D081736F3C4636471C1E0F624123DB15A659
          525CAE9C96DB1C7C7182A1EDE38CA124F9B4959A7AAD9FCD7E4745451457A87C
          1851451400514514005145140051451400514514005145140051451400514514
          0051451400514514005145140051451401FFD9}
        Stretch = True
      end
      object Bevel2: TBevel
        Left = 262
        Top = 46
        Width = 171
        Height = 154
      end
      object Label41: TLabel
        Left = 32
        Top = 16
        Width = 91
        Height = 13
        Caption = 'Utilize a m'#227'o direita'
      end
      object btDig1: TButton
        Left = 40
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Iniciar Leitura'
        TabOrder = 0
      end
      object btDig2: TButton
        Left = 272
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Iniciar Leitura'
        TabOrder = 1
      end
    end
  end
  object edObs: TEdit
    Left = 48
    Top = 344
    Width = 513
    Height = 21
    MaxLength = 150
    TabOrder = 2
    OnKeyDown = edObsKeyDown
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 617
    Height = 24
    Align = alTop
    TabOrder = 3
    object lbAtual: TLabel
      Left = 24
      Top = 5
      Width = 40
      Height = 13
      Caption = 'lbAtual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ListBancos: TListBox
    Left = 464
    Top = 120
    Width = 121
    Height = 57
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object ImageList1: TImageList
    Left = 496
    Top = 64
    Bitmap = {
      494C010106000900240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object dsBco: TDataSource
    DataSet = DM1.cdsFBco
    Left = 520
    Top = 170
  end
  object dsCar: TDataSource
    DataSet = DM1.cdsFCar
    Left = 568
    Top = 170
  end
  object dsTel: TDataSource
    DataSet = DM1.cdsTel
    Left = 488
    Top = 186
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 
      'http://localhost:2902/api/Motorista?numero=15&nome=Marcio&permis' +
      'sao=778526969'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 264
    Top = 256
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 288
    Top = 280
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 352
    Top = 288
  end
end
