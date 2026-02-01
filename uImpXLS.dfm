object ImpXLS: TImpXLS
  Left = 306
  Top = 131
  Caption = 'Importa Notas a partir do Excel'
  ClientHeight = 385
  ClientWidth = 661
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
  object Bevel1: TBevel
    Left = 128
    Top = 85
    Width = 121
    Height = 2
  end
  object Label1: TLabel
    Left = 136
    Top = 72
    Width = 77
    Height = 13
    Caption = 'Coluna do Excel'
  end
  object Label2: TLabel
    Left = 123
    Top = 339
    Width = 190
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 96
    Width = 69
    Height = 13
    Caption = 'N'#250'mero da NF'
  end
  object Label4: TLabel
    Left = 48
    Top = 128
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 48
    Top = 160
    Width = 24
    Height = 13
    Caption = 'Peso'
  end
  object Label6: TLabel
    Left = 48
    Top = 192
    Width = 35
    Height = 13
    Caption = 'Volume'
  end
  object Label7: TLabel
    Left = 48
    Top = 224
    Width = 21
    Height = 13
    Caption = 'CEP'
  end
  object Label8: TLabel
    Left = 48
    Top = 256
    Width = 52
    Height = 13
    Caption = 'Localidade'
  end
  object Label9: TLabel
    Left = 48
    Top = 288
    Width = 56
    Height = 13
    Caption = 'Destinat'#225'rio'
  end
  object Label10: TLabel
    Left = 488
    Top = 64
    Width = 129
    Height = 121
    AutoSize = False
    Caption = 
      'Usar 1a linha do Excel para t'#237'tulos.'#13#10#13#10'Tamanho m'#225'ximo de cada c' +
      'ampo texto '#233' administrado pelo importador.'#13#10#13#10'S'#243' importa Cliente' +
      ', Num e Valor diferentes.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label11: TLabel
    Left = 48
    Top = 319
    Width = 49
    Height = 13
    Caption = 'Dest Fone'
  end
  object Label12: TLabel
    Left = 272
    Top = 100
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label13: TLabel
    Left = 272
    Top = 132
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label14: TLabel
    Left = 272
    Top = 164
    Width = 64
    Height = 13
    Caption = 'Complemento'
  end
  object Label15: TLabel
    Left = 272
    Top = 196
    Width = 27
    Height = 13
    Caption = 'Bairro'
  end
  object Label16: TLabel
    Left = 272
    Top = 228
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label17: TLabel
    Left = 272
    Top = 260
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label18: TLabel
    Left = 488
    Top = 192
    Width = 75
    Height = 13
    Caption = 'N'#227'o Importadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 272
    Top = 293
    Width = 48
    Height = 13
    Caption = 'Dest DOC'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 661
    Height = 57
    Align = alTop
    TabOrder = 0
    object lbCli: TLabel
      Left = 32
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbCli: TComboBox
      Left = 88
      Top = 22
      Width = 409
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'cbCli'
    end
  end
  object Edit1: TEdit
    Left = 160
    Top = 94
    Width = 49
    Height = 21
    TabOrder = 1
    Text = 'A'
  end
  object Edit2: TEdit
    Left = 160
    Top = 126
    Width = 49
    Height = 21
    TabOrder = 2
    Text = 'B'
  end
  object Edit3: TEdit
    Left = 160
    Top = 158
    Width = 49
    Height = 21
    TabOrder = 3
    Text = 'C'
  end
  object Edit4: TEdit
    Left = 160
    Top = 190
    Width = 49
    Height = 21
    TabOrder = 4
    Text = 'D'
  end
  object Edit5: TEdit
    Left = 160
    Top = 222
    Width = 49
    Height = 21
    TabOrder = 5
    Text = 'E'
  end
  object Edit6: TEdit
    Left = 160
    Top = 254
    Width = 49
    Height = 21
    TabOrder = 6
    Text = 'F'
  end
  object btImportar: TBitBtn
    Left = 32
    Top = 351
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 7
    OnClick = btImportarClick
  end
  object PBnotas: TProgressBar
    Left = 120
    Top = 354
    Width = 433
    Height = 17
    TabOrder = 8
  end
  object Edit7: TEdit
    Left = 160
    Top = 286
    Width = 49
    Height = 21
    TabOrder = 9
  end
  object btParar: TBitBtn
    Left = 576
    Top = 352
    Width = 75
    Height = 25
    Caption = 'btParar'
    TabOrder = 10
    Visible = False
  end
  object Edit8: TEdit
    Left = 160
    Top = 317
    Width = 49
    Height = 21
    TabOrder = 11
  end
  object Edit9: TEdit
    Left = 384
    Top = 98
    Width = 49
    Height = 21
    TabOrder = 12
  end
  object Edit10: TEdit
    Left = 384
    Top = 130
    Width = 49
    Height = 21
    TabOrder = 13
  end
  object Edit11: TEdit
    Left = 384
    Top = 162
    Width = 49
    Height = 21
    TabOrder = 14
  end
  object Edit12: TEdit
    Left = 384
    Top = 194
    Width = 49
    Height = 21
    TabOrder = 15
  end
  object Edit13: TEdit
    Left = 384
    Top = 226
    Width = 49
    Height = 21
    TabOrder = 16
  end
  object Edit14: TEdit
    Left = 384
    Top = 258
    Width = 49
    Height = 21
    TabOrder = 17
  end
  object LibNao: TListBox
    Left = 488
    Top = 208
    Width = 121
    Height = 137
    ItemHeight = 13
    TabOrder = 19
  end
  object edDOCD: TEdit
    Left = 384
    Top = 291
    Width = 49
    Height = 21
    TabOrder = 18
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 64
  end
end
