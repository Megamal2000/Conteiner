object TinyNF: TTinyNF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'TinyNF'
  ClientHeight = 411
  ClientWidth = 653
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
    Width = 653
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
      Visible = False
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 28
      Height = 13
      Caption = 'Datas'
    end
    object cbCli: TComboBox
      Left = 72
      Top = 14
      Width = 281
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
      Visible = False
    end
    object dt1: TDateTimePicker
      Left = 72
      Top = 44
      Width = 121
      Height = 21
      Date = 43708.773559884260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43708.773559884260000000
      TabOrder = 1
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 224
      Top = 44
      Width = 121
      Height = 21
      Date = 43708.773559884260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43708.773559884260000000
      TabOrder = 2
    end
    object btPesq: TBitBtn
      Left = 416
      Top = 43
      Width = 89
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = btPesqClick
    end
    object pb: TProgressBar
      Left = 519
      Top = 12
      Width = 122
      Height = 17
      TabOrder = 4
    end
    object ckVisual: TCheckBox
      Left = 416
      Top = 20
      Width = 97
      Height = 17
      Caption = 'Visualizar'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object Btrast: TBitBtn
      Left = 519
      Top = 43
      Width = 114
      Height = 25
      Caption = 'Enviar Rastreio'
      Enabled = False
      TabOrder = 6
      OnClick = BtrastClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 81
    Width = 653
    Height = 311
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
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
        FieldName = 'numNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Volume'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorNF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Transp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vfrete'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vPeso'
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 96
    Top = 184
    Width = 513
    Height = 177
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 392
    Width = 653
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 448
    Top = 120
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'numNF'
        DataType = ftInteger
      end
      item
        Name = 'SerieNF'
        DataType = ftInteger
      end
      item
        Name = 'Volume'
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Locali'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NumPed'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Transp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ValorNF'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'NomeDest'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'docDest'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Ender'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Comp'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CodMun'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ChaveNF'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ie'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'vfrete'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'vPeso'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'idNF'
        DataType = ftInteger
      end
      item
        Name = 'fone'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'idPed'
        DataType = ftInteger
      end>
    Left = 504
    Top = 120
    object TabnumNF: TIntegerField
      FieldName = 'numNF'
      DisplayFormat = '#,##0'
    end
    object TabSerieNF: TIntegerField
      FieldName = 'SerieNF'
    end
    object TabVolume: TIntegerField
      FieldName = 'Volume'
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TabLocali: TStringField
      FieldName = 'Locali'
      Size = 25
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
    end
    object TabTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object TabNumPed: TStringField
      FieldName = 'NumPed'
      Size = 15
    end
    object TabTransp: TStringField
      FieldName = 'Transp'
    end
    object TabValorNF: TFloatField
      FieldName = 'ValorNF'
    end
    object TabNomeDest: TStringField
      FieldName = 'NomeDest'
      Size = 50
    end
    object TabdocDest: TStringField
      FieldName = 'docDest'
      Size = 18
    end
    object TabEnder: TStringField
      FieldName = 'Ender'
      Size = 70
    end
    object TabNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TabComp: TStringField
      FieldName = 'Comp'
      Size = 15
    end
    object TabCodMun: TStringField
      FieldName = 'CodMun'
      Size = 7
    end
    object TabEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object TabChaveNF: TStringField
      FieldName = 'ChaveNF'
      Size = 50
    end
    object Tabie: TStringField
      FieldName = 'ie'
      Size = 18
    end
    object Tabvfrete: TFloatField
      FieldName = 'vfrete'
    end
    object TabvPeso: TFloatField
      FieldName = 'vPeso'
    end
    object TabidNF: TIntegerField
      FieldName = 'idNF'
    end
    object Tabfone: TStringField
      FieldName = 'fone'
      Size = 16
    end
    object TabidPed: TIntegerField
      FieldName = 'idPed'
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 544
    Top = 272
  end
  object Tempor: TJvThreadTimer
    OnTimer = TemporTimer
    Left = 168
    Top = 168
  end
  object TemporRast: TJvThreadTimer
    Interval = 4000
    OnTimer = TemporRastTimer
    Left = 248
    Top = 192
  end
end
