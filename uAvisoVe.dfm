object avisoVe: TavisoVe
  Left = 615
  Top = 143
  BorderIcons = [biSystemMenu]
  Caption = 'Central de Avisos'
  ClientHeight = 502
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvGradient1: TJvGradient
    Left = 0
    Top = 0
    Width = 314
    Height = 502
    ExplicitWidth = 322
    ExplicitHeight = 506
  end
  object Label1: TLabel
    Left = 32
    Top = 472
    Width = 104
    Height = 13
    Caption = 'Quantidade de Avisos'
    Transparent = True
  end
  object Label2: TLabel
    Left = 152
    Top = 472
    Width = 8
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Titulo: TJvGradientHeaderPanel
    Left = 16
    Top = 8
    Width = 285
    Height = 30
    GradientStyle = grHorizontal
    LabelCaption = 'Data'
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelAlignment = taLeftJustify
    TabOrder = 0
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 19
    Top = 44
    Width = 283
    Height = 410
    Color = clGradientActiveCaption
    DataSource = DataSource1
    PanelHeight = 82
    PanelWidth = 266
    ParentColor = False
    TabOrder = 1
    RowCount = 5
    object DBText1: TDBText
      Left = 16
      Top = 8
      Width = 129
      Height = 17
      DataField = 'DT'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 16
      Top = 24
      Width = 233
      Height = 33
      DataField = 'DESCR'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object DBText3: TDBText
      Left = 176
      Top = 8
      Width = 65
      Height = 17
      Alignment = taRightJustify
      DataField = 'VALORPREV'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pOk: TPanel
      Left = 21
      Top = 61
      Width = 70
      Height = 17
      Caption = 'Ok'
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = pOkClick
    end
    object pCancela: TPanel
      Left = 177
      Top = 61
      Width = 70
      Height = 17
      Caption = 'Cancela'
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = DM4.cdsAvisoM
    Left = 8
    Top = 184
  end
end
