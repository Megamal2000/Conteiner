object Cob2: TCob2
  Left = 300
  Top = 141
  BorderIcons = [biSystemMenu]
  Caption = 'Cobran'#231'a - Procura por M'#234's'
  ClientHeight = 442
  ClientWidth = 566
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 73
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object BitBtn1: TBitBtn
      Left = 338
      Top = 20
      Width = 25
      Height = 25
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
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btCalc: TBitBtn
      Left = 400
      Top = 19
      Width = 129
      Height = 25
      Caption = 'Calcula Selecionados'
      TabOrder = 1
      OnClick = btCalcClick
    end
    object pb: TProgressBar
      Left = 400
      Top = 48
      Width = 129
      Height = 17
      TabOrder = 2
    end
    object lbR: TStaticText
      Left = 368
      Top = 48
      Width = 4
      Height = 4
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbCli: TComboBox
      Left = 80
      Top = 22
      Width = 177
      Height = 21
      Sorted = True
      TabOrder = 4
      Text = '<Clientes>'
    end
    object vAno: TJvSpinEdit
      Left = 272
      Top = 22
      Width = 57
      Height = 21
      DisplayFormat = '#,###'
      Decimal = 0
      TabOrder = 5
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 193
    Width = 566
    Height = 208
    Align = alClient
    DataSource = DataSource1
    FixedColor = clMoneyGreen
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    MultiSelect = True
    AlternateRowColor = 16642019
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Caption = 'Data da Emiss'#227'o'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'N'#250'mero do relat'#243'rio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'N'#250'm. Romaneio'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VFRETET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Valor do Frete'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RELSTATUS'
        Title.Caption = 'Status'
        Width = 64
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 401
    Width = 566
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object Label2: TLabel
      Left = 24
      Top = 13
      Width = 88
      Height = 13
      Caption = 'Procura Romaneio'
    end
    object edRoma: TEdit
      Left = 128
      Top = 10
      Width = 89
      Height = 21
      TabOrder = 0
      OnEnter = edRomaEnter
      OnKeyPress = edRomaKeyPress
    end
    object btImprime: TBitBtn
      Left = 456
      Top = 9
      Width = 105
      Height = 25
      Caption = 'Imprimir'
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
      TabOrder = 1
      OnClick = btImprimeClick
    end
    object btZeros: TButton
      Left = 296
      Top = 10
      Width = 121
      Height = 25
      Caption = 'Analisa Zerados'
      TabOrder = 2
      OnClick = btZerosClick
    end
  end
  object JvDBGrid2: TJvDBGrid
    Left = 0
    Top = 73
    Width = 566
    Height = 120
    Align = alTop
    DataSource = DataSource2
    FixedColor = 10930928
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu2
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid2CellClick
    AlternateRowColor = 15199727
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Descri'#231#227'o da Cobran'#231'a'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPREV'
        Title.Caption = 'Data Prevista'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 176
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsRelV
    Left = 432
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = DM3.cdsCred
    Left = 432
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 240
  end
  object PopupMenu2: TPopupMenu
    Left = 472
    Top = 96
  end
  object RelCob: TppReport
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
    Template.FileName = 'G:\FlaydelSOFTS\Singular\RELS\RelCob.rtm'
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
    Left = 352
    Top = 240
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676534170000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFC0000B08006A00CB01011100FFC4001F00000105010101
          01010100000000000000000102030405060708090A0BFFC400B5100002010303
          020403050504040000017D010203000411051221314106135161072271143281
          91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
          3738393A434445464748494A535455565758595A636465666768696A73747576
          7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
          B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
          E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00FB2E8A2B17C57E2CF0
          DF852D16EBC45AD59E9B1BE7609A4C33E3AED51F337E00D70571FB43FC2A8A42
          89AEDCCC07F12584D8FD541A8FFE1A2FE16FFD05AF7FF0064FF0A3FE1A2FE16F
          FD05AF7FF0064FF0A3FE1A2FE16FFD05AF7FF0064FF0AE7FC75FB4B785ECB4DB
          59FC239D56EC5DA8B8B7B982484341B5B71572386DDB3B1EFC5771F0CBE30F82
          FC78B1DBD8DF7D835461CD85E109213FEC1E8FF81CFA815E8745145145145145
          14514514514565F8B75983C3BE17D535EB952F169F6B25C320382FB549DA3DCE
          31F8D7E7878C7C49AB78B7C4575AEEB572D717772E49C9F9635EC8A3B281C015
          8F457A27877E09FC4BD7F47B7D5B4EF0E31B3B941240F35D4511743C860ACC0E
          08E41239AD1FF867BF8AFF00F42EC3FF00830B7FFE2EB9CF1C7C30F1C782B4E8
          F51F126886CED259842928B98A505C8240F91891C29EBE95D7FC28F805E2EF16
          98352D503F87F4938759A743E7CA3AE638F823FDE6C0EE335F647863474D0742
          B5D263BEBFBE5B64D827BD9CCB33FBB31FFF0055695145145145145145145145
          3659238627965758E3452CEEC70140EA49EC2BE77F88DFB4869B67E2DD3F49F0
          C1FB469705EC4754D45503F9912B832242A7839008DC7AF6ECD507C52F8FFE05
          F12FC3CD6F41D3A2D605DDF5AB451196D955371C7521CE057CAB4515F5EF857F
          68DF87DA6785F4AD36E21D6CCD69650C126CB542BB91029C1DFD322B4BFE1A6F
          E1C7FCF0D77FF0113FF8BAF5F92DB4ED5EDACAE6E6CE1B948D96EADFCE8C318D
          F69DAE33D18063CFB9ABB4514514514514514514514515E25FB54786BE237883
          4041E16BAFB468D1A66F74CB652B7131073BB39FDE28FEE0C73CE1B8C7C68629
          44C6131B89436D2854EECF4C63D6A492CEF2342EF693AA8E4968C802A0A28AB0
          B637ACA196CEE082320888F3FA52FD82FBFE7CAE7FEFD37F857E9368608D12C4
          1E0FD9A3FF00D0455CA28A28A28A28A28A28A28A28A2B84F16FC2BF0BEBFE2ED
          2BC58B6FF60D6B4FBE86ECDC5BA81F69F2DC36D917A36718DDD471C90314EF8F
          DFF2467C55FF0060F7FE62BF3F68A2BEFDBDD6EFFC37F0120D7B4C8EDA4BBB0D
          0609E34B852D1B6D8909042907A67BD79F7ECFDF1ABC59F113C752687AAE9FA2
          DB5AC56525CB35AC32AB92AC8A002D211D5FD2BDFEBC87F690F8A7AB7C358345
          FEC4874CB9B9BF697CC8AF2277C2205F981575C72D8E739F6C557FD9C3E2EEAB
          F122EB58B1D76D34EB5BAB348E58059A3A874258364333743B7FEFAAE63E35FC
          6DF1FF00C3EF1F5DE831E93A04D645167B29A5826DD244DEB8940C860CA7007D
          DAF5DF83FE31FF0084DFE1D69DE24B836D1DC4AAEB769102A91488C430C12481
          800F27A115E5BA4FC64F1CEADE10F1B78BACAC3C3E348D0A411D8335BCC4DC93
          2A8F98F9BDA3209C01CB2F6C8AE234DFDA53E276A72B43A6F85B44BD91577325
          BD95CC840E9921653C56CF817F695F115D78CECB46F15E83A65BDADC5CADACAF
          6C924525BB336DCB0766C807A8E0F5FA5697C6DF8EDE30F02FC47D43C39A769B
          A15C59C0913C4F710CA6421E3563B8AC807527B0E315809FB407C61781674F02
          E9ED132EF120D2EECA95C6739F33A574BF19BE39F8AFC1BAAE890E95A6E893DB
          6A7A35BEA39B98652EAD216057E59071F28EDDEBD83E14788350F14FC3CD1FC4
          3AAC76B15E5F4265912D959635F9980003127A01DFAE6BA8A28A28A28A2B86F8
          FDFF002467C55FF60F7FE62BF3F68A2BEEDF197FC9B1DDFF00D8AE9FFA216BC1
          3F629FF92B57BFF6069BFF0046C35F64D7CC5F10B456F8B1F1C7C55A7461A5B5
          F0DE852C16D83F29BBDA768FAF98EDFF007EEBCD3F658D7BFB0FE336948EFB21
          D495EC25E7AEF1941FF7DAA57B7FED99E10FED6F035AF8A6D62DD75A34BB6620
          726DE4201FAED6DA7D816AF03F871F12EF7C2BF0F3C59E1483CD67D6225166CB
          FF002CA4621253F5319E0FAA8AFA0BC45E131E0BFD92751D0DE30B7634F59AF3
          D4CEF22338F7C676FD14579B7EC3FF00F250B5AFFB049FFD1B1D79EFC59F97E3
          B6BE4718D71CFF00E44ADDFDAE3FE4B7EA7FF5EF6DFF00A296BDA7C33FB43FC3
          AD2BC23A5D8CF2EA8F7369610C32247699CBA4601009207515E69FB6BC826F88
          BA2CAA080FA246C01F79A5AFA1FF0067CFF922FE16FF00AF21FF00A11AEEDD95
          119DD82AA8C924E001EB50D85ED9DFDBFDA2C6EA1B984B151244E19720E08C8F
          7AAC35CD20DFFD806A36DF682FE584DE397EE80F42DFECF5F6AB57B776B650F9
          F79730DB459C6F96408B9F4C9A6E9F7B69A85B0B9B2B88E788B15DE872320E08
          FCC558A28AE1BE3F903E0CF8A493FF002E0DFCC57E7ED1457DD9E3020FECC574
          41C83E174C7FDF85AF05FD8A7FE4AD5EFF00D81A6FFD1B0D7D75E23D56DF43F0
          FEA1ACDD9C41636D25C49CF508A588FAF15F1C7C37D37E3B4F6D7DE2CF045ACE
          906BD3B4F3DC23DB0F3DD5DF27129DD80C5FF5AF3AD62D3C43E0CF1C6DD5ED4D
          96B7A7DD4774F192A76BE56453943B71C83C57E805D9D3BC51E0695DD04FA76A
          BA696DA7F8A3923CFF00235F0CFC00D36D356F8C9E19B2BD8FCC80DDF9A57B13
          1AB48A0FB6546457D83FB467FC913F13FF00D7AAFF00E8C5AF03FD87FF00E4A1
          6B5FF6093FFA363AF3DF8B3CFC76D7C0E7FE278FFF00A32B77F6B8FF0092DFA9
          FF00D7BDB7FE8A5AFA0BC27F04FE186A5E0BD22E6EFC2F1B5C5D69F0492CAB75
          32B1768D496E1F83939AF1BFDB62358BE23E8B127DD4D12351F4134B5F43FECF
          9FF245FC2DFF005E43FF004235D078D2F23B4D2499B987E696703A98A24691C6
          3D1B6043FEFD73DE0A8E6B5F02E9F62D7606B3ACC82EAF1925FDE46D705A591B
          D54840E14FAA8AE0B50BA7B9F06F8AFC44649D6DA6B7B9B5D2ED55C88EDE349A
          38AD4A2740ED2248D9EA48ADAF14EAFAAEA1A8E89A60B896D6E7528A37B8BB88
          956B782425628A37556F2DA528C59C292318E8011D77C281616BA6EABA3E9F60
          F6A9A66A525BC8CD72F7026936233B798E01272D83C0E95D95145795FED3BFF0
          915EFC3897C3DE19D0EFF54BAD5245499ADE22C2189183B127D490AA07A16F4A
          F937FE1537C4AFFA12B5AFFC07347FC2A6F895FF004256B5FF0080E68FF854DF
          12BFE84AD6BFF01CD7D4FE14D37C57E26FD9CA6F08DF6952691AEC761FD96ABA
          82B468CAA02AC99009C6CC76FBC0FD6BC8B4BFD9BFE2A695726E74BF1268B633
          952864B6D42E2362A48246562071C0E3DAB623F821F18DB4FD4ED6FBC57A5DFF
          00DBAD7ECB9B9D4EE6411A19124623746704F9617E8C6BE86F877A249E1BF026
          87A0CEB009EC2C6282630B128D2051BD81201C16C9E40EB5E33FB40FC12F13F8
          FBC7ABAFE8573A2DB5B9B28E1905D4F22BBBA96F9B0B1B0C60A8EBDABD3BE17F
          87FC4BE1EF8596DE1AD6E5D3E7D4ECADE4B78248257689D39F2F24A82300853C
          1E066BC5FE137C01F1C7843E22E8DE23BDBED026B6B298B4A90DC4A5CA946538
          062009F9BD457B97C5FF000F6A5E2BF871AC7877487B54BDBE8D238DAE5D9630
          3CC52D92A09E80E38EB8AF9C34AFD9C7E2B69333CFA5789B46B095D7633DB6A1
          711332E7382562191C0AD6F047ECDBE2883C6767AD78BB5CD2A6B482E96EA710
          4D2CB2DC32B6EC12E8BD4F53927AD5DF8E7F05FC53E35F891A8788F4FD5FC396
          D653244912DCDE3AC9848D54EE02320720F73C62B021F83BF1723856DE1F897A
          52448A11634D7EE42AA81800009C0F6ADEF8B1F05BC4FE2EB9F0E9D335BF0F08
          F4AD0ADB4E91AE2F64DF24B1EE2EFC21C825BA9E6B16C7E06FC63B4B58ED2CBC
          7BA7416F18DB1C50EB374A8A3D0011E057BAE8DE1BF1368BE05D0B4EB19348D4
          354B2B16B5BC5BE9246826326D3236E0A58FCCBDC7209CE2A9E89E03F125BDCD
          CEB579AAE8F06AC90797A741A7D9795696DF38720FF1306C6D248CED271547C3
          3F0F35E9AFEC17C426C6CB46D3AE7ED51D85ADCBDC19E5562D1866655C46ACCC
          C1704E49C9AD0F11783BC4B7B7089A78D1204B648E38EEA4966325CC511631C3
          24606D418665670589566C01B88AEA3E1FE8577E1FF0F9B5D46E62B9D42E2EA7
          BBBB9A20423CB2C8CE7683CE002073E95D0514514514514532E2686DE169AE25
          8E2890659DD82A81EE4D713AF7C5BF87FA3B347378821BA957F82CD5A7CFFC09
          46DFCCD709AD7ED1BA4444AE8DE1DBDBAEC1EEA65847D70BBB3FA5723AA7ED0D
          E30B8CAD8E9DA4D929E87CB791C7E25B1FA57337DF187E235D93BBC47244A7F8
          61B78931F885CFEB496579F16FC4641B3BBF16DEA37F14724C23FCC61455BB8F
          01FC4361BB5ED4A0D310F25B53D6A34FCC6F27F4ACEB8F076896A33AAFC45D00
          37A59ACF767F354C7EB55C699F0FA0E67F166B377FECDAE8EABFABCA3F951237
          C358D7F77178B6E4FAB496F0E7FF001D7AA735EF82D4E2DFC3DAD37BCDABC673
          F82C03F9D306A7E195FBBE1795BFDFD49CFF002514EB792CAFDF669DE119257F
          48A79A43FA56C59F833C697C01B1F02EA5103D0C89320FCD9856CD97C27F8997
          183FD83F6553DDF5155FD3CC27F4AD8B4F81FF0011A520BEB163663B87BF9588
          FF00BE53FAD7D03E08F0F41E17F0D5A68F0CD25C344B9967918969643F798E7D
          FA0EC302B6A8A28A28A2B87F1BFC54F07784CBC177A87DB2F57836967892407D
          18E76AFD0907DABC63C5DFB41789350DF0F87ECADF4884F0257FDF4DF5C91B47
          E47EB5E57AE6BFADEB9379DAC6AD7B7EF9C8F3E6670BF404E07E1552C6D2EAFA
          E92D6CADA6B9B890E122850BBB1F603935E87A37C1AF144D6BFDA1E209EC3C35
          A78E5E6D4270AC07FBA0F07D98AD4F35AFC1BF0DFCB35EEB3E2FBC5E0AC1FE8F
          6C4FD786C7B82D555BE2ABE9C0A784BC23E1FD0147DD985B89EE07FDB47EBF88
          AE775AF1EF8CF582DFDA1E26D4E446EB1A4E6343FF00014C2FE95CDB31662CC4
          924E49279342AB3305552CC4E0003249AEF3C33F08BC79AF04922D19AC607E44
          D7CDE48C7AED3F39FC16BBD3F0174CD0F41BBD6FC5BE269FECD6503DC5CA585B
          FDD44525B0CD927807F86B725F06FC1EF0AE8BA46AB79A66A5AB36AC14E9F095
          96E2E2E329BF88A3C0385E4E46056E7FC245F08B44D234AD534DD16CAE135385
          EE2D469FA479D318A3FF00592300BB9553904B63183E86B4EE7E24F87ECB5477
          3A95943A0DBE851EACD2241233C91CB2048CAE000A33C6DC3312DD171CADFF00
          C5BF0AD868C355BCB6D7A0856E0DB4E8FA4CCAF6F20DB859015F9776F5DBEB9C
          0E73567FE168F84D2CF56B9B99AFAD3FB256D8DD457167224A1AE066240846E2
          C7D31C77A59BE28784A0F075E78A6E6E2EEDECEC6EBEC9750CD6AE9710CD91FB
          B68C8DC0E083F4E6BB1B69A2B9B78AE20712452A07461D1948C83F9549451451
          5C67C42F895E17F05C4D1DFDDFDA750C652CADC8694FA6EEC83DCFE00D7CE1E3
          FF008BDE2DF153C904774DA4E9CDC0B5B4720B0FF6DFAB7E83DABCF2A7B0B3BA
          BFBB8ECEC6DA6B9B895B6C7144859D8FA003935EC5E18F82F6FA6E9675FF0089
          3ABC7A3582007ECC920F30FA066E4027FBAA093EC699AB7C5AD0BC336EFA5FC3
          0F0EDAD8478DADA85C45BA593DC03927EAE4FF00BA2BCB3C43AFEB5E20BD379A
          D6A7737D3763339217D947451EC00ACCA28AEFBE167C2ED73C7328B95FF40D21
          5B125E48B9DD8EAB1AFF0011FD07AF6AFA6BC0DF0EBC29E0F890E97A6A4976A3
          E6BCB801E663ECDFC3F45C0AEB6B03E2469779ADFC3FF1068FA7A2C9777BA74F
          6F02B30505D9080093C0E4D79B7F60F8FD97C0FADFFC2276CB7FE10592D7EC27
          558CFDB6392D844D207DBB5082A0ED3EBD6B174CF85DE36F0CE9BA1DD6991C77
          DA80D1EEF4EBD8EDEFC5BB5B3CD7067592376520852DB5B8C9038CE6AEA7C3BF
          18CA2E24D5B4BD3359925F0941A64D15D5D158EE274B93232EE4C32FCBCAB718
          6C74A07C3FF1CDC7C2AD7340996602E353B59B4AD3AF35217325A411CB1B3A99
          8E011F29217B01EA6AE78D7E1DF89B53F14F8BF5BB182D98CDA8E8DA8E991C93
          855B93691B092363CECFBDC123AE29DE21F07F8FFC6B35A45A9D9E89E1DB392F
          6E6EE754896E8A830F9312CA15D7CD908794EE07030BD7A577DF09F4FD7348F8
          79A3E91E228D1351B083ECAE5240E1910958D811EA817F1CD753451515EDD5B5
          95A4B77793C76F6F0A979259182AA28EA493D057CF5F15BE3B4B71E6E91E0966
          862E564D49970EDFF5C81FBA3FDA3CFA01D6BC1E69649A679A691E491D8B3BBB
          65989EA493D4D32BA9F873E06D6FC71ABFD8F4C8C476F1E0DCDDC80F9708F7F5
          63D9475F61923DCB53D43C11F03B45FB0E996EBA9F88EE23F98B91E6B7FB521F
          E04F451D7DF96AF01F19F8B35DF176A86FF5CBE79DB27CB88711423D117A01FA
          9EE4D61514515E91F037E1CC9E37D69AEAFD648F44B261F6871C199FA8894FEA
          48E83DC8AF5AF889AC6BFA4FC4CD1BC23E1CBDD5F4ED28E8C67FB3E8BA6DB4EE
          ACB2EC0712A9DA8075C7B7157BE29EADE2BB4F19787B40D0FC512694B3E957D7
          33CE6D2197CD92045652C1D4E01E73B71D6B93D3FE23FC40F105ACB268B25BA5
          FCDE0C8B5082D5A38C27DACDD189E452C33928095524AE71C1A8755F19F8BBFE
          158EA9AB69DE36D62DB55D1B5186DEEAD750D16DE1B98C4CF120494152A71976
          5650B9079A6F88FC6BE3CD0FE246A1E1A83C517F7F2DA5EE9369669269B6CB6D
          72F709BA513C81018C90095DA467071D389756F1EF8D5EEE4B4B7D635219F1B6
          A5A5A8D3EC6DE5B8FB3451AB471A2C8BB49073C9E48CE4D69FC38F1EF8AF57D4
          BC176FA9EAD14C6FB4DD49EFD12DD10B4D0C9B5378DA0A3A8EA17033EA31586B
          F157C6563A1AEA535F8BC71E034D5363DBC601BC7BCF27CD3B541C0523E5FBBC
          74ADEF186A7AE685E09D6B4CF12F8C341D6CEA1F6086C24BE860125ACB3B00EF
          3C5B447E52E0C8A5B3F70E7A5667873C67AE6B9E1EF02787BC3DABC1A13DD585
          F3DFDDDA5AC2F99AD4630AA414019BE7381C8618C66BD5FE10F886F7C57F0D74
          3F106A28AB79776F99B6AED0CCAC54B01DB3B73F8D7574515CB78FBC0F61E358
          22B5D5B53D562B38F9FB35ACCA91BB7F79B2A4B1FA9C0F4AE413E00780D7ABEA
          EDF5B95FE8B52AFC05F000EB0EA4DF5BB3FD054C9F02BE1E2F5B0BC6FADE3FF4
          AEEBC37A0E95E1CD162D2345B55B4B58C1C05E4927AB127927DCD71B7BF05FC0
          B7D7B35EDF5ADFDD5CCCE5E5965BE90B3B1EA49CD357E087C381D74599BEB7B3
          7FF15522FC15F86A3AF8759BEB7D71FF00C5D4ABF06FE1B2F4F0CA7E37739FFD
          9EA55F845F0E57A7862DFF0019A53FFB354ABF0A7E1E2F4F0B597E2CE7FF0066
          AE9B42D1F4CD0B4E4D3B48B286CAD109658A218192724D6378ABC05E18F13EAD
          06ADABD9DCBDF4101B78E682FA7B761196DDB7F76EB919E79A6F8ABE1F784FC5
          0D62DAE69D35D358C2D04045E4D1911B001958A38DC08519DD9CD17FF0F3C1B7
          DE68B9D0A074934D4D2CC6199505B23EF4455070BB58021800C081CD4507C37F
          0745E1DBCD03FB29E4B2BE9D2E2EBCCBA95E59E4465656690B6F382ABC671C7D
          6AC6AFE02F0A6AB75AADD5F698649F5592DA5BC905C4A8CCF6FF00EA594AB0D8
          57D5719EF9AA9A87C32F05DF248B71A5CC3CCD4A6D519A2BE9E26FB4CA009240
          CAE08C80380703B0A65DFC2CF02DC68FA6E95FD8A60B6D33CCFB21B7BA9A2923
          F33FD60F31583B6EEF927357C780FC2425F33FB16023FB2468DB0B318FEC61B7
          795B33B7AF3BB1BBDEB9EF03FC29D0347B657D534DB6BABC8AF8DD4321B89A6C
          008522572E7E7D88CCA011800F033963A57FF0B7C0D7B6F2412E8A515EF66BDC
          C375346C92CCA1652A55815560002A30A7D2BABD2B4FB2D2B4CB6D374EB68EDA
          CEDA358A1890615140C002ACD145145145145145145145145145145145145145
          7FFFD9}
        mmHeight = 32015
        mmLeft = 3969
        mmTop = 3969
        mmWidth = 66675
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Detalhamento de Cobran'#231'a '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 14
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 6879
        mmLeft = 67733
        mmTop = 6350
        mmWidth = 80698
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 67733
        mmTop = 15610
        mmWidth = 11091
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67733
        mmTop = 27517
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Pen.Width = 4
        Style = lsDouble
        Weight = 3.000000000000000000
        mmHeight = 1323
        mmLeft = 5292
        mmTop = 37835
        mmWidth = 176477
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
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 15610
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Label8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4763
        mmLeft = 87313
        mmTop = 14817
        mmWidth = 60325
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Pen.Width = 0
        Weight = 0.250000000000000000
        mmHeight = 1323
        mmLeft = 5292
        mmTop = 46302
        mmWidth = 176477
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data do Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4572
        mmLeft = 8467
        mmTop = 40746
        mmWidth = 30565
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#250'm. do Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4572
        mmLeft = 43392
        mmTop = 40746
        mmWidth = 31581
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'N'#250'm. do Romaneio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4572
        mmLeft = 78581
        mmTop = 40746
        mmWidth = 33782
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4572
        mmLeft = 130969
        mmTop = 41010
        mmWidth = 9144
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4741
        mmLeft = 87313
        mmTop = 26988
        mmWidth = 81756
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'DTEMISSAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 14023
        mmTop = 762
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NCOB'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 50271
        mmTop = 762
        mmWidth = 17018
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'ROMANEIO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 84931
        mmTop = 762
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'VFRETET'
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
        mmLeft = 127265
        mmTop = 762
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
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Pen.Width = 0
        Weight = 0.250000000000000000
        mmHeight = 1323
        mmLeft = 5291
        mmTop = 794
        mmWidth = 176477
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Flaydel Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 1588
        mmWidth = 19844
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 144992
        mmTop = 2117
        mmWidth = 21844
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 4498
        mmWidth = 7408
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
        mmLeft = 35454
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'TOTAL FRETE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 90752
        mmTop = 4498
        mmWidth = 24342
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'VFRETET'
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
        mmLeft = 124090
        mmTop = 4498
        mmWidth = 19844
        BandType = 7
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Pen.Width = 0
        Weight = 0.125000000000000000
        mmHeight = 1323
        mmLeft = 22490
        mmTop = 1058
        mmWidth = 125677
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
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DBPipeline1'
    Left = 400
    Top = 240
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'DTEMISSAO'
      FieldName = 'DTEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMROMA'
      FieldName = 'NUMROMA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ROMANEIO'
      FieldName = 'ROMANEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VFRETET'
      FieldName = 'VFRETET'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'RELSTATUS'
      FieldName = 'RELSTATUS'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NCOB'
      FieldName = 'NCOB'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
  end
end
