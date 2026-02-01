object RomaPQ: TRomaPQ
  Left = 206
  Top = 115
  Width = 618
  Height = 547
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa Romaneios de uma data'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 610
    Height = 421
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    FixedCols = 1
    AlternateRowColor = 16776176
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'LINHA'
        Title.Caption = '...'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Motorista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESOR'
        Title.Caption = 'Peso'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEMBAIXA'
        Title.Caption = 'sem Baixa'
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 0
    Top = 73
    Width = 610
    Height = 421
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDrawColumnCell = JvDBGrid2DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 16776176
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Motorista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PesoR'
        Title.Caption = 'Peso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEMBAIXA'
        Title.Caption = 'sem Baixa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Frete'
        Width = 76
        Visible = True
      end>
  end
  object JvDBGrid3: TJvDBGrid
    Left = 0
    Top = 73
    Width = 610
    Height = 421
    Align = alClient
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    FixedCols = 1
    AlternateRowColor = 13299444
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'LINHA'
        Title.Caption = '...'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idC'
        Title.Caption = 'Num Cli'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeC'
        Title.Caption = 'Cliente'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFtot'
        Title.Caption = 'Quant Notas'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFfalta'
        Title.Caption = 'n'#227'o Entregues'
        Width = 81
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 73
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 89
      Height = 13
      Caption = 'Data do Romaneio'
    end
    object lbAtual: TLabel
      Left = 416
      Top = 16
      Width = 3
      Height = 13
    end
    object Label2: TLabel
      Left = 24
      Top = 52
      Width = 53
      Height = 13
      Caption = 'Mostrar por'
    end
    object dtR: TDateTimePicker
      Left = 128
      Top = 21
      Width = 129
      Height = 21
      Date = 40925.618466064810000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40925.618466064810000000
      TabOrder = 0
    end
    object btPesq: TBitBtn
      Left = 272
      Top = 19
      Width = 104
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesqClick
    end
    object rbRoma: TRadioButton
      Left = 93
      Top = 51
      Width = 84
      Height = 17
      Caption = 'Romaneio'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rbCli: TRadioButton
      Left = 192
      Top = 52
      Width = 113
      Height = 17
      Caption = 'Clientes'
      TabOrder = 3
    end
  end
  object Rodape: TStatusBar
    Left = 0
    Top = 494
    Width = 610
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsRomaPQ
    Left = 432
    Top = 88
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 464
    Top = 88
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'LINHA'
        DataType = ftSmallint
      end
      item
        Name = 'NUM'
        DataType = ftInteger
      end
      item
        Name = 'KM'
        DataType = ftSmallint
      end
      item
        Name = 'ROMANEIO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SEMBAIXA'
        DataType = ftInteger
      end
      item
        Name = 'Frete'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'PesoR'
        DataType = ftFloat
        Precision = 1
      end>
    Left = 496
    Top = 88
    object TabNUM: TIntegerField
      FieldName = 'NUM'
    end
    object TabKM: TSmallintField
      FieldName = 'KM'
    end
    object TabROMANEIO: TIntegerField
      FieldName = 'ROMANEIO'
    end
    object TabNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object TabSEMBAIXA: TIntegerField
      FieldName = 'SEMBAIXA'
    end
    object TabFrete: TFloatField
      FieldName = 'Frete'
      DisplayFormat = '#,##0.00'
    end
    object TabPesoR: TFloatField
      FieldName = 'PesoR'
      DisplayFormat = '#,##0.0'
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = Tab2
    Left = 464
    Top = 136
  end
  object Tab2: TJvMemoryData
    FieldDefs = <
      item
        Name = 'LINHA'
        DataType = ftSmallint
      end
      item
        Name = 'idC'
        DataType = ftInteger
      end
      item
        Name = 'NomeC'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NFtot'
        DataType = ftInteger
      end
      item
        Name = 'NFfalta'
        DataType = ftInteger
      end>
    Left = 504
    Top = 136
    object Tab2idC: TIntegerField
      FieldName = 'idC'
    end
    object Tab2NomeC: TStringField
      FieldName = 'NomeC'
    end
    object Tab2NFtot: TIntegerField
      FieldName = 'NFtot'
    end
    object Tab2NFfalta: TIntegerField
      FieldName = 'NFfalta'
    end
    object Tab2LINHA: TSmallintField
      FieldName = 'LINHA'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 528
    Top = 232
    object BaixaporRomaneio1: TMenuItem
      Caption = 'Baixa por Romaneio'
      OnClick = BaixaporRomaneio1Click
    end
  end
end
