object StokCV: TStokCV
  Left = 261
  Top = 289
  BorderIcons = [biSystemMenu]
  Caption = 'Detalhes do Contrato - Valores'
  ClientHeight = 454
  ClientWidth = 727
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
    Width = 727
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 735
    object Label18: TLabel
      Left = 32
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label19: TLabel
      Left = 32
      Top = 40
      Width = 91
      Height = 13
      Caption = 'Status do Contrato '
    end
    object Label20: TLabel
      Left = 128
      Top = 14
      Width = 55
      Height = 16
      Caption = 'Label20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 130
      Top = 37
      Width = 183
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'Rascunho'
      Items.Strings = (
        'Rascunho'
        'Passado para o Cliente'
        'Aprovado'
        'Prorrogado'
        'Finalizado')
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 727
    Height = 328
    ActivePage = tbs
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 735
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label23: TLabel
        Left = 247
        Top = 165
        Width = 78
        Height = 13
        Caption = 'Especial M'#237'nimo'
      end
      object GroupBox1: TGroupBox
        Left = 240
        Top = 50
        Width = 265
        Height = 87
        Caption = 'Datas do Contrato'
        TabOrder = 0
        object Label21: TLabel
          Left = 24
          Top = 24
          Width = 30
          Height = 13
          Caption = 'In'#237'cio '
        end
        object Label22: TLabel
          Left = 24
          Top = 51
          Width = 16
          Height = 13
          Caption = 'Fim'
        end
        object dti: TDateTimePicker
          Left = 96
          Top = 23
          Width = 137
          Height = 21
          Date = 42110.668544733790000000
          Format = 'dd/MM/yyyy, ddd'
          Time = 42110.668544733790000000
          TabOrder = 0
        end
        object dtf: TDateTimePicker
          Left = 96
          Top = 48
          Width = 137
          Height = 21
          Date = 42110.669435034730000000
          Format = 'dd/MM/yyyy, ddd'
          Time = 42110.669435034730000000
          TabOrder = 1
        end
      end
      object Emin: TJvValidateEdit
        Left = 337
        Top = 161
        Width = 128
        Height = 21
        Color = 15263952
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        TabOrder = 1
      end
    end
    object tba: TTabSheet
      Caption = 'Armazenagem'
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 601
        Height = 27
        AutoSize = False
        Caption = 'Armazenagem'
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object rbArm1: TRadioButton
        Left = 32
        Top = 48
        Width = 193
        Height = 17
        Caption = 'Porcentagem sobre o Faturamento'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbArm1Click
      end
      object Agr1: TGroupBox
        Left = 240
        Top = 50
        Width = 265
        Height = 87
        Caption = 'Porcentagem'
        TabOrder = 1
        object Label4: TLabel
          Left = 24
          Top = 24
          Width = 179
          Height = 13
          Caption = 'Taxa                                                % '
        end
        object Label5: TLabel
          Left = 24
          Top = 51
          Width = 62
          Height = 13
          Caption = 'Valor M'#237'nimo'
        end
        object aTaxa: TJvValidateEdit
          Left = 97
          Top = 22
          Width = 88
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 1
          TabOrder = 0
        end
        object aMin: TJvValidateEdit
          Left = 97
          Top = 49
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object rbArm2: TRadioButton
        Left = 32
        Top = 145
        Width = 113
        Height = 17
        Caption = #193'rea / Palete'
        TabOrder = 2
        OnClick = rbArm2Click
      end
      object Agr2: TGroupBox
        Left = 240
        Top = 145
        Width = 265
        Height = 105
        Caption = #193'rea'
        TabOrder = 3
        object Label6: TLabel
          Left = 24
          Top = 24
          Width = 49
          Height = 13
          Caption = 'Valor Fixo '
        end
        object Label7: TLabel
          Left = 24
          Top = 51
          Width = 185
          Height = 13
          Caption = #193'rea limite                                         m2'
        end
        object Label8: TLabel
          Left = 24
          Top = 79
          Width = 68
          Height = 13
          Caption = 'm2 Excedente'
        end
        object aVlr: TJvValidateEdit
          Left = 97
          Top = 23
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 0
        end
        object aArea: TJvValidateEdit
          Left = 97
          Top = 48
          Width = 88
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DecimalPlaces = 1
          TabOrder = 1
        end
        object aExc: TJvValidateEdit
          Left = 97
          Top = 76
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
    end
    object tbM: TTabSheet
      Caption = 'Movimenta'#231#227'o'
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 601
        Height = 27
        AutoSize = False
        Caption = 'Movimenta'#231#227'o'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object rbMov1: TRadioButton
        Left = 32
        Top = 48
        Width = 193
        Height = 17
        Caption = 'Porcentagem sobre o Faturamento'
        TabOrder = 0
        OnClick = rbMov1Click
      end
      object Mgr1: TGroupBox
        Left = 240
        Top = 50
        Width = 377
        Height = 79
        Caption = 'Porcentagem'
        TabOrder = 1
        object Label9: TLabel
          Left = 24
          Top = 24
          Width = 179
          Height = 13
          Caption = 'Taxa                                                % '
        end
        object Label10: TLabel
          Left = 24
          Top = 51
          Width = 60
          Height = 13
          Caption = 'M'#237'nimo ENT'
        end
        object Label11: TLabel
          Left = 200
          Top = 51
          Width = 55
          Height = 13
          Caption = 'M'#237'nimo SAI'
        end
        object mTaxa: TJvValidateEdit
          Left = 97
          Top = 22
          Width = 88
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 1
          TabOrder = 0
        end
        object mMinE: TJvValidateEdit
          Left = 97
          Top = 49
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 1
        end
        object mMinS: TJvValidateEdit
          Left = 262
          Top = 47
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 2
        end
      end
      object rbMov2: TRadioButton
        Left = 32
        Top = 134
        Width = 193
        Height = 17
        Caption = 'Diversidade'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = rbMov2Click
      end
      object Mgr2: TGroupBox
        Left = 240
        Top = 134
        Width = 377
        Height = 49
        Caption = 'Diversidade ENTRADA Normal '
        TabOrder = 3
        object Label12: TLabel
          Left = 24
          Top = 23
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object mDivEn: TJvValidateEdit
          Left = 97
          Top = 20
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 0
        end
        object rbDivEn: TRadioButton
          Left = 207
          Top = 23
          Width = 65
          Height = 17
          Caption = 'por NF'
          TabOrder = 1
        end
        object rbDivEi: TRadioButton
          Left = 295
          Top = 23
          Width = 65
          Height = 17
          Caption = 'por Item'
          TabOrder = 2
        end
      end
      object Mgr3: TGroupBox
        Left = 240
        Top = 190
        Width = 377
        Height = 49
        Caption = 'Diversidade ENTRADA Devolu'#231#227'o'
        TabOrder = 4
        object Label13: TLabel
          Left = 24
          Top = 23
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object mDivEd: TJvValidateEdit
          Left = 97
          Top = 20
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 0
        end
        object rbDivEn1: TRadioButton
          Left = 207
          Top = 23
          Width = 73
          Height = 17
          Caption = 'por NF'
          TabOrder = 1
        end
        object rbDivEi1: TRadioButton
          Left = 295
          Top = 23
          Width = 65
          Height = 17
          Caption = 'por Item'
          TabOrder = 2
        end
      end
      object Mgr4: TGroupBox
        Left = 240
        Top = 246
        Width = 377
        Height = 49
        Caption = 'Diversidade SA'#205'DA'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 5
        object Label14: TLabel
          Left = 24
          Top = 23
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object mDivS: TJvValidateEdit
          Left = 97
          Top = 20
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 0
        end
        object rbDivSn: TRadioButton
          Left = 207
          Top = 23
          Width = 73
          Height = 17
          Caption = 'por NF'
          TabOrder = 1
        end
        object rbDivSi: TRadioButton
          Left = 295
          Top = 23
          Width = 65
          Height = 17
          Caption = 'por Item'
          TabOrder = 2
        end
      end
    end
    object tbs: TTabSheet
      Caption = 'Seguro'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 609
        Height = 27
        AutoSize = False
        Caption = 'Seguro'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 64
        Top = 160
        Width = 124
        Height = 13
        Caption = 'Dia (Per'#237'odo para Seguro)'
      end
      object GroupBox7: TGroupBox
        Left = 240
        Top = 50
        Width = 265
        Height = 87
        Caption = 'Porcentagem'
        TabOrder = 0
        object Label15: TLabel
          Left = 24
          Top = 24
          Width = 179
          Height = 13
          Caption = 'Taxa                                                % '
        end
        object Label16: TLabel
          Left = 24
          Top = 51
          Width = 62
          Height = 13
          Caption = 'Valor M'#237'nimo'
        end
        object sTaxa: TJvValidateEdit
          Left = 97
          Top = 22
          Width = 88
          Height = 21
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 1
          TabOrder = 0
        end
        object sMin: TJvValidateEdit
          Left = 97
          Top = 49
          Width = 88
          Height = 21
          Color = 15263952
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfCurrency
          DecimalPlaces = 2
          TabOrder = 1
        end
      end
      object dtSeg: TDateTimePicker
        Left = 238
        Top = 158
        Width = 131
        Height = 21
        Date = 42073.683545821760000000
        Time = 42073.683545821760000000
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 435
    Width = 727
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 439
    ExplicitWidth = 735
  end
  object btSalvar: TBitBtn
    Left = 488
    Top = 401
    Width = 97
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
    TabOrder = 3
    OnClick = btSalvarClick
  end
end
