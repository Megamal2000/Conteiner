object OcorrePQ: TOcorrePQ
  Left = 140
  Top = 152
  BorderIcons = [biSystemMenu]
  Caption = 'Procura Ocorr'#234'ncia'
  ClientHeight = 230
  ClientWidth = 474
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
  object Label1: TLabel
    Left = 24
    Top = 19
    Width = 12
    Height = 13
    Caption = 'N'#186
  end
  object Bevel1: TBevel
    Left = 8
    Top = 48
    Width = 465
    Height = 3
  end
  object Label2: TLabel
    Left = 104
    Top = 19
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object edNum: TJvValidateEdit
    Left = 48
    Top = 16
    Width = 41
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edNumKeyPress
  end
  object edDesc: TEdit
    Left = 160
    Top = 16
    Width = 193
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'edDesc'
    OnKeyPress = edDescKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 465
    Height = 161
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Descri'#231#227'o da Ocorr'#234'ncia'
        Visible = True
      end>
  end
  object btOK: TBitBtn
    Left = 376
    Top = 16
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btOKClick
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsOc
    Left = 408
    Top = 88
  end
end
