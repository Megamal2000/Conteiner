object PagLista: TPagLista
  Left = 210
  Top = 116
  BorderIcons = [biSystemMenu]
  Caption = 'Lista de Pagamento de Motoristas'
  ClientHeight = 497
  ClientWidth = 701
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
    Width = 701
    Height = 81
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    ExplicitWidth = 635
    object Label1: TLabel
      Left = 40
      Top = 29
      Width = 170
      Height = 13
      Caption = 'Per'#237'odo:     de                               a '
    end
    object Label2: TLabel
      Left = 40
      Top = 8
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label3: TLabel
      Left = 40
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lbCli: TLabel
      Left = 88
      Top = 8
      Width = 25
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbINI: TLabel
      Left = 120
      Top = 29
      Width = 22
      Height = 13
      Caption = 'lbINI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbFim: TLabel
      Left = 214
      Top = 29
      Width = 24
      Height = 13
      Caption = 'lbFim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbDesc: TLabel
      Left = 96
      Top = 56
      Width = 33
      Height = 13
      Caption = 'lbDesc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btImp: TBitBtn
      Left = 512
      Top = 48
      Width = 99
      Height = 25
      Caption = 'Relat'#243'rio'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        22222200000000000222208888888880802200000000000008020888888BBB88
        0002088888877788080200000000000008800888888888808080200000000008
        0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
        022222220FFFFFFFF02222222000000000222222222222222222}
      TabOrder = 0
      OnClick = btImpClick
    end
    object btAlterar: TBitBtn
      Left = 512
      Top = 16
      Width = 97
      Height = 25
      Caption = 'Alterar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555500005577777777777777777500005000000000000000007500005088
        80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
        0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
        0F44F0750000508880FF0078088880750000508180F400007844807500005088
        80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
        0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
        00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
        55555555550BFFBB0000}
      TabOrder = 1
      OnClick = btAlterarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 478
    Width = 701
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ExplicitWidth = 635
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 81
    Width = 701
    Height = 371
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        FieldName = 'NOME'
        Title.Caption = 'Motorista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VSERVICO'
        Title.Caption = 'Servi'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCREDITOS'
        Title.Caption = 'Cr'#233'ditos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VVALES'
        Title.Caption = 'Vales'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCALCF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'vlr Sistema'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCALCM'
        Title.Caption = 'vlr Motorista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'vlr Pago'
        Width = 74
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 320
    Top = 394
    Width = 323
    Height = 62
    TabOrder = 3
    Visible = False
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 22
      Width = 279
      Height = 2
    end
    object lbMot: TLabel
      Left = 72
      Top = 8
      Width = 32
      Height = 13
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 32
      Width = 70
      Height = 13
      Caption = 'Valor Motorista'
    end
    object btValorM: TSpeedButton
      Left = 175
      Top = 28
      Width = 23
      Height = 22
      Hint = 'Salvar Valor do Motorista'
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88888888888888888DDDDDD0
        000800000008000088DDDD03333087708880333308DDDD033330877088803333
        08DDDD03333087708880333308DDDD03333087708880333308DDDD0333308770
        8880333308DDDD03333088808880333308DDDD03333000000007333308DDDD03
        333333333333333308DDDD03333333333333333308DDDD033330000000033333
        08DDDD03330FFFFFFFF0333308DDDD03330FFFFFFFF0333308DDDD03330FFFFF
        FFF0333308DDDD03330FFFFFFFF0333308DDDD03330FFFFFFFF0333308DDDD03
        330FFFFFFFF0308308DDDD03330FFFFFFFF0308308DDDD000000000000000800
        0DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      OnClick = btValorMClick
    end
    object edValorM: TJvValidateEdit
      Left = 93
      Top = 28
      Width = 72
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 0
      OnKeyPress = edValorMKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 452
    Width = 701
    Height = 26
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 4
    ExplicitWidth = 635
    object lbServ: TLabel
      Left = 176
      Top = 8
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCred: TLabel
      Left = 280
      Top = 8
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbVale: TLabel
      Left = 344
      Top = 8
      Width = 50
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSist: TLabel
      Left = 398
      Top = 8
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '222.000,54'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbMotor: TLabel
      Left = 472
      Top = 8
      Width = 68
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '122.000,54'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPago: TLabel
      Left = 542
      Top = 8
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '122.000,54'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPagI
    Left = 584
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 216
    object AlterarValorMotorista1: TMenuItem
      Caption = 'Alterar Valor Motorista'
      OnClick = AlterarValorMotorista1Click
    end
    object AnotarPagamento1: TMenuItem
      Caption = 'Anotar Pagamento'
      OnClick = AnotarPagamento1Click
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = JvDataSource1
    UserName = 'DBPipeline1'
    Left = 584
    Top = 176
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGPAG'
      FieldName = 'LIGPAG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VSERVICO'
      FieldName = 'VSERVICO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VCREDITOS'
      FieldName = 'VCREDITOS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VVALES'
      FieldName = 'VVALES'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VCALCF'
      FieldName = 'VCALCF'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VCALCM'
      FieldName = 'VCALCM'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VPAGO'
      FieldName = 'VPAGO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'MODO'
      FieldName = 'MODO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIGFUNC'
      FieldName = 'LIGFUNC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'DTPAGM'
      FieldName = 'DTPAGM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDF'
      FieldName = 'IDF'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
  end
  object relPag2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
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
    Template.FileName = 'G:\FlaydelSOFTS\Singular\RELS\RelPag2.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    ModalPreview = False
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
    Left = 584
    Top = 216
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'FLAYDEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 1058
        mmWidth = 16341
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Relat'#243'rio de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 38269
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 4763
        mmTop = 21696
        mmWidth = 186796
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 14817
        mmTop = 17727
        mmWidth = 14563
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 80433
        mmTop = 17727
        mmWidth = 11769
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Cr'#233'ditos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 100013
        mmTop = 17727
        mmWidth = 13123
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 122767
        mmTop = 17727
        mmWidth = 8805
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Vlr Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 136261
        mmTop = 17727
        mmWidth = 18119
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Vlr Motor.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 155840
        mmTop = 17727
        mmWidth = 15409
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Vlr Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 176742
        mmTop = 17727
        mmWidth = 13547
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 4763
        mmTop = 17198
        mmWidth = 186796
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 11642
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 11642
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Label15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 66675
        mmTop = 1058
        mmWidth = 13208
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'De                          at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 7673
        mmWidth = 36777
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Label17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 7673
        mmWidth = 13208
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 7673
        mmWidth = 13208
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NOME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 14023
        mmTop = 794
        mmWidth = 59796
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'VSERVICO'
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
        mmHeight = 4233
        mmLeft = 75936
        mmTop = 794
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'VCREDITOS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 96309
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'VVALES'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 115623
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VCALCF'
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
        mmHeight = 4233
        mmLeft = 135202
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'VCALCM'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 154252
        mmTop = 794
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'VPAGO'
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
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 795
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground1
      end
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape1'
        Brush.Color = clBlack
        mmHeight = 2381
        mmLeft = 10319
        mmTop = 1588
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer2
        UserName = 'SubReport1'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5027
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipeline2
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
          Version = '18.01'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipeline2'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 529
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLabel1: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label1'
              HyperlinkEnabled = False
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 14552
              mmTop = 795
              mmWidth = 10054
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText3: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText3'
              HyperlinkEnabled = False
              DataField = 'BCONOME'
              DataPipeline = ppDBPipeline2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4233
              mmLeft = 36513
              mmTop = 794
              mmWidth = 18785
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText4: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText4'
              HyperlinkEnabled = False
              DataField = 'AGENCIA'
              DataPipeline = ppDBPipeline2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4233
              mmLeft = 64558
              mmTop = 794
              mmWidth = 10319
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText10: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText10'
              HyperlinkEnabled = False
              DataField = 'CONTA'
              DataPipeline = ppDBPipeline2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4233
              mmLeft = 88636
              mmTop = 794
              mmWidth = 23813
              BandType = 4
              LayerName = Foreground
            end
            object ppLabel2: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label2'
              HyperlinkEnabled = False
              Caption = 'Ag'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 58208
              mmTop = 795
              mmWidth = 4233
              BandType = 4
              LayerName = Foreground
            end
            object ppLabel3: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label3'
              HyperlinkEnabled = False
              Caption = 'Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 77523
              mmTop = 795
              mmWidth = 9525
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText11: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText11'
              HyperlinkEnabled = False
              DataField = 'BCONUM'
              DataPipeline = ppDBPipeline2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 3969
              mmLeft = 26723
              mmTop = 794
              mmWidth = 7938
              BandType = 4
              LayerName = Foreground
            end
            object ppLabel4: TppLabel
              DesignLayer = ppDesignLayer1
              UserName = 'Label4'
              HyperlinkEnabled = False
              Caption = 'CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4064
              mmLeft = 115359
              mmTop = 794
              mmWidth = 7112
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText12: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText12'
              HyperlinkEnabled = False
              DataField = 'CPF'
              DataPipeline = ppDBPipeline2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 3969
              mmLeft = 124884
              mmTop = 794
              mmWidth = 26194
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppSummaryBand1: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppLine1: TppLine
              DesignLayer = ppDesignLayer1
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 1588
              mmLeft = 14552
              mmTop = 1058
              mmWidth = 138642
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
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Motoristas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 8731
        mmWidth = 16140
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc1'
        HyperlinkEnabled = False
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 25665
        mmTop = 8731
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'VCALCF'
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
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 8731
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc3'
        HyperlinkEnabled = False
        DataField = 'VPAGO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 8731
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Pen.Style = psDash
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 81492
        mmTop = 15346
        mmWidth = 109273
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line5'
        Pen.Width = 4
        Weight = 3.000000000000000000
        mmHeight = 2117
        mmLeft = 4233
        mmTop = 3440
        mmWidth = 187855
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = JvDataSource2
    RangeEndCount = 5
    SkipWhenNoRecords = False
    UserName = 'DBPipeline2'
    Left = 416
    Top = 176
    MasterDataPipelineName = 'ppDBPipeline1'
    object ppDBPipeline2ppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'IDF'
      GuidCollationType = gcString
      DetailFieldName = 'LIGFUNC'
      DetailSortOrder = soAscending
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM1.cdsFBco
    Left = 416
    Top = 136
  end
end
