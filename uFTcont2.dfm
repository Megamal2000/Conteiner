object FTcont2: TFTcont2
  Left = 275
  Top = 161
  Width = 466
  Height = 506
  Caption = 'Romaneios de Contrato'
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
    Width = 458
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object lbCli: TLabel
      Left = 72
      Top = 16
      Width = 25
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbMot: TLabel
      Left = 72
      Top = 40
      Width = 26
      Height = 13
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbConta: TLabel
      Left = 396
      Top = 67
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbConta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btTodos: TBitBtn
      Left = 16
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Todos'
      TabOrder = 0
      OnClick = btTodosClick
    end
    object btNenhum: TBitBtn
      Left = 104
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Nenhum'
      TabOrder = 1
      OnClick = btNenhumClick
    end
    object btSalvar: TBitBtn
      Left = 256
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 453
    Width = 458
    Height = 19
    Panels = <>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 105
    Width = 458
    Height = 348
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'Sel'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Roma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notas'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalNF'
        Width = 83
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 328
    Top = 8
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Sel'
        DataType = ftBoolean
      end
      item
        Name = 'Num'
        DataType = ftInteger
      end
      item
        Name = 'Roma'
        DataType = ftInteger
      end
      item
        Name = 'Notas'
        DataType = ftInteger
      end
      item
        Name = 'TotalNF'
        DataType = ftFloat
      end>
    Left = 368
    Top = 8
    object TabSel: TBooleanField
      FieldName = 'Sel'
    end
    object TabNum: TIntegerField
      FieldName = 'Num'
    end
    object TabRoma: TIntegerField
      FieldName = 'Roma'
    end
    object TabNotas: TIntegerField
      FieldName = 'Notas'
    end
    object TabTotalNF: TFloatField
      FieldName = 'TotalNF'
      DisplayFormat = '#,##0.00'
    end
  end
end
