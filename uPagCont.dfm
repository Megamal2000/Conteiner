object PagCont: TPagCont
  Left = 226
  Top = 196
  BorderIcons = [biSystemMenu]
  Caption = 'Informa'#231#245'es para Pagamento - Contrato'
  ClientHeight = 189
  ClientWidth = 395
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
    Left = 32
    Top = 72
    Width = 61
    Height = 13
    Caption = 'Valor Mensal'
  end
  object Label3: TLabel
    Left = 32
    Top = 104
    Width = 50
    Height = 13
    Caption = 'Km Avulso'
  end
  object Label4: TLabel
    Left = 32
    Top = 136
    Width = 58
    Height = 13
    Caption = 'Hora Avulsa'
  end
  object Label1: TLabel
    Left = 32
    Top = 168
    Width = 32
    Height = 13
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 49
    Align = alTop
    Color = 13091017
    TabOrder = 0
    ExplicitWidth = 403
    object lbCli: TLabel
      Left = 16
      Top = 16
      Width = 361
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valores para C'#225'lculo de Pagamento de Funcion'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object vMensal: TJvValidateEdit
    Left = 112
    Top = 72
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 1
  end
  object vKM: TJvValidateEdit
    Left = 112
    Top = 104
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 2
  end
  object vHora: TJvValidateEdit
    Left = 112
    Top = 136
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    TabOrder = 3
  end
  object btSalvar: TBitBtn
    Left = 232
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Salvar'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777770000000000007770330770000330777033077000033077703307700003
      30777033000000033077703333333333307770330000000330777030FFFFFFF0
      30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
      8077777CCC777700007777CCC77777777777777C777777777777}
    TabOrder = 4
    OnClick = btSalvarClick
  end
end
