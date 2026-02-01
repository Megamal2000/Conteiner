object expEdi: TexpEdi
  Left = 247
  Top = 249
  Width = 410
  Height = 307
  BorderIcons = [biSystemMenu]
  Caption = 'Exporta EDI'
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
  object lbObs: TLabel
    Left = 160
    Top = 78
    Width = 27
    Height = 13
    Caption = 'lbObs'
  end
  object lbTarefa: TLabel
    Left = 24
    Top = 224
    Width = 48
    Height = 13
    Caption = 'lbTarefa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 160
    Top = 120
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 160
    Top = 158
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object cbCli: TComboBox
      Left = 64
      Top = 14
      Width = 217
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Text = 'cbCli'
    end
  end
  object btExporta: TBitBtn
    Left = 24
    Top = 72
    Width = 121
    Height = 25
    Caption = 'Exporta Ocorr'#234'ncias'
    TabOrder = 1
    OnClick = btExportaClick
  end
  object pb: TProgressBar
    Left = 24
    Top = 240
    Width = 345
    Height = 17
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 56
    Top = 184
    Width = 265
    Height = 25
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object btExpCon: TBitBtn
    Left = 24
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Exporta Conhecimento'
    TabOrder = 4
    OnClick = btExpConClick
  end
  object btExpCob: TBitBtn
    Left = 24
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Exporta Cobran'#231'a'
    TabOrder = 5
    OnClick = btExpCobClick
  end
end
