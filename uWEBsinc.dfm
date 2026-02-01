object WEBsinc: TWEBsinc
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'WEBsinc'
  ClientHeight = 79
  ClientWidth = 222
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Notas alteradas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 26
    Width = 171
    Height = 13
    Caption = '[x-WEB ] n'#227'o sincronizadas na WEB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16744448
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 15
    Top = 41
    Width = 185
    Height = 2
  end
  object lbNFs: TLabel
    Left = 16
    Top = 48
    Width = 31
    Height = 16
    Caption = 'lbNFs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pb: TJvGradientProgressBar
    Left = 16
    Top = 46
    Width = 122
    Height = 17
    ParentColor = True
  end
  object SpeedButton1: TSpeedButton
    Left = 189
    Top = 8
    Width = 25
    Height = 22
    Caption = 'ver'
    OnClick = SpeedButton1Click
  end
  object btSinc: TBitBtn
    Left = 144
    Top = 45
    Width = 49
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 0
    OnClick = btSincClick
  end
  object Tab: TJvMemoryData
    FieldDefs = <>
    Left = 80
    Top = 32
  end
end
