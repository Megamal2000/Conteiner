object RespXL: TRespXL
  Left = 243
  Top = 113
  Width = 342
  Height = 275
  Caption = 'Responde Excel'
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
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Planilha'
  end
  object Label3: TLabel
    Left = 16
    Top = 94
    Width = 159
    Height = 13
    Caption = 'Coluna do N'#250'mero da Nota Fiscal'
  end
  object Label4: TLabel
    Left = 16
    Top = 128
    Width = 96
    Height = 13
    Caption = 'Coluna da Resposta'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object cbCli: TComboBox
      Left = 56
      Top = 13
      Width = 233
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Text = 'cbCli'
    end
  end
  object btPesq: TBitBtn
    Left = 16
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
  end
  object btCancela: TBitBtn
    Left = 240
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
  end
  object pb: TProgressBar
    Left = 16
    Top = 208
    Width = 297
    Height = 17
    TabOrder = 3
  end
  object Arquivo: TJvFilenameEdit
    Left = 64
    Top = 59
    Width = 249
    Height = 22
    TabOrder = 4
    Text = 'Arquivo'
  end
  object cbCol1: TComboBox
    Left = 248
    Top = 92
    Width = 60
    Height = 21
    Style = csSimple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 5
    Text = 'cbCol1'
    Items.Strings = (
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G'
      'H'
      'I'
      'J'
      'K'
      'L'
      'M'
      'N'
      'O')
  end
  object cbCol2: TComboBox
    Left = 248
    Top = 124
    Width = 60
    Height = 21
    Style = csSimple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 6
    Text = 'cbCol2'
    Items.Strings = (
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G'
      'H'
      'I'
      'J'
      'K'
      'L'
      'M'
      'N'
      'O')
  end
  object lbProc: TStaticText
    Left = 24
    Top = 189
    Width = 281
    Height = 17
    AutoSize = False
    Caption = 'lbProc'
    TabOrder = 7
  end
end
