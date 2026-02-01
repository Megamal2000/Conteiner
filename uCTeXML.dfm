object CTeXML: TCTeXML
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'CTe - XML mensal'
  ClientHeight = 169
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Label3: TLabel
    Left = 26
    Top = 109
    Width = 164
    Height = 13
    Caption = 'Copiar para pasta C:\MZp\CteXML'
  end
  object cbCli: TComboBox
    Left = 80
    Top = 21
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'cbCli'
  end
  object cbMes: TComboBox
    Left = 80
    Top = 53
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'cbMes'
    Items.Strings = (
      'Janeiro'
      'Fevereiro'
      'Mar'#231'o'
      'Abril'
      'Maio'
      'Junho'
      'Julho'
      'Agosto'
      'Setembro'
      'Outubro'
      'Novembro'
      'Desembro')
  end
  object cbAno: TComboBox
    Left = 245
    Top = 53
    Width = 92
    Height = 21
    TabOrder = 2
    Text = 'cbAno'
    Items.Strings = (
      '2020'
      '2021'
      '2022'
      '2023'
      '2024'
      '2025'
      '2026'
      '2027'
      '2028'
      '2029'
      '2030'
      '2031'
      '2032'
      '2033'
      '2034'
      '2035'
      '2036'
      '2037'
      '2038'
      '2039'
      '2040')
  end
  object btCopiar: TBitBtn
    Left = 245
    Top = 104
    Width = 92
    Height = 25
    Hint = 'Copia somente XML enviados'
    Caption = 'Copiar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btCopiarClick
  end
  object pb: TProgressBar
    Left = 32
    Top = 136
    Width = 305
    Height = 17
    TabOrder = 4
  end
end
