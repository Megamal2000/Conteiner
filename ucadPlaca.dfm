object cadPlaca: TcadPlaca
  Left = 201
  Top = 113
  Width = 340
  Height = 378
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Ve'#237'culo'
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
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Placa'
  end
  object lbPlaca: TLabel
    Left = 64
    Top = 16
    Width = 43
    Height = 13
    Caption = 'lbPlaca'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbModelo: TLabel
    Left = 72
    Top = 40
    Width = 52
    Height = 13
    Caption = 'lbModelo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  object Label3: TLabel
    Left = 184
    Top = 40
    Width = 16
    Height = 13
    Caption = 'Cor'
  end
  object lbCor: TLabel
    Left = 210
    Top = 40
    Width = 30
    Height = 13
    Caption = 'lbCor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lstCor: TListBox
    Left = 184
    Top = 64
    Width = 121
    Height = 225
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnClick = lstCorClick
  end
  object btGravar: TBitBtn
    Left = 56
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 1
    Kind = bkOK
  end
  object btCancel: TBitBtn
    Left = 232
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object lstModelo: TListBox
    Left = 24
    Top = 64
    Width = 145
    Height = 225
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    OnClick = lstModeloClick
  end
  object cbModelo: TComboBox
    Left = 16
    Top = 104
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbModelo'
    Visible = False
  end
  object cbCor: TComboBox
    Left = 152
    Top = 168
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbCor'
    Visible = False
  end
end
