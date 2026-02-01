object BIP2: TBIP2
  Left = 137
  Top = 100
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Entrada de Notas'
  ClientHeight = 357
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object PanelInic: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Data de Entrada'
    end
    object dtEntra: TDateTimePicker
      Left = 112
      Top = 12
      Width = 113
      Height = 21
      Date = 43576.760421284720000000
      Time = 43576.760421284720000000
      TabOrder = 0
    end
    object btIniciar: TBitBtn
      Left = 520
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 1
      OnClick = btIniciarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 304
    Width = 635
    Height = 53
    Align = alBottom
    TabOrder = 1
    object lbNotas: TLabel
      Left = 266
      Top = 6
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbNotas'
    end
    object lbVol: TLabel
      Left = 351
      Top = 6
      Width = 22
      Height = 13
      Caption = 'lbVol'
    end
    object btConfere: TBitBtn
      Left = 24
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Conferir'
      TabOrder = 0
    end
    object btImprime: TBitBtn
      Left = 139
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
    end
    object btFinal: TBitBtn
      Left = 520
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      TabOrder = 2
      OnClick = btFinalClick
    end
  end
  object PanelFim: TPanel
    Left = 0
    Top = 49
    Width = 635
    Height = 49
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Data de Entrada'
    end
    object lbEntra: TLabel
      Left = 112
      Top = 16
      Width = 40
      Height = 13
      Caption = 'lbEntra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 360
      Top = 16
      Width = 78
      Height = 13
      Caption = 'N'#250'mero da Nota'
    end
    object edNum: TEdit
      Left = 453
      Top = 7
      Width = 148
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edNum'
      OnKeyPress = edNumKeyPress
    end
  end
  object Memo1: TMemo
    Left = 410
    Top = 98
    Width = 225
    Height = 206
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object JvDBGrid2: TJvDBGrid
    Left = 241
    Top = 98
    Width = 169
    Height = 206
    Align = alLeft
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid2DrawColumnCell
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'tNota'
        Title.Caption = 'Nota'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tVol'
        Title.Caption = 'Volume'
        Width = 44
        Visible = True
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 98
    Width = 241
    Height = 206
    Align = alLeft
    DataSource = DataSource1
    TabOrder = 5
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
    Columns = <
      item
        Expanded = False
        FieldName = 'DTENTRADA'
        Title.Caption = 'Dia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTASENT'
        Title.Caption = 'Notas'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTULTCONF'
        Title.Caption = 'Ult Conferencia'
        Width = 80
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 144
    Top = 256
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'tNota'
        DataType = ftInteger
      end
      item
        Name = 'tVol'
        DataType = ftInteger
      end
      item
        Name = 'Alterado'
        DataType = ftSmallint
      end>
    KeyFieldNames = 'tNota'
    Left = 200
    Top = 256
    object TabtNota: TIntegerField
      FieldName = 'tNota'
    end
    object TabtVol: TIntegerField
      FieldName = 'tVol'
    end
    object TabAlterado: TSmallintField
      FieldName = 'Alterado'
    end
  end
  object DataSource1: TDataSource
    DataSet = DM5.cdsBIP2
    Left = 48
    Top = 256
  end
  object DataSource2: TDataSource
    DataSet = Tab
    Left = 224
    Top = 192
  end
end
