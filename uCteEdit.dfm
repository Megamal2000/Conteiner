object CteEdit: TCteEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Editar CT-e'
  ClientHeight = 377
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 136
      Height = 27
      Caption = 'N'#250'mero CT-e'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCTe: TLabel
      Left = 170
      Top = 24
      Width = 61
      Height = 27
      Caption = 'lbCTe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 336
      Top = 9
      Width = 52
      Height = 13
      Caption = 'Nota Fiscal'
    end
    object Label3: TLabel
      Left = 336
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lbNF: TLabel
      Left = 400
      Top = 9
      Width = 23
      Height = 13
      Caption = 'lbNF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCli: TLabel
      Left = 400
      Top = 32
      Width = 19
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 336
      Top = 55
      Width = 58
      Height = 13
      Caption = 'Destinat'#225'rio'
    end
    object lbDest: TLabel
      Left = 400
      Top = 55
      Width = 30
      Height = 13
      Caption = 'lbDest'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 299
      Top = 5
      Width = 23
      Height = 18
      Caption = 'ver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 299
      Top = 28
      Width = 23
      Height = 18
      Caption = 'ver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 299
      Top = 51
      Width = 23
      Height = 18
      Caption = 'ver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 698
    Height = 98
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 4
      Width = 143
      Height = 13
      Caption = 'Configura'#231#245'es Gerais do CT-e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 12
      Top = 18
      Width = 185
      Height = 3
    end
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Tipo do CT-e'
    end
    object Label7: TLabel
      Left = 336
      Top = 24
      Width = 76
      Height = 13
      Caption = 'Tipo de Emiss'#227'o'
    end
    object Label8: TLabel
      Left = 16
      Top = 48
      Width = 73
      Height = 13
      Caption = 'Tipo do Servi'#231'o'
    end
    object Label9: TLabel
      Left = 336
      Top = 48
      Width = 27
      Height = 13
      Caption = 'CFOP'
    end
    object Label10: TLabel
      Left = 424
      Top = 48
      Width = 207
      Height = 13
      Caption = 'Padr'#227'o para SP 5353, outros estados 6353'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 16
      Top = 72
      Width = 67
      Height = 13
      Caption = 'Nat Opera'#231#227'o'
    end
    object cbTpCte: TComboBox
      Left = 105
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'cbTpCte'
      Items.Strings = (
        'Normal'
        'Complemento de Valores'
        'Anula'#231#227'o'
        'Substituto')
    end
    object cbTpEmiss: TComboBox
      Left = 424
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'cbTpEmiss'
      Items.Strings = (
        'Normal'
        'EPEC pela SVC'
        'Conting'#234'ncia FSDA'
        'Autoriza'#231#227'o pela SVC-RS'
        'Autoriza'#231#227'o pela SVC-SP')
    end
    object cbTpServ: TComboBox
      Left = 105
      Top = 45
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'cbTpServ'
      Items.Strings = (
        'Normal'
        'Subcontrata'#231#227'o'
        'Redespacho'
        'Redespacho Intermedi'#225'rio'
        'Vinculado '#224' Multimodal')
    end
    object nCFOP: TJvValidateEdit
      Left = 369
      Top = 45
      Width = 43
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 3
    end
    object edNatOp: TEdit
      Left = 105
      Top = 69
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = 'EDIT1'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 179
    Width = 698
    Height = 96
    Align = alTop
    TabOrder = 2
    ExplicitTop = 161
    object Label11: TLabel
      Left = 16
      Top = 2
      Width = 142
      Height = 13
      Caption = 'Configura'#231#245'es dos Endere'#231'os'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 12
      Top = 16
      Width = 185
      Height = 3
    end
    object Label12: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Remetente'
    end
    object Label13: TLabel
      Left = 16
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Destinat'#225'rio'
    end
    object Label14: TLabel
      Left = 16
      Top = 72
      Width = 42
      Height = 13
      Caption = 'Tomador'
    end
    object cbRem: TComboBox
      Left = 105
      Top = 21
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'cbRem'
      Items.Strings = (
        'Cliente'
        'Destinat'#225'rio')
    end
    object cbDest: TComboBox
      Left = 105
      Top = 45
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'cbDest'
      Items.Strings = (
        'Cliente'
        'Destinat'#225'rio')
    end
    object cbToma: TComboBox
      Left = 105
      Top = 69
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'cbToma'
      Items.Strings = (
        'Remetente'
        'Expedidor'
        'Recebedor'
        'Destinat'#225'rio')
    end
  end
end
