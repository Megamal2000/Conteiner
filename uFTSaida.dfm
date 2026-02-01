object FTSaida: TFTSaida
  Left = 74
  Top = 151
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o de Frete - Sa'#237'da'
  ClientHeight = 283
  ClientWidth = 870
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
  object Label25: TLabel
    Left = 24
    Top = 95
    Width = 29
    Height = 13
    Caption = '1500'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 119
    Width = 29
    Height = 13
    Caption = '1800'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 143
    Width = 29
    Height = 13
    Caption = '3000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 24
    Top = 167
    Width = 29
    Height = 13
    Caption = '5000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 24
    Top = 191
    Width = 36
    Height = 13
    Caption = '12000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 24
    Top = 215
    Width = 36
    Height = 13
    Caption = '24000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 523
    Top = 8
    Width = 23
    Height = 13
    Caption = 'OUT'
  end
  object Bevel2: TBevel
    Left = 472
    Top = 24
    Width = 113
    Height = 2
  end
  object Label15: TLabel
    Left = 528
    Top = 26
    Width = 54
    Height = 13
    Caption = 'Pagamento'
  end
  object Label16: TLabel
    Left = 476
    Top = 26
    Width = 46
    Height = 13
    Caption = 'Cobran'#231'a'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 41
    Align = alTop
    TabOrder = 49
    ExplicitWidth = 878
    object Label1: TLabel
      Left = 24
      Top = 13
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 64
      Top = 13
      Width = 25
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 870
    Height = 48
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 50
    ExplicitWidth = 878
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 18
      Height = 13
      Caption = 'at'#233' '
    end
    object Label3: TLabel
      Left = 131
      Top = 8
      Width = 14
      Height = 13
      Caption = 'SP'
    end
    object Bevel1: TBevel
      Left = 80
      Top = 24
      Width = 113
      Height = 2
    end
    object Label5: TLabel
      Left = 84
      Top = 26
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object Label6: TLabel
      Left = 136
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label10: TLabel
      Left = 267
      Top = 8
      Width = 22
      Height = 13
      Caption = 'GSP'
    end
    object Bevel3: TBevel
      Left = 216
      Top = 24
      Width = 113
      Height = 2
    end
    object Label11: TLabel
      Left = 220
      Top = 26
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object Label12: TLabel
      Left = 272
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label19: TLabel
      Left = 395
      Top = 8
      Width = 18
      Height = 13
      Caption = 'INT'
    end
    object Bevel6: TBevel
      Left = 344
      Top = 24
      Width = 113
      Height = 2
    end
    object Label20: TLabel
      Left = 348
      Top = 26
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object Label21: TLabel
      Left = 400
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label22: TLabel
      Left = 523
      Top = 8
      Width = 24
      Height = 13
      Caption = 'INT2'
    end
    object Bevel7: TBevel
      Left = 472
      Top = 24
      Width = 113
      Height = 2
    end
    object Label23: TLabel
      Left = 476
      Top = 26
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object Label24: TLabel
      Left = 528
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label17: TLabel
      Left = 636
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Out ESTADOS'
    end
    object Label18: TLabel
      Left = 780
      Top = 8
      Width = 46
      Height = 13
      Caption = 'OUTROS'
    end
    object Bevel4: TBevel
      Left = 608
      Top = 24
      Width = 113
      Height = 2
    end
    object Bevel5: TBevel
      Left = 744
      Top = 24
      Width = 113
      Height = 2
    end
    object Label26: TLabel
      Left = 612
      Top = 26
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object Label27: TLabel
      Left = 748
      Top = 26
      Width = 46
      Height = 13
      Caption = 'Cobran'#231'a'
    end
    object Label28: TLabel
      Left = 664
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
    object Label29: TLabel
      Left = 800
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Pagamento'
    end
  end
  object vCobINT1: TJvValidateEdit
    Left = 345
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 25
  end
  object vPagINT1: TJvValidateEdit
    Left = 401
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 31
  end
  object vCobOUT1: TJvValidateEdit
    Left = 747
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 37
  end
  object vPagOUT1: TJvValidateEdit
    Left = 803
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 43
  end
  object vCobSp1: TJvValidateEdit
    Left = 80
    Top = 92
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 1
  end
  object vPagSp1: TJvValidateEdit
    Left = 136
    Top = 92
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 7
  end
  object vCobG1: TJvValidateEdit
    Left = 213
    Top = 92
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 13
  end
  object vPagG1: TJvValidateEdit
    Left = 269
    Top = 92
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 19
  end
  object vCobINT2: TJvValidateEdit
    Left = 345
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 26
  end
  object vPagINT2: TJvValidateEdit
    Left = 401
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 32
  end
  object vCobOUT2: TJvValidateEdit
    Left = 747
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 38
  end
  object vPagOUT2: TJvValidateEdit
    Left = 803
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 44
  end
  object vCobSp2: TJvValidateEdit
    Left = 80
    Top = 116
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 2
  end
  object vPagSp2: TJvValidateEdit
    Left = 136
    Top = 116
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 8
  end
  object vCobG2: TJvValidateEdit
    Left = 213
    Top = 116
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 14
  end
  object vPagG2: TJvValidateEdit
    Left = 269
    Top = 116
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 20
  end
  object vCobINT3: TJvValidateEdit
    Left = 345
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 27
  end
  object vPagINT3: TJvValidateEdit
    Left = 401
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 33
  end
  object vCobOUT3: TJvValidateEdit
    Left = 747
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 39
  end
  object vPagOUT3: TJvValidateEdit
    Left = 803
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 45
  end
  object vCobSp3: TJvValidateEdit
    Left = 80
    Top = 140
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 3
  end
  object vPagSp3: TJvValidateEdit
    Left = 136
    Top = 140
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 9
  end
  object vCobG3: TJvValidateEdit
    Left = 213
    Top = 140
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 15
  end
  object vPagG3: TJvValidateEdit
    Left = 269
    Top = 140
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 21
  end
  object vCobINT4: TJvValidateEdit
    Left = 345
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 28
  end
  object vPagINT4: TJvValidateEdit
    Left = 401
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 34
  end
  object vCobOUT4: TJvValidateEdit
    Left = 747
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 40
  end
  object vPagOUT4: TJvValidateEdit
    Left = 803
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 46
  end
  object vCobSp4: TJvValidateEdit
    Left = 80
    Top = 164
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 4
  end
  object vPagSp4: TJvValidateEdit
    Left = 136
    Top = 164
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 10
  end
  object vCobG4: TJvValidateEdit
    Left = 213
    Top = 164
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 16
  end
  object vPagG4: TJvValidateEdit
    Left = 269
    Top = 164
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 22
  end
  object vCobINT5: TJvValidateEdit
    Left = 345
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 29
  end
  object vPagINT5: TJvValidateEdit
    Left = 401
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 35
  end
  object vCobOUT5: TJvValidateEdit
    Left = 747
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 41
  end
  object vPagOUT5: TJvValidateEdit
    Left = 803
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 47
  end
  object vCobSp5: TJvValidateEdit
    Left = 80
    Top = 188
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 5
  end
  object vPagSp5: TJvValidateEdit
    Left = 136
    Top = 188
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 11
  end
  object vCobG5: TJvValidateEdit
    Left = 213
    Top = 188
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 17
  end
  object vPagG5: TJvValidateEdit
    Left = 269
    Top = 188
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 23
  end
  object vCobINT6: TJvValidateEdit
    Left = 345
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 30
  end
  object vPagINT6: TJvValidateEdit
    Left = 401
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 36
  end
  object vCobOUT6: TJvValidateEdit
    Left = 747
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 42
  end
  object vPagOUT6: TJvValidateEdit
    Left = 803
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 48
  end
  object vCobSp6: TJvValidateEdit
    Left = 80
    Top = 212
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 6
  end
  object vPagSp6: TJvValidateEdit
    Left = 136
    Top = 212
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 12
  end
  object vCobG6: TJvValidateEdit
    Left = 213
    Top = 212
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 18
  end
  object vPagG6: TJvValidateEdit
    Left = 269
    Top = 212
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 24
  end
  object btSalvar: TBitBtn
    Left = 728
    Top = 248
    Width = 131
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
    TabOrder = 0
    OnClick = btSalvarClick
  end
  object vCobOEST1: TJvValidateEdit
    Left = 611
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 51
  end
  object vPagOEST1: TJvValidateEdit
    Left = 667
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 52
  end
  object vCobOEST2: TJvValidateEdit
    Left = 611
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 53
  end
  object vPagOEST2: TJvValidateEdit
    Left = 667
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 54
  end
  object vCobOEST3: TJvValidateEdit
    Left = 611
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 55
  end
  object vPagOEST3: TJvValidateEdit
    Left = 667
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 56
  end
  object vCobOEST4: TJvValidateEdit
    Left = 611
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 57
  end
  object vPagOEST4: TJvValidateEdit
    Left = 667
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 58
  end
  object vCobOEST5: TJvValidateEdit
    Left = 611
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 59
  end
  object vPagOEST5: TJvValidateEdit
    Left = 667
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 60
  end
  object vCobOEST6: TJvValidateEdit
    Left = 611
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 61
  end
  object vPagOEST6: TJvValidateEdit
    Left = 667
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 62
  end
  object vCobINT21: TJvValidateEdit
    Left = 475
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 63
  end
  object vPagINT21: TJvValidateEdit
    Left = 531
    Top = 93
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 64
  end
  object vCobINT22: TJvValidateEdit
    Left = 475
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 65
  end
  object vPagINT22: TJvValidateEdit
    Left = 531
    Top = 117
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 66
  end
  object vCobINT23: TJvValidateEdit
    Left = 475
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 67
  end
  object vPagINT23: TJvValidateEdit
    Left = 531
    Top = 141
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 68
  end
  object vCobINT24: TJvValidateEdit
    Left = 475
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 69
  end
  object vPagINT24: TJvValidateEdit
    Left = 531
    Top = 165
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 70
  end
  object vCobINT25: TJvValidateEdit
    Left = 475
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 71
  end
  object vPagINT25: TJvValidateEdit
    Left = 531
    Top = 189
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 72
  end
  object vCobINT26: TJvValidateEdit
    Left = 475
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 73
  end
  object vPagINT26: TJvValidateEdit
    Left = 531
    Top = 213
    Width = 55
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 74
  end
end
