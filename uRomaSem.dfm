object RomaSem: TRomaSem
  Left = 174
  Top = 121
  BorderIcons = [biSystemMenu]
  Caption = 'Notas SEM Romaneio'
  ClientHeight = 460
  ClientWidth = 694
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
    Width = 694
    Height = 57
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 100
      Height = 13
      Caption = 'Notas SEM romaneio'
    end
    object lbSEM: TLabel
      Left = 143
      Top = 8
      Width = 37
      Height = 13
      Caption = 'lbSEM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbResp: TLabel
      Left = 458
      Top = 34
      Width = 3
      Height = 13
    end
    object Label2: TLabel
      Left = 368
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Procura por NF'
    end
    object iNumNF: TJvValidateEdit
      Left = 456
      Top = 10
      Width = 65
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
      OnKeyPress = iNumNFKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 694
    Height = 41
    Align = alTop
    Color = 14611434
    TabOrder = 1
    Visible = False
    object btEsq: TSpeedButton
      Left = 88
      Top = 8
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        F6000000424DF60000000000000076000000280000000C000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        0000FFFFFFFFFFFF0000FFFFFFFF8FFF0000FFFFFFF08FFF0000FFFFFF008FFF
        0000FFFFF0908FFF0000FFFF09908FFF0000FFF099908FFF0000FF0999908FFF
        0000FFF099908FFF0000FFFF09908FFF0000FFFFF0908FFF0000FFFFFF008FFF
        0000FFFFFFF0FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000}
      OnClick = btEsqClick
    end
    object btDir: TSpeedButton
      Left = 160
      Top = 8
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        F6000000424DF60000000000000076000000280000000C000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFF08FFFFFFF0000FFF008FFFFFF
        0000FFF0908FFFFF0000FFF09908FFFF0000FFF099908FFF0000FFF099990FFF
        0000FFF09990FFFF0000FFF0990FFFFF0000FFF090FFFFFF0000FFF00FFFFFFF
        0000FFF0FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000}
      OnClick = btDirClick
    end
    object lbPag: TLabel
      Left = 120
      Top = 12
      Width = 33
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'lbPag'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 56
      Top = 8
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        F6000000424DF60000000000000076000000280000000C000000100000000100
        04000000000080000000130B0000130B00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        0000FFFFFFFFFFFF0000FFFFFFFFFF8F0000FCCFFFFFFC8F0000FCCFFFFFCC8F
        0000FCCFFFF0CC8F0000FCCFFF0CCC8F0000FCCFF0CCCC8F0000FCCF0CCCCC8F
        0000FCCFF0CCCC8F0000FCCFFF0CCC8F0000FCCFFFF0CC8F0000FCCFFFFFCC8F
        0000FCCFFFFFFCFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 192
      Top = 8
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        F6000000424DF60000000000000076000000280000000C000000100000000100
        04000000000080000000130B0000130B00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFC8FFFFCCF0000FFFCC8FFFCCF
        0000FFFCC08FFCCF0000FFFCCC08FCCF0000FFFCCCC08CCF0000FFFCCCCC0CCF
        0000FFFCCCC0FCCF0000FFFCCC0FFCCF0000FFFCC0FFFCCF0000FFFCCFFFFCCF
        0000FFFCFFFFFCCF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000}
      OnClick = SpeedButton2Click
    end
    object vPag: TJvValidateEdit
      Left = 304
      Top = 8
      Width = 41
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
      OnKeyPress = vPagKeyPress
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 98
    Width = 694
    Height = 362
    Align = alClient
    Color = clWhite
    DataSource = DataSource1
    FixedColor = clMoneyGreen
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    AlternateRowColor = 16381416
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DTNOTA'
        Title.Caption = 'Data Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Local'
        Width = 159
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsSEM
    Left = 368
    Top = 184
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 160
    object ApagarNota1: TMenuItem
      Caption = 'Apagar Nota'
      OnClick = ApagarNota1Click
    end
    object DescartarNotas1: TMenuItem
      Caption = 'Descartar Notas'
      OnClick = DescartarNotas1Click
    end
  end
end
