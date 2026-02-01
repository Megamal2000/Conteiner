object PagDiv: TPagDiv
  Left = 254
  Top = 177
  BorderIcons = [biSystemMenu]
  Caption = 'Pagamentos de Mototistas'
  ClientHeight = 539
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 105
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 200
      Height = 13
      Caption = 'De                                                        at'#233' '
    end
    object lbMot: TLabel
      Left = 115
      Top = 13
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbkm: TLabel
      Left = 32
      Top = 80
      Width = 151
      Height = 13
      Caption = 'Valor do KM para este Motorista'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 66
      Width = 617
      Height = 2
    end
    object btSalveKM: TSpeedButton
      Left = 269
      Top = 77
      Width = 23
      Height = 22
      Hint = 'Salvar KM no Motorista'
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
      OnClick = btSalveKMClick
    end
    object btImp: TSpeedButton
      Left = 543
      Top = 75
      Width = 24
      Height = 24
      Hint = 'Imprimir Lista'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btImpClick
    end
    object dat1: TDateTimePicker
      Left = 64
      Top = 40
      Width = 112
      Height = 21
      Date = 40837.654298495370000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40837.654298495370000000
      TabOrder = 0
      OnChange = dat1Change
    end
    object dat2: TDateTimePicker
      Left = 256
      Top = 40
      Width = 112
      Height = 21
      Date = 40837.654730173610000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40837.654730173610000000
      TabOrder = 1
      OnChange = dat2Change
    end
    object btMot: TBitBtn
      Left = 29
      Top = 10
      Width = 75
      Height = 20
      Caption = 'Motorista'
      TabOrder = 2
      OnClick = btMotClick
    end
    object btAtualiza: TBitBtn
      Left = 464
      Top = 37
      Width = 105
      Height = 25
      Caption = 'Atualiza'
      TabOrder = 3
      OnClick = btAtualizaClick
    end
    object valorKM: TJvValidateEdit
      Left = 192
      Top = 77
      Width = 73
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 4
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 105
    Width = 799
    Height = 292
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        FieldName = 'dtRoma'
        Title.Caption = 'Data Romaneio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Romaneio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Regiao'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtNFtot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Qt Notas'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtNFprinc'
        Title.Caption = 'Aglomera'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QNFsite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Entregas'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Peso'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ponto'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'km'
        Title.Caption = 'Km'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PagM'
        Title.Caption = 'Tipo pgm'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPAG'
        Title.Caption = 'Valor'
        Width = 73
        Visible = True
      end>
  end
  object Rodape: TStatusBar
    Left = 0
    Top = 520
    Width = 799
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 397
    Width = 799
    Height = 123
    Align = alBottom
    TabOrder = 3
    object lbSubt: TLabel
      Left = 549
      Top = 10
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
    end
    object lbVales: TLabel
      Left = 549
      Top = 32
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbTot: TLabel
      Left = 512
      Top = 88
      Width = 109
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 24
      Top = 16
      Width = 185
      Height = 57
    end
    object Label3: TLabel
      Left = 72
      Top = 24
      Width = 89
      Height = 13
      Caption = 'Gravar Pagamento'
    end
    object lbCred: TLabel
      Left = 549
      Top = 56
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btVales: TBitBtn
      Left = 440
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Vales'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btValesClick
    end
    object btSalvPag: TBitBtn
      Left = 80
      Top = 43
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
    end
    object btcred: TBitBtn
      Left = 440
      Top = 52
      Width = 75
      Height = 25
      Caption = 'Cr'#233'dito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btcredClick
    end
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 768
    Top = 256
  end
  object PopupMenu1: TPopupMenu
    Left = 768
    Top = 128
    object Classificarpagm1: TMenuItem
      Caption = 'Classificar pagm'
      OnClick = Classificarpagm1Click
    end
    object AlterarKm1: TMenuItem
      Caption = 'Alterar Km'
      OnClick = AlterarKm1Click
    end
    object AlterarValor1: TMenuItem
      Caption = 'Alterar Valor'
      OnClick = AlterarValor1Click
    end
    object AlterarTipo1: TMenuItem
      Caption = 'Alterar Tipo'
      object Entregas1: TMenuItem
        Caption = 'Entregas'
        OnClick = Entregas1Click
      end
      object KM1: TMenuItem
        Caption = 'KM'
        OnClick = KM1Click
      end
      object Sada1: TMenuItem
        Caption = 'Sa'#237'da'
        OnClick = Sada1Click
      end
      object Contrato1: TMenuItem
        Caption = 'Contrato'
        OnClick = Contrato1Click
      end
      object ratado1: TMenuItem
        Caption = 'Tratado'
        OnClick = ratado1Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Calcular1: TMenuItem
      Caption = 'Calcular'
      OnClick = Calcular1Click
    end
    object InserirTratado1: TMenuItem
      Caption = 'Inserir Tratado'
    end
  end
  object RelPG1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'F:\XEtrab\FlaydelSofts\Singular\RELS\RelPagR.rtm'
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
    Left = 768
    Top = 168
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'DEMONSTRATIVO DE PAGAMENTO - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 13229
        mmTop = 4498
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 79111
        mmTop = 4498
        mmWidth = 11261
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 153459
        mmTop = 4498
        mmWidth = 17610
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 10848
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Per'#237'odo de                                  at'#233' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 13494
        mmTop = 12435
        mmWidth = 57743
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 32808
        mmTop = 12435
        mmWidth = 11261
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Label5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 73819
        mmTop = 12435
        mmWidth = 11261
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 6879
        mmTop = 18521
        mmWidth = 174361
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 19050
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Romaneio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 27781
        mmTop = 19050
        mmWidth = 16171
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'NFs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 65910
        mmTop = 19050
        mmWidth = 6435
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Pontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 98703
        mmTop = 19050
        mmWidth = 10922
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Tipo de Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 126214
        mmTop = 19050
        mmWidth = 24892
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 166688
        mmTop = 19315
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label19'
        HyperlinkEnabled = False
        Caption = 'Aglom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 73578
        mmTop = 19050
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label21'
        HyperlinkEnabled = False
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 114049
        mmTop = 19050
        mmWidth = 7959
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label22'
        HyperlinkEnabled = False
        Caption = 'Entreg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 85743
        mmTop = 19050
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label20'
        Caption = 'Regi'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 46831
        mmTop = 19050
        mmWidth = 10584
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'DTROMA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 7408
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'ROMANEIO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 26988
        mmTop = 794
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'QtNFtot'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 65382
        mmTop = 794
        mmWidth = 7938
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'Ponto'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 98438
        mmTop = 794
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'PAGM'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 127000
        mmTop = 795
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'VPAG'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 794
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'QtNFprinc'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 76496
        mmTop = 794
        mmWidth = 7938
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'Peso'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 110609
        mmTop = 794
        mmWidth = 11906
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'QNFsite'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 87346
        mmTop = 794
        mmWidth = 7938
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'Regiao'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4498
        mmLeft = 43127
        mmTop = 529
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 6085
        mmTop = 529
        mmWidth = 176213
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 106098
        mmTop = 794
        mmWidth = 76465
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        HyperlinkEnabled = False
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'VPAG'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4234
        mmLeft = 151130
        mmTop = 2380
        mmWidth = 17018
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Romaneios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 127000
        mmTop = 2381
        mmWidth = 17992
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Vales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 135466
        mmTop = 8997
        mmWidth = 8730
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 122047
        mmTop = 25665
        mmWidth = 7958
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Label16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 151130
        mmTop = 8997
        mmWidth = 17018
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Label17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5165
        mmLeft = 152231
        mmTop = 25135
        mmWidth = 15917
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 132503
        mmTop = 17198
        mmWidth = 11430
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label18'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 150813
        mmTop = 17198
        mmWidth = 16933
        BandType = 7
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
  object Tab: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'dtRoma'
        DataType = ftDate
      end
      item
        Name = 'Num'
        DataType = ftInteger
      end
      item
        Name = 'Romaneio'
        DataType = ftInteger
      end
      item
        Name = 'QtNFtot'
        DataType = ftInteger
      end
      item
        Name = 'QtNFprinc'
        DataType = ftInteger
      end
      item
        Name = 'QtNFout'
        DataType = ftInteger
      end
      item
        Name = 'PagM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'km'
        DataType = ftInteger
      end
      item
        Name = 'Ponto'
        DataType = ftSmallint
      end
      item
        Name = 'Tipo_Carro'
        DataType = ftSmallint
      end
      item
        Name = 'Tipo_Pag'
        DataType = ftSmallint
      end
      item
        Name = 'VPAG'
        DataType = ftFloat
      end
      item
        Name = 'LigAjud'
        DataType = ftInteger
      end
      item
        Name = 'Peso'
        DataType = ftFloat
      end
      item
        Name = 'QNFsite'
        DataType = ftInteger
      end
      item
        Name = 'Regiao'
        DataType = ftString
        Size = 20
      end>
    Left = 768
    Top = 304
    object TabdtRoma: TDateField
      FieldName = 'dtRoma'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object TabNum: TIntegerField
      FieldName = 'Num'
    end
    object TabRomaneio: TIntegerField
      FieldName = 'Romaneio'
      DisplayFormat = '#,##0'
    end
    object TabQtNFtot: TIntegerField
      FieldName = 'QtNFtot'
    end
    object TabQtNFprinc: TIntegerField
      FieldName = 'QtNFprinc'
    end
    object TabQtNFout: TIntegerField
      FieldName = 'QtNFout'
    end
    object TabPagM: TStringField
      FieldName = 'PagM'
      Size = 10
    end
    object Tabkm: TIntegerField
      FieldName = 'km'
    end
    object TabPonto: TSmallintField
      FieldName = 'Ponto'
    end
    object TabTipo_Carro: TSmallintField
      FieldName = 'Tipo_Carro'
    end
    object TabTipo_Pag: TSmallintField
      FieldName = 'Tipo_Pag'
    end
    object TabVPAG: TFloatField
      FieldName = 'VPAG'
      DisplayFormat = '#,##0.00'
    end
    object TabLigAjud: TIntegerField
      FieldName = 'LigAjud'
    end
    object TabPeso: TFloatField
      FieldName = 'Peso'
    end
    object TabQNFsite: TIntegerField
      FieldName = 'QNFsite'
    end
    object TabRegiao: TStringField
      FieldName = 'Regiao'
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DBPipeline1'
    Left = 768
    Top = 208
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'dtRoma'
      FieldName = 'dtRoma'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'Num'
      FieldName = 'Num'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Romaneio'
      FieldName = 'Romaneio'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QtNFtot'
      FieldName = 'QtNFtot'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QtNFprinc'
      FieldName = 'QtNFprinc'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QtNFout'
      FieldName = 'QtNFout'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'PagM'
      FieldName = 'PagM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'km'
      FieldName = 'km'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'Ponto'
      FieldName = 'Ponto'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'Tipo_Carro'
      FieldName = 'Tipo_Carro'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'Tipo_Pag'
      FieldName = 'Tipo_Pag'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VPAG'
      FieldName = 'VPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'LigAjud'
      FieldName = 'LigAjud'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'Peso'
      FieldName = 'Peso'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'QNFsite'
      FieldName = 'QNFsite'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'Regiao'
      FieldName = 'Regiao'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
  end
end
