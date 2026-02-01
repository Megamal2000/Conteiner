object BaixaRb: TBaixaRb
  Left = 28
  Top = 291
  Width = 339
  Height = 205
  BorderIcons = [biSystemMenu]
  Caption = 'Baixa Romaneios'
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
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 189
    Height = 13
    Caption = 'Digite o n'#250'mero do Romaneio devolvido'
  end
  object lbResp: TLabel
    Left = 40
    Top = 64
    Width = 249
    Height = 13
    AutoSize = False
    Caption = 'lbResp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbResp2: TLabel
    Left = 40
    Top = 90
    Width = 249
    Height = 16
    AutoSize = False
    Caption = 'lbResp2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbResp3: TLabel
    Left = 40
    Top = 120
    Width = 249
    Height = 13
    AutoSize = False
    Caption = 'lbResp3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edNum: TEdit
    Left = 216
    Top = 17
    Width = 73
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edNumKeyPress
  end
end
