object NFfora: TNFfora
  Left = 227
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Notas Fiscais que n'#227'o foram inclu'#237'das'
  ClientHeight = 320
  ClientWidth = 680
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
    Top = 80
    Width = 78
    Height = 13
    Caption = 'N'#250'mero da Nota'
  end
  object Label2: TLabel
    Left = 24
    Top = 112
    Width = 89
    Height = 13
    Caption = 'N'#250'mero do Evento'
  end
  object Label3: TLabel
    Left = 24
    Top = 144
    Width = 64
    Height = 13
    Caption = 'Complemento'
  end
  object Label4: TLabel
    Left = 24
    Top = 192
    Width = 100
    Height = 13
    Caption = 'Descri'#231#227'o do Evento'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 65
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label5: TLabel
      Left = 24
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Cliente '
    end
    object cbCli: TComboBox
      Left = 134
      Top = 18
      Width = 211
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '<Cliente>'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 255
    Width = 680
    Height = 65
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Nota Fiscal'
    end
    object Label7: TLabel
      Left = 24
      Top = 40
      Width = 48
      Height = 13
      Caption = 'Resultado'
    end
    object lbNota: TLabel
      Left = 88
      Top = 16
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbResp: TLabel
      Left = 88
      Top = 40
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object edNum: TEdit
    Left = 136
    Top = 77
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = edNumExit
    OnKeyPress = edNumKeyPress
  end
  object edEVn: TEdit
    Left = 136
    Top = 110
    Width = 121
    Height = 21
    TabOrder = 3
    OnExit = edEVnExit
    OnKeyPress = edEVnKeyPress
  end
  object edEVc: TEdit
    Left = 136
    Top = 141
    Width = 201
    Height = 21
    TabOrder = 4
    OnKeyPress = edEVcKeyPress
  end
  object edEVd: TEdit
    Left = 136
    Top = 186
    Width = 305
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object btInsere: TBitBtn
    Left = 136
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Salvar'
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFF000000FFFFFFFF00F8F8F800FFFFF08F8F8F8F870FFFF0F8F8F8F8F
      80FFF0F8F008F8F0F80FF08F08808F808F0FF0F808F80880F80FF08F0F8F800F
      8F0FFF08F8F8F8F8F0FFFF078F8F8F8F80FFFFF008F8F8F00FFFFFFFF000000F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 6
    OnClick = btInsereClick
  end
  object Lista: TListBox
    Left = 456
    Top = 70
    Width = 209
    Height = 185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
end
