object pagGrupo: TpagGrupo
  Left = 228
  Top = 110
  Width = 507
  Height = 208
  BorderIcons = []
  Caption = 'Grava Grupo de Pagamentos'
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
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Data Inicial '
  end
  object lbInic: TLabel
    Left = 104
    Top = 16
    Width = 32
    Height = 13
    Caption = 'lbInic'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 42
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object lbFim: TLabel
    Left = 104
    Top = 42
    Width = 30
    Height = 13
    Caption = 'lbFim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Ano: TLabel
    Left = 32
    Top = 72
    Width = 19
    Height = 13
    Caption = 'Ano'
  end
  object lbAno: TLabel
    Left = 105
    Top = 64
    Width = 50
    Height = 24
    Caption = 'lbAno'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 104
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object edDesc: TEdit
    Left = 103
    Top = 102
    Width = 282
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 0
  end
  object btSalvar: TBitBtn
    Left = 104
    Top = 136
    Width = 97
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btSalvarClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888888000088877777777777777778000088000000000000000778000080BF
      B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
      000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
      FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
      BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
      000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
      F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
      88888888888888880000}
  end
  object btCancelar: TBitBtn
    Left = 368
    Top = 136
    Width = 97
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelarClick
    Glyph.Data = {
      36010000424D3601000000000000760000002800000014000000100000000100
      040000000000C000000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777977777777
      7777977700007779977777777779777700007777977777777799777700007777
      990000000990077700007777799AAAAA99AA0777000077777999AA999AAA0777
      0000777777999999AAAA0777000077777709999AAAAA077700007777779999AA
      AAAA0777000077777999999AAAAA07770000777799999999AAAA077700007779
      999AAA9999000777000077999970007999777777000077999777777799977777
      0000777977777777799977770000777777777777779977770000}
  end
end
