object tmpAcesso: TtmpAcesso
  Left = 199
  Top = 114
  Width = 239
  Height = 153
  BorderIcons = [biSystemMenu]
  Caption = 'Acesso ao Banco'
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
    Left = 24
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object edChave: TEdit
    Left = 78
    Top = 14
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edChave'
  end
  object edAcesso: TEdit
    Left = 78
    Top = 46
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edAcesso'
  end
  object btOk: TBitBtn
    Left = 80
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btOkClick
    Kind = bkOK
  end
end
