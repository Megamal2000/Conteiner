object EnviaRest: TEnviaRest
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Envia Informa'#231#245'es para WEB'
  ClientHeight = 114
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbQual: TStaticText
    Left = 29
    Top = 21
    Width = 42
    Height = 18
    Caption = 'lbQual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object lbProg: TStaticText
    Left = 29
    Top = 51
    Width = 34
    Height = 17
    Caption = 'lbProg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object pb: TProgressBar
    Left = 24
    Top = 74
    Width = 369
    Height = 17
    TabOrder = 2
  end
  object StaticText1: TStaticText
    Left = 29
    Top = 95
    Width = 364
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 3
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 208
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
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    Timeout = 300000
    SynchronizedEvents = False
    Left = 280
    Top = 5
  end
  object RESTResponse1: TRESTResponse
    Left = 360
    Top = 5
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 144
    Top = 16
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://localhost:2902/api/Sac/1990'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 72
    Top = 16
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient2
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 80
    Top = 24
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 88
    Top = 32
  end
end
