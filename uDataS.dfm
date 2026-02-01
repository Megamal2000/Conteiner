object DataS: TDataS
  Left = 329
  Top = 237
  Width = 370
  Height = 154
  Caption = 'Data Padr'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 78
    Height = 13
    Caption = 'Data do Sistema'
  end
  object Bevel1: TBevel
    Left = 24
    Top = 8
    Width = 313
    Height = 57
  end
  object dtSis: TDateTimePicker
    Left = 160
    Top = 24
    Width = 137
    Height = 21
    Date = 40799.665836226850000000
    Format = 'dd/MM/yyyy ddd'
    Time = 40799.665836226850000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
