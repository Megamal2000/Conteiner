object PagNota: TPagNota
  Left = 244
  Top = 114
  Caption = 'Informa'#231#245'es para Pagamento - por Nota'
  ClientHeight = 296
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
  object Panel1: TPanel
    Left = 16
    Top = 24
    Width = 209
    Height = 193
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 8
      Width = 14
      Height = 13
      Caption = 'SP'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 24
      Width = 193
      Height = 2
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label3: TLabel
      Left = 84
      Top = 32
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object Label4: TLabel
      Left = 144
      Top = 32
      Width = 42
      Height = 13
      Caption = 'Ajudante'
    end
    object Label5: TLabel
      Left = 16
      Top = 96
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label6: TLabel
      Left = 16
      Top = 128
      Width = 43
      Height = 13
      Caption = 'acima de'
    end
    object Label7: TLabel
      Left = 16
      Top = 160
      Width = 50
      Height = 13
      Caption = 'Nota Extra'
    end
    object qN1: TJvValidateEdit
      Left = 37
      Top = 62
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
      OnExit = qN1Exit
    end
    object vM1: TJvValidateEdit
      Left = 84
      Top = 62
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object vA1: TJvValidateEdit
      Left = 143
      Top = 62
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
    end
    object qN2: TJvValidateEdit
      Left = 37
      Top = 94
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 3
      OnExit = qN2Exit
    end
    object vM2: TJvValidateEdit
      Left = 84
      Top = 94
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object vA2: TJvValidateEdit
      Left = 143
      Top = 94
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 5
    end
    object vEx: TJvValidateEdit
      Left = 84
      Top = 158
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object vM3: TJvValidateEdit
      Left = 84
      Top = 126
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object vA3: TJvValidateEdit
      Left = 143
      Top = 126
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 240
    Top = 24
    Width = 209
    Height = 193
    TabOrder = 1
    object Label8: TLabel
      Left = 96
      Top = 8
      Width = 22
      Height = 13
      Caption = 'GSP'
    end
    object Bevel2: TBevel
      Left = 8
      Top = 24
      Width = 193
      Height = 2
    end
    object Label9: TLabel
      Left = 16
      Top = 64
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label10: TLabel
      Left = 84
      Top = 32
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object Label11: TLabel
      Left = 144
      Top = 32
      Width = 42
      Height = 13
      Caption = 'Ajudante'
    end
    object Label12: TLabel
      Left = 16
      Top = 96
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label13: TLabel
      Left = 16
      Top = 128
      Width = 43
      Height = 13
      Caption = 'acima de'
    end
    object Label14: TLabel
      Left = 16
      Top = 160
      Width = 50
      Height = 13
      Caption = 'Nota Extra'
    end
    object gN1: TJvValidateEdit
      Left = 37
      Top = 62
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
    end
    object gM1: TJvValidateEdit
      Left = 84
      Top = 62
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object gA1: TJvValidateEdit
      Left = 143
      Top = 62
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
    end
    object gN2: TJvValidateEdit
      Left = 37
      Top = 94
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 3
      OnExit = gN2Exit
    end
    object gM2: TJvValidateEdit
      Left = 84
      Top = 94
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object gA2: TJvValidateEdit
      Left = 143
      Top = 94
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 5
    end
    object gEx: TJvValidateEdit
      Left = 84
      Top = 158
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object gM3: TJvValidateEdit
      Left = 84
      Top = 126
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object gA3: TJvValidateEdit
      Left = 143
      Top = 126
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 7
    end
  end
  object Panel3: TPanel
    Left = 464
    Top = 24
    Width = 209
    Height = 193
    TabOrder = 2
    object Label15: TLabel
      Left = 96
      Top = 8
      Width = 18
      Height = 13
      Caption = 'INT'
    end
    object Bevel3: TBevel
      Left = 8
      Top = 24
      Width = 193
      Height = 2
    end
    object Label16: TLabel
      Left = 16
      Top = 64
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label17: TLabel
      Left = 84
      Top = 32
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object Label18: TLabel
      Left = 144
      Top = 32
      Width = 42
      Height = 13
      Caption = 'Ajudante'
    end
    object Label19: TLabel
      Left = 16
      Top = 96
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label20: TLabel
      Left = 16
      Top = 128
      Width = 43
      Height = 13
      Caption = 'acima de'
    end
    object Label21: TLabel
      Left = 16
      Top = 160
      Width = 50
      Height = 13
      Caption = 'Nota Extra'
    end
    object iN1: TJvValidateEdit
      Left = 37
      Top = 62
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
    end
    object iM1: TJvValidateEdit
      Left = 84
      Top = 62
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object iA1: TJvValidateEdit
      Left = 143
      Top = 62
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 2
    end
    object iN2: TJvValidateEdit
      Left = 37
      Top = 94
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 3
      OnExit = iN2Exit
    end
    object iM2: TJvValidateEdit
      Left = 84
      Top = 94
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object iA2: TJvValidateEdit
      Left = 143
      Top = 94
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 5
    end
    object iEx: TJvValidateEdit
      Left = 84
      Top = 158
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object iM3: TJvValidateEdit
      Left = 84
      Top = 126
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object iA3: TJvValidateEdit
      Left = 143
      Top = 126
      Width = 44
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 7
    end
  end
  object btSalvar: TBitBtn
    Left = 528
    Top = 248
    Width = 105
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btSalvarClick
  end
end
