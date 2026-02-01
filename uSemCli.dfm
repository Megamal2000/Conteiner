object SemCli: TSemCli
  Left = 75
  Top = 247
  BorderIcons = [biSystemMenu]
  Caption = 'Notas sem Cliente'
  ClientHeight = 382
  ClientWidth = 705
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
    Top = 307
    Width = 705
    Height = 75
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 32
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas'
    end
    object lbNotas: TLabel
      Left = 56
      Top = 32
      Width = 32
      Height = 13
      Caption = 'lbTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 108
      Top = 15
      Width = 2
      Height = 50
    end
    object Label3: TLabel
      Left = 128
      Top = 32
      Width = 167
      Height = 13
      Caption = 'Passar Selecionadas para o Cliente'
    end
    object Label4: TLabel
      Left = 544
      Top = 32
      Width = 101
      Height = 13
      Caption = 'Apagar Selecionadas'
    end
    object btApaga: TSpeedButton
      Left = 657
      Top = 28
      Width = 23
      Height = 22
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777777777777777770000000777777777777770F700000007777
        0F777777777770000000777000F7777770F770000000777000F777770F777000
        00007777000F77700F777000000077777000F700F7777000000077777700000F
        7777700000007777777000F777777000000077777700000F7777700000007777
        7000F70F7777700000007770000F77700F7770000000770000F7777700F77000
        00007700F7777777700F70000000777777777777777770000000777777777777
        777770000000}
      OnClick = btApagaClick
    end
    object Bevel2: TBevel
      Left = 532
      Top = 15
      Width = 2
      Height = 50
    end
    object btPassar: TBitBtn
      Left = 446
      Top = 26
      Width = 75
      Height = 25
      Caption = 'Passar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        72000000424D72000000000000003E00000028000000110000000D0000000100
        010000000000340000000000000000000000020000000000000000000000FFFF
        FF00FFFF8000FFFF8000FFFF8000FFEF8000FFE78000FC038000FC018000FC03
        8000FFE78000FFEF8000FFFF8000FFFF8000FFFF8000}
      ParentFont = False
      TabOrder = 0
      OnClick = btPassarClick
    end
    object cbCli: TComboBox
      Left = 305
      Top = 29
      Width = 133
      Height = 21
      TabOrder = 1
      Text = 'cbCli'
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 705
    Height = 307
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = clSkyBlue
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'num Nota'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 104
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
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Local'
        Width = 202
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsSemC
    Left = 328
    Top = 64
  end
end
