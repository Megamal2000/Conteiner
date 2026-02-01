object eImportaPr: TeImportaPr
  Left = 0
  Top = 0
  Caption = 'Importa Lista de Produtos - Excel'
  ClientHeight = 259
  ClientWidth = 406
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
    Width = 406
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 500
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 64
      Top = 24
      Width = 19
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btModelo: TBitBtn
      Left = 294
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Modelo'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 406
    Height = 80
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 500
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Arquivo Excel'
    end
    object arq: TJvFilenameEdit
      Left = 96
      Top = 13
      Width = 273
      Height = 21
      TabOrder = 0
      Text = 'C:\MZp'
    end
    object btImportar: TBitBtn
      Left = 294
      Top = 45
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = btImportarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 137
    Width = 406
    Height = 122
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 168
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 117
      Height = 13
      Caption = 'Quantidade de Produtos'
    end
    object Label4: TLabel
      Left = 16
      Top = 40
      Width = 25
      Height = 13
      Caption = 'Erros'
    end
    object Processando: TLabel
      Left = 16
      Top = 64
      Width = 61
      Height = 13
      Caption = 'Processando'
    end
    object lbTot1: TLabel
      Left = 144
      Top = 16
      Width = 30
      Height = 13
      Caption = 'lbTot1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbErro: TLabel
      Left = 48
      Top = 40
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTot2: TLabel
      Left = 123
      Top = 64
      Width = 30
      Height = 13
      Caption = 'lbTot2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pb: TProgressBar
      Left = 16
      Top = 82
      Width = 353
      Height = 17
      TabOrder = 0
    end
    object lbProc: TStaticText
      Left = 83
      Top = 64
      Width = 33
      Height = 17
      Caption = 'lbProc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
