object avisoCfg: TavisoCfg
  Left = 221
  Top = 143
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#245'es dos Avisos'
  ClientHeight = 250
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 231
    Width = 496
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 496
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
    object lbResp: TLabel
      Left = 320
      Top = 19
      Width = 161
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbResp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
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
      SectionName = 'Normais'
    end
    object btPesq: TJvSpeedItem
      Caption = 'btPesq'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      Hint = 'btPesq|'
      Spacing = 1
      Left = 190
      Top = 3
      Visible = True
      OnClick = btPesqClick
      SectionName = 'Outros'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 496
    Height = 184
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Data do evento'
    end
    object Label2: TLabel
      Left = 25
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel
      Left = 25
      Top = 57
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label5: TLabel
      Left = 24
      Top = 88
      Width = 208
      Height = 13
      Caption = 'Avisar com                  dias de anteced'#234'ncia'
    end
    object dtEv: TDateTimePicker
      Left = 128
      Top = 5
      Width = 129
      Height = 21
      Date = 41337.683924328700000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41337.683924328700000000
      TabOrder = 0
    end
    object edDesc: TEdit
      Left = 128
      Top = 27
      Width = 337
      Height = 21
      TabOrder = 1
      Text = 'edDesc'
      OnKeyPress = edDescKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 277
      Top = 67
      Width = 187
      Height = 105
      Caption = 'Repeti'#231#227'o'
      TabOrder = 2
      object Spin: TJvSpinButton
        Left = 48
        Top = 78
        Width = 19
        OnBottomClick = SpinBottomClick
        OnTopClick = SpinTopClick
      end
      object Label3: TLabel
        Left = 80
        Top = 80
        Width = 28
        Height = 13
        Caption = 'vezes'
      end
      object ckRep: TCheckBox
        Left = 16
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Repetir'
        TabOrder = 0
        OnClick = ckRepClick
      end
      object cbRepete: TComboBox
        Left = 16
        Top = 48
        Width = 153
        Height = 21
        TabOrder = 1
        Text = 'cbRepete'
        Items.Strings = (
          'semanal'
          'quinzenal'
          'mensal'
          'anualmente')
      end
      object vez: TJvValidateEdit
        Left = 19
        Top = 77
        Width = 25
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 2
      end
    end
    object vlrEv: TJvValidateEdit
      Left = 128
      Top = 50
      Width = 81
      Height = 24
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = vlrEvKeyPress
    end
    object Avisar: TJvValidateEdit
      Left = 86
      Top = 86
      Width = 36
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 4
      OnKeyPress = AvisarKeyPress
    end
  end
end
