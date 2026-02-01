object Rel2: TRel2
  Left = 206
  Top = 254
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rios de Cobran'#231'a'
  ClientHeight = 392
  ClientWidth = 522
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
    Width = 522
    Height = 73
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    ExplicitWidth = 530
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 93
      Height = 13
      Caption = 'Data dos Relat'#243'rios'
    end
    object dte: TDateTimePicker
      Left = 130
      Top = 21
      Width = 127
      Height = 21
      Date = 40807.076352893520000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40807.076352893520000000
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 266
      Top = 19
      Width = 25
      Height = 25
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
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object btCalc: TBitBtn
      Left = 352
      Top = 19
      Width = 129
      Height = 25
      Caption = 'Calcula Selecionados'
      TabOrder = 2
      OnClick = btCalcClick
    end
    object pb: TProgressBar
      Left = 352
      Top = 48
      Width = 129
      Height = 17
      TabOrder = 3
    end
    object lbR: TStaticText
      Left = 488
      Top = 48
      Width = 4
      Height = 4
      TabOrder = 4
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 522
    Height = 278
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    MultiSelect = True
    AlternateRowColor = 16642019
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Caption = 'Data da Emiss'#227'o'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'N'#250'mero do relat'#243'rio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'N'#250'm. Romaneio'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VFRETET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Valor do Frete'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RELSTATUS'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 351
    Width = 522
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    ExplicitTop = 355
    ExplicitWidth = 530
    object Label2: TLabel
      Left = 24
      Top = 13
      Width = 88
      Height = 13
      Caption = 'Procura Romaneio'
      Visible = False
    end
    object edRoma: TEdit
      Left = 128
      Top = 10
      Width = 89
      Height = 21
      TabOrder = 0
      Text = 'edRoma'
      Visible = False
      OnEnter = edRomaEnter
      OnKeyPress = edRomaKeyPress
    end
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsRelV
    Left = 304
    Top = 96
  end
end
