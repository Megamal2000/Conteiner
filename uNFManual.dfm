object NfManual: TNfManual
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Entrada Manual de Notas Fiscais'
  ClientHeight = 414
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object cbCli: TComboBox
      Left = 80
      Top = 13
      Width = 361
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
    end
    object btIniciar: TBitBtn
      Left = 592
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 1
      OnClick = btIniciarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 720
    Height = 48
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Corrigir por'
    end
    object Bevel1: TBevel
      Left = 381
      Top = 10
      Width = 2
      Height = 31
    end
    object Bevel2: TBevel
      Left = 538
      Top = 8
      Width = 2
      Height = 31
    end
    object ckFaixa: TCheckBox
      Left = 96
      Top = 16
      Width = 106
      Height = 17
      Caption = 'In'#237'cio e fim da Nota'
      TabOrder = 0
      OnClick = ckFaixaClick
    end
    object ckNotas: TCheckBox
      Left = 394
      Top = 18
      Width = 97
      Height = 17
      Caption = 'Quant Notas'
      TabOrder = 1
      OnClick = ckNotasClick
    end
    object ckVol: TCheckBox
      Left = 546
      Top = 18
      Width = 97
      Height = 17
      Caption = 'Quant Volumes'
      TabOrder = 2
      OnClick = ckVolClick
    end
    object fInic: TJvValidateEdit
      Left = 216
      Top = 14
      Width = 49
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 3
    end
    object fFim: TJvValidateEdit
      Left = 288
      Top = 14
      Width = 49
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 4
    end
    object fNotas: TJvValidateEdit
      Left = 483
      Top = 16
      Width = 40
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 5
    end
    object fVols: TJvValidateEdit
      Left = 648
      Top = 16
      Width = 40
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 97
    Width = 720
    Height = 64
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 6
      Top = 30
      Width = 33
      Height = 19
      Caption = 'Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 158
      Top = 30
      Width = 54
      Height = 19
      Caption = 'Volume'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 358
      Top = 28
      Width = 28
      Height = 19
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edNota: TEdit
      Left = 49
      Top = 22
      Width = 93
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edNota'
      OnKeyPress = edNotaKeyPress
    end
    object edVol: TEdit
      Left = 220
      Top = 22
      Width = 93
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Edit5'
      OnKeyPress = edVolKeyPress
    end
    object edCEP: TEdit
      Left = 396
      Top = 22
      Width = 149
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Edit5'
      OnKeyPress = edCEPKeyPress
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 373
    Width = 720
    Height = 41
    Align = alBottom
    TabOrder = 3
    object lbErro: TLabel
      Left = 27
      Top = 12
      Width = 28
      Height = 13
      Caption = 'lbErro'
    end
    object btFim: TBitBtn
      Left = 584
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Grava e Limpa'
      TabOrder = 0
      OnClick = btFimClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 161
    Width = 720
    Height = 212
    Align = alClient
    DataSource = JvDataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AlternateRowColor = clSkyBlue
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ERRO'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mNNOTA'
        Title.Caption = 'Nota Fiscal'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mVOLUME'
        Title.Caption = 'Volumes'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mCEP'
        Title.Caption = 'CEP'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCli'
        Title.Caption = 'Nome Cliente'
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 448
    Top = 272
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'ERRO'
        DataType = ftSmallint
      end
      item
        Name = 'mNNOTA'
        DataType = ftInteger
      end
      item
        Name = 'mVOLUME'
        DataType = ftInteger
      end
      item
        Name = 'mCEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'mIDC'
        DataType = ftInteger
      end
      item
        Name = 'NomeCli'
        DataType = ftString
        Size = 40
      end>
    Left = 400
    Top = 272
    object TabERRO: TSmallintField
      FieldName = 'ERRO'
    end
    object TabmNNOTA: TIntegerField
      FieldName = 'mNNOTA'
    end
    object TabmVOLUME: TIntegerField
      FieldName = 'mVOLUME'
    end
    object TabmCEP: TStringField
      FieldName = 'mCEP'
      Size = 9
    end
    object TabmIDC: TIntegerField
      FieldName = 'mIDC'
    end
    object TabNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 40
    end
  end
end
