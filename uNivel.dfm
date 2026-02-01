object Nivel: TNivel
  Left = 196
  Top = 114
  Width = 454
  Height = 497
  Caption = 'N'#237'vel de Entregas'
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
    Width = 446
    Height = 89
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 41
      Height = 13
      Caption = 'Intervalo'
    end
    object cbCli: TComboBox
      Left = 72
      Top = 14
      Width = 313
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Text = 'cbCli'
    end
    object dia1: TDateTimePicker
      Left = 82
      Top = 52
      Width = 113
      Height = 21
      Date = 42640.716256504630000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42640.716256504630000000
      TabOrder = 1
    end
    object dia2: TDateTimePicker
      Left = 218
      Top = 52
      Width = 113
      Height = 21
      Date = 42640.716256504630000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42640.716256504630000000
      TabOrder = 2
    end
    object btPesq: TBitBtn
      Left = 345
      Top = 50
      Width = 86
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = btPesqClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 446
    Height = 308
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
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
        FieldName = 'Dias'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Porcentagem'
        Width = 117
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 444
    Width = 446
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 397
    Width = 446
    Height = 47
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 3
    object lbTot: TLabel
      Left = 91
      Top = 16
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbTot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btExcel: TBitBtn
      Left = 288
      Top = 14
      Width = 91
      Height = 25
      Caption = 'Excel'
      TabOrder = 0
      OnClick = btExcelClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
    end
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 312
    Top = 160
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Dias'
        DataType = ftSmallint
      end
      item
        Name = 'Notas'
        DataType = ftInteger
      end
      item
        Name = 'Porcentagem'
        DataType = ftFloat
        Precision = 1
      end>
    Left = 312
    Top = 200
    object TabDias: TSmallintField
      FieldName = 'Dias'
      DisplayFormat = '00'
    end
    object TabNotas: TIntegerField
      FieldName = 'Notas'
      DisplayFormat = '#,##0'
    end
    object TabPorcentagem: TFloatField
      FieldName = 'Porcentagem'
      DisplayFormat = '##0.0'
    end
  end
end
