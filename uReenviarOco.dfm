object ReenviaOco: TReenviaOco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Reenvia EDI OCOREN'
  ClientHeight = 160
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbResp: TLabel
    Left = 32
    Top = 119
    Width = 41
    Height = 14
    Caption = 'lbResp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 113
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 529
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Clliente'
    end
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 26
      Height = 13
      Caption = 'Entre'
    end
    object cbCli: TComboBox
      Left = 88
      Top = 13
      Width = 337
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
    end
    object dta: TDateTimePicker
      Left = 88
      Top = 40
      Width = 121
      Height = 21
      Date = 43635.607560983790000000
      Format = 'dd/MM/yyyyy ddd'
      Time = 43635.607560983790000000
      TabOrder = 1
    end
    object dtb: TDateTimePicker
      Left = 256
      Top = 44
      Width = 121
      Height = 21
      Date = 43635.607560983790000000
      Format = 'dd/MM/yyyyy ddd'
      Time = 43635.607560983790000000
      TabOrder = 2
    end
    object btReenviar: TBitBtn
      Left = 320
      Top = 76
      Width = 107
      Height = 25
      Caption = 'Reenviar'
      TabOrder = 3
      OnClick = btReenviarClick
    end
  end
end
