object RomaRes: TRomaRes
  Left = 230
  Top = 189
  Caption = 'Romaneio - Resultados'
  ClientHeight = 442
  ClientWidth = 598
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
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 598
    Height = 369
    Align = alClient
    Color = clWhite
    DataSource = DataSource1
    FixedColor = clMoneyGreen
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    AlternateRowColor = 16381416
    SortedField = 'NUMNF'
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DTENT'
        Title.Caption = 'Data Ent'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Motorista'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Volume'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 73
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Total de Notas:'
    end
    object lbNF: TLabel
      Left = 152
      Top = 8
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 32
      Width = 95
      Height = 13
      Caption = 'Total de Romaneios'
    end
    object lbRoma: TLabel
      Left = 152
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btExcel: TBitBtn
      Left = 520
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 0
      OnClick = btExcelClick
    end
    object btAtual: TBitBtn
      Left = 440
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Atual'
      TabOrder = 1
      OnClick = btAtualClick
    end
    object dtRoma: TDateTimePicker
      Left = 192
      Top = 41
      Width = 105
      Height = 21
      Date = 40785.758477824070000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40785.758477824070000000
      TabOrder = 2
    end
    object cbCli: TComboBox
      Left = 192
      Top = 9
      Width = 233
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsRomaR
    Left = 360
    Top = 152
  end
end
