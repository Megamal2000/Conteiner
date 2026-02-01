object ejAltQuant: TejAltQuant
  Left = 0
  Top = 0
  Caption = 'Ajustes - Altera Quantidade no Estoque'
  ClientHeight = 197
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 84
    Height = 13
    Caption = 'Tipo de Altera'#231#227'o'
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 84
    Height = 13
    Caption = 'Quantidade Atual'
  end
  object Label5: TLabel
    Left = 16
    Top = 128
    Width = 111
    Height = 13
    Caption = 'Quantidade Pretendida'
  end
  object lbQt: TLabel
    Left = 152
    Top = 104
    Width = 20
    Height = 13
    Caption = 'lbQt'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 65
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 64
      Top = 16
      Width = 23
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object lbProd: TLabel
      Left = 64
      Top = 35
      Width = 30
      Height = 13
      Caption = 'lbProd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object cbObs: TComboBox
    Left = 152
    Top = 77
    Width = 250
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = 'In'#237'cio do Estoque'
    Items.Strings = (
      'In'#237'cio do Estoque'
      'Perda - sumiu'
      'Perda - estragou / quebrou'
      'Corre'#231#227'o de lan'#231'amento'
      'Altera'#231#227'o de Pacote'
      'Invent'#225'rio')
  end
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 427
    Height = 50
    Align = alBottom
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    object btCancel: TBitBtn
      Left = 25
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Glyph.Data = {
        76030000424D76030000000000003600000028000000150000000D0000000100
        18000000000040030000330B0000330B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FFF7F7FFFFFFFFFFFFFFFFFFFFF4F4
        FFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE9E9FF4949FF5252FFE7E7FFFFFFFFC8C8FF3C3C
        FF6D6DFFFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF1F1FF4040FF0101FF8E8EFFF9F9FF5757FF0000
        FF7171FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8FF1111FF2222FF8E8EFF0E0EFF2222
        FFD5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF7070FF0000FF0707FF0101FF8E8E
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2FF1A1AFF0000FF2020FFE1E1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FFF0303FF0000FF0E0EFFB8B8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2FF2222FF1818FF3A3AFF0000FF4040
        FFEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9F9FF5A5AFF0000FF7171FFCFCFFF1B1BFF0303
        FF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEDEDFF3A3AFF2A2AFFD5D5FFFEFEFF8989FF0E0E
        FF5454FFF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFFDFDFFFFFFFFFFFFFFFF5F5FFD3D3
        FFE3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      TabOrder = 0
      OnClick = btCancelClick
    end
    object btAltera: TBitBtn
      Left = 327
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Alterar'
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000F0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
        FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
        FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
        00F0FFFFFFFFFFFFFFF0}
      TabOrder = 1
      OnClick = btAlteraClick
    end
  end
  object edQt: TJvValidateEdit
    Left = 152
    Top = 123
    Width = 49
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
