object stkCentral: TstkCentral
  Left = 272
  Top = 180
  Caption = 'Controle Central do Estoque'
  ClientHeight = 502
  ClientWidth = 723
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 483
    Width = 723
    Height = 19
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
    ExplicitTop = 487
    ExplicitWidth = 731
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 64
    Width = 723
    Height = 419
    Align = alClient
    AllowDelete = False
    AllowInsert = False
    Color = 7294993
    DataSource = JvDataSource1
    PanelHeight = 52
    PanelWidth = 706
    ParentColor = False
    TabOrder = 1
    RowCount = 8
    ExplicitTop = 145
    ExplicitWidth = 731
    ExplicitHeight = 342
    object DBText1: TDBText
      Left = 13
      Top = 11
      Width = 252
      Height = 17
      DataField = 'NOME'
      DataSource = JvDataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 272
      Top = 3
      Width = 2
      Height = 44
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitTop = 81
    ExplicitWidth = 731
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 723
    Height = 23
    Align = alTop
    TabOrder = 3
    ExplicitTop = 122
    ExplicitWidth = 731
    object Bevel2: TBevel
      Left = 273
      Top = 2
      Width = 1
      Height = 42
    end
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 56
      Height = 16
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsStokC
    Left = 624
    Top = 24
  end
end
