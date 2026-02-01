object eStok: TeStok
  Left = 0
  Top = 0
  Caption = 'Visualiza'#231#227'o Geral do Estoque'
  ClientHeight = 479
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 854
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 424
      Top = 14
      Width = 96
      Height = 13
      Caption = 'Mostrar Quantidade'
    end
    object cbCli: TComboBox
      Left = 66
      Top = 11
      Width = 327
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
    end
    object cbTipoQt: TComboBox
      Left = 532
      Top = 11
      Width = 101
      Height = 21
      TabOrder = 1
      Text = 'maior que zero'
      Items.Strings = (
        'maior que zero'
        'igual a zero'
        'menor que zero'
        'diferente de zero'
        'Todos')
    end
    object btMostrar: TBitBtn
      Left = 656
      Top = 9
      Width = 97
      Height = 25
      Caption = 'Mostrar'
      TabOrder = 2
      OnClick = btMostrarClick
    end
    object btPDF: TBitBtn
      Left = 766
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 3
      OnClick = btPDFClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 864
    Height = 32
    Align = alTop
    Caption = 'Visualiza'#231#227'o do Estoque'
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 854
    object edPesq: TSearchBox
      Left = 16
      Top = 6
      Width = 289
      Height = 21
      TabOrder = 0
      TextHint = 'Pesquise [nome] ou  #[codtransp] ou @[codcli] '
      OnChange = edPesqChange
      OnClick = edPesqClick
      OnKeyPress = edPesqKeyPress
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 864
    Height = 280
    Align = alTop
    DataSource = JvDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clPurple
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    AlternateRowColor = clMoneyGreen
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CODCLI'
        Title.Caption = 'C'#243'd Cli'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMELONGO'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Caption = 'Estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTMOV'
        Title.Caption = 'Dt Movimento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DINVENTARIO'
        Title.Caption = 'Dt Invent'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTMIN'
        Title.Caption = 'M'#237'nima'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLASSIF1LOCAL'
        Title.Caption = 'Classifica'#231#227'o'
        Width = 112
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 353
    Width = 497
    Height = 126
    Align = alLeft
    TabOrder = 3
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 495
      Height = 24
      Align = alTop
      Caption = 'SubProdutos'
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 518
    end
    object JvDBGrid2: TJvDBGrid
      Left = 1
      Top = 25
      Width = 495
      Height = 100
      Align = alClient
      DataSource = JvDataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clPurple
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = JvDBGrid2CellClick
      AlternateRowColor = clSkyBlue
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMESUB'
          Title.Caption = 'Produto'
          Width = 179
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTSUB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Quant Vol'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTUM'
          Title.Caption = 'por Vol'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTCALC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Quant Unit'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODCLI'
          Title.Caption = 'C'#243'd Cli'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODTRANSP'
          Title.Caption = 'C'#243'd Transp'
          Width = 78
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 497
    Top = 353
    Width = 367
    Height = 126
    Align = alClient
    TabOrder = 4
    ExplicitLeft = 520
    ExplicitWidth = 334
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 365
      Height = 24
      Align = alTop
      Caption = 'Hist'#243'rico'
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 332
    end
    object JvDBGrid3: TJvDBGrid
      Left = 1
      Top = 25
      Width = 365
      Height = 100
      Align = alClient
      DataSource = JvDataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clPurple
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AlternateRowColor = clSkyBlue
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'DTCRIADO'
          Title.Caption = 'Data'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPODESC'
          Title.Caption = 'Movimenta'#231#227'o'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMDOC'
          Title.Caption = 'NF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Quantidade'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEUSER'
          Title.Caption = 'Usu'#225'rio'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MODOMODIFICA'
          Title.Caption = '...'
          Width = 17
          Visible = True
        end>
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = eDM.cdsStok
    Left = 752
    Top = 104
  end
  object JvDataSource2: TJvDataSource
    DataSet = eDM.cdsStoks
    Left = 16
    Top = 433
  end
  object JvDataSource3: TJvDataSource
    DataSet = eDM.cdsStokh
    Left = 577
    Top = 433
  end
  object RelEstoque: TppReport
    AutoStop = False
    DataPipeline = pipEstoque
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'F:\00MZcode\FlaydelSofts\Singular\RELS\estoquePosicao.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 752
    Top = 200
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipEstoque'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 6879
        mmTop = 2381
        mmWidth = 13494
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'Cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 8467
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 22225
        mmTop = 8466
        mmWidth = 11377
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 5292
        mmTop = 19050
        mmWidth = 187325
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'C'#243'd. Cli'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 21696
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20370
        mmTop = 21696
        mmWidth = 11642
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 21696
        mmWidth = 11907
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        Caption = 'Dt Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 21696
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'CODCLI'
        DataPipeline = pipEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipEstoque'
        mmHeight = 4498
        mmLeft = 6615
        mmTop = 529
        mmWidth = 10848
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'NOMELONGO'
        DataPipeline = pipEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipEstoque'
        mmHeight = 4498
        mmLeft = 20370
        mmTop = 528
        mmWidth = 88900
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'QUANTIDADE'
        DataPipeline = pipEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipEstoque'
        mmHeight = 4498
        mmLeft = 112977
        mmTop = 528
        mmWidth = 11906
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'DTMOV'
        DataPipeline = pipEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipEstoque'
        mmHeight = 4498
        mmLeft = 130704
        mmTop = 529
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 5292
        mmTop = 1058
        mmWidth = 187325
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20373
        mmTop = 3440
        mmWidth = 529
        BandType = 8
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc2'
        DataPipeline = pipEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pipEstoque'
        mmHeight = 4498
        mmLeft = 39423
        mmTop = 3440
        mmWidth = 17198
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pipEstoque: TppDBPipeline
    DataSource = JvDataSource1
    UserName = 'pipEstoque'
    Left = 752
    Top = 144
    object pipEstoqueppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object pipEstoqueppField2: TppField
      FieldAlias = 'NOMELONGO'
      FieldName = 'NOMELONGO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pipEstoqueppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object pipEstoqueppField4: TppField
      FieldAlias = 'DTMOV'
      FieldName = 'DTMOV'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object pipEstoqueppField5: TppField
      FieldAlias = 'DINVENTARIO'
      FieldName = 'DINVENTARIO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object pipEstoqueppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTMIN'
      FieldName = 'QUANTMIN'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object pipEstoqueppField7: TppField
      FieldAlias = 'CLASSIF1LOCAL'
      FieldName = 'CLASSIF1LOCAL'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object pipEstoqueppField8: TppField
      FieldAlias = 'CODCLI'
      FieldName = 'CODCLI'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
  end
end
