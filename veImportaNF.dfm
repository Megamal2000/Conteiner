object eImportaNF: TeImportaNF
  Left = 0
  Top = 0
  Caption = 'Importar Nota Fiscal para o Estoque'
  ClientHeight = 383
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 121
    Width = 516
    Height = 262
    Align = alClient
    TabOrder = 2
    ExplicitTop = 136
    ExplicitHeight = 202
    object Panel4: TPanel
      Left = 1
      Top = 65
      Width = 514
      Height = 56
      Align = alTop
      TabOrder = 0
      ExplicitTop = 1
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 37
        Height = 13
        Caption = 'Arquivo'
      end
      object Label5: TLabel
        Left = 16
        Top = 27
        Width = 52
        Height = 13
        Caption = 'Nota Fiscal'
      end
      object Label6: TLabel
        Left = 207
        Top = 25
        Width = 48
        Height = 13
        Caption = 'Pedido No'
      end
      object lbArq: TLabel
        Left = 81
        Top = 8
        Width = 25
        Height = 13
        Caption = 'lbArq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbNota: TLabel
        Left = 80
        Top = 27
        Width = 31
        Height = 13
        Caption = 'lbNota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object nPed: TJvValidateEdit
        Left = 263
        Top = 22
        Width = 57
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Arquivos: TFileListBox
      Left = 1
      Top = 1
      Width = 514
      Height = 64
      Align = alTop
      ItemHeight = 13
      Mask = '*.xml'
      TabOrder = 1
      OnClick = ArquivosClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 85
    Align = alTop
    Color = 16776176
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 40
      Top = 35
      Width = 27
      Height = 13
      Caption = 'Pasta'
    end
    object Label3: TLabel
      Left = 40
      Top = 60
      Width = 61
      Height = 13
      Caption = 'Tipo de Nota'
    end
    object cbCli: TComboBox
      Left = 93
      Top = 6
      Width = 396
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Sorted = True
      TabOrder = 0
      Text = 'cbCli'
    end
    object e_dir: TJvDirectoryEdit
      Left = 94
      Top = 32
      Width = 395
      Height = 21
      DialogKind = dkWin32
      Flat = False
      ParentFlat = False
      InitialDir = 'C:\Mzp'
      TabOrder = 1
      Text = 'C:\MZp'
      OnChange = e_dirChange
    end
    object cbTipo: TComboBox
      Left = 120
      Top = 57
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Entrada'
      Items.Strings = (
        'Entrada'
        'Sa'#237'da'
        'Devolu'#231#227'o')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 516
    Height = 36
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    object lbResp: TLabel
      Left = 128
      Top = 14
      Width = 3
      Height = 13
    end
    object btVerif: TBitBtn
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Verificar'
      TabOrder = 0
      OnClick = btVerifClick
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 336
    Top = 234
  end
end
