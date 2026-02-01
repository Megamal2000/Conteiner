object RespXL: TRespXL
  Left = 225
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  Caption = 'Responde Excel'
  ClientHeight = 323
  ClientWidth = 326
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
    Left = 16
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Planilha'
  end
  object Label3: TLabel
    Left = 16
    Top = 125
    Width = 216
    Height = 13
    Caption = 'Coluna do N'#250'mero da Nota Fiscal (ou Pedido)'
  end
  object Label4: TLabel
    Left = 16
    Top = 159
    Width = 96
    Height = 13
    Caption = 'Coluna da Resposta'
  end
  object lbCod: TLabel
    Left = 16
    Top = 190
    Width = 190
    Height = 13
    Caption = 'Coluna do C'#243'digo do Cliente (FLAYDEL)'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 49
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 32
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
      OnChange = cbCliChange
    end
  end
  object btPesq: TBitBtn
    Left = 13
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btPesqClick
  end
  object btCancela: TBitBtn
    Left = 237
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelaClick
  end
  object pb: TProgressBar
    Left = 13
    Top = 296
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
    Top = 123
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
    Top = 155
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
    Left = 21
    Top = 277
    Width = 281
    Height = 17
    AutoSize = False
    Caption = 'lbProc'
    TabOrder = 7
  end
  object JvDBUltimGrid1: TJvDBUltimGrid
    Left = 109
    Top = 236
    Width = 104
    Height = 149
    DataSource = JvDataSource1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NumNF'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Linha'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Retorno'
        Width = 152
        Visible = True
      end>
  end
  object cbCodCli: TComboBox
    Left = 248
    Top = 188
    Width = 60
    Height = 21
    Style = csSimple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
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
  object ckPedido: TCheckBox
    Left = 16
    Top = 88
    Width = 190
    Height = 17
    Caption = 'Procurar pelo n'#250'mero do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = ckPedidoClick
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 120
    Top = 248
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
        Name = 'DataEnt'
        DataType = ftDate
      end
      item
        Name = 'vFrete'
        DataType = ftFloat
      end>
    Left = 184
    Top = 248
    object TabNumNF: TIntegerField
      FieldName = 'NumNF'
    end
    object TabLinha: TIntegerField
      FieldName = 'Linha'
    end
    object TabRetorno: TStringField
      FieldName = 'Retorno'
      Size = 40
    end
    object TabDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object TabvFrete: TFloatField
      FieldName = 'vFrete'
    end
  end
end
