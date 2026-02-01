object GanhoM: TGanhoM
  Left = 191
  Top = 206
  BorderIcons = [biSystemMenu]
  Caption = 'An'#225'lise de Saldo de Motorista'
  ClientHeight = 442
  ClientWidth = 714
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
    Width = 714
    Height = 89
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object lbMot: TLabel
      Left = 120
      Top = 19
      Width = 361
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 56
      Width = 170
      Height = 13
      Caption = 'De                                              at'#233' '
    end
    object Bevel1: TBevel
      Left = 120
      Top = 34
      Width = 360
      Height = 2
    end
    object btExcel: TSpeedButton
      Left = 560
      Top = 52
      Width = 26
      Height = 25
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
    object btMot: TBitBtn
      Left = 18
      Top = 14
      Width = 89
      Height = 25
      Caption = 'Motorista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333300003333333333333333333300003333373333333333333300003333
        07733333333333330000333000773333333333330000330F0007733333333333
        00003330F000777777733333000033330F000000007733330000333330F00788
        87077333000033333300788FF870773300003333330788888F87073300003333
        3308888888F80733000033333307888888F807330000333333078FF888880733
        0000333333777FF8888773330000333333307788887033330000333333330777
        7703333300003333333337000733333300003333333333333333333300003333
        33333333333333330000}
      ParentFont = False
      TabOrder = 0
      OnClick = btMotClick
    end
    object dt1: TDateTimePicker
      Left = 145
      Top = 52
      Width = 113
      Height = 21
      Date = 41176.640339988430000000
      Format = 'dd/MM/yyyy ddd'
      Time = 41176.640339988430000000
      TabOrder = 1
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 305
      Top = 52
      Width = 115
      Height = 21
      Date = 41176.640387905090000000
      Format = 'dd/MM/yyyy ddd'
      Time = 41176.640387905090000000
      TabOrder = 2
    end
    object btPesq: TBitBtn
      Left = 440
      Top = 52
      Width = 105
      Height = 25
      Caption = 'Atualizar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777700007777777778888887777700007777777000003888777700007777
        770BBBB03088877700007777770BBBB0308887770000777770BBBB0333088777
        0000777770BBBB03330887770000777770000003330887770000777777778033
        3308877700007777777000333308877700007777770BB0333308877700007777
        70BBBB0333088777000077770BBBBBB03308877700007770BBBBBBBB03088777
        0000777000BBBB00030887770000777770BBBB033308777700007777770BBBB0
        3087777700007777770BBBB03077777700007777777000003777777700007777
        77777777777777770000}
      TabOrder = 3
      OnClick = btPesqClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 714
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
    Width = 714
    Height = 293
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = clInfoBk
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DTROMA'
        Title.Caption = 'Data Romaneio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTAS'
        Title.Caption = 'Quant Notas'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECEITA'
        Title.Caption = 'Receita'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESPESA'
        Title.Caption = 'Despesa'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LUCRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Lucro'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTO'
        Title.Caption = 'Porcento'
        Width = 100
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 382
    Width = 714
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Label1: TLabel
      Left = 261
      Top = 16
      Width = 3
      Height = 13
      Alignment = taRightJustify
    end
    object Label3: TLabel
      Left = 373
      Top = 16
      Width = 3
      Height = 13
      Alignment = taRightJustify
    end
    object Label4: TLabel
      Left = 461
      Top = 16
      Width = 3
      Height = 13
      Alignment = taRightJustify
    end
    object Label5: TLabel
      Left = 563
      Top = 16
      Width = 5
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Barra: TJvSpecialProgress
      Left = 8
      Top = 12
      Width = 150
      Height = 15
      Caption = 'Barra'
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsGerGM
    Left = 648
    Top = 8
  end
end
