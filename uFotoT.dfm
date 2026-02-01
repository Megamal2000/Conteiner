object FotoT: TFotoT
  Left = 9
  Top = 197
  Width = 941
  Height = 307
  BorderIcons = [biSystemMenu]
  Caption = 'Visualiza o Canhoto da Nota Fiscal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 254
    Width = 933
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 254
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 365
      Height = 37
      Caption = 'Figura n'#227'o encontrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object figura: TImage
      Left = 18
      Top = 16
      Width = 887
      Height = 177
      Stretch = True
    end
    object Bevel1: TBevel
      Left = 8
      Top = 9
      Width = 913
      Height = 200
    end
    object btMail: TBitBtn
      Left = 432
      Top = 220
      Width = 121
      Height = 25
      Caption = 'Enviar por e-mail'
      TabOrder = 0
      OnClick = btMailClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222222222222222222222222222222222222200000000000002288888888888
        880228B7B7B7B7B7B802280B7B7B7B7B080228B0B7B0B7B0B80228FB0B0B0B0B
        780228B7B0B7B0B7B80228FB0B7B7B0B780228B0B7B7B7B0B802280BFBFBFBFB
        0802288888888888882222222222222222222222222222222222}
    end
    object edMail: TEdit
      Left = 16
      Top = 222
      Width = 409
      Height = 21
      TabOrder = 1
    end
  end
end
