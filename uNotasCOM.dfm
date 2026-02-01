object NotasCOM: TNotasCOM
  Left = 205
  Top = 194
  Width = 577
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Notas que possuem Romaneio'
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
    Width = 569
    Height = 65
    Align = alTop
    Color = clGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Tipo de Pesquisa'
    end
    object Label2: TLabel
      Left = 34
      Top = 32
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo '
    end
    object lbTipo: TLabel
      Left = 128
      Top = 8
      Width = 36
      Height = 13
      Caption = 'lbTipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPer: TLabel
      Left = 128
      Top = 32
      Width = 24
      Height = 13
      Caption = 'lbPer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 569
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 65
    Width = 569
    Height = 362
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'DTROMA'
        Title.Caption = 'Data R'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Local'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Volume'
        Width = 47
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM3.cdsNF
    Left = 280
    Top = 24
  end
end
