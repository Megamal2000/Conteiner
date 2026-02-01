object smpPreco: TsmpPreco
  Left = 199
  Top = 114
  BorderIcons = [biSystemMenu]
  Caption = 'Valores dos Servi'#231'os'
  ClientHeight = 363
  ClientWidth = 635
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
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 102
    Height = 13
    Caption = 'Descri'#231#227'o do Servi'#231'o'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 70
    Height = 13
    Caption = 'Valor Pequeno'
  end
  object Label4: TLabel
    Left = 24
    Top = 128
    Width = 56
    Height = 13
    Caption = 'Valor M'#233'dio'
  end
  object Label5: TLabel
    Left = 24
    Top = 152
    Width = 62
    Height = 13
    Caption = 'Valor Grande'
  end
  object Label6: TLabel
    Left = 24
    Top = 176
    Width = 67
    Height = 13
    Caption = 'Valor Especial'
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 635
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
    TabOrder = 5
    ExplicitWidth = 643
    InternalVer = 1
    object JvSpeedBarSection1: TJvSpeedBarSection
      Caption = 'Normais'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 212
    Width = 635
    Height = 151
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'N'#250'mero'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Descri'#231#227'o do Servi'#231'o'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORP'
        Title.Caption = 'Veic Pequeno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORM'
        Title.Caption = 'Veic M'#233'dio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORG'
        Title.Caption = 'Veic Grande'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORE'
        Title.Caption = 'Veic Esp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTALTERADO'
        Title.Caption = #218'ltima Altera'#231#227'o'
        Width = 92
        Visible = True
      end>
  end
  object vNum: TJvValidateEdit
    Left = 152
    Top = 54
    Width = 49
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyDown = vNumKeyDown
  end
  object vPeq: TJvValidateEdit
    Left = 152
    Top = 101
    Width = 73
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 2
    OnKeyDown = vPeqKeyDown
  end
  object vMedio: TJvValidateEdit
    Left = 152
    Top = 125
    Width = 73
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 3
    OnKeyDown = vMedioKeyDown
  end
  object edServico: TEdit
    Left = 152
    Top = 77
    Width = 297
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 40
    ParentFont = False
    TabOrder = 1
    OnKeyDown = edServicoKeyDown
  end
  object vGrande: TJvValidateEdit
    Left = 152
    Top = 149
    Width = 73
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 6
    OnKeyDown = vGrandeKeyDown
  end
  object vEspecial: TJvValidateEdit
    Left = 152
    Top = 173
    Width = 73
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 7
    OnKeyDown = vEspecialKeyDown
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsValores
    Left = 368
    Top = 136
  end
end
