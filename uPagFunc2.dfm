object PagFunc2: TPagFunc2
  Left = 298
  Top = 209
  Caption = 'Pagamento de Motoristas - Personalizado [SA'#205'DA]'
  ClientHeight = 392
  ClientWidth = 551
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
    Width = 551
    Height = 49
    Align = alTop
    Color = 16776176
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object lbMot: TLabel
      Left = 80
      Top = 16
      Width = 32
      Height = 13
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbLocal: TComboBox
      Left = 336
      Top = 13
      Width = 161
      Height = 21
      TabOrder = 0
      Text = 'cbLocal'
      OnCloseUp = cbLocalCloseUp
      Items.Strings = (
        'SP - Capital'
        'GSP - Grande S'#227'o Paulo'
        'INT - Interior ')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 551
    Height = 96
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 8
      Width = 117
      Height = 13
      Caption = 'Dentro da Faixa de Peso'
    end
    object Label3: TLabel
      Left = 24
      Top = 40
      Width = 27
      Height = 13
      Caption = 'In'#237'cio'
    end
    object Label4: TLabel
      Left = 24
      Top = 64
      Width = 16
      Height = 13
      Caption = 'Fim'
    end
    object Label5: TLabel
      Left = 232
      Top = 40
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label6: TLabel
      Left = 232
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object vInicio: TJvValidateEdit
      Left = 71
      Top = 38
      Width = 73
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
    end
    object vFim: TJvValidateEdit
      Left = 71
      Top = 63
      Width = 73
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 1
    end
    object vPag: TJvValidateEdit
      Left = 312
      Top = 38
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
    end
    object vCob: TJvValidateEdit
      Left = 312
      Top = 63
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 3
    end
    object btSalvar1: TBitBtn
      Left = 448
      Top = 58
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      TabOrder = 4
      OnClick = btSalvar1Click
    end
    object btNovo: TBitBtn
      Left = 448
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Novo'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777770000000000770000000777770FFFFFFFF07700000007777
        70F000000F0770000000777770FFFFFFFF0770000000777770F000000F077000
        0000777770FFFFFFFF07700000007F778FF000000F077000000078778BFFFFFF
        FF0770000000777F8F8000F00007700000007888FB7FFFF0F077700000007FB8
        BFBFBFB0077770000000778B8B8B000077777000000078B78F78B77777777000
        00007B778B778F7777777000000077778F777777777770000000777777777777
        777770000000}
      TabOrder = 5
      OnClick = btNovoClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 145
    Width = 551
    Height = 48
    Align = alTop
    Color = clMedGray
    TabOrder = 2
    object Label7: TLabel
      Left = 24
      Top = 15
      Width = 48
      Height = 13
      Caption = 'A partir de'
    end
    object Label8: TLabel
      Left = 232
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Valor '
      Visible = False
    end
    object vMinimo: TJvValidateEdit
      Left = 81
      Top = 11
      Width = 64
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
    end
    object vACmot: TJvValidateEdit
      Left = 312
      Top = 11
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 1
    end
    object btSalvar2: TBitBtn
      Left = 448
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      TabOrder = 2
      OnClick = btSalvar2Click
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 193
    Width = 551
    Height = 199
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = clInactiveCaptionText
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'INICIO'
        Title.Caption = 'In'#237'cio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIM'
        Title.Caption = 'Fim'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPAG'
        Title.Caption = 'Valor Pago'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCOB'
        Title.Caption = 'Valor Cobrado'
        Width = 102
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPG3
    Left = 232
    Top = 272
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 272
    object Apagar1: TMenuItem
      Caption = 'Apagar'
      OnClick = Apagar1Click
    end
  end
end
