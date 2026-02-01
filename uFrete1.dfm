object Frete1: TFrete1
  Left = 250
  Top = 117
  Caption = 'Frete - Valores para c'#225'lculo do frete'
  ClientHeight = 458
  ClientWidth = 569
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
    Width = 569
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label22: TLabel
      Left = 36
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 80
      Top = 19
      Width = 25
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 569
    Height = 40
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    object lbTipo: TLabel
      Left = 40
      Top = 8
      Width = 321
      Height = 19
      AutoSize = False
      Caption = 'lbTipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object btConfigurar: TBitBtn
      Left = 416
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Configurar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007444444444444777700000007488
        8888888847777000000074777777770747777000000074700700700047777000
        000074777777770007777000000074700700700B80777000000074777777770B
        707770000000744444444440B8077000000074F44F44F440B707700000007444
        444444440B80700000007777777777770B807000000077777777777770050000
        0000777777777777705500000000777777777777770070000000777777777777
        777770000000}
      TabOrder = 0
      OnClick = btConfigurarClick
    end
  end
  object btSalvar: TBitBtn
    Left = 443
    Top = 425
    Width = 105
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
    OnClick = btSalvarClick
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 96
    Width = 545
    Height = 323
    ActivePage = tsSP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 3
    object tsSP: TTabSheet
      Caption = 'SP'
      object Label40: TLabel
        Left = 16
        Top = 8
        Width = 105
        Height = 23
        AutoSize = False
        Caption = 'Capital'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label110: TLabel
        Left = 389
        Top = 271
        Width = 35
        Height = 13
        Caption = 'M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label112: TLabel
        Left = 236
        Top = 271
        Width = 43
        Height = 13
        Caption = 'Adicional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label113: TLabel
        Left = 40
        Top = 271
        Width = 67
        Height = 13
        Caption = #193'rea de Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox7: TGroupBox
        Left = 7
        Top = 36
        Width = 170
        Height = 104
        Caption = 'Ad Valor'
        TabOrder = 0
        object Label18: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tSPadValor: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vSPadValor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 188
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Gris'
        TabOrder = 1
        object Label20: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'GRIS %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label23: TLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tSPGris: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vSPgrisMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vSPgrisSup: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox11: TGroupBox
        Left = 367
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Grau de dificuldade'
        TabOrder = 2
        object Label24: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label32: TLabel
          Left = 8
          Top = 72
          Width = 53
          Height = 13
          Caption = 'M'#225'ximo R$'
        end
        object tSPDific: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vSPDificMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vSPDificMax: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox12: TGroupBox
        Left = 7
        Top = 148
        Width = 170
        Height = 105
        Caption = 'ICMS'
        TabOrder = 3
        object Label33: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Maior %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Menor %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 8
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Limite R$'
        end
        object tSPicmsMaior: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object tSPicmsMenor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object vSPicmsLimite: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox17: TGroupBox
        Left = 188
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Entregas'
        TabOrder = 4
        object Label36: TLabel
          Left = 8
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Ponto a Ponto R$'
        end
        object Label51: TLabel
          Left = 8
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Ped'#225'gio R$'
        end
        object Label52: TLabel
          Left = 8
          Top = 72
          Width = 79
          Height = 13
          Caption = 'Frete M'#237'nimo R$'
        end
        object vSPponto: TJvValidateEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object vSPpedagio: TJvValidateEdit
          Left = 96
          Top = 48
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vSPFTminimo: TJvValidateEdit
          Left = 96
          Top = 72
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox18: TGroupBox
        Left = 367
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Outras Taxas'
        TabOrder = 5
        object Label53: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Emiss'#227'o R$'
        end
        object Label54: TLabel
          Left = 8
          Top = 48
          Width = 63
          Height = 13
          Caption = 'Devolu'#231#227'o %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 8
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Reentrega %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object vSPemissao: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object tSPdevolve: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object tSPreent: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object vSPrisco: TJvValidateEdit
        Left = 436
        Top = 268
        Width = 65
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object vSPriscoAD: TJvValidateEdit
        Left = 289
        Top = 268
        Width = 60
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
    end
    object tsGSP: TTabSheet
      Caption = 'GSP'
      ImageIndex = 1
      object Label41: TLabel
        Left = 16
        Top = 8
        Width = 158
        Height = 23
        AutoSize = False
        Caption = 'Grande S'#227'o Paulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label111: TLabel
        Left = 384
        Top = 273
        Width = 35
        Height = 13
        Caption = 'M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label114: TLabel
        Left = 40
        Top = 272
        Width = 67
        Height = 13
        Caption = #193'rea de Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label115: TLabel
        Left = 224
        Top = 273
        Width = 43
        Height = 13
        Caption = 'Adicional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 7
        Top = 36
        Width = 170
        Height = 104
        Caption = 'Ad Valor'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tGSPadValor: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vGSPadValor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 188
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Gris'
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'GRIS %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label5: TLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tGSPgris: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vGSPgrisMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vGSPgrisSup: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 367
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Grau de dificuldade'
        TabOrder = 2
        object Label6: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label8: TLabel
          Left = 8
          Top = 72
          Width = 53
          Height = 13
          Caption = 'M'#225'ximo R$'
        end
        object tGSPDific: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vGSPDificMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vGSPDificMax: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox4: TGroupBox
        Left = 7
        Top = 148
        Width = 170
        Height = 105
        Caption = 'ICMS'
        TabOrder = 3
        object Label9: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Maior %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Menor %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 8
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Limite R$'
        end
        object tGSPicmsMaior: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object tGSPicmsMenor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object vGSPicmsLimite: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 188
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Entregas'
        TabOrder = 4
        object Label12: TLabel
          Left = 8
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Ponto a Ponto R$'
        end
        object Label13: TLabel
          Left = 8
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Ped'#225'gio R$'
        end
        object Label14: TLabel
          Left = 8
          Top = 72
          Width = 79
          Height = 13
          Caption = 'Frete M'#237'nimo R$'
        end
        object vGSPponto: TJvValidateEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object vGSPpedagio: TJvValidateEdit
          Left = 96
          Top = 48
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vGSPFTminimo: TJvValidateEdit
          Left = 96
          Top = 72
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox6: TGroupBox
        Left = 367
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Outras Taxas'
        TabOrder = 5
        object Label15: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Emiss'#227'o R$'
        end
        object Label16: TLabel
          Left = 8
          Top = 48
          Width = 63
          Height = 13
          Caption = 'Devolu'#231#227'o %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Reentrega %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object vGSPemissao: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object tGSPdevolve: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object tGSPreent: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object vGSPrisco: TJvValidateEdit
        Left = 432
        Top = 270
        Width = 65
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object vGSPriscoAD: TJvValidateEdit
        Left = 282
        Top = 270
        Width = 65
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
    end
    object tsINT: TTabSheet
      Caption = 'INT'
      ImageIndex = 2
      object Label42: TLabel
        Left = 16
        Top = 8
        Width = 129
        Height = 23
        AutoSize = False
        Caption = 'Interior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object GroupBox13: TGroupBox
        Left = 7
        Top = 148
        Width = 170
        Height = 105
        Caption = 'ICMS'
        TabOrder = 0
        object Label37: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Maior %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Menor %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 8
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Limite R$'
        end
        object tINTicmsMaior: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object tINTicmsMenor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object vINTicmsLimite: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox14: TGroupBox
        Left = 188
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Gris'
        TabOrder = 1
        object Label43: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'GRIS %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label45: TLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tINTgris: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vINTgrisMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vINTgrisSup: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox15: TGroupBox
        Left = 367
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Grau de dificuldade'
        TabOrder = 2
        object Label46: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label48: TLabel
          Left = 8
          Top = 72
          Width = 53
          Height = 13
          Caption = 'M'#225'ximo R$'
        end
        object tINTDific: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vINTDificMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vINTDificMax: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox9: TGroupBox
        Left = 367
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Outras Taxas'
        TabOrder = 3
        object Label25: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Emiss'#227'o R$'
        end
        object Label26: TLabel
          Left = 8
          Top = 48
          Width = 63
          Height = 13
          Caption = 'Devolu'#231#227'o %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 8
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Reentrega %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object vINTemissao: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object tINTdevolve: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object tINTreent: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox10: TGroupBox
        Left = 7
        Top = 36
        Width = 170
        Height = 104
        Caption = 'Ad Valor'
        TabOrder = 4
        object Label30: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tINTadValor: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vINTadValor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object GroupBox16: TGroupBox
        Left = 188
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Entregas'
        TabOrder = 5
        object Label28: TLabel
          Left = 8
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Ponto a Ponto R$'
        end
        object Label29: TLabel
          Left = 8
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Ped'#225'gio R$'
        end
        object Label50: TLabel
          Left = 8
          Top = 72
          Width = 79
          Height = 13
          Caption = 'Frete M'#237'nimo R$'
        end
        object vINTponto: TJvValidateEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object vINTpedagio: TJvValidateEdit
          Left = 96
          Top = 48
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vINTFTminimo: TJvValidateEdit
          Left = 96
          Top = 72
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
    end
    object tsINT2: TTabSheet
      Caption = 'INT2'
      ImageIndex = 3
      object Label56: TLabel
        Left = 16
        Top = 8
        Width = 129
        Height = 23
        AutoSize = False
        Caption = 'Interior 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object GroupBox19: TGroupBox
        Left = 7
        Top = 36
        Width = 170
        Height = 104
        Caption = 'Ad Valor'
        TabOrder = 0
        object Label57: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tINT2adValor: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vINT2adValor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object GroupBox20: TGroupBox
        Left = 188
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Gris'
        TabOrder = 1
        object Label59: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'GRIS %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label60: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label61: TLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tINT2gris: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vINT2grisMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vINT2grisSup: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox21: TGroupBox
        Left = 367
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Grau de dificuldade'
        TabOrder = 2
        object Label62: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label63: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label64: TLabel
          Left = 8
          Top = 72
          Width = 53
          Height = 13
          Caption = 'M'#225'ximo R$'
        end
        object tINT2Dific: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vINT2DificMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vINT2DificMax: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox22: TGroupBox
        Left = 367
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Outras Taxas'
        TabOrder = 3
        object Label65: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Emiss'#227'o R$'
        end
        object Label66: TLabel
          Left = 8
          Top = 48
          Width = 63
          Height = 13
          Caption = 'Devolu'#231#227'o %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 8
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Reentrega %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object vINT2emissao: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object tINT2devolve: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object tINT2reent: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox23: TGroupBox
        Left = 188
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Entregas'
        TabOrder = 4
        object Label68: TLabel
          Left = 8
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Ponto a Ponto R$'
        end
        object Label69: TLabel
          Left = 8
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Ped'#225'gio R$'
        end
        object Label70: TLabel
          Left = 8
          Top = 72
          Width = 79
          Height = 13
          Caption = 'Frete M'#237'nimo R$'
        end
        object vINT2ponto: TJvValidateEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object vINT2pedagio: TJvValidateEdit
          Left = 96
          Top = 48
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vINT2FTminimo: TJvValidateEdit
          Left = 96
          Top = 72
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox24: TGroupBox
        Left = 7
        Top = 148
        Width = 170
        Height = 105
        Caption = 'ICMS'
        TabOrder = 5
        object Label71: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Maior %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Menor %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label73: TLabel
          Left = 8
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Limite R$'
        end
        object tINT2icmsMaior: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object tINT2icmsMenor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object vINT2icmsLimite: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
    end
    object tsOEST: TTabSheet
      Caption = 'OEST'
      ImageIndex = 4
      object Label74: TLabel
        Left = 16
        Top = 8
        Width = 153
        Height = 23
        AutoSize = False
        Caption = 'Outros Estados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object GroupBox25: TGroupBox
        Left = 7
        Top = 36
        Width = 170
        Height = 104
        Caption = 'Ad Valor'
        TabOrder = 0
        object Label75: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label76: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tOESTadValor: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vOESTadValor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object GroupBox26: TGroupBox
        Left = 188
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Gris'
        TabOrder = 1
        object Label77: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'GRIS %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label78: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label79: TLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tOESTgris: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vOESTgrisMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vOESTgrisSup: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox27: TGroupBox
        Left = 367
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Grau de dificuldade'
        TabOrder = 2
        object Label80: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label81: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label82: TLabel
          Left = 8
          Top = 72
          Width = 53
          Height = 13
          Caption = 'M'#225'ximo R$'
        end
        object tOESTDific: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vOESTDificMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vOESTDificMax: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox28: TGroupBox
        Left = 367
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Outras Taxas'
        TabOrder = 3
        object Label83: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Emiss'#227'o R$'
        end
        object Label84: TLabel
          Left = 8
          Top = 48
          Width = 63
          Height = 13
          Caption = 'Devolu'#231#227'o %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label85: TLabel
          Left = 8
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Reentrega %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object vOESTemissao: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object tOESTdevolve: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object tOESTreent: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox29: TGroupBox
        Left = 188
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Entregas'
        TabOrder = 4
        object Label86: TLabel
          Left = 8
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Ponto a Ponto R$'
        end
        object Label87: TLabel
          Left = 8
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Ped'#225'gio R$'
        end
        object Label88: TLabel
          Left = 8
          Top = 72
          Width = 79
          Height = 13
          Caption = 'Frete M'#237'nimo R$'
        end
        object vOESTponto: TJvValidateEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object vOESTpedagio: TJvValidateEdit
          Left = 96
          Top = 48
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vOESTFTminimo: TJvValidateEdit
          Left = 96
          Top = 72
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox30: TGroupBox
        Left = 7
        Top = 148
        Width = 170
        Height = 105
        Caption = 'ICMS'
        TabOrder = 5
        object Label89: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Maior %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label90: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Menor %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label91: TLabel
          Left = 8
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Limite R$'
        end
        object tOESTicmsMaior: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object tOESTicmsMenor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object vOESTicmsLimite: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
    end
    object tsOUT: TTabSheet
      Caption = 'OUTROS'
      ImageIndex = 5
      object Label92: TLabel
        Left = 16
        Top = 8
        Width = 129
        Height = 23
        AutoSize = False
        Caption = 'Outros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object GroupBox31: TGroupBox
        Left = 7
        Top = 36
        Width = 170
        Height = 104
        Caption = 'Ad Valor'
        TabOrder = 0
        object Label93: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label94: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tOUTadValor: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vOUTadValor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object GroupBox32: TGroupBox
        Left = 188
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Gris'
        TabOrder = 1
        object Label95: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'GRIS %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label96: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label97: TLabel
          Left = 8
          Top = 72
          Width = 64
          Height = 13
          Caption = 'a partir de R$'
        end
        object tOUTgris: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vOUTgrisMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vOUTgrisSup: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox33: TGroupBox
        Left = 367
        Top = 36
        Width = 170
        Height = 105
        Caption = 'Grau de dificuldade'
        TabOrder = 2
        object Label98: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Taxa %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label99: TLabel
          Left = 8
          Top = 48
          Width = 52
          Height = 13
          Caption = 'M'#237'nimo R$'
        end
        object Label100: TLabel
          Left = 8
          Top = 72
          Width = 53
          Height = 13
          Caption = 'M'#225'ximo R$'
        end
        object tOUTDific: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object vOUTDificMin: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vOUTDificMax: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox34: TGroupBox
        Left = 367
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Outras Taxas'
        TabOrder = 3
        object Label101: TLabel
          Left = 8
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Emiss'#227'o R$'
        end
        object Label102: TLabel
          Left = 8
          Top = 48
          Width = 63
          Height = 13
          Caption = 'Devolu'#231#227'o %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label103: TLabel
          Left = 8
          Top = 72
          Width = 61
          Height = 13
          Caption = 'Reentrega %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object vOUTemissao: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object tOUTdevolve: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object tOUTreent: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox35: TGroupBox
        Left = 188
        Top = 149
        Width = 170
        Height = 105
        Caption = 'Entregas'
        TabOrder = 4
        object Label104: TLabel
          Left = 8
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Ponto a Ponto R$'
        end
        object Label105: TLabel
          Left = 8
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Ped'#225'gio R$'
        end
        object Label106: TLabel
          Left = 8
          Top = 72
          Width = 79
          Height = 13
          Caption = 'Frete M'#237'nimo R$'
        end
        object vOUTponto: TJvValidateEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 0
        end
        object vOUTpedagio: TJvValidateEdit
          Left = 96
          Top = 48
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 1
        end
        object vOUTFTminimo: TJvValidateEdit
          Left = 96
          Top = 72
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object GroupBox36: TGroupBox
        Left = 7
        Top = 148
        Width = 170
        Height = 105
        Caption = 'ICMS'
        TabOrder = 5
        object Label107: TLabel
          Left = 8
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Maior %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label108: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Menor %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label109: TLabel
          Left = 8
          Top = 72
          Width = 44
          Height = 13
          Caption = 'Limite R$'
        end
        object tOUTicmsMaior: TJvValidateEdit
          Left = 96
          Top = 21
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object tOUTicmsMenor: TJvValidateEdit
          Left = 96
          Top = 47
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object vOUTicmsLimite: TJvValidateEdit
          Left = 96
          Top = 73
          Width = 65
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
    end
  end
end
