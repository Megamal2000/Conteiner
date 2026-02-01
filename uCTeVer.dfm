object CTeVer: TCTeVer
  Left = 0
  Top = 0
  Caption = 'Visualiza XML do CT-e'
  ClientHeight = 542
  ClientWidth = 839
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
    Width = 839
    Height = 51
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -18
    ExplicitWidth = 653
    object imCanc: TImage
      Left = 42
      Top = 1
      Width = 41
      Height = 49
      Align = alLeft
      Stretch = True
      ExplicitLeft = 48
      ExplicitTop = -4
    end
    object imOK: TImage
      Left = 1
      Top = 1
      Width = 41
      Height = 49
      Align = alLeft
      Stretch = True
      ExplicitLeft = 8
      ExplicitTop = 2
      ExplicitHeight = 41
    end
    object Label1: TLabel
      Left = 156
      Top = 9
      Width = 36
      Height = 25
      Caption = 'CTe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNumCTe: TLabel
      Left = 203
      Top = 11
      Width = 107
      Height = 25
      Caption = 'lbNumCTe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbStatus: TLabel
      Left = 435
      Top = 13
      Width = 230
      Height = 23
      AutoSize = False
      Caption = 'lbStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 96
      Top = 37
      Width = 31
      Height = 13
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 51
    Width = 839
    Height = 491
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -18
    ExplicitWidth = 653
    ExplicitHeight = 231
    ControlData = {
      4C0000007D430000E01700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
