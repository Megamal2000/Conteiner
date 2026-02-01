object impXML: TimpXML
  Left = 228
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Importa Notas via XML'
  ClientHeight = 194
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 96
    Top = 96
    Width = 113
    Height = 13
    Caption = 'Quantidade de arquivos'
  end
  object lbQT: TLabel
    Left = 224
    Top = 97
    Width = 8
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 32
    Top = 136
    Width = 457
    Height = 2
  end
  object Label4: TLabel
    Left = 40
    Top = 144
    Width = 54
    Height = 13
    Caption = 'Andamento'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 81
    Align = alTop
    Color = 16776176
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 40
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Pasta'
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
      Top = 37
      Width = 395
      Height = 21
      DialogKind = dkWin32
      Flat = False
      ParentFlat = False
      TabOrder = 1
      Text = 'e_dir'
      OnChange = e_dirChange
    end
    object ckColeta: TCheckBox
      Left = 360
      Top = 61
      Width = 129
      Height = 17
      Caption = 'Importar como Coleta'
      TabOrder = 2
    end
  end
  object e_arqs: TFileListBox
    Left = 8
    Top = 32
    Width = 145
    Height = 97
    ItemHeight = 13
    Mask = '*.xml'
    TabOrder = 1
    Visible = False
  end
  object btIMP: TBitBtn
    Left = 392
    Top = 93
    Width = 97
    Height = 25
    Caption = 'Importar'
    Glyph.Data = {
      6E000000424D6E000000000000003E000000280000000C0000000C0000000100
      010000000000300000000000000000000000020000000200000000000000FFFF
      FF00FFF00000FFF00000FFF00000FDF00000F8F00000F0700000E0300000F8F0
      0000F8F00000F8F00000FFF00000FFF00000}
    TabOrder = 2
    OnClick = btIMPClick
  end
  object pb: TProgressBar
    Left = 128
    Top = 144
    Width = 361
    Height = 17
    TabOrder = 3
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
    Left = 272
    Top = 104
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.099999999999999000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    Left = 328
    Top = 104
  end
end
