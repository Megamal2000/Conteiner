object EnviaRest3: TEnviaRest3
  Left = 0
  Top = 0
  Caption = 'Enviar Tabelas'
  ClientHeight = 381
  ClientWidth = 433
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 105
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 32
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Label2'
    end
    object pb: TProgressBar
      Left = 32
      Top = 64
      Width = 385
      Height = 17
      TabOrder = 0
    end
    object StaticText1: TStaticText
      Left = 32
      Top = 87
      Width = 59
      Height = 17
      Caption = 'StaticText1'
      TabOrder = 1
    end
  end
  object btCancelar: TBitBtn
    Left = 342
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btCancelarClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 152
    Width = 401
    Height = 209
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object RESTResponse1: TRESTResponse
    Left = 360
    Top = 5
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 280
    Top = 5
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    Params = <>
    HandleRedirects = True
    SynchronizedEvents = False
    Left = 208
    Top = 5
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 144
    Top = 16
  end
end
