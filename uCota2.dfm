object Cota2: TCota2
  Left = 129
  Top = 155
  BorderIcons = [biSystemMenu]
  Caption = 'Cota'#231#245'es - Editar Cota'#231#227'o'
  ClientHeight = 514
  ClientWidth = 521
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
    Width = 521
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 529
    object lbDT: TLabel
      Left = 133
      Top = 24
      Width = 28
      Height = 13
      Caption = 'lbDT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 81
      Height = 13
      Caption = 'Data da Cota'#231#227'o'
    end
    object Label2: TLabel
      Left = 296
      Top = 24
      Width = 95
      Height = 13
      Caption = 'N'#250'mero da Cota'#231#227'o'
    end
    object lbNUM: TLabel
      Left = 408
      Top = 24
      Width = 39
      Height = 13
      Caption = 'lbNUM'
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
    Top = 57
    Width = 521
    Height = 192
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 529
    object Label3: TLabel
      Left = 32
      Top = 16
      Width = 69
      Height = 13
      Caption = 'N'#250'mero da NF'
    end
    object Label4: TLabel
      Left = 32
      Top = 42
      Width = 56
      Height = 13
      Caption = 'Valor da NF'
    end
    object Label5: TLabel
      Left = 32
      Top = 71
      Width = 24
      Height = 13
      Caption = 'Peso'
    end
    object Label6: TLabel
      Left = 32
      Top = 97
      Width = 35
      Height = 13
      Caption = 'Volume'
    end
    object Label7: TLabel
      Left = 32
      Top = 125
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label8: TLabel
      Left = 296
      Top = 15
      Width = 52
      Height = 13
      Caption = 'Dimens'#245'es'
    end
    object Bevel1: TBevel
      Left = 296
      Top = 31
      Width = 185
      Height = 2
    end
    object Label9: TLabel
      Left = 296
      Top = 47
      Width = 44
      Height = 13
      Caption = 'Medida 1'
    end
    object Label10: TLabel
      Left = 296
      Top = 71
      Width = 44
      Height = 13
      Caption = 'Medida 2'
    end
    object Label11: TLabel
      Left = 296
      Top = 95
      Width = 44
      Height = 13
      Caption = 'Medida 3'
    end
    object lbVol: TLabel
      Left = 441
      Top = 128
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbVol'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 32
      Top = 152
      Width = 52
      Height = 13
      Caption = 'Localidade'
    end
    object Label21: TLabel
      Left = 296
      Top = 152
      Width = 48
      Height = 13
      Caption = 'Data Serv'
    end
    object vlNF: TJvValidateEdit
      Left = 132
      Top = 12
      Width = 121
      Height = 21
      Color = clSkyBlue
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
    end
    object vlValorNF: TJvValidateEdit
      Left = 132
      Top = 38
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 1
    end
    object vlPeso: TJvValidateEdit
      Left = 132
      Top = 65
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
    end
    object vlVol: TJvValidateEdit
      Left = 132
      Top = 92
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DecimalPlaces = 2
      TabOrder = 3
    end
    object edCEP: TEdit
      Left = 132
      Top = 120
      Width = 121
      Height = 21
      MaxLength = 9
      TabOrder = 4
      Text = 'edCEP'
    end
    object vlMed1: TJvValidateEdit
      Left = 352
      Top = 45
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 5
    end
    object vlMed2: TJvValidateEdit
      Left = 352
      Top = 69
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 6
    end
    object vlMed3: TJvValidateEdit
      Left = 352
      Top = 93
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 7
    end
    object edLocal: TEdit
      Left = 132
      Top = 148
      Width = 121
      Height = 21
      MaxLength = 25
      TabOrder = 8
      Text = 'edLocal'
    end
    object dtS: TDateTimePicker
      Left = 354
      Top = 149
      Width = 118
      Height = 21
      Date = 41948.779682071760000000
      Format = 'dd/MM/yyyy ddd'
      Time = 41948.779682071760000000
      TabOrder = 9
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 249
    Width = 521
    Height = 40
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 529
    object Label12: TLabel
      Left = 32
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Valor da Cota'#231#227'o'
    end
    object Label13: TLabel
      Left = 296
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object vlValorC: TJvValidateEdit
      Left = 132
      Top = 6
      Width = 121
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 0
    end
    object cbStatus: TComboBox
      Left = 352
      Top = 5
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'cbStatus'
      Items.Strings = (
        'Negociando'
        'Aprovado'
        'Reprovado'
        'Cobrado')
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 289
    Width = 521
    Height = 176
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 529
    object Label14: TLabel
      Left = 32
      Top = 35
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label15: TLabel
      Left = 32
      Top = 59
      Width = 27
      Height = 13
      Caption = 'e-mail'
    end
    object Label16: TLabel
      Left = 32
      Top = 88
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
    end
    object Label17: TLabel
      Left = 32
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label18: TLabel
      Left = 32
      Top = 115
      Width = 56
      Height = 13
      Caption = 'Destinat'#225'rio'
    end
    object Label19: TLabel
      Left = 33
      Top = 142
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object edNome: TEdit
      Left = 132
      Top = 30
      Width = 197
      Height = 21
      MaxLength = 20
      TabOrder = 1
      Text = 'edNome'
    end
    object edMail: TEdit
      Left = 132
      Top = 55
      Width = 309
      Height = 21
      MaxLength = 60
      TabOrder = 2
      Text = 'edMail'
    end
    object edObs: TEdit
      Left = 132
      Top = 82
      Width = 357
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      TabOrder = 3
      Text = 'edObs'
    end
    object cbCli: TComboBox
      Left = 133
      Top = 4
      Width = 340
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'cbCli'
    end
    object edDest: TEdit
      Left = 132
      Top = 110
      Width = 205
      Height = 21
      MaxLength = 20
      TabOrder = 4
      Text = 'edDest'
    end
    object edCNPJ: TEdit
      Left = 132
      Top = 136
      Width = 205
      Height = 21
      MaxLength = 20
      TabOrder = 5
      Text = 'edCNPJ'
    end
  end
  object btSalvar: TBitBtn
    Left = 400
    Top = 477
    Width = 105
    Height = 25
    Caption = 'Salvar'
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888888000088877777777777777778000088000000000000000778000080BF
      B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
      000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
      FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
      BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
      000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
      F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
      88888888888888880000}
    TabOrder = 4
    OnClick = btSalvarClick
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 408
  end
end
