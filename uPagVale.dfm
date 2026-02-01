object PagVale: TPagVale
  Left = 222
  Top = 144
  Width = 528
  Height = 456
  BorderIcons = [biSystemMenu]
  Caption = 'Vales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 217
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 200
      Height = 13
      Caption = 'De                                                        at'#233' '
    end
    object lbMot: TLabel
      Left = 115
      Top = 13
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 66
      Width = 481
      Height = 2
    end
    object Label1: TLabel
      Left = 24
      Top = 76
      Width = 62
      Height = 13
      Caption = 'Data do Vale'
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 224
      Top = 72
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object btSubNovo: TSpeedButton
      Left = 24
      Top = 125
      Width = 23
      Height = 22
      Hint = 'Inserir um novo telefone'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = btSubNovoClick
    end
    object btSubSalvar: TSpeedButton
      Left = 56
      Top = 125
      Width = 23
      Height = 22
      Hint = 'Salvar o telefone'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = btSubSalvarClick
    end
    object btSubApagar: TSpeedButton
      Left = 88
      Top = 125
      Width = 23
      Height = 22
      Hint = 'Apagar um telefone'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777777700000000007777770FFFFFFFF07777770FFFFFFF
        F077771F0F888888F077711F0F85BFB8F0777711F11BFBF8F077777151788888
        F077777511FFFFFFF07775111F1FFF00007771570FF1FF0F077777770FFFFF00
        7777777700000007777777777777777777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = btSubApagarClick
    end
    object dat1: TDateTimePicker
      Left = 64
      Top = 40
      Width = 112
      Height = 21
      Date = 40837.654298495370000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40837.654298495370000000
      TabOrder = 0
    end
    object dat2: TDateTimePicker
      Left = 256
      Top = 40
      Width = 112
      Height = 21
      Date = 40837.654730173610000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40837.654730173610000000
      TabOrder = 1
    end
    object btMot: TBitBtn
      Left = 29
      Top = 10
      Width = 75
      Height = 20
      Caption = 'Motorista'
      TabOrder = 2
      OnClick = btMotClick
    end
    object btAtualiza: TBitBtn
      Left = 384
      Top = 37
      Width = 105
      Height = 25
      Caption = 'Atualiza'
      TabOrder = 3
      OnClick = btAtualizaClick
    end
    object dtVale: TDateTimePicker
      Left = 96
      Top = 72
      Width = 113
      Height = 21
      Date = 40847.871406967590000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40847.871406967590000000
      TabOrder = 4
    end
    object vValor: TJvValidateEdit
      Left = 96
      Top = 96
      Width = 73
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 5
    end
    object rd1: TRadioButton
      Left = 264
      Top = 72
      Width = 113
      Height = 17
      Caption = 'Vale Sal'#225'rio'
      TabOrder = 6
    end
    object rd2: TRadioButton
      Left = 264
      Top = 93
      Width = 113
      Height = 17
      Caption = 'Vale Combust'#237'vel'
      TabOrder = 7
    end
    object rd3: TRadioButton
      Left = 264
      Top = 115
      Width = 57
      Height = 17
      Caption = 'Outros'
      TabOrder = 8
    end
    object edOut: TEdit
      Left = 323
      Top = 114
      Width = 158
      Height = 21
      MaxLength = 20
      TabOrder = 9
      Text = 'edOut'
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 160
      Width = 457
      Height = 49
      Caption = 'Repetir'
      TabOrder = 10
      object Label5: TLabel
        Left = 232
        Top = 19
        Width = 97
        Height = 13
        Caption = 'Mais Quantas Vezes'
      end
      object cbVezes: TComboBox
        Left = 16
        Top = 16
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'N'#227'o Repetir'
        Items.Strings = (
          'N'#227'o Repetir'
          'Quinzenal'
          'Mensal'
          'Semestral'
          'Anual')
      end
      object spVezes: TJvSpinEdit
        Left = 345
        Top = 17
        Width = 49
        Height = 21
        Decimal = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object rd4: TRadioButton
      Left = 264
      Top = 136
      Width = 113
      Height = 17
      Caption = 'NEXTEL'
      TabOrder = 11
    end
  end
  object Rodape: TStatusBar
    Left = 0
    Top = 403
    Width = 520
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 217
    Width = 520
    Height = 186
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 10930928
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Tipo de Vale'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 96
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsVale
    Left = 408
    Top = 144
  end
end
