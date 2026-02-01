object WebRec: TWebRec
  Left = 390
  Top = 268
  Caption = 'Atualiza'#231#227'o - Web para Sistema'
  ClientHeight = 249
  ClientWidth = 379
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
    Width = 379
    Height = 73
    Align = alTop
    Color = 13427151
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 91
      Height = 13
      Caption = 'Receber dados de '
      Visible = False
    end
    object btAtual: TBitBtn
      Left = 288
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 0
      Visible = False
      OnClick = btAtualClick
    end
    object dtRm: TDateTimePicker
      Left = 117
      Top = 13
      Width = 124
      Height = 21
      Date = 40783.494149479160000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40783.494149479160000000
      TabOrder = 1
      Visible = False
    end
    object btReceber: TBitBtn
      Left = 288
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Receber'
      TabOrder = 2
      OnClick = btReceberClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 379
    Height = 176
    Align = alClient
    Color = 12566400
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 337
      Height = 13
      AutoSize = False
      Caption = 'Recebendo'
      Color = 16573133
      ParentColor = False
      Transparent = True
    end
    object pb: TProgressBar
      Left = 16
      Top = 26
      Width = 337
      Height = 17
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 16
      Top = 56
      Width = 337
      Height = 105
      TabOrder = 1
    end
  end
  object XMLDocument1: TXMLDocument
    FileName = 'G:\FlaydelSOFTS\Singular\xml\Romaneio XML 2011 07 20.XML'
    Left = 248
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://localhost:2902/api/BaixaLer/12057'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 8
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 24
    Top = 24
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 32
    Top = 32
  end
  object Baixas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 48
  end
end
