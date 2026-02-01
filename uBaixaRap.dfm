object BaixaRap: TBaixaRap
  Left = 238
  Top = 190
  BorderIcons = [biSystemMenu]
  Caption = 'Baixa por Romaneio'
  ClientHeight = 535
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 424
    Top = 280
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 49
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Romaneio'
    end
    object lbMot: TLabel
      Left = 272
      Top = 16
      Width = 39
      Height = 16
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edRoma: TEdit
      Left = 88
      Top = 13
      Width = 73
      Height = 21
      TabOrder = 0
      Text = 'edRoma'
      OnKeyPress = edRomaKeyPress
    end
    object btMostrar: TBitBtn
      Left = 171
      Top = 12
      Width = 86
      Height = 25
      Caption = 'Mostrar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000D00DDDDDDDDDDDDDD0000000D000DDDDDDDDDDDDD0000000DD00
        0DDDDDDDDDDDD0000000DDD000D800008DDDD0000000DDDD0000777700DDD000
        0000DDDDD08EE777780DD0000000DDDD807E77777708D0000000DDDD07E77777
        7770D0000000DDDD077777777770D0000000DDDD077777777E70D0000000DDDD
        077777777E70D0000000DDDD80777777EE08D0000000DDDDD08777EEE80DD000
        0000DDDDDD00777700DDD0000000DDDDDDD800008DDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
      TabOrder = 1
      OnClick = btMostrarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 854
    Height = 41
    Align = alTop
    Color = 14611434
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 14
      Width = 67
      Height = 13
      Caption = 'Data da Baixa'
    end
    object Label3: TLabel
      Left = 312
      Top = 15
      Width = 93
      Height = 13
      Caption = 'Intervalo de Hor'#225'rio'
    end
    object dtBaixa: TDateTimePicker
      Left = 112
      Top = 10
      Width = 121
      Height = 21
      Date = 43089.708518692130000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43089.708518692130000000
      TabOrder = 0
    end
    object hri: TJvSpinEdit
      Left = 432
      Top = 11
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object hrf: TJvSpinEdit
      Left = 507
      Top = 11
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object btCompletar: TBitBtn
      Left = 600
      Top = 9
      Width = 89
      Height = 25
      Caption = 'Completar'
      TabOrder = 3
      OnClick = btCompletarClick
    end
    object btRetirar: TBitBtn
      Left = 733
      Top = 9
      Width = 89
      Height = 25
      Caption = 'Retirar Baixa '
      TabOrder = 4
      OnClick = btRetirarClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 90
    Width = 854
    Height = 382
    Align = alClient
    DataSource = dsTab
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
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
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Num Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nOcorr'
        Title.Caption = 'Oc'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datEnt'
        Title.Caption = 'Data Ent'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'horaEnt'
        Title.Caption = 'Hora Ent'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Recedor'
        Title.Caption = 'Recebedor'
        Width = 174
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 472
    Width = 854
    Height = 63
    Align = alBottom
    Color = 14611434
    TabOrder = 3
    object lbMens: TLabel
      Left = 14
      Top = 37
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 9
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object btMarca: TSpeedButton
      Left = 46
      Top = 9
      Width = 34
      Height = 22
      Caption = 'Tudo'
      OnClick = btMarcaClick
    end
    object btDesmarca: TSpeedButton
      Left = 87
      Top = 9
      Width = 31
      Height = 22
      Caption = 'Nada'
      OnClick = btDesmarcaClick
    end
    object Bevel1: TBevel
      Left = 124
      Top = 8
      Width = 2
      Height = 25
    end
    object btRecebe: TBitBtn
      Left = 536
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Gravar Recebedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btRecebeClick
    end
    object btGravar: TBitBtn
      Left = 704
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Gravar Baixas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btGravarClick
    end
    object btReent: TBitBtn
      Left = 378
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Gerar Reentregas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btReentClick
    end
  end
  object dsTab: TJvDataSource
    DataSet = Tab
    Left = 640
    Top = 112
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Sel'
        DataType = ftBoolean
      end
      item
        Name = 'idNF'
        DataType = ftInteger
      end
      item
        Name = 'numNF'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'nOcorr'
        DataType = ftInteger
      end
      item
        Name = 'datEnt'
        DataType = ftDate
      end
      item
        Name = 'horaEnt'
        DataType = ftTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Recedor'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Flag'
        DataType = ftSmallint
      end
      item
        Name = 'Origem'
        DataType = ftInteger
      end
      item
        Name = 'Obs'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'ligcli'
        DataType = ftInteger
      end
      item
        Name = 'criaDT'
        DataType = ftDateTime
      end>
    Left = 672
    Top = 112
    object TabSel: TBooleanField
      FieldName = 'Sel'
    end
    object TabidNF: TIntegerField
      FieldName = 'idNF'
    end
    object TabnumNF: TIntegerField
      FieldName = 'numNF'
      DisplayFormat = '#,##0'
    end
    object TabValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#,##0.00'
    end
    object TabnOcorr: TIntegerField
      FieldName = 'nOcorr'
    end
    object TabdatEnt: TDateField
      FieldName = 'datEnt'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TabhoraEnt: TTimeField
      FieldName = 'horaEnt'
      DisplayFormat = 'HH:mm'
    end
    object TabCliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object TabRecedor: TStringField
      FieldName = 'Recedor'
      Size = 40
    end
    object TabFlag: TSmallintField
      FieldName = 'Flag'
    end
    object TabOrigem: TIntegerField
      FieldName = 'Origem'
    end
    object TabObs: TStringField
      FieldName = 'Obs'
      Size = 55
    end
    object Tabligcli: TIntegerField
      FieldName = 'ligcli'
    end
    object TabcriaDT: TDateTimeField
      FieldName = 'criaDT'
    end
  end
end
