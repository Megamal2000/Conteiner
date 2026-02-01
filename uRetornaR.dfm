object RetornaR: TRetornaR
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Retorna Rastreio de Planilha Excel'
  ClientHeight = 115
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 24
    Width = 119
    Height = 13
    Caption = 'Coluna do N'#250'mero da NF'
  end
  object Edit1: TEdit
    Left = 176
    Top = 21
    Width = 49
    Height = 21
    TabOrder = 0
    Text = 'A'
  end
  object btImportar: TBitBtn
    Left = 25
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 1
    OnClick = btImportarClick
  end
  object PBnotas: TProgressBar
    Left = 176
    Top = 76
    Width = 273
    Height = 17
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 32
  end
end
