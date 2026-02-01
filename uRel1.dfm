object RelGer: TRelGer
  Left = 309
  Top = 160
  BorderIcons = [biSystemMenu]
  Caption = 'Gerar Relat'#243'rio'
  ClientHeight = 442
  ClientWidth = 563
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
    Width = 563
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 550
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 56
      Height = 13
      Caption = 'Data In'#237'cio '
    end
    object Label3: TLabel
      Left = 240
      Top = 32
      Width = 16
      Height = 13
      Caption = 'Fim'
    end
    object lbQt: TLabel
      Left = 524
      Top = 30
      Width = 5
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dt1: TDateTimePicker
      Left = 88
      Top = 29
      Width = 121
      Height = 21
      Date = 40806.983952546300000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40806.983952546300000000
      TabOrder = 0
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 264
      Top = 29
      Width = 113
      Height = 21
      Date = 40806.984372465270000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40806.984372465270000000
      TabOrder = 1
    end
    object btPesq: TBitBtn
      Left = 386
      Top = 27
      Width = 25
      Height = 25
      Hint = 'Procurar Romaneios para Cobran'#231'a'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333300003333333333333333333300003333333330033003300300003333
        3333300330033003000033303333333333333333000033000333333333333333
        000030F000333333333333330000330F000333333333333300003330F0000000
        73333333000033330F0078887033333300003333300788FF8703333300003333
        30788888F877333300003333308888888F80333300003333307888888F803333
        000033333078FF8888803333000033333777FF88887733330000333333077888
        8703333300003333333077777033333300003333333370007333333300003333
        33333333333333330000}
      TabOrder = 2
      OnClick = btPesqClick
    end
    object cbCli: TComboBox
      Left = 88
      Top = 6
      Width = 292
      Height = 21
      Sorted = True
      TabOrder = 3
      Text = '<Clientes>'
    end
    object cbIncluir: TCheckBox
      Left = 432
      Top = 7
      Width = 113
      Height = 17
      Caption = 'Incluir Notas CTe'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 563
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    ExplicitWidth = 550
    object btEsq: TSpeedButton
      Left = 16
      Top = 8
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777777770000000000000000777777770FFFFFFF000000007777
        77770F88888F00000000777777770F8FFF8F00000000777777770F88888F0000
        0000744444440FFFFFFF00000000748888880F88777F00000000747777770FFF
        F00000000000747007000F88707070000000747777770FFFF007700000007470
        0700000000777000000074777777777747777000000074444444444447777000
        000074F44F44F44F477770000000744444444444477770000000777777777777
        777770000000}
      OnClick = btEsqClick
    end
    object lbPag: TLabel
      Left = 48
      Top = 12
      Width = 481
      Height = 13
      AutoSize = False
      Caption = 'sem N'#250'mero Cobran'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btGerar: TBitBtn
      Left = 465
      Top = 7
      Width = 80
      Height = 25
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = btGerarClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 106
    Width = 563
    Height = 336
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    MultiSelect = True
    AlternateRowColor = 16511470
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Num Romaneio'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTAS'
        Title.Caption = 'Notas'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsRelG
    Left = 360
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 504
    Top = 121
    object GerarRelatrio1: TMenuItem
      Caption = 'Gerar Relat'#243'rio'
      OnClick = GerarRelatrio1Click
    end
  end
end
