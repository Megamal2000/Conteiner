object cliEscolhe: TcliEscolhe
  Left = 214
  Top = 200
  BorderIcons = []
  Caption = 'Escolha o Cliente'
  ClientHeight = 89
  ClientWidth = 400
  Color = clSilver
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
    Left = 38
    Top = 12
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Panel1: TPanel
    Left = 0
    Top = 37
    Width = 400
    Height = 52
    Align = alBottom
    Color = clAppWorkSpace
    TabOrder = 0
    ExplicitWidth = 272
    object btOK: TBitBtn
      Left = 32
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btOKClick
    end
    object btCancela: TBitBtn
      Left = 176
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Cancela'
      TabOrder = 1
      OnClick = btCancelaClick
    end
  end
  object cbCli: TComboBox
    Left = 80
    Top = 9
    Width = 265
    Height = 21
    Sorted = True
    TabOrder = 1
    Text = 'Escolher'
  end
end
