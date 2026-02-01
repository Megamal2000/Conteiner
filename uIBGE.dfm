object IBGE: TIBGE
  Left = 228
  Top = 113
  Caption = 'IBGE'
  ClientHeight = 272
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 162
      Height = 13
      Caption = 'Digite parte do nome do munic'#237'pio'
    end
    object edPesq: TEdit
      Left = 200
      Top = 22
      Width = 137
      Height = 21
      TabOrder = 0
      OnKeyDown = edPesqKeyDown
    end
    object btProcura: TBitBtn
      Left = 352
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
      TabOrder = 1
      OnClick = btProcuraClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 438
    Height = 215
    Align = alClient
    DataSource = DataSource1
    FixedColor = 12615680
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MUNIC'
        Title.Caption = 'Munic'#237'pio'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CMUN'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsIBGE
    Left = 24
    Top = 40
  end
end
