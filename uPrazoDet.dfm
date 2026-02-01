object PrazoDet: TPrazoDet
  Left = 234
  Top = 189
  Width = 739
  Height = 500
  BorderIcons = [biSystemMenu]
  Caption = 'Detalhes do Relat'#243'rio de Prazos'
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
    Width = 731
    Height = 73
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Entre Datas'
    end
    object Label2: TLabel
      Left = 40
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbDatas: TLabel
      Left = 112
      Top = 16
      Width = 36
      Height = 13
      Caption = 'lbDatas'
    end
    object lbCli: TLabel
      Left = 112
      Top = 40
      Width = 25
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 592
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object lbTot: TLabel
      Left = 632
      Top = 16
      Width = 30
      Height = 13
      Caption = 'lbTot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btExcel: TBitBtn
      Left = 592
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btExcelClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 731
    Height = 393
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    TitleButtons = True
    AlternateRowColor = clMoneyGreen
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
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Nota'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT'
        Title.Caption = 'qt'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTNOTA'
        Title.Caption = 'Dt Nota'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTIMPORTA'
        Title.Caption = 'Dt Cria'#231#227'o'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENTREGA'
        Title.Caption = 'Dt Entrega'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASG'
        Title.Caption = 'Dias Ent'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASC'
        Title.Caption = 'Dias Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCOR'
        Title.Caption = 'Ocorr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Dias Transp'
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPrazo
    Left = 648
    Top = 120
  end
end
