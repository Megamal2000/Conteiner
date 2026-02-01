object VisualEst: TVisualEst
  Left = 204
  Top = 103
  Width = 696
  Height = 480
  Caption = 'Visualiza o Estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 73
    Align = alTop
    Color = 13297644
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 96
      Top = 16
      Width = 505
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
    object Label2: TLabel
      Left = 24
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object lbProd: TLabel
      Left = 96
      Top = 40
      Width = 37
      Height = 13
      Caption = 'lbProd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 73
    Width = 688
    Height = 32
    Align = alTop
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 688
    Height = 348
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsEstM
    Left = 608
    Top = 40
  end
end
