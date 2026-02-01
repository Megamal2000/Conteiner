object OcorreNF: TOcorreNF
  Left = 243
  Top = 110
  Width = 588
  Height = 452
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
    Width = 580
    Height = 73
    Align = alTop
    TabOrder = 0
    object lbMotivo: TLabel
      Left = 98
      Top = 10
      Width = 423
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 96
      Top = 40
      Width = 101
      Height = 13
      Caption = 'Quantidade de Notas'
    end
    object lbQT: TLabel
      Left = 208
      Top = 40
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object numM: TJvValidateEdit
      Left = 40
      Top = 8
      Width = 49
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
      OnKeyPress = numMKeyPress
    end
    object Hoje: TDateTimePicker
      Left = 344
      Top = 34
      Width = 130
      Height = 21
      Date = 40849.744971423620000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40849.744971423620000000
      TabOrder = 1
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 580
    Height = 345
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 14742776
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
        Title.Caption = 'Data Romaneio'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Local'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCONH'
        Title.Caption = 'CT-e'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsNFoc
    Left = 416
    Top = 168
  end
end
