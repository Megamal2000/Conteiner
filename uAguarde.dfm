object Aguarde: TAguarde
  Left = 286
  Top = 195
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Aguarde'
  ClientHeight = 87
  ClientWidth = 304
  Color = 14614260
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 32
    Top = 18
    Width = 49
    Height = 41
    Transparent = True
  end
  object StaticText1: TStaticText
    Left = 136
    Top = 24
    Width = 116
    Height = 31
    Caption = 'Aguarde ...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Transparent = False
  end
end
