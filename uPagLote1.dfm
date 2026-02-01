object PagLote1: TPagLote1
  Left = 195
  Top = 214
  Width = 417
  Height = 143
  Caption = 'Criar Lote de Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 67
    Height = 13
    Caption = 'T'#237'tulo do Lote'
  end
  object edLote: TEdit
    Left = 128
    Top = 22
    Width = 233
    Height = 21
    MaxLength = 35
    TabOrder = 0
    Text = 'edLote'
  end
  object btOK: TBitBtn
    Left = 128
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btOKClick
  end
  object btCancel: TBitBtn
    Left = 280
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
end
