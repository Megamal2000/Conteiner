object WebEnv: TWebEnv
  Left = 245
  Top = 130
  BorderIcons = [biSystemMenu]
  Caption = 'Envia Notas para Web'
  ClientHeight = 478
  ClientWidth = 561
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
    Width = 561
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 18
      Width = 74
      Height = 13
      Caption = 'Data Romaneio'
    end
    object dtPesq: TDateTimePicker
      Left = 120
      Top = 16
      Width = 113
      Height = 21
      Date = 40776.371605532400000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40776.371605532400000000
      TabOrder = 0
    end
    object btAtual: TBitBtn
      Left = 248
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 1
      OnClick = btAtualClick
    end
    object btEnviar: TButton
      Left = 456
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Enviar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btEnviarClick
    end
    object num: TStaticText
      Left = 426
      Top = 22
      Width = 7
      Height = 17
      Alignment = taRightJustify
      Caption = '-'
      TabOrder = 3
    end
    object btEnviar2: TBitBtn
      Left = 375
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btEnviar2Click
    end
  end
  object Rodape: TStatusBar
    Left = 0
    Top = 460
    Width = 561
    Height = 18
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 65
    Width = 561
    Height = 295
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    TitleButtons = True
    TitleButtonAllowMove = True
    AlternateRowColor = 13889234
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSG'
        Title.Caption = 'Status'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIGCLI'
        Title.Caption = 'num Cli'
        Width = 63
        Visible = True
      end>
  end
  object RespMemo: TRichEdit
    Left = 0
    Top = 360
    Width = 561
    Height = 100
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'RespMemo')
    ParentFont = False
    TabOrder = 3
    Zoom = 100
  end
  object DataSource1: TDataSource
    DataSet = DM3.vcWeb
    Left = 488
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 104
    object Enviar1: TMenuItem
      Caption = 'Enviar UMA'
      OnClick = Enviar1Click
    end
    object EnviarSelecionadas1: TMenuItem
      Caption = 'Enviar Selecionadas'
      OnClick = EnviarSelecionadas1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Desmarcarselecionadas1: TMenuItem
      Caption = 'Desmarcar selecionadas'
      OnClick = Desmarcarselecionadas1Click
    end
  end
  object RESTClient1: TRESTClient
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    Left = 208
    Top = 232
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
    Top = 232
  end
  object RESTResponse1: TRESTResponse
    Left = 360
    Top = 232
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 232
  end
end
