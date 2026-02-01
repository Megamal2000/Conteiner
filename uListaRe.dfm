object ListaRe: TListaRe
  Left = 330
  Top = 125
  Caption = 'Lista Reentregas de um Dia'
  ClientHeight = 442
  ClientWidth = 605
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
  object Rodape: TStatusBar
    Left = 0
    Top = 423
    Width = 605
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitWidth = 491
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 57
    Width = 605
    Height = 366
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 16776176
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
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATUAL'
        Title.Caption = 'Romaneio Atual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROX'
        Title.Caption = 'Pr'#243'ximo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCORR'
        Title.Caption = 'Oc.'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBAIXA'
        Title.Caption = 'Data Baixa'
        Width = 81
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 57
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
    ExplicitWidth = 491
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 26
      Height = 13
      Caption = 'Data '
    end
    object btrefaz: TSpeedButton
      Left = 376
      Top = 17
      Width = 25
      Height = 25
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000000
        87777777770AAAAA00877777770AAAAAA2077777770AAAAA2A20777777000000
        A220777777777777002077777777777777007777077777777700777007777777
        0020770A00000000A22070AAAAAAAAAA2A200AAAAAAAAAAAA20770AAAAAAAAAA
        0077770A00000000877777700777777777777777077777777777}
      OnClick = btrefazClick
    end
    object btExcel: TSpeedButton
      Left = 407
      Top = 17
      Width = 23
      Height = 25
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      OnClick = btExcelClick
    end
    object dtR: TDateTimePicker
      Left = 96
      Top = 21
      Width = 129
      Height = 21
      Date = 40925.618466064810000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40925.618466064810000000
      TabOrder = 0
    end
    object btPesq: TBitBtn
      Left = 256
      Top = 19
      Width = 104
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesqClick
    end
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsProx
    Left = 264
    Top = 112
  end
end
