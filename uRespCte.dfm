object RespCte: TRespCte
  Left = 0
  Top = 0
  Caption = 'Responde Excel para CT-e'
  ClientHeight = 295
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 36
    Height = 13
    Caption = 'Planilha'
  end
  object Label3: TLabel
    Left = 16
    Top = 94
    Width = 158
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
  object lbCod: TLabel
    Left = 16
    Top = 159
    Width = 188
    Height = 13
    Caption = 'Coluna do C'#243'digo do Cliente (FLAYDEL)'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 49
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 33
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
      ParentFont = False
      Sorted = True
      TabOrder = 0
      Text = 'cbCli'
    end
  end
  object btPesq: TBitBtn
    Left = 16
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btPesqClick
  end
  object btCancela: TBitBtn
    Left = 240
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
  end
  object pb: TProgressBar
    Left = 8
    Top = 256
    Width = 297
    Height = 17
    TabOrder = 3
  end
  object Arquivo: TJvFilenameEdit
    Left = 64
    Top = 59
    Width = 249
    Height = 21
    Filter = 'Excel|*.xls|All files (*.*)|*.*'
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
      'O'
      'P'
      'Q'
      'R'
      'S'
      'T'
      'U'
      'V'
      'W'
      'X'
      'Y'
      'Z'
      'AA'
      'AB'
      'AC'
      'AD'
      'AE'
      'AF'
      'AG'
      'AH'
      'AI'
      'AJ'
      'AK'
      'AL'
      'AM'
      'AN'
      'AO'
      'AP'
      'AQ'
      'AR'
      'AS'
      'AT'
      'AU'
      'AV'
      'AW'
      'AX'
      'AY'
      'AZ')
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
      'O'
      'P'
      'Q'
      'R'
      'S'
      'T'
      'U'
      'V'
      'W'
      'X'
      'Y'
      'Z'
      'AA'
      'AB'
      'AC'
      'AD'
      'AE'
      'AF'
      'AG'
      'AH'
      'AI'
      'AJ'
      'AK'
      'AL'
      'AM'
      'AN'
      'AO'
      'AP'
      'AQ'
      'AR'
      'AS'
      'AT'
      'AU'
      'AV'
      'AW'
      'AX'
      'AY'
      'AZ')
  end
  object lbProc: TStaticText
    Left = 24
    Top = 237
    Width = 281
    Height = 17
    AutoSize = False
    Caption = 'lbProc'
    TabOrder = 7
  end
  object cbCodCli: TComboBox
    Left = 248
    Top = 157
    Width = 60
    Height = 21
    Style = csSimple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
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
      'O'
      'P'
      'Q'
      'R'
      'S'
      'T'
      'U'
      'V'
      'W'
      'X'
      'Y'
      'Z'
      'AA'
      'AB'
      'AC'
      'AD'
      'AE'
      'AF'
      'AG'
      'AH'
      'AI'
      'AJ'
      'AK'
      'AL'
      'AM'
      'AN'
      'AO'
      'AP'
      'AQ'
      'AR'
      'AS'
      'AT'
      'AU'
      'AV'
      'AW'
      'AX'
      'AY'
      'AZ')
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 120
    Top = 136
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'NumNF'
        DataType = ftInteger
      end
      item
        Name = 'Linha'
        DataType = ftInteger
      end
      item
        Name = 'Retorno'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'nCte'
        DataType = ftInteger
      end
      item
        Name = 'vFrete'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'vValor'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'vPeso'
        DataType = ftFloat
        Precision = 2
      end>
    Left = 152
    Top = 136
    object TabNumNF: TIntegerField
      FieldName = 'NumNF'
    end
    object TabLinha: TIntegerField
      FieldName = 'Linha'
    end
    object TabRetorno: TStringField
      FieldName = 'Retorno'
      Size = 55
    end
    object TabnCte: TIntegerField
      FieldName = 'nCte'
    end
    object TabvFrete: TFloatField
      FieldName = 'vFrete'
    end
    object TabvValor: TFloatField
      FieldName = 'vValor'
    end
    object TabvPeso: TFloatField
      FieldName = 'vPeso'
    end
  end
end
