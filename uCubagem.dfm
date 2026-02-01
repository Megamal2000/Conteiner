object Cubagem: TCubagem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cubagem'
  ClientHeight = 382
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 674
    Height = 293
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    SortMarker = smUp
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = clSkyBlue
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DTCRIA'
        Title.Caption = 'Data Cria'#231#227'o'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Volume'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Localidade'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIGCLI'
        Title.Caption = 'nCli'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUB_VOLUME'
        Title.Caption = 'Cubagem'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 89
    Align = alTop
    Color = 12615680
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Bevel1: TBevel
      Left = 32
      Top = 43
      Width = 809
      Height = 2
    end
    object Label2: TLabel
      Left = 33
      Top = 55
      Width = 186
      Height = 13
      Caption = 'Data                                             at'#233'    '
    end
    object lbQuant: TLabel
      Left = 623
      Top = 16
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbQuant'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbCli: TComboBox
      Left = 81
      Top = 14
      Width = 320
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Sorted = True
      TabOrder = 0
      Text = 'cbCli'
    end
    object dt1: TDateTimePicker
      Left = 64
      Top = 52
      Width = 113
      Height = 21
      Date = 42215.597907071760000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42215.597907071760000000
      TabOrder = 1
    end
    object dt2: TDateTimePicker
      Left = 224
      Top = 52
      Width = 113
      Height = 21
      Date = 42215.597949027780000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42215.597949027780000000
      TabOrder = 2
    end
    object btPesq: TBitBtn
      Left = 372
      Top = 51
      Width = 97
      Height = 25
      Caption = 'Pesquisar'
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      TabOrder = 3
      OnClick = btPesqClick
    end
    object btImp: TBitBtn
      Left = 748
      Top = 51
      Width = 89
      Height = 25
      Caption = 'Imprmir'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
        000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
        0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
        7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
        0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
        0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
        FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      TabOrder = 4
    end
    object ck300: TCheckBox
      Left = 549
      Top = 55
      Width = 52
      Height = 17
      Caption = 'x 300'
      TabOrder = 5
    end
    object edValor: TJvValidateEdit
      Left = 496
      Top = 53
      Width = 43
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 6
    end
    object btAltera: TBitBtn
      Left = 599
      Top = 51
      Width = 68
      Height = 25
      Caption = 'Altera Todos'
      TabOrder = 7
      OnClick = btAlteraClick
    end
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsNotas
    Left = 280
    Top = 208
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 224
    object AlterarSelecionados1: TMenuItem
      Caption = 'Alterar Selecionados'
      OnClick = AlterarSelecionados1Click
    end
    object VoltarOriginalnosSelecionados1: TMenuItem
      Caption = 'Voltar Original nos Selecionados'
      OnClick = VoltarOriginalnosSelecionados1Click
    end
  end
end
