object DocCob: TDocCob
  Left = 0
  Top = 0
  Caption = 'Emitir Documento de Cobran'#231'a'
  ClientHeight = 435
  ClientWidth = 642
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
    Width = 642
    Height = 37
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lbConta: TLabel
      Left = 440
      Top = 9
      Width = 37
      Height = 13
      Caption = 'lbConta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbCli: TComboBox
      Left = 106
      Top = 6
      Width = 271
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
      OnChange = cbCliChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 37
    Width = 642
    Height = 156
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 91
      Height = 13
      Caption = 'Mostrando '#218'ltimos '
    end
    object lbCte: TLabel
      Left = 272
      Top = 8
      Width = 25
      Height = 13
      Caption = 'lbCte'
    end
    object edUlts: TJvValidateEdit
      Left = 113
      Top = 6
      Width = 24
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      EditText = '50'
      TabOrder = 0
    end
    object JvDBGrid1: TJvDBGrid
      Left = 8
      Top = 27
      Width = 241
      Height = 118
      DataSource = JvDataSource1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = JvDBGrid1DrawColumnCell
      OnDblClick = JvDBGrid1DblClick
      AlternateRowColor = 15263999
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'STATUS_ENV'
          Title.Caption = 'st...'
          Width = 19
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'N'#250'm'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISSAO'
          Title.Caption = 'Emiss'#227'o'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORCOB'
          Title.Caption = 'Valor'
          Width = 73
          Visible = True
        end>
    end
    object JvDBGrid2: TJvDBGrid
      Left = 261
      Top = 27
      Width = 231
      Height = 118
      DataSource = JvDataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      MultiSelect = True
      AlternateRowColor = 14806015
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMC'
          Title.Caption = 'CT-e'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAC'
          Title.Caption = 'Data'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Caption = 'Valor'
          Width = 59
          Visible = True
        end>
    end
    object btGerar: TBitBtn
      Left = 504
      Top = 66
      Width = 97
      Height = 33
      Caption = 'Gerar'
      TabOrder = 3
      OnClick = btGerarClick
    end
    object btSelecionar: TBitBtn
      Left = 504
      Top = 27
      Width = 97
      Height = 33
      Caption = 'Selecionar Todos'
      TabOrder = 4
      OnClick = btSelecionarClick
    end
  end
  object PanelInsere: TPanel
    Left = 0
    Top = 193
    Width = 642
    Height = 128
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 32
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Conta Banc'#225'ria'
    end
    object Label4: TLabel
      Left = 32
      Top = 32
      Width = 79
      Height = 13
      Caption = 'Data da Emiss'#227'o'
    end
    object LbEmissao: TLabel
      Left = 120
      Top = 32
      Width = 59
      Height = 13
      Caption = 'LbEmissao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 256
      Top = 32
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
    end
    object Label6: TLabel
      Left = 32
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object cbConta: TComboBox
      Left = 128
      Top = 5
      Width = 257
      Height = 21
      TabOrder = 0
      Text = 'cbConta'
    end
    object dtVenc: TDateTimePicker
      Left = 360
      Top = 27
      Width = 117
      Height = 21
      Date = 43604.629637384260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43604.629637384260000000
      TabOrder = 1
    end
    object edObs: TEdit
      Left = 104
      Top = 53
      Width = 313
      Height = 21
      MaxLength = 30
      TabOrder = 2
      Text = 'edObs'
    end
    object btSalvar: TBitBtn
      Left = 32
      Top = 80
      Width = 75
      Height = 33
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btSalvarClick
    end
    object pb: TProgressBar
      Left = 120
      Top = 96
      Width = 391
      Height = 17
      TabOrder = 4
    end
    object lbProcesso: TStaticText
      Left = 124
      Top = 78
      Width = 55
      Height = 17
      Caption = 'lbProcesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object PanelEdita: TPanel
    Left = 0
    Top = 321
    Width = 642
    Height = 56
    Align = alTop
    TabOrder = 3
    object Label14: TLabel
      Left = 20
      Top = 6
      Width = 60
      Height = 13
      Caption = 'DOC COB n'#186
    end
    object lbNcob: TLabel
      Left = 86
      Top = 6
      Width = 37
      Height = 13
      Caption = 'lbNcob'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btEdita: TBitBtn
      Left = 15
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Altera'
      TabOrder = 0
      OnClick = btEditaClick
    end
    object btCalc: TBitBtn
      Left = 108
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Recalcula'
      TabOrder = 1
      OnClick = btCalcClick
    end
    object btDesco: TBitBtn
      Left = 200
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Desconto'
      TabOrder = 2
      OnClick = btDescoClick
    end
    object btNF: TBitBtn
      Left = 292
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Nota Fiscal'
      TabOrder = 3
      OnClick = btNFClick
    end
    object btRel: TBitBtn
      Left = 553
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btRelClick
    end
    object btReenviar: TBitBtn
      Left = 457
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btReenviarClick
    end
  end
  object PanelAlt1: TPanel
    Left = 0
    Top = 377
    Width = 642
    Height = 80
    Align = alTop
    TabOrder = 4
    object Label7: TLabel
      Left = 32
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Conta Banc'#225'ria'
    end
    object Label8: TLabel
      Left = 32
      Top = 32
      Width = 79
      Height = 13
      Caption = 'Data da Emiss'#227'o'
    end
    object Label10: TLabel
      Left = 256
      Top = 32
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
    end
    object Label11: TLabel
      Left = 32
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object a1cbConta: TComboBox
      Left = 128
      Top = 5
      Width = 257
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'cbConta'
    end
    object a1dtVenc: TDateTimePicker
      Left = 360
      Top = 28
      Width = 117
      Height = 21
      Date = 43604.629637384260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43604.629637384260000000
      TabOrder = 1
    end
    object a1edObs: TEdit
      Left = 104
      Top = 53
      Width = 313
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
      Text = 'edObs'
    end
    object a1btSalvar: TBitBtn
      Left = 512
      Top = 40
      Width = 75
      Height = 33
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = a1btSalvarClick
    end
    object a1dtEmissao: TDateTimePicker
      Left = 117
      Top = 28
      Width = 117
      Height = 21
      Date = 43604.629637384260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43604.629637384260000000
      TabOrder = 4
    end
  end
  object PanelAlt2: TPanel
    Left = 0
    Top = 457
    Width = 642
    Height = 47
    Align = alTop
    TabOrder = 5
    object Label9: TLabel
      Left = 32
      Top = 14
      Width = 87
      Height = 13
      Caption = 'Valor do Desconto'
    end
    object Label13: TLabel
      Left = 272
      Top = 14
      Width = 53
      Height = 13
      Caption = 'Data Limite'
    end
    object a2dtLimite: TDateTimePicker
      Left = 335
      Top = 11
      Width = 117
      Height = 21
      Date = 43604.629637384260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43604.629637384260000000
      TabOrder = 0
    end
    object a2btSalvar: TBitBtn
      Left = 512
      Top = 6
      Width = 75
      Height = 33
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = a2btSalvarClick
    end
    object a2edValor: TJvValidateEdit
      Left = 128
      Top = 11
      Width = 73
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
    end
  end
  object PanelAlt3: TPanel
    Left = 0
    Top = 504
    Width = 642
    Height = 47
    Align = alTop
    TabOrder = 6
    object Label12: TLabel
      Left = 32
      Top = 14
      Width = 107
      Height = 13
      Caption = 'N'#250'mero da Nota Fiscal'
    end
    object a3btSalvar: TBitBtn
      Left = 512
      Top = 6
      Width = 75
      Height = 33
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = a3btSalvarClick
    end
    object a3edNum: TJvValidateEdit
      Left = 153
      Top = 11
      Width = 73
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DecimalPlaces = 2
      TabOrder = 1
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsCob
    Left = 112
    Top = 133
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsCobCTe
    Left = 336
    Top = 125
  end
  object RelCob: TppReport
    AutoStop = False
    DataPipeline = pipCTe
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
    Template.FileName = 'F:\XEtrab\FlaydelSofts\Singular\RELS\RelDocCob.rtm'
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
    Left = 480
    Top = 313
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipCTe'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Flaydel Log / DOCCOB n'#186'  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9260
        mmTop = 3704
        mmWidth = 42069
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 53711
        mmTop = 3704
        mmWidth = 11377
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4234
        mmLeft = 91281
        mmTop = 3704
        mmWidth = 10584
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'Label5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 107686
        mmTop = 3703
        mmWidth = 11377
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'No. CT-e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9260
        mmTop = 528
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'NUMC'
        DataPipeline = pipCTe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCTe'
        mmHeight = 4498
        mmLeft = 24871
        mmTop = 528
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'DATAC'
        DataPipeline = pipCTe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCTe'
        mmHeight = 4498
        mmLeft = 55033
        mmTop = 529
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'TOTAL'
        DataPipeline = pipCTe
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCTe'
        mmHeight = 4498
        mmLeft = 91281
        mmTop = 529
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 7938
        mmTop = 1058
        mmWidth = 105569
        BandType = 8
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        DataField = 'TOTAL'
        DataPipeline = pipCTe
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipCTe'
        mmHeight = 4498
        mmLeft = 84402
        mmTop = 4233
        mmWidth = 24342
        BandType = 8
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc2'
        DataPipeline = pipCTe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pipCTe'
        mmHeight = 4498
        mmLeft = 22754
        mmTop = 4232
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
  object pipCob2: TppDBPipeline
    DataSource = dsCob2
    UserName = 'pipCob2'
    Left = 520
    Top = 313
    object pipCob2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object pipCob2ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGUSER'
      FieldName = 'LIGUSER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object pipCob2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGCLI'
      FieldName = 'LIGCLI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object pipCob2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGBANCO'
      FieldName = 'LIGBANCO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object pipCob2ppField5: TppField
      FieldAlias = 'DTEMISSAO'
      FieldName = 'DTEMISSAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object pipCob2ppField6: TppField
      FieldAlias = 'DTVENC'
      FieldName = 'DTVENC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object pipCob2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCOB'
      FieldName = 'VALORCOB'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object pipCob2ppField8: TppField
      FieldAlias = 'TIPOCOB'
      FieldName = 'TIPOCOB'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object pipCob2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORICMS'
      FieldName = 'VALORICMS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object pipCob2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORJUROS'
      FieldName = 'VALORJUROS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 9
    end
    object pipCob2ppField11: TppField
      FieldAlias = 'DESCDTLIMITE'
      FieldName = 'DESCDTLIMITE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 10
    end
    object pipCob2ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCVALOR'
      FieldName = 'DESCVALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 11
    end
    object pipCob2ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'NFTRANSP'
      FieldName = 'NFTRANSP'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object pipCob2ppField14: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object pipCob2ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALIDA'
      FieldName = 'VALIDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
  end
  object pipCTe: TppDBPipeline
    DataSource = JvDataSource2
    UserName = 'pipCTe'
    Left = 560
    Top = 313
    object pipCTeppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object pipCTeppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMC'
      FieldName = 'NUMC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object pipCTeppField3: TppField
      FieldAlias = 'DATAC'
      FieldName = 'DATAC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object pipCTeppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGTRANSP'
      FieldName = 'LIGTRANSP'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object pipCTeppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMNOTA'
      FieldName = 'NUMNOTA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object pipCTeppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pipCTeppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOC'
      FieldName = 'NOC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
  end
  object pipNF: TppDBPipeline
    DataSource = dsNF
    UserName = 'pipNF'
    Left = 608
    Top = 313
    MasterDataPipelineName = 'pipCTe'
    object pipNFppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object pipNFppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMNF'
      FieldName = 'NUMNF'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object pipNFppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 2
    end
    object pipNFppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'NCONH'
      FieldName = 'NCONH'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object pipNFppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object pipNFppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGCLI'
      FieldName = 'LIGCLI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object pipNFppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGDCOB'
      FieldName = 'LIGDCOB'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object pipNFppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CTEGRUPO'
      FieldName = 'CTEGRUPO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object pipNFppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO'
      FieldName = 'PESO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pipNFppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SERIENF'
      FieldName = 'SERIENF'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object pipNFppField11: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 9
      DisplayWidth = 9
      Position = 10
    end
    object pipNFppField12: TppField
      FieldAlias = 'NOMEDEST'
      FieldName = 'NOMEDEST'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object pipNFppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PONTO'
      FieldName = 'PONTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object pipNFppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPOLOCAL'
      FieldName = 'TIPOLOCAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object pipNFppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'NUMC'
      GuidCollationType = gcString
      DetailFieldName = 'NCONH'
      DetailSortOrder = soAscending
    end
  end
  object dsCob2: TJvDataSource
    DataSet = DM5.cdsCob2
    Left = 520
    Top = 257
  end
  object dsNF: TJvDataSource
    DataSet = DM5.cdsNFcte
    Left = 584
    Top = 257
  end
  object ImageList1: TImageList
    Left = 160
    Top = 141
    Bitmap = {
      494C010103000800340010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFF7EF00F0F7F000A9D4A90051A8510059AC5900C1E0C100F3F9
      F300F2F9F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700D4D4D400A8A8A800ACACAC00E0E0E000F9F9
      F900F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFFB00E0E0F700D8D8F500D8D8F500DFDFF700F4F4
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EAF4EA00DEEEDE004AA54A000683060000800000008000000E870E006CB6
      6C00E9F4E900F1F8F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F4F400EEEEEE00A5A5A50083838300808080008080800087878700B6B6
      B600F4F4F400F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFCFE00E8E8F900E4E4F8009393E4004D4DD3005151D400AAAAEA00EAEA
      FA00ECECFA00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00EFF7
      EF00DBEDDB003198310000800000008000000080000000800000008000000180
      01004DA64D00E7F3E700FAFDFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700EDEDED009898980080808000808080008080800080808000808080008080
      8000A6A6A600F3F3F300FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8E8F900C1C1EF002F2FCC000101C0000000C0000000C0000606C1004A4A
      D200DFDFF700ECECFA00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E9F4
      E90079BC79000080000000800000008000000080000000800000008000000080
      00000A850A00C0E0C000E9F4E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400BCBCBC008080800080808000808080008080800080808000808080008080
      800085858500E0E0E000F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8
      F900DADAF6002626C9000000C0000000C0000000C0000000C0000000C0000000
      C0004A4AD200EAEAFA00F4F4FC00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F0F7
      F000369B36000080000000800000008000000080000000800000008000000080
      00000080000069B46900EBF5EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F7009B9B9B008080800080808000808080008080800080808000808080008080
      800080808000B4B4B400F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEC
      FB007171DC000000C0000000C0000000C0000000C0000000C0000000C0000000
      C0000606C100ABABEA00E9E9FA00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00DFEF
      DF00148A14000080000000800000008000000080000000800000008000000080
      0000008000003B9D3B00DDEEDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF008A8A8A008080800080808000808080008080800080808000808080008080
      8000808080009D9D9D00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      F9002424C9000000C0000000C0000000C0000000C0000000C0000000C0000000
      C0000000C0005B5BD600E9E9FA00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00EDF6
      ED002B952B000080000000800000008000000080000000800000008000000080
      0000008000005BAD5B00EBF5EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6
      F600959595008080800080808000808080008080800080808000808080008080
      800080808000ADADAD00F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3
      F8001919C6000000C0000000C0000000C0000000C0000000C0000000C0000000
      C0000000C0005050D400E4E4F900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00EEF6
      EE0062B162000080000000800000008000000080000000800000008000000080
      000004820400A9D5A900E9F4E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6
      F600B1B1B1008080800080808000808080008080800080808000808080008080
      800082828200D5D5D500F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1
      FB005959D6000000C0000000C0000000C0000000C0000000C0000000C0000000
      C0000101C0009393E400EAEAFA00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E8F4
      E800C8E3C800158A150000800000008000000080000000800000008000000080
      00002F972F00E3F1E300F4F9F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400E3E3E3008A8A8A0080808000808080008080800080808000808080008080
      800097979700F1F1F100F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4
      F800C3C3F0001111C4000000C0000000C0000000C0000000C0000000C0000000
      C0002F2FCC00E4E4F800EFEFFB00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8F3E800B9DDB900269326000080000000800000008000000180010040A0
      4000CEE7CE00ECF5EC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F3F3F300DDDDDD009393930080808000808080008080800080808000A0A0
      A000E7E7E700F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
      FE00ECECFA009696E5000D0DC3000000C0000000C0000000C0000000C0002222
      C800C1C1EF00EAEAF900FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFEFD00F1F8F100DAECDA0070B87000168B1600239123008EC78E00EBF5
      EB00EEF6EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00F8F8F800ECECEC00B8B8B8008B8B8B0091919100C7C7C700F5F5
      F500F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F5F5FD00ECECFA00B9B9ED005757D5001313C5001D1DC7006E6EDB00D2D2
      F400E8E8F900FCFCFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E8F3E800F1F8F100DFEFDF00E4F2E400EDF6ED00EEF6
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F3F3F300F8F8F800EFEFEF00F2F2F200F6F6F600F6F6
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFCFE00E4E4F800F0F0FB00DFDFF700E3E3F800ECECFB00E8E8
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
