object MotList: TMotList
  Left = 87
  Top = 105
  BorderIcons = [biSystemMenu]
  Caption = 'Lista de Motoristas para verificar data Seguro'
  ClientHeight = 442
  ClientWidth = 800
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
    Top = 0
    Width = 800
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 685
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 114
      Height = 13
      Caption = 'Verificar data do Seguro'
    end
    object btExcel: TBitBtn
      Left = 304
      Top = 15
      Width = 115
      Height = 33
      Caption = 'Exporta Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      ParentFont = False
      TabOrder = 0
      OnClick = btExcelClick
    end
    object btSelA: TBitBtn
      Left = 520
      Top = 15
      Width = 115
      Height = 33
      Caption = 'ATIVAR selecionados'
      TabOrder = 1
      OnClick = btSelAClick
    end
    object btSelD: TBitBtn
      Left = 656
      Top = 15
      Width = 115
      Height = 33
      Caption = 'Desativar Selecionados'
      TabOrder = 2
      OnClick = btSelDClick
    end
    object ckAtivos: TCheckBox
      Left = 525
      Top = 51
      Width = 97
      Height = 17
      Caption = 'Somente Ativos'
      TabOrder = 3
      OnClick = ckAtivosClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 800
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitWidth = 685
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 800
    Height = 350
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = 16776176
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
        FieldName = 'ID'
        Title.Caption = 'Num'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Motorista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEGVALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Seguro Data'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHVALIDADE'
        Title.Caption = 'Validade CH'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Width = 21
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsMot
    Left = 312
    Top = 176
  end
end
