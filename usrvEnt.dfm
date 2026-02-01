object srvEnt: TsrvEnt
  Left = 201
  Top = 114
  Width = 633
  Height = 420
  Caption = 'Entrada de Servi'#231'o'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 49
    Align = alTop
    Color = 14480884
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 27
      Height = 13
      Caption = 'Placa'
    end
    object lbResp: TLabel
      Left = 200
      Top = 16
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edPL1: TEdit
      Left = 56
      Top = 7
      Width = 57
      Height = 28
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      Text = 'WWW'
      OnChange = edPL1Change
      OnKeyPress = edPL1KeyPress
    end
    object edPL2: TEdit
      Left = 125
      Top = 7
      Width = 57
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 1
      Text = '9999'
      OnKeyDown = edPL2KeyDown
      OnKeyPress = edPL2KeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 625
    Height = 72
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Placa'
    end
    object lbPlaca: TLabel
      Left = 64
      Top = 16
      Width = 43
      Height = 13
      Caption = 'lbPlaca'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 168
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object lbModelo: TLabel
      Left = 208
      Top = 16
      Width = 52
      Height = 13
      Caption = 'lbModelo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 368
      Top = 16
      Width = 16
      Height = 13
      Caption = 'Cor'
    end
    object lbCor: TLabel
      Left = 392
      Top = 16
      Width = 30
      Height = 13
      Caption = 'lbCor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 472
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Tamanho'
    end
    object lbTamanho: TLabel
      Left = 528
      Top = 16
      Width = 63
      Height = 13
      Caption = 'lbTamanho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 72
      Top = 40
      Width = 273
      Height = 13
      AutoSize = False
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 368
      Top = 40
      Width = 55
      Height = 13
      Caption = 'Documento'
    end
    object lbDoc: TLabel
      Left = 432
      Top = 40
      Width = 153
      Height = 13
      AutoSize = False
      Caption = 'lbDoc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 121
    Width = 625
    Height = 272
    Align = alClient
    TabOrder = 2
  end
end
