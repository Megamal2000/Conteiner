object ConhImp: TConhImp
  Left = 272
  Top = 128
  BorderIcons = [biSystemMenu]
  Caption = 'Imprimir Lista de Conhecimentos'
  ClientHeight = 466
  ClientWidth = 696
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
    Width = 696
    Height = 81
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    ExplicitWidth = 676
    object Label21: TLabel
      Left = 32
      Top = 16
      Width = 200
      Height = 13
      Caption = 'De                                                         at'#233
    end
    object btData: TSpeedButton
      Left = 400
      Top = 11
      Width = 97
      Height = 24
      Caption = 'Procurar'
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
      OnClick = btDataClick
    end
    object Label23: TLabel
      Left = 560
      Top = 16
      Width = 29
      Height = 13
      Caption = #218'ltimo'
    end
    object lbUlt: TLabel
      Left = 600
      Top = 16
      Width = 21
      Height = 13
      Caption = 'lbUlt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Notas: TLabel
      Left = 560
      Top = 35
      Width = 28
      Height = 13
      Caption = 'Notas'
    end
    object lbQt: TLabel
      Left = 600
      Top = 35
      Width = 19
      Height = 13
      Caption = 'lbQt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 32
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object JvArrowButton1: TJvArrowButton
      Left = 535
      Top = 52
      Width = 105
      Height = 25
      DropDown = JvPopupMenu1
      Caption = 'Selecionados'
      FillFont.Charset = DEFAULT_CHARSET
      FillFont.Color = clWindowText
      FillFont.Height = -11
      FillFont.Name = 'Tahoma'
      FillFont.Style = []
    end
    object btTodos: TSpeedButton
      Left = 646
      Top = 54
      Width = 23
      Height = 22
      Hint = 'Selecionar TODOS'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007770000777777777700000007770FB0774444444700000007770
        BF0777777777700000007770F007777777777000000077700077777777777000
        0000777777777777777770000000700700700700700070000000777777777777
        7777700000007070000777777770700000007070BF0770000070700000007770
        FB0777777777700000007070B007777777707000000070700077777777707000
        0000777777777777777770000000700700700700700070000000777777777777
        777770000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btTodosClick
    end
    object dat1: TDateTimePicker
      Left = 72
      Top = 13
      Width = 121
      Height = 21
      Date = 40991.704233750000000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40991.704233750000000000
      TabOrder = 0
    end
    object dat2: TDateTimePicker
      Left = 256
      Top = 13
      Width = 121
      Height = 21
      Date = 40991.704233750000000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40991.704233750000000000
      TabOrder = 1
    end
    object cbCli: TComboBox
      Left = 72
      Top = 46
      Width = 353
      Height = 21
      TabOrder = 2
      Text = 'cbCli'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 328
    Width = 696
    Height = 138
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    ExplicitWidth = 676
    object Label1: TLabel
      Left = 72
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 168
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 256
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 344
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 432
      Top = 24
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 520
      Top = 25
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 168
      Top = 81
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 249
      Top = 81
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 344
      Top = 81
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 424
      Top = 81
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label10'
    end
    object Bevel1: TBevel
      Left = 304
      Top = 16
      Width = 81
      Height = 33
    end
    object Bevel2: TBevel
      Left = 568
      Top = 16
      Width = 81
      Height = 33
    end
    object Bevel3: TBevel
      Left = 128
      Top = 16
      Width = 81
      Height = 33
    end
    object Bevel4: TBevel
      Left = 216
      Top = 16
      Width = 81
      Height = 33
    end
    object Bevel5: TBevel
      Left = 216
      Top = 72
      Width = 81
      Height = 33
    end
    object Bevel6: TBevel
      Left = 392
      Top = 16
      Width = 81
      Height = 33
    end
    object Bevel7: TBevel
      Left = 40
      Top = 16
      Width = 81
      Height = 33
    end
    object Bevel8: TBevel
      Left = 304
      Top = 72
      Width = 81
      Height = 33
    end
    object Bevel9: TBevel
      Left = 392
      Top = 72
      Width = 81
      Height = 33
    end
    object Bevel10: TBevel
      Left = 480
      Top = 72
      Width = 81
      Height = 33
    end
    object Label11: TLabel
      Left = 52
      Top = 3
      Width = 51
      Height = 13
      Caption = 'Frete Peso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 152
      Top = 3
      Width = 48
      Height = 13
      Caption = 'Adic Peso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 235
      Top = 3
      Width = 40
      Height = 13
      Caption = 'Ad Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 320
      Top = 3
      Width = 18
      Height = 13
      Caption = 'Gris'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 408
      Top = 3
      Width = 39
      Height = 13
      Caption = 'Ped'#225'gio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 592
      Top = 3
      Width = 22
      Height = 13
      Caption = 'TDE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 246
      Top = 59
      Width = 24
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 306
      Top = 59
      Width = 77
      Height = 13
      Caption = 'Base de C'#225'lculo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 411
      Top = 59
      Width = 40
      Height = 13
      Caption = 'Al'#237'quota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 504
      Top = 59
      Width = 26
      Height = 13
      Caption = 'ICMS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btImp: TSpeedButton
      Left = 567
      Top = 72
      Width = 25
      Height = 25
      Hint = 'Imprime Relat'#243'rio'
      Flat = True
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
    object btExcel: TSpeedButton
      Left = 598
      Top = 72
      Width = 25
      Height = 25
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      OnClick = btExcelClick
    end
    object Label25: TLabel
      Left = 496
      Top = 3
      Width = 38
      Height = 13
      Caption = 'Tx CT-e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel12: TBevel
      Left = 480
      Top = 16
      Width = 81
      Height = 33
    end
    object Label28: TLabel
      Left = 64
      Top = 59
      Width = 33
      Height = 13
      Caption = 'Pontos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel15: TBevel
      Left = 40
      Top = 72
      Width = 81
      Height = 33
    end
    object Label29: TLabel
      Left = 152
      Top = 59
      Width = 31
      Height = 13
      Caption = 'Outros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel16: TBevel
      Left = 128
      Top = 72
      Width = 81
      Height = 33
    end
    object Label30: TLabel
      Left = 598
      Top = 25
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label30'
    end
    object Label31: TLabel
      Left = 70
      Top = 80
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label31'
    end
    object Label32: TLabel
      Left = 510
      Top = 80
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label32'
    end
    object btMail: TSpeedButton
      Left = 627
      Top = 72
      Width = 23
      Height = 25
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222222222222222222222222222222222222200000000000002288888888888
        880228B7B7B7B7B7B802280B7B7B7B7B080228B0B7B0B7B0B80228FB0B0B0B0B
        780228B7B0B7B0B7B80228FB0B7B7B0B780228B0B7B7B7B0B802280BFBFBFBFB
        0802288888888888882222222222222222222222222222222222}
      OnClick = btMailClick
    end
    object btExcelCli: TSpeedButton
      Left = 651
      Top = 72
      Width = 25
      Height = 25
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      OnClick = btExcelCliClick
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 118
      Width = 694
      Height = 19
      Panels = <
        item
          Width = 250
        end
        item
          Width = 50
        end>
      ExplicitWidth = 674
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 113
    Width = 696
    Height = 215
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    MultiSelect = True
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
        FieldName = 'STATUS_EDI'
        Title.Caption = 'st...'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAC'
        Title.Caption = 'Data Conh'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMC'
        Title.Caption = 'Conhecimento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNOTA'
        Title.Caption = 'Nota F'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE'
        Title.Caption = 'Frete'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQ'
        Title.Caption = 'Al'#237'quota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICMS'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIGDCOB'
        Title.Caption = 'DocCob'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 176
    Top = 176
    Width = 353
    Height = 81
    TabOrder = 3
    Visible = False
    object Label24: TLabel
      Left = 32
      Top = 24
      Width = 140
      Height = 13
      Caption = 'A G U A R D E. Executando: '
    end
    object agPB: TJvGradientProgressBar
      Left = 24
      Top = 43
      Width = 297
      Height = 17
      ParentColor = True
    end
    object agLB: TStaticText
      Left = 184
      Top = 24
      Width = 33
      Height = 17
      Caption = 'agLB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 81
    Width = 696
    Height = 32
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 676
    object Label26: TLabel
      Left = 24
      Top = 8
      Width = 209
      Height = 13
      Caption = 'Pesquisa R'#225'pida. N'#250'mero do Conhecimento'
    end
    object Label27: TLabel
      Left = 424
      Top = 8
      Width = 85
      Height = 13
      Caption = 'N'#250'mero DOCCOB'
    end
    object edNumC: TEdit
      Left = 244
      Top = 5
      Width = 94
      Height = 21
      TabOrder = 0
      Text = 'edNumC'
      OnKeyPress = edNumCKeyPress
    end
    object edDOCCOB: TEdit
      Left = 520
      Top = 5
      Width = 88
      Height = 21
      TabOrder = 1
      Text = 'edDOCCOB'
      OnKeyPress = edDOCCOBKeyPress
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsConh
    Left = 520
    Top = 128
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = JvDataSource1
    UserName = 'DBPipeline1'
    Left = 560
    Top = 120
  end
  object RelCon: TppReport
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
    Template.FileName = 'G:\FlaydelSOFTS\Singular\RELS\RelConh.rtm'
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
    Left = 600
    Top = 120
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 40217
      mmPrintPosition = 0
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Pen.Color = clSilver
        Pen.Width = 0
        Weight = 0.250000000000000000
        mmHeight = 2381
        mmLeft = 4233
        mmTop = 33073
        mmWidth = 191030
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 4233
        mmTop = 38100
        mmWidth = 191030
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Data Conhec'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 33867
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Nota F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 33867
        mmWidth = 11642
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Conhecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 40217
        mmTop = 33867
        mmWidth = 22437
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 33867
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Al'#237'quota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 137584
        mmTop = 33867
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 33867
        mmWidth = 8996
        BandType = 0
        LayerName = Foreground
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        mmHeight = 28840
        mmLeft = 0
        mmTop = 2117
        mmWidth = 64823
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
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71967
        mmTop = 12700
        mmWidth = 10319
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 71967
        mmTop = 21167
        mmWidth = 4445
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 110067
        mmTop = 21167
        mmWidth = 4868
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
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 79375
        mmTop = 21167
        mmWidth = 10372
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Label6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 118269
        mmTop = 21167
        mmWidth = 10372
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Lista de Conhecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 5644
        mmLeft = 71967
        mmTop = 3440
        mmWidth = 66675
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'DATAC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'dd/mm/yyyy, ddd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 794
        mmWidth = 26194
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUMC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 795
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NUMNOTA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4057
        mmLeft = 69321
        mmTop = 795
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'TOTAL'
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
        mmHeight = 4057
        mmLeft = 98954
        mmTop = 795
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'ALIQ'
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
        mmLeft = 137848
        mmTop = 795
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'ICMS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4057
        mmLeft = 157692
        mmTop = 795
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
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Conhecimentos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 15346
        mmTop = 2381
        mmWidth = 26194
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
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 44715
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'TOTAL'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 1058
        mmWidth = 173038
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc3'
        HyperlinkEnabled = False
        DataField = 'ICMS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 2380
        mmWidth = 17198
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
  object ImageList1: TImageList
    Left = 600
    Top = 216
    Bitmap = {
      494C0101020028006C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      000000000000EFF7EF00F0F7F000A9D4A90051A8510059AC5900C1E0C100F3F9
      F300F2F9F2000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700F7F7F700D4D4D400A8A8A800ACACAC00E0E0E000F9F9
      F900F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAF4EA00DEEEDE004AA54A000683060000800000008000000E870E006CB6
      6C00E9F4E900F1F8F10000000000000000000000000000000000000000000000
      0000F4F4F400EEEEEE00A5A5A50083838300808080008080800087878700B6B6
      B600F4F4F400F8F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFF7
      EF00DBEDDB003198310000800000008000000080000000800000008000000180
      01004DA64D00E7F3E700FAFDFA0000000000000000000000000000000000F7F7
      F700EDEDED009898980080808000808080008080800080808000808080008080
      8000A6A6A600F3F3F300FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E9F4
      E90079BC79000080000000800000008000000080000000800000008000000080
      00000A850A00C0E0C000E9F4E90000000000000000000000000000000000F4F4
      F400BCBCBC008080800080808000808080008080800080808000808080008080
      800085858500E0E0E000F4F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F7
      F000369B36000080000000800000008000000080000000800000008000000080
      00000080000069B46900EBF5EB0000000000000000000000000000000000F7F7
      F7009B9B9B008080800080808000808080008080800080808000808080008080
      800080808000B4B4B400F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFEF
      DF00148A14000080000000800000008000000080000000800000008000000080
      0000008000003B9D3B00DDEEDD0000000000000000000000000000000000EFEF
      EF008A8A8A008080800080808000808080008080800080808000808080008080
      8000808080009D9D9D00EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDF6
      ED002B952B000080000000800000008000000080000000800000008000000080
      0000008000005BAD5B00EBF5EB0000000000000000000000000000000000F6F6
      F600959595008080800080808000808080008080800080808000808080008080
      800080808000ADADAD00F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEF6
      EE0062B162000080000000800000008000000080000000800000008000000080
      000004820400A9D5A900E9F4E90000000000000000000000000000000000F6F6
      F600B1B1B1008080800080808000808080008080800080808000808080008080
      800082828200D5D5D500F4F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8F4
      E800C8E3C800158A150000800000008000000080000000800000008000000080
      00002F972F00E3F1E300F4F9F40000000000000000000000000000000000F4F4
      F400E3E3E3008A8A8A0080808000808080008080800080808000808080008080
      800097979700F1F1F100F9F9F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E8F3E800B9DDB900269326000080000000800000008000000180010040A0
      4000CEE7CE00ECF5EC0000000000000000000000000000000000000000000000
      0000F3F3F300DDDDDD009393930080808000808080008080800080808000A0A0
      A000E7E7E700F5F5F50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFEFD00F1F8F100DAECDA0070B87000168B1600239123008EC78E00EBF5
      EB00EEF6EE000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F8F8F800ECECEC00B8B8B8008B8B8B0091919100C7C7C700F5F5
      F500F6F6F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8F3E800F1F8F100DFEFDF00E4F2E400EDF6ED00EEF6
      EE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F300F8F8F800EFEFEF00F2F2F200F6F6F600F6F6
      F600000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      F807F80700000000F003F00300000000E001E00100000000E001E00100000000
      E001E00100000000E001E00100000000E001E00100000000E001E00100000000
      E001E00100000000F003F00300000000F007F00700000000FC0FFC0F00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object JvPopupMenu1: TJvPopupMenu
    Style = msBtnLowered
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 600
    Top = 176
    object ReenviarCONEMB2: TMenuItem
      Caption = 'Reenviar CONEMB'
      OnClick = ReenviarCONEMB2Click
    end
    object CopiarXML2: TMenuItem
      Caption = 'Copiar XML'
      OnClick = CopiarXML2Click
    end
    object FretenaNotaFiscal1: TMenuItem
      Caption = 'Frete na Nota Fiscal'
      OnClick = FretenaNotaFiscal1Click
    end
  end
end
