object FTEnt: TFTEnt
  Left = 245
  Top = 110
  Caption = 'Configura'#231#227'o de Frete - por Entrega'
  ClientHeight = 315
  ClientWidth = 340
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
    Left = 24
    Top = 80
    Width = 59
    Height = 13
    Caption = 'Valor Capital'
  end
  object Label3: TLabel
    Left = 24
    Top = 112
    Width = 49
    Height = 13
    Caption = 'Valor GSP'
  end
  object Label4: TLabel
    Left = 24
    Top = 144
    Width = 59
    Height = 13
    Caption = 'Valor Interior'
  end
  object Label5: TLabel
    Left = 24
    Top = 176
    Width = 65
    Height = 13
    Caption = 'Valor Interior2'
  end
  object Label6: TLabel
    Left = 24
    Top = 208
    Width = 76
    Height = 13
    Caption = 'Valor O Estados'
  end
  object Label7: TLabel
    Left = 24
    Top = 240
    Width = 58
    Height = 13
    Caption = 'Valor Outros'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 348
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 72
      Top = 24
      Width = 257
      Height = 13
      AutoSize = False
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object vCap: TJvValidateEdit
    Left = 96
    Top = 76
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 1
  end
  object vGSP: TJvValidateEdit
    Left = 96
    Top = 108
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 2
  end
  object vINT: TJvValidateEdit
    Left = 96
    Top = 140
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 3
  end
  object btSalvar: TBitBtn
    Left = 224
    Top = 144
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
    OnClick = btSalvarClick
  end
  object vINT2: TJvValidateEdit
    Left = 96
    Top = 172
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 5
  end
  object vOEST: TJvValidateEdit
    Left = 96
    Top = 204
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 6
  end
  object vOUT: TJvValidateEdit
    Left = 96
    Top = 236
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 7
  end
end
