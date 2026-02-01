object AltCob: TAltCob
  Left = 196
  Top = 114
  Width = 349
  Height = 187
  BorderIcons = []
  Caption = 'Altera Tipo de Servi'#231'o de Cobran'#231'a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Nota Fiscal'
  end
  object lbNF: TLabel
    Left = 104
    Top = 16
    Width = 27
    Height = 13
    Caption = 'lbNF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 40
    Width = 52
    Height = 13
    Caption = 'Localidade'
  end
  object lbLocal: TLabel
    Left = 104
    Top = 40
    Width = 34
    Height = 13
    Caption = 'lbLocal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 68
    Width = 36
    Height = 13
    Caption = 'Servi'#231'o'
  end
  object Bevel1: TBevel
    Left = 24
    Top = 96
    Width = 289
    Height = 2
  end
  object cbCob: TComboBox
    Left = 104
    Top = 65
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'cbCob'
    Items.Strings = (
      'Peso'
      'Taxa'
      'Entrega'
      'Sa'#237'da'
      'Contrato')
  end
  object btCancel: TBitBtn
    Left = 32
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btCancelClick
    Kind = bkCancel
  end
  object btSalvar: TBitBtn
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btSalvarClick
    Kind = bkOK
  end
end
