object NotasPQ: TNotasPQ
  Left = 205
  Top = 117
  Width = 527
  Height = 266
  BorderIcons = [biSystemMenu]
  Caption = 'Escolha a Nota'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Nota n'#186' '
  end
  object Bevel1: TBevel
    Left = 8
    Top = 40
    Width = 497
    Height = 2
  end
  object Label2: TLabel
    Left = 64
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 456
    Top = 24
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Grid: TJvDBGrid
    Left = 8
    Top = 44
    Width = 497
    Height = 152
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = GridDblClick
    SortMarker = smDown
    AlternateRowColor = 15263952
    SortedField = 'Romaneio'
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTROMA'
        Title.Caption = 'Data Romaneio'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeC'
        Title.Caption = 'Cliente'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obs'
        Width = 186
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.vcNFp
    Left = 392
    Top = 8
  end
end
