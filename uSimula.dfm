object Simula: TSimula
  Left = 261
  Top = 156
  BorderIcons = [biSystemMenu]
  Caption = 'Simulador de C'#225'lculo de Frete'
  ClientHeight = 407
  ClientWidth = 584
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
    Left = 32
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Label2: TLabel
    Left = 296
    Top = 16
    Width = 26
    Height = 13
    Caption = 'Local'
  end
  object Label6: TLabel
    Left = 32
    Top = 144
    Width = 54
    Height = 13
    Caption = 'Frete Total '
  end
  object lbFreteTot: TLabel
    Left = 96
    Top = 144
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Frete: TLabel
    Left = 32
    Top = 176
    Width = 24
    Height = 13
    Caption = 'Frete'
  end
  object Bevel1: TBevel
    Left = 24
    Top = 160
    Width = 545
    Height = 2
  end
  object lbTipo: TLabel
    Left = 72
    Top = 176
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lbFrete: TLabel
    Left = 211
    Top = 176
    Width = 5
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 32
    Top = 200
    Width = 37
    Height = 13
    Caption = 'AdValor'
  end
  object Label8: TLabel
    Left = 32
    Top = 224
    Width = 39
    Height = 13
    Caption = 'Pedagio'
  end
  object Label9: TLabel
    Left = 32
    Top = 248
    Width = 18
    Height = 13
    Caption = 'Gris'
  end
  object lbAdv: TLabel
    Left = 213
    Top = 200
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object lbPed: TLabel
    Left = 213
    Top = 224
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object lbGris: TLabel
    Left = 213
    Top = 248
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Label5: TLabel
    Left = 32
    Top = 41
    Width = 33
    Height = 13
    Caption = 'Pontos'
  end
  object Label10: TLabel
    Left = 296
    Top = 43
    Width = 55
    Height = 13
    Caption = 'Total Notas'
  end
  object Label3: TLabel
    Left = 32
    Top = 65
    Width = 15
    Height = 13
    Caption = 'at'#233
  end
  object Label4: TLabel
    Left = 296
    Top = 68
    Width = 24
    Height = 13
    Caption = 'Peso'
  end
  object Shape1: TShape
    Left = 32
    Top = 272
    Width = 193
    Height = 25
    Shape = stRoundRect
  end
  object Label11: TLabel
    Left = 40
    Top = 279
    Width = 9
    Height = 13
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbSubA: TLabel
    Left = 213
    Top = 279
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Shape2: TShape
    Left = 304
    Top = 168
    Width = 193
    Height = 25
    Shape = stRoundRect
  end
  object Label13: TLabel
    Left = 312
    Top = 175
    Width = 9
    Height = 13
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbSubAA: TLabel
    Left = 485
    Top = 175
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label15: TLabel
    Left = 304
    Top = 200
    Width = 94
    Height = 13
    Caption = 'Grau de Dificuldade'
  end
  object lbGrauD: TLabel
    Left = 485
    Top = 200
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Label17: TLabel
    Left = 312
    Top = 376
    Width = 26
    Height = 13
    Caption = 'ICMS'
  end
  object lbICMS: TLabel
    Left = 485
    Top = 376
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Label19: TLabel
    Left = 304
    Top = 224
    Width = 68
    Height = 13
    Caption = 'Ponto a Ponto'
  end
  object lbPonto: TLabel
    Left = 485
    Top = 224
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Shape3: TShape
    Left = 304
    Top = 336
    Width = 193
    Height = 25
    Shape = stRoundRect
  end
  object Label21: TLabel
    Left = 312
    Top = 343
    Width = 9
    Height = 13
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbSubB: TLabel
    Left = 485
    Top = 343
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 304
    Top = 248
    Width = 81
    Height = 13
    Caption = 'Taxa de Emiss'#227'o'
  end
  object lbEmissao: TLabel
    Left = 485
    Top = 248
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Label14: TLabel
    Left = 305
    Top = 274
    Width = 52
    Height = 13
    Caption = 'Devolu'#231#227'o'
  end
  object lbDevol: TLabel
    Left = 486
    Top = 274
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Label18: TLabel
    Left = 306
    Top = 303
    Width = 50
    Height = 13
    Caption = 'Reentrega'
  end
  object lbReent: TLabel
    Left = 487
    Top = 303
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = '-'
  end
  object Label16: TLabel
    Left = 459
    Top = 64
    Width = 21
    Height = 13
    Caption = 'CEP'
  end
  object cbCli: TComboBox
    Left = 88
    Top = 13
    Width = 177
    Height = 21
    TabOrder = 0
    Text = '<Cliente>'
  end
  object cbLocal: TComboBox
    Left = 376
    Top = 13
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '<Local>'
    Items.Strings = (
      'SP'
      'Grande SP'
      'Interior'
      'Interior 2'
      'Outros Estados'
      'Outros Locais')
  end
  object nPontos: TJvValidateEdit
    Left = 88
    Top = 37
    Width = 97
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    TabOrder = 2
  end
  object totNotas: TJvValidateEdit
    Left = 376
    Top = 37
    Width = 121
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 3
  end
  object btEntregas: TBitBtn
    Left = 48
    Top = 104
    Width = 89
    Height = 25
    Caption = 'Entregas'
    TabOrder = 4
    OnClick = btEntregasClick
  end
  object btPeso: TBitBtn
    Left = 176
    Top = 104
    Width = 89
    Height = 25
    Caption = 'Peso'
    TabOrder = 5
    OnClick = btPesoClick
  end
  object btSaida: TBitBtn
    Left = 312
    Top = 104
    Width = 89
    Height = 25
    Caption = 'Sa'#237'da'
    TabOrder = 6
    OnClick = btSaidaClick
  end
  object cbFaixa: TComboBox
    Left = 88
    Top = 60
    Width = 145
    Height = 21
    TabOrder = 7
    Text = '<faixa>'
    Items.Strings = (
      'Normal'
      '1500'
      '1800'
      '3000'
      '5000'
      '12000'
      '24000')
  end
  object vlPeso: TJvValidateEdit
    Left = 376
    Top = 61
    Width = 65
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 8
  end
  object edCEP: TEdit
    Left = 491
    Top = 62
    Width = 72
    Height = 21
    TabOrder = 9
  end
end
