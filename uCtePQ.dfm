object CtePQ: TCtePQ
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa CT-e'
  ClientHeight = 369
  ClientWidth = 586
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
    Width = 586
    Height = 51
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 78
      Height = 13
      Caption = 'N'#250'mero do CT-e'
    end
    object lbResp: TLabel
      Left = 296
      Top = 17
      Width = 257
      Height = 13
      AutoSize = False
      Caption = 'lbResp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNum: TEdit
      Left = 104
      Top = 14
      Width = 81
      Height = 21
      TabOrder = 0
      Text = 'edNum'
      OnKeyPress = edNumKeyPress
    end
    object btPesq: TBitBtn
      Left = 201
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesqClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 51
    Width = 586
    Height = 318
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 584
      Height = 72
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 23
        Height = 13
        Caption = 'CT-e'
      end
      object lbNum: TLabel
        Left = 48
        Top = 8
        Width = 35
        Height = 13
        Caption = 'lbNum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 153
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lbValor: TLabel
        Left = 192
        Top = 8
        Width = 39
        Height = 13
        Caption = 'lbValor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 27
        Width = 58
        Height = 13
        Caption = 'REMETENTE'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 75
        Height = 13
        Caption = 'DESTINAT'#193'RIO'
      end
      object lbCli: TLabel
        Left = 86
        Top = 27
        Width = 19
        Height = 13
        Caption = 'lbCli'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbDest: TLabel
        Left = 104
        Top = 48
        Width = 30
        Height = 13
        Caption = 'lbDest'
      end
      object Label13: TLabel
        Left = 280
        Top = 8
        Width = 42
        Height = 13
        Caption = 'Tipo Cob'
      end
      object lbTipoCob: TLabel
        Left = 328
        Top = 8
        Width = 47
        Height = 13
        Caption = 'lbTipoCob'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btCalc: TBitBtn
        Left = 463
        Top = 5
        Width = 105
        Height = 25
        Caption = 'Recalcular'
        TabOrder = 0
        OnClick = btCalcClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 177
      Width = 584
      Height = 140
      Align = alBottom
      TabOrder = 1
      object lbTotV: TLabel
        Left = 204
        Top = 2
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'lbTotV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbTotP: TLabel
        Left = 268
        Top = 2
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'lbTotP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lb1FreteP: TLabel
        Left = 16
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb2AdPeso: TLabel
        Left = 71
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb3AdValor: TLabel
        Left = 128
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb4Gris: TLabel
        Left = 189
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb5Pedagio: TLabel
        Left = 253
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb6Taxa: TLabel
        Left = 320
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb7Tde: TLabel
        Left = 392
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb8Pontos: TLabel
        Left = 456
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lb9Out: TLabel
        Left = 518
        Top = 48
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object lbTot: TLabel
        Left = 502
        Top = 79
        Width = 50
        Height = 19
        Alignment = taRightJustify
        Caption = '000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 0
        Top = 32
        Width = 56
        Height = 13
        Caption = 'Frete Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 67
        Top = 32
        Width = 39
        Height = 13
        Caption = 'Ad Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 126
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Ad Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 198
        Top = 32
        Width = 18
        Height = 13
        Caption = 'Gris'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 250
        Top = 32
        Width = 38
        Height = 13
        Caption = 'Ped'#225'gio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 307
        Top = 32
        Width = 50
        Height = 13
        Caption = 'Taxa CT-e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 405
        Top = 32
        Width = 19
        Height = 13
        Caption = 'TDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 456
        Top = 32
        Width = 33
        Height = 13
        Caption = 'Pontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 518
        Top = 32
        Width = 33
        Height = 13
        Caption = 'Outros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 422
        Top = 84
        Width = 53
        Height = 13
        Caption = 'Frete Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 19
        Top = 83
        Width = 23
        Height = 13
        Caption = 'Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbBase: TLabel
        Left = 62
        Top = 83
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
      end
      object Label8: TLabel
        Left = 123
        Top = 84
        Width = 36
        Height = 13
        Caption = 'Aliq(%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbAliq: TLabel
        Left = 163
        Top = 84
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
      end
      object Label10: TLabel
        Left = 215
        Top = 84
        Width = 25
        Height = 13
        Caption = 'ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbICMS: TLabel
        Left = 254
        Top = 84
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 112
        Width = 24
        Height = 13
        Caption = 'SubT'
      end
      object lbSomaSubt: TLabel
        Left = 62
        Top = 112
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 422
        Top = 112
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object lbSomaTot: TLabel
        Left = 512
        Top = 112
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = '000,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btEdita: TSpeedButton
        Left = 516
        Top = 4
        Width = 23
        Height = 22
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555500005577777777777777777500005000000000000000007500005088
          80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
          0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
          0F44F0750000508880FF0078088880750000508180F400007844807500005088
          80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
          0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
          00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
          55555555550BFFBB0000}
        OnClick = btEditaClick
      end
      object btSalva: TSpeedButton
        Left = 545
        Top = 4
        Width = 23
        Height = 22
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
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
        OnClick = btSalvaClick
      end
      object ed1FreteP: TJvValidateEdit
        Left = 1
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 0
        OnExit = ed1FretePExit
      end
      object ed2AdPeso: TJvValidateEdit
        Left = 63
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 1
        OnExit = ed1FretePExit
      end
      object ed3AdValor: TJvValidateEdit
        Left = 120
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 2
        OnExit = ed1FretePExit
      end
      object ed4Gris: TJvValidateEdit
        Left = 178
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 3
        OnExit = ed1FretePExit
      end
      object ed5Pedagio: TJvValidateEdit
        Left = 247
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 4
        OnExit = ed1FretePExit
      end
      object ed6Taxa: TJvValidateEdit
        Left = 307
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 5
        OnExit = ed1FretePExit
      end
      object ed7Tde: TJvValidateEdit
        Left = 374
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 6
        OnExit = ed1FretePExit
      end
      object ed8Pontos: TJvValidateEdit
        Left = 441
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 7
        OnExit = ed1FretePExit
      end
      object ed9Out: TJvValidateEdit
        Left = 507
        Top = 47
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 8
        OnExit = ed1FretePExit
      end
      object edBase: TJvValidateEdit
        Left = 47
        Top = 80
        Width = 59
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 9
        OnExit = edBaseExit
      end
      object edAliq: TJvValidateEdit
        Left = 163
        Top = 80
        Width = 40
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 1
        TabOrder = 10
      end
      object edICMS: TJvValidateEdit
        Left = 254
        Top = 80
        Width = 52
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 11
      end
      object edTot: TJvValidateEdit
        Left = 484
        Top = 80
        Width = 73
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 12
      end
    end
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 73
      Width = 584
      Height = 104
      Align = alClient
      DataSource = JvDataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = JvDBGrid1DblClick
      AlternateRowColor = clMoneyGreen
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMNF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Nota Fiscal'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIENF'
          Title.Caption = 'S'#233'rie'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO'
          Title.Caption = 'Peso'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CTEGRUPO'
          Title.Caption = 'Grupo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCONH'
          Title.Caption = 'Num CT-e'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 73
          Visible = True
        end>
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsNFcte
    Left = 400
    Top = 155
  end
end
