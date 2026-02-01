object Resto: TResto
  Left = 238
  Top = 154
  Width = 501
  Height = 383
  Caption = 'Controle - Romaneios Restantes'
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
    Top = 57
    Width = 493
    Height = 292
    Align = alClient
    Color = clWhite
    DataSource = DataSource1
    FixedColor = 12639446
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    SortMarker = smUp
    AlternateRowColor = 14941692
    SortedField = 'Romaneio'
    SelectColumnsDialogStrings.Caption = 'Selecione uma coluna'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'dtRoma'
        Title.Caption = 'Data Romaneio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Romaneio'
        Title.Caption = 'Num Romaneio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Motorista'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 57
    Align = alTop
    Color = 12639446
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 40
      Width = 153
      Height = 13
      Caption = 'Romaneios ainda n'#227'o entregues'
    end
    object lbQt: TLabel
      Left = 200
      Top = 40
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object DataSource1: TDataSource
    DataSet = DM3.vcC3
    Left = 24
    Top = 136
  end
end
