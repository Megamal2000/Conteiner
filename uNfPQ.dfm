object nfPQ: TnfPQ
  Left = 64
  Top = 133
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa Notas Fiscais de Clientes'
  ClientHeight = 502
  ClientWidth = 944
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
    Width = 944
    Height = 89
    Align = alTop
    Color = 12615680
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 32
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
      Width = 451
      Height = 13
      Caption = 
        'Data                                             at'#233'            ' +
        '                                    OU               a partir da' +
        ' Nota'
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
      OnChange = dt1Change
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
      Left = 644
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
      OnClick = btImpClick
    end
    object edNum: TEdit
      Left = 490
      Top = 52
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'edNum'
      OnKeyPress = edNumKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 483
    Width = 944
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 944
    Height = 394
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
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
        FieldName = 'FLAG_IMP'
        Title.Caption = '.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTCRIA'
        Title.Caption = 'Data Cria'#231#227'o'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Local'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Ocorr'#234'ncia'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 278
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsNFp
    Left = 800
    Top = 136
  end
  object RelREC: TppReport
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
    Template.FileName = 'F:\00Trab\FlaydelSofts\Singular\RELS\RelFDrec2.rtm'
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
    Left = 528
    Top = 144
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 46302
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 42069
        mmLeft = 2117
        mmTop = 0
        mmWidth = 193675
        BandType = 4
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 29633
        mmLeft = 165100
        mmTop = 794
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label23'
        HyperlinkEnabled = False
        Caption = 'Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 173832
        mmTop = 5027
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 29369
        mmLeft = 18785
        mmTop = 1058
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 19050
        mmTop = 11377
        mmWidth = 146315
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NUMNF'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5556
        mmLeft = 167217
        mmTop = 9260
        mmWidth = 26194
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label26'
        HyperlinkEnabled = False
        Caption = 'RECEBEMOS OS PRODUTOS DA NOTA FISCAL AO LADO EMITIDA POR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20108
        mmTop = 1852
        mmWidth = 97102
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOMECli'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4995
        mmLeft = 20373
        mmTop = 5556
        mmWidth = 140759
        BandType = 4
        LayerName = Foreground
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 29898
        mmWidth = 193411
        BandType = 4
        LayerName = Foreground
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 129117
        mmTop = 17198
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel30: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label30'
        HyperlinkEnabled = False
        Caption = 'NOME LEG'#205'VEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 6085
        mmTop = 29898
        mmWidth = 20638
        BandType = 4
        LayerName = Foreground
      end
      object ppDBBarCode1: TppDBBarCode
        DesignLayer = ppDesignLayer1
        UserName = 'DBBarCode1'
        AlignBarCode = ahLeft
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        DataField = 'NUMNF'
        DataPipeline = ppDBPipeline1
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 11377
        mmLeft = 137584
        mmTop = 30956
        mmWidth = 53975
        BandType = 4
        LayerName = Foreground
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line12'
        Pen.Style = psDash
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 2117
        mmTop = 43656
        mmWidth = 191559
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NROMA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2822
        mmLeft = 171186
        mmTop = 794
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground
      end
      object ppImage2: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676523060000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFC0000B080065003501011100FFC4001F00000105010101
          01010100000000000000000102030405060708090A0BFFC400B5100002010303
          020403050504040000017D010203000411051221314106135161072271143281
          91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
          3738393A434445464748494A535455565758595A636465666768696A73747576
          7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
          B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
          E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00FB2E8A28CD4704CB34
          3E6A06232C31DF8247F4A6C33991118C1321762BB59795C6793CF4E3F515246D
          BE357DACBB803861823D8D3A8A293BE73F8567690FBF4E996442EAAC46D03390
          543631F89A9AEFCA8224F3E76019F064794272548F607E9D3BF6AB16854DAC45
          4285D8B80A410063B638C7D2A4A28A86E2E1219ADA375626790C684018042337
          3F829ACCD1A46682EA1DB9C43130C0C924C407A8F4F51576D64486DD701E40CF
          B77C68581E3EF75271C75CF5AB16DCDB447F79F707FACFBDD3BFBD4945731ABD
          835D5EEA57835ED4ED22B5C192389C844C46AC7001E78E7EA69BA6E942DB51D2
          EFE5D6751BD5959BC9598EE5CB44C727278F97356749F323BE316E2167B18DD4
          2E031214018CF7EB5A57513DC46B1B44537CA7EFA2C8146C3CE3385E7EBFA9AB
          A8AA8811542AA8C00060014B4570BE281A7AEB57D1CDE289EC4CE17CEB64B776
          5FB8072470723F9D2F860D83EB5631C5E29B8BF30EEF2AD9EDDD57EE30E09E06
          0135692E9E1B9D32EDC61562D84E3B06653FA574F7B1F98224C6499383B49038
          3D70471DBD39C77A92D71F658B0A546C185230471D307A5494572D789E21B6D7
          3509B4CD3ACAE219DD0EF95C6EC88D463EF03F9FF5A758A788EEB5AB09B52D32
          CA082DDDD8C91302C331B2E3EF1E3247E955F56463600000476D752C23D79C11
          FD6B47C3BA989238ECE79023A71193D1C7403FCFB56EA821402C5881C93DE968
          AE4FC45797936A93D8E8BA3CAF7A8143DE86F2C29DA180246370C11C31C7B1AB
          DA3C3E2B4BB84EA777A7CB6C01F30460EF3C1C7F081D71552EA1CCBABDAB7CCE
          08B94F4001C9FC70D8AC5AF4185B7428DEAA0D54BBD52CED752B5D3E6942CF73
          BBCB1C638F5F4CF41EB8ABB5CBEBBA9EBEBAACD63671DA595B2A8D9797418212
          40E037DDCE4918C1E950F8421D4AFAFE7D4350D6269CDA5CC900893889C85C6E
          C0E3F8B8E3B55CD55D6CBC490DC1CF972A81267A11F74FE4306B1B52B63697D2
          DB9CE14FCA4F753D2BB4D38EED3ED9BD6253FA0AE1FC6302BFC41D2D37C83CD1
          092439047EF08F97FBBD3B77E6BA7D67C47A7E937F1D95D09BCD9103AEC40460
          923D7DAAEDC6A9A65B4CD0DC6A3690CABF79249955877E84D66ADDE90356B18F
          4B9ECDA49E67F356DE5FBC3CB73B9829C1E40FBC0D3FC5D6FE658A5C004985B9
          E7B1E3F9E2A818CEADA42C88A4DDDA808C00E5D7B7E3FF00D7F5AE874BFF0090
          65AFFD714FFD04570DE3DB94B2F1BE997722B3243146EC17A90246271EF58DE3
          0D6AD757D6EDEF6D52658E3895089000490CC7B13EB5BD77E24F085DDC3DC5CE
          913CB2BE373B42A49C0C0FE2F414FD335EF0B0D4ED574ED1E48EEA499638DFCB
          550BB8ED27209EC4D76B730A4F0490C9F75D4A9AE2E192E34BD44E3878D8AB0E
          CC3FC0FF008576B6F289ADE3994102450C01F719AF3BF8AF6F2AEAD697447EE9
          E0F2C1FF00695893FF00A10AE368ABDE1DFF00918B4DFF00AFB8BFF4315ED758
          1E2AD3CBA8BE8572546250076EC7FCFF004AD7D2FF00E4196BFF005C53FF0041
          14FBAB6B7BB84C3750453C64E76C8A1867E86BCBFC7F6B6165E238A0B5B71044
          214322AA1504E4E48F5E31D3F9E6BBE8B40D02589254D2EDF6BA86198C8383EA
          0F23F1A70F0E688B3C33A69F147242E24464CAE181C8E879FC6B569180652AC0
          1046083D0D2448B14491A0C2228551E8053AA86A9A3E9FA95C5B4F790091ED9F
          727A1F63EA33838F6F4C837E8A28A2BFFFD9}
        mmHeight = 21696
        mmLeft = 5821
        mmTop = 3440
        mmWidth = 10848
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel24: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label301'
        HyperlinkEnabled = False
        Caption = 'N'#186' do DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 73290
        mmTop = 29898
        mmWidth = 26458
        BandType = 4
        LayerName = Foreground
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 166688
        mmTop = 15346
        mmWidth = 26988
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel25: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label302'
        HyperlinkEnabled = False
        Caption = 'Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 12171
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NOMEDest'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3133
        mmLeft = 37306
        mmTop = 12171
        mmWidth = 123561
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'Endereco'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 17727
        mmWidth = 105040
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText12'
        HyperlinkEnabled = False
        DataField = 'Numero'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 131498
        mmTop = 16933
        mmWidth = 11377
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        HyperlinkEnabled = False
        DataField = 'Complem'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 144198
        mmTop = 16933
        mmWidth = 19579
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText14'
        HyperlinkEnabled = False
        DataField = 'Bairro'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 23019
        mmWidth = 55827
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText15'
        HyperlinkEnabled = False
        DataField = 'Cidade'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 79904
        mmTop = 22754
        mmWidth = 46038
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText16'
        HyperlinkEnabled = False
        DataField = 'CEP'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 20902
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'FONEdest'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3683
        mmLeft = 140229
        mmTop = 25135
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Volume'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 17463
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VOLUME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5821
        mmLeft = 177800
        mmTop = 16404
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 167217
        mmTop = 26194
        mmWidth = 6477
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'Peso'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 175155
        mmTop = 26194
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 20902
        mmWidth = 5821
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 25135
        mmWidth = 7938
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 1323
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
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
  object ppDBPipeline1: TppDBPipeline
    DataSource = JvDataSource2
    UserName = 'DBPipeline1'
    Left = 568
    Top = 144
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMNF'
      FieldName = 'NUMNF'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NRoma'
      FieldName = 'NRoma'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'NOMECli'
      FieldName = 'NOMECli'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'NOMEDest'
      FieldName = 'NOMEDest'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VOLUME'
      FieldName = 'VOLUME'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'Endereco'
      FieldName = 'Endereco'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'Numero'
      FieldName = 'Numero'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'Complem'
      FieldName = 'Complem'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'Bairro'
      FieldName = 'Bairro'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'Cidade'
      FieldName = 'Cidade'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 9
      DisplayWidth = 9
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'FONEdest'
      FieldName = 'FONEdest'
      FieldLength = 20
      DisplayWidth = 20
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
  end
  object Tab: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'NUMNF'
        DataType = ftInteger
      end
      item
        Name = 'NRoma'
        DataType = ftInteger
      end
      item
        Name = 'NOMECli'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMEDest'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'VOLUME'
        DataType = ftInteger
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Complem'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'FONEdest'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Peso'
        DataType = ftFloat
      end>
    Left = 648
    Top = 144
    object TabNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object TabNRoma: TIntegerField
      FieldName = 'NRoma'
    end
    object TabNOMECli: TStringField
      FieldName = 'NOMECli'
      Size = 50
    end
    object TabNOMEDest: TStringField
      FieldName = 'NOMEDest'
      Size = 40
    end
    object TabVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object TabEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object TabNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TabComplem: TStringField
      FieldName = 'Complem'
      Size = 15
    end
    object TabBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object TabID: TIntegerField
      FieldName = 'ID'
    end
    object TabFONEdest: TStringField
      FieldName = 'FONEdest'
    end
    object TabPeso: TFloatField
      FieldName = 'Peso'
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = Tab
    Left = 608
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 168
    object Desmarcarimpresso1: TMenuItem
      Caption = 'Desmarcar impresso'
      OnClick = Desmarcarimpresso1Click
    end
    object Marcarcomoimpresso1: TMenuItem
      Caption = 'Marcar como impresso'
      OnClick = Marcarcomoimpresso1Click
    end
  end
end
