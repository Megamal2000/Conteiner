object RegiaoPQ: TRegiaoPQ
  Left = 210
  Top = 113
  Width = 303
  Height = 302
  Caption = 'Procura por Regi'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 74
      Height = 13
      Caption = 'Procura Regi'#227'o'
    end
    object SpeedButton1: TSpeedButton
      Left = 256
      Top = 30
      Width = 24
      Height = 24
    end
    object edReg: TEdit
      Left = 104
      Top = 31
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'edReg'
      OnKeyPress = edRegKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 295
    Height = 179
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Regi'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL'
        Title.Caption = 'Localidade'
        Width = 58
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsReg
    Left = 256
    Top = 112
  end
end
