object Carro: TCarro
  Left = 228
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Carros da Flaydel'
  ClientHeight = 488
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 64
    Width = 27
    Height = 13
    Caption = 'Placa'
  end
  object Label2: TLabel
    Left = 24
    Top = 96
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object Label3: TLabel
    Left = 24
    Top = 136
    Width = 31
    Height = 13
    Caption = 'Chassi'
  end
  object Label4: TLabel
    Left = 24
    Top = 176
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object cbTipo: TComboBox
    Left = 72
    Top = 100
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'cbTipo'
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 467
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [sbAllowDrag, sbFlatBtns, sbGrayedBtns]
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 34
    BtnHeight = 33
    Color = 14480884
    TabOrder = 1
    InternalVer = 1
    object JvSpeedBarSection1: TJvSpeedBarSection
      Caption = 'Normais'
    end
    object JvSpeedBarSection2: TJvSpeedBarSection
      Caption = 'Outros'
    end
    object btNovo: TJvSpeedItem
      Caption = 'btNovo'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Hint = 'Inserir um novo Usu'#225'rio'
      Spacing = 1
      Left = 20
      Top = 3
      Visible = True
      OnClick = btNovoClick
      SectionName = 'Normais'
    end
    object btSalvar: TJvSpeedItem
      Caption = 'btSalvar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      Hint = 'Salvar / Gravar as modifica'#231#245'es'
      Spacing = 1
      Left = 54
      Top = 3
      Visible = True
      OnClick = btSalvarClick
      SectionName = 'Normais'
    end
    object btApagar: TJvSpeedItem
      Caption = 'btApagar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000071F77777777777777000000011F771577777777770000000711F
        11F7777777777000000077151777777777777000000077511F77000000007000
        0000511771F70FBFBFB070000000157770000BFBFBF070000000777770FF0000
        000070000000777770FFFFF0777770000000777770F888F07777700000007777
        70FFFFF0777770000000777770F888F0777770000000777770FFFFF077777000
        0000777770000000777770000000777777777777777770000000777777777777
        777770000000}
      Hint = 'Apagar um registro'
      Spacing = 1
      Left = 88
      Top = 3
      Visible = True
      OnClick = btApagarClick
      SectionName = 'Normais'
    end
  end
  object edPlaca: TMaskEdit
    Left = 72
    Top = 64
    Width = 120
    Height = 28
    EditMask = 'LLL-0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    TabOrder = 2
    Text = '   -    '
  end
  object edChassi: TMaskEdit
    Left = 72
    Top = 128
    Width = 193
    Height = 28
    EditMask = '000\-00000\-00000000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 18
    ParentFont = False
    TabOrder = 3
    Text = '   -     -        '
  end
  object JvDBGrid1: TJvDBGrid
    Left = 16
    Top = 233
    Width = 433
    Height = 201
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = clMoneyGreen
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Title.Caption = 'Placa'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHASSI'
        Title.Caption = 'Chassi'
        Width = 197
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 469
    Width = 467
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 395
  end
  object edLibera: TEdit
    Left = 72
    Top = 173
    Width = 193
    Height = 21
    TabOrder = 6
    TextHint = 'Libera'#231#227'o da Seguradora'
  end
  object DataSource1: TDataSource
    DataSet = DM4.cdsCar
    Left = 344
    Top = 128
  end
end
