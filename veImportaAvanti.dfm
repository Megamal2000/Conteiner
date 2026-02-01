object eImportaAvanti: TeImportaAvanti
  Left = 0
  Top = 0
  Caption = 'Importar Pedidos de Venda - AVANTI'
  ClientHeight = 497
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 21
    Width = 70
    Height = 13
    Caption = 'a partir do dia '
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Pedidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 277
    Width = 75
    Height = 13
    Caption = 'Itens do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btMostrar: TBitBtn
    Left = 16
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 0
    OnClick = btMostrarClick
  end
  object dt: TDateTimePicker
    Left = 224
    Top = 18
    Width = 129
    Height = 21
    Date = 44766.496155844910000000
    Format = 'dd/MM/yyyy ddd'
    Time = 44766.496155844910000000
    TabOrder = 1
  end
  object JvDBGrid1: TJvDBGrid
    Left = 16
    Top = 61
    Width = 553
    Height = 209
    DataSource = JvDataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    MultiSelect = True
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
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PedNumero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PedData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DestNome'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 69
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 16
    Top = 289
    Width = 553
    Height = 88
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clMoneyGreen
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object Memo1: TMemo
    Left = 16
    Top = 383
    Width = 553
    Height = 73
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object btImp: TBitBtn
    Left = 416
    Top = 462
    Width = 153
    Height = 25
    Caption = 'Importar Selecionados'
    TabOrder = 5
    OnClick = btImpClick
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 464
    Top = 208
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Sel'
        DataType = ftSmallint
      end
      item
        Name = 'PedNumero'
        DataType = ftInteger
      end
      item
        Name = 'PedData'
        DataType = ftDate
      end
      item
        Name = 'DestNome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Valor'
        DataType = ftFloat
        Precision = 2
      end>
    Left = 400
    Top = 208
    object TabSel: TSmallintField
      FieldName = 'Sel'
    end
    object TabPedNumero: TIntegerField
      FieldName = 'PedNumero'
    end
    object TabPedData: TDateField
      FieldName = 'PedData'
    end
    object TabDestNome: TStringField
      FieldName = 'DestNome'
      Size = 50
    end
    object TabValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#,##0.00'
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=MariaDB')
    LoginPrompt = False
    Left = 32
    Top = 208
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT Codigo, DATA, RazaoCliente, CNPJ, TotalPedido, CodigoTran' +
        'sportadora, TotalPesoB FROM pedidosvenda WHERE DATA >= :dia ORDE' +
        'R BY Codigo'
      '')
    Left = 112
    Top = 208
    ParamData = <
      item
        Name = 'DIA'
        ParamType = ptInput
      end>
  end
  object cdsPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 264
    Top = 208
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 184
    Top = 208
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = FDQuery2
    Left = 184
    Top = 256
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 264
    Top = 256
  end
  object JvDataSource2: TJvDataSource
    DataSet = cdsProd
    Left = 344
    Top = 256
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT CodigoPedido, CodigoProduto,  Quantidade, ValorUnitario, ' +
        'ValorTotal FROM pedidosvendaprodutos'
      'WHERE CodigoPedido = :Ligped'
      '')
    Left = 112
    Top = 256
    ParamData = <
      item
        Name = 'LIGPED'
        ParamType = ptInput
      end>
  end
end
