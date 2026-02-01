object FTCont: TFTCont
  Left = 349
  Top = 130
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o de Frete - Contrato'
  ClientHeight = 192
  ClientWidth = 404
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
  object Label2: TLabel
    Left = 32
    Top = 72
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label3: TLabel
    Left = 232
    Top = 104
    Width = 73
    Height = 13
    Caption = 'Km Avulso (R$)'
  end
  object Label4: TLabel
    Left = 232
    Top = 136
    Width = 81
    Height = 13
    Caption = 'Hora Avulsa (R$)'
  end
  object Label5: TLabel
    Left = 32
    Top = 104
    Width = 57
    Height = 13
    Caption = 'Km - padr'#227'o'
  end
  object Label6: TLabel
    Left = 32
    Top = 136
    Width = 47
    Height = 13
    Caption = 'Horas/dia'
  end
  object Label7: TLabel
    Left = 32
    Top = 176
    Width = 93
    Height = 13
    Caption = 'Informa'#231#245'es Salvas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 49
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 6
    ExplicitWidth = 412
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 64
      Top = 16
      Width = 385
      Height = 13
      AutoSize = False
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object vMensal: TJvValidateEdit
    Left = 112
    Top = 72
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 0
  end
  object vKM: TJvValidateEdit
    Left = 312
    Top = 104
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 2
  end
  object vHora: TJvValidateEdit
    Left = 312
    Top = 136
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 4
  end
  object btSalvar: TBitBtn
    Left = 273
    Top = 164
    Width = 97
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
    TabOrder = 5
    OnClick = btSalvarClick
  end
  object nKM: TJvValidateEdit
    Left = 112
    Top = 104
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    TabOrder = 1
  end
  object nHora: TJvValidateEdit
    Left = 112
    Top = 136
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    TabOrder = 3
  end
  object rbMens: TRadioButton
    Left = 200
    Top = 72
    Width = 73
    Height = 17
    Caption = 'Mensal'
    Checked = True
    TabOrder = 7
    TabStop = True
  end
  object rbDia: TRadioButton
    Left = 288
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Di'#225'rio'
    TabOrder = 8
  end
end
