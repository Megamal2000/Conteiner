object Prazo: TPrazo
  Left = 213
  Top = 113
  Width = 818
  Height = 511
  BorderIcons = [biSystemMenu]
  Caption = 'Prazo'
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
    Width = 810
    Height = 57
    Align = alTop
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Entre'
    end
    object dt1: TDateTimePicker
      Left = 88
      Top = 20
      Width = 121
      Height = 21
      Date = 42979.697105937500000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42979.697105937500000000
      TabOrder = 0
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 232
      Top = 20
      Width = 129
      Height = 21
      Date = 42979.697142465280000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42979.697142465280000000
      TabOrder = 1
    end
    object btMostrar: TBitBtn
      Left = 409
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Mostrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btMostrarClick
    end
    object ckPorc: TCheckBox
      Left = 496
      Top = 23
      Width = 97
      Height = 17
      Caption = 'Porcentagem'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = ckPorcClick
    end
    object btExcel: TBitBtn
      Left = 704
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
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
    object BitBtn1: TBitBtn
      Left = 608
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 5
      Visible = False
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 810
    Height = 56
    Align = alTop
    Color = clBlue
    TabOrder = 1
    object Pb1: TJvSpecialProgress
      Left = 120
      Top = 11
      Width = 617
      Height = 15
      Caption = 'Pb1'
    end
    object Pb2: TJvSpecialProgress
      Left = 120
      Top = 35
      Width = 617
      Height = 15
      Caption = 'JvSpecialProgress1'
    end
    object lbProg: TStaticText
      Left = 52
      Top = 11
      Width = 34
      Height = 17
      Alignment = taRightJustify
      Caption = 'lbProg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 113
    Width = 810
    Height = 364
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
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
        FieldName = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prazo'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'd1'
        Title.Caption = '24h'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'd2'
        Title.Caption = '48h'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'd3'
        Title.Caption = '72h'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dOut'
        Title.Caption = 'Acima'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NaoEnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'N'#227'o Ent'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Erro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrazoOK'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrazoFora'
        Width = 54
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 0
    Top = 113
    Width = 810
    Height = 364
    Align = alClient
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
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
        FieldName = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prazo'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'd1'
        Title.Caption = '24h'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'd2'
        Title.Caption = '48h'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'd3'
        Title.Caption = '72h'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dOut'
        Title.Caption = 'Acima'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NaoEnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'N'#227'o Ent'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Erro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrazoOK'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrazoFora'
        Width = 54
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 584
    Top = 40
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'idCli'
        DataType = ftInteger
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Prazo'
        DataType = ftSmallint
      end
      item
        Name = 'd1'
        DataType = ftFloat
      end
      item
        Name = 'd2'
        DataType = ftFloat
      end
      item
        Name = 'd3'
        DataType = ftFloat
      end
      item
        Name = 'dOut'
        DataType = ftFloat
      end
      item
        Name = 'NaoEnt'
        DataType = ftFloat
      end
      item
        Name = 'Erro'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftInteger
      end
      item
        Name = 'PrazoOK'
        DataType = ftFloat
      end
      item
        Name = 'PrazoFora'
        DataType = ftFloat
      end>
    Left = 656
    Top = 40
    object TabidCli: TIntegerField
      FieldName = 'idCli'
    end
    object TabCliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object TabPrazo: TSmallintField
      FieldName = 'Prazo'
    end
    object Tabd1: TFloatField
      FieldName = 'd1'
      DisplayFormat = '#0.0'
    end
    object Tabd2: TFloatField
      FieldName = 'd2'
      DisplayFormat = '#0.0'
    end
    object Tabd3: TFloatField
      FieldName = 'd3'
      DisplayFormat = '#0.0'
    end
    object TabdOut: TFloatField
      FieldName = 'dOut'
      DisplayFormat = '#0.0'
    end
    object TabNaoEnt: TFloatField
      FieldName = 'NaoEnt'
      DisplayFormat = '#0.0'
    end
    object TabErro: TFloatField
      FieldName = 'Erro'
      DisplayFormat = '#0.0'
    end
    object TabTotal: TIntegerField
      FieldName = 'Total'
    end
    object TabPrazoOK: TFloatField
      FieldName = 'PrazoOK'
      DisplayFormat = '#0.0'
    end
    object TabPrazoFora: TFloatField
      FieldName = 'PrazoFora'
      DisplayFormat = '#0.0'
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = Tab2
    Left = 584
    Top = 128
  end
  object Tab2: TJvMemoryData
    FieldDefs = <
      item
        Name = 'idCli'
        DataType = ftInteger
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Prazo'
        DataType = ftSmallint
      end
      item
        Name = 'd1'
        DataType = ftFloat
      end
      item
        Name = 'd2'
        DataType = ftFloat
      end
      item
        Name = 'd3'
        DataType = ftFloat
      end
      item
        Name = 'dOut'
        DataType = ftFloat
      end
      item
        Name = 'NaoEnt'
        DataType = ftFloat
      end
      item
        Name = 'Erro'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftInteger
      end
      item
        Name = 'PrazoOK'
        DataType = ftFloat
      end
      item
        Name = 'PrazoFora'
        DataType = ftFloat
      end>
    Left = 656
    Top = 128
    object Tab2idCli: TIntegerField
      FieldName = 'idCli'
    end
    object Tab2Cliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object Tab2Prazo: TSmallintField
      FieldName = 'Prazo'
    end
    object Tab2d1: TFloatField
      FieldName = 'd1'
      DisplayFormat = '#0.0'
    end
    object Tab2d2: TFloatField
      FieldName = 'd2'
      DisplayFormat = '#0.0'
    end
    object Tab2d3: TFloatField
      FieldName = 'd3'
      DisplayFormat = '#0.0'
    end
    object Tab2dOut: TFloatField
      FieldName = 'dOut'
      DisplayFormat = '#0.0'
    end
    object Tab2NaoEnt: TFloatField
      FieldName = 'NaoEnt'
      DisplayFormat = '#0.0'
    end
    object Tab2Erro: TFloatField
      FieldName = 'Erro'
      DisplayFormat = '#0.0'
    end
    object Tab2Total: TIntegerField
      FieldName = 'Total'
    end
    object Tab2PrazoOK: TFloatField
      FieldName = 'PrazoOK'
      DisplayFormat = '#0.0'
    end
    object Tab2PrazoFora: TFloatField
      FieldName = 'PrazoFora'
      DisplayFormat = '#0.0'
    end
  end
end
