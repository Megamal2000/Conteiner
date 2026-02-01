object FTtaxa: TFTtaxa
  Left = 243
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Taxa %'
  ClientHeight = 339
  ClientWidth = 516
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
    Left = 24
    Top = 104
    Width = 73
    Height = 13
    Caption = 'Capital Taxa % '
  end
  object Label3: TLabel
    Left = 24
    Top = 136
    Width = 70
    Height = 13
    Caption = 'Capital M'#237'nimo'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 160
    Width = 465
    Height = 2
  end
  object Label4: TLabel
    Left = 24
    Top = 184
    Width = 63
    Height = 13
    Caption = 'GSP Taxa % '
  end
  object Label5: TLabel
    Left = 24
    Top = 216
    Width = 60
    Height = 13
    Caption = 'GSP M'#237'nimo'
  end
  object Bevel2: TBevel
    Left = 16
    Top = 240
    Width = 465
    Height = 2
  end
  object Label6: TLabel
    Left = 24
    Top = 256
    Width = 73
    Height = 13
    Caption = 'Interior Taxa % '
  end
  object Label7: TLabel
    Left = 24
    Top = 288
    Width = 70
    Height = 13
    Caption = 'Interior M'#237'nimo'
  end
  object Bevel3: TBevel
    Left = 16
    Top = 312
    Width = 465
    Height = 2
  end
  object lbmsg: TLabel
    Left = 331
    Top = 320
    Width = 5
    Height = 13
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 256
    Top = 104
    Width = 79
    Height = 13
    Caption = 'Interior2 Taxa % '
  end
  object Label9: TLabel
    Left = 256
    Top = 136
    Width = 76
    Height = 13
    Caption = 'Interior2 M'#237'nimo'
  end
  object Label10: TLabel
    Left = 256
    Top = 184
    Width = 90
    Height = 13
    Caption = 'O Estados Taxa % '
  end
  object Label11: TLabel
    Left = 256
    Top = 216
    Width = 87
    Height = 13
    Caption = 'O Estados M'#237'nimo'
  end
  object Label12: TLabel
    Left = 256
    Top = 256
    Width = 72
    Height = 13
    Caption = 'Outros Taxa % '
  end
  object Label13: TLabel
    Left = 256
    Top = 288
    Width = 69
    Height = 13
    Caption = 'Outros M'#237'nimo'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 524
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 80
      Top = 16
      Width = 25
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 516
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    ExplicitWidth = 524
    object btSalvar: TBitBtn
      Left = 293
      Top = 8
      Width = 25
      Height = 25
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      TabOrder = 0
      OnClick = btSalvarClick
    end
  end
  object cap_p: TJvValidateEdit
    Left = 112
    Top = 101
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 2
    OnEnter = cap_pEnter
  end
  object cap_m: TJvValidateEdit
    Left = 112
    Top = 133
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 3
    OnEnter = cap_mEnter
  end
  object gsp_p: TJvValidateEdit
    Left = 112
    Top = 181
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 4
    OnEnter = gsp_pEnter
  end
  object gsp_m: TJvValidateEdit
    Left = 112
    Top = 213
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 5
    OnEnter = gsp_mEnter
  end
  object int_p: TJvValidateEdit
    Left = 112
    Top = 253
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 6
    OnEnter = int_pEnter
  end
  object int_m: TJvValidateEdit
    Left = 112
    Top = 285
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 7
    OnEnter = int_mEnter
  end
  object int2_p: TJvValidateEdit
    Left = 344
    Top = 101
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 8
    OnEnter = cap_pEnter
  end
  object int2_m: TJvValidateEdit
    Left = 344
    Top = 133
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 9
    OnEnter = cap_mEnter
  end
  object oest_p: TJvValidateEdit
    Left = 344
    Top = 181
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 10
    OnEnter = cap_pEnter
  end
  object oest_m: TJvValidateEdit
    Left = 344
    Top = 213
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 11
    OnEnter = cap_mEnter
  end
  object out_p: TJvValidateEdit
    Left = 344
    Top = 253
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 12
    OnEnter = cap_pEnter
  end
  object out_m: TJvValidateEdit
    Left = 344
    Top = 285
    Width = 81
    Height = 21
    Flat = False
    ParentFlat = False
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 2
    EditText = '0'
    TabOrder = 13
    OnEnter = cap_mEnter
  end
end
