object PagFunc: TPagFunc
  Left = 293
  Top = 152
  BorderIcons = [biSystemMenu]
  Caption = 'Pagamento de Motoristas - Personalizado [ENTREGAS]'
  ClientHeight = 435
  ClientWidth = 763
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
  object Panel4: TPanel
    Left = 0
    Top = 49
    Width = 481
    Height = 386
    Align = alLeft
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 479
      Height = 96
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 24
        Top = 8
        Width = 135
        Height = 13
        Caption = 'Dentro da Faixa de Entregas'
      end
      object Label3: TLabel
        Left = 24
        Top = 40
        Width = 27
        Height = 13
        Caption = 'In'#237'cio'
      end
      object Label4: TLabel
        Left = 24
        Top = 64
        Width = 16
        Height = 13
        Caption = 'Fim'
      end
      object Label5: TLabel
        Left = 169
        Top = 40
        Width = 70
        Height = 13
        Caption = 'Valor Motorista'
      end
      object Label6: TLabel
        Left = 169
        Top = 64
        Width = 69
        Height = 13
        Caption = 'Valor Ajudante'
      end
      object brDelPg1: TSpeedButton
        Left = 435
        Top = 64
        Width = 25
        Height = 26
        Hint = 'Apagar Faixa'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777771F77771F7777777777777111F777777
          1F7777111F777771F777777111F77711F7777777111F711F77777777711111F7
          7777777777111F7777777777711111F777777777111F71F77777771111F77711
          F77771111F7777711F77711F7777777711F77777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = brDelPg1Click
      end
      object vInicio: TJvValidateEdit
        Left = 71
        Top = 38
        Width = 73
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
        OnKeyPress = vInicioKeyPress
      end
      object vFim: TJvValidateEdit
        Left = 71
        Top = 63
        Width = 73
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 1
        OnKeyPress = vFimKeyPress
      end
      object vFXmot: TJvValidateEdit
        Left = 249
        Top = 38
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 2
        OnKeyPress = vFXmotKeyPress
      end
      object vFXajud: TJvValidateEdit
        Left = 249
        Top = 63
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 3
        OnKeyPress = vFXajudKeyPress
      end
      object btSalvar1: TBitBtn
        Left = 385
        Top = 36
        Width = 75
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
        OnClick = btSalvar1Click
      end
      object btNovo: TBitBtn
        Left = 385
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Novo'
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777770000000777770000000000770000000777770FFFFFFFF07700000007777
          70F000000F0770000000777770FFFFFFFF0770000000777770F000000F077000
          0000777770FFFFFFFF07700000007F778FF000000F077000000078778BFFFFFF
          FF0770000000777F8F8000F00007700000007888FB7FFFF0F077700000007FB8
          BFBFBFB0077770000000778B8B8B000077777000000078B78F78B77777777000
          00007B778B778F7777777000000077778F777777777770000000777777777777
          777770000000}
        TabOrder = 5
        OnClick = btNovoClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 97
      Width = 479
      Height = 123
      Align = alTop
      Color = clMedGray
      TabOrder = 1
      object Label7: TLabel
        Left = 24
        Top = 7
        Width = 44
        Height = 13
        Caption = 'Acima de'
      end
      object Label8: TLabel
        Left = 169
        Top = 39
        Width = 70
        Height = 13
        Caption = 'Valor Motorista'
      end
      object Label9: TLabel
        Left = 169
        Top = 63
        Width = 69
        Height = 13
        Caption = 'Valor Ajudante'
      end
      object Label10: TLabel
        Left = 169
        Top = 87
        Width = 50
        Height = 13
        Caption = 'Nota Extra'
      end
      object Label11: TLabel
        Left = 24
        Top = 41
        Width = 35
        Height = 13
        Caption = 'M'#237'nimo'
      end
      object Bevel2: TBevel
        Left = 20
        Top = 29
        Width = 350
        Height = 2
      end
      object lbQt1: TLabel
        Left = 445
        Top = 104
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'lbQt1'
      end
      object vAcima: TJvValidateEdit
        Left = 72
        Top = 7
        Width = 73
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
        OnKeyPress = vAcimaKeyPress
      end
      object vACmot: TJvValidateEdit
        Left = 249
        Top = 39
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 1
        OnKeyPress = vACmotKeyPress
      end
      object vACajud: TJvValidateEdit
        Left = 249
        Top = 63
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 2
        OnKeyPress = vACajudKeyPress
      end
      object vACntx: TJvValidateEdit
        Left = 249
        Top = 87
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 3
        OnKeyPress = vACntxKeyPress
      end
      object btSalvar2: TBitBtn
        Left = 385
        Top = 39
        Width = 75
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
        OnClick = btSalvar2Click
      end
      object vMinimo: TJvValidateEdit
        Left = 72
        Top = 37
        Width = 73
        Height = 21
        Hint = 'Deixe Zero para n'#227'o utilizar valor m'#237'nimo'
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyPress = vAcimaKeyPress
      end
      object ckUtilPeso: TCheckBox
        Left = 168
        Top = 8
        Width = 193
        Height = 17
        Caption = 'Utilizar Peso no C'#225'lculo Adicional'
        TabOrder = 6
      end
    end
    object JvDBGrid1: TJvDBGrid
      Left = 1
      Top = 220
      Width = 479
      Height = 165
      Align = alClient
      DataSource = JvDataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = JvDBGrid1CellClick
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
          FieldName = 'INICIO'
          Title.Caption = 'In'#237'cio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIM'
          Title.Caption = 'Fim'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORMOT'
          Title.Caption = 'vlr Motorista'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORAJUD'
          Title.Caption = 'vlr Ajudante'
          Width = 77
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 49
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object lbMot: TLabel
      Left = 80
      Top = 16
      Width = 32
      Height = 13
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbLocal: TComboBox
      Left = 300
      Top = 13
      Width = 161
      Height = 21
      TabOrder = 0
      Text = 'cbLocal'
      OnCloseUp = cbLocalCloseUp
      Items.Strings = (
        'SP - Capital'
        'GSP - Grande S'#227'o Paulo'
        'INT - Interior'
        'INT2 - Interior 2'
        'OEST - Outros Estados'
        'OUT - Outros'
        '')
    end
    object btCopiar: TBitBtn
      Left = 671
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Copiar de ...'
      TabOrder = 1
      OnClick = btCopiarClick
    end
  end
  object Panel5: TPanel
    Left = 481
    Top = 49
    Width = 282
    Height = 386
    Align = alClient
    TabOrder = 2
    object Label12: TLabel
      Left = 21
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Peso'
    end
    object Label13: TLabel
      Left = 21
      Top = 38
      Width = 233
      Height = 57
      AutoSize = False
      Caption = 
        'Ap'#243's limite de Entregas utilizar faixa de Peso para calcular val' +
        'or das entregas. Usar ordem decrescente de Peso e calcular as en' +
        'tregas excedentes por faixa de Peso.  (set/21)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Label14: TLabel
      Left = 24
      Top = 99
      Width = 48
      Height = 13
      Caption = 'A partir de'
    end
    object lbLimite: TLabel
      Left = 80
      Top = 99
      Width = 44
      Height = 13
      Caption = 'lbLimite'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 22
      Top = 117
      Width = 219
      Height = 86
    end
    object Label15: TLabel
      Left = 37
      Top = 127
      Width = 27
      Height = 13
      Caption = 'In'#237'cio'
    end
    object Label16: TLabel
      Left = 37
      Top = 152
      Width = 16
      Height = 13
      Caption = 'Fim'
    end
    object Label17: TLabel
      Left = 37
      Top = 176
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object btPesoN: TSpeedButton
      Left = 176
      Top = 128
      Width = 23
      Height = 22
      Hint = 'Inserir Nova'
      Glyph.Data = {
        62050000424D62050000000000003604000028000000140000000F0000000100
        0800000000002C01000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
        A400FFFBF0008080400000FF800000404000A4C8F0000080FF00A0A0A4000040
        8000FF0080004000800080400000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000FFFFFF
        FFFFFFFFFFFF00FAFAFAFAFAFAFAFAFA00FFFFFFFFFFFFFFFFFF00FAFAFAFAFA
        FAFAFAFA00FFFFFFFFFFFFFFFFFF00FAFAFAFA00FAFAFAFA00FFFFFFFFFFFFFF
        FFFF00FAFAFAFA00FAFAFAFA00FFFFFFFFFFFFFFFFFF00FAFAFAFA00FAFAFAFA
        00FFFFFFFFFFFFFFFFFF00FA00000000000000FA00FFFFFFFFFFFFFFFFFF00FA
        FAFAFA00FAFAFAFA00FFFFFFFFFFFFFFFFFF00FAFAFAFA00FAFAFAFA00FFFFFF
        FFFFFFFFFFFF00FAFAFAFA00FA00000000FFFFFFFFFFFFFFFFFF00FAFAFAFAFA
        FA000000FFFFFFFFFFFFFFFFFFFF00FAFAFAFAFAFA0000FFFFFFFFFFFFFFFFFF
        FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btPesoNClick
    end
    object btPesoS: TSpeedButton
      Left = 176
      Top = 152
      Width = 23
      Height = 22
      Hint = 'Salvar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF5AFFFFF
        0000000000000FFFF5AFFFF08B000000880B0FFF55FAFFF0B800000088080FFF
        55FAFFF08B000000880B0FFFFFFFFFF0B800000000080FFFFFFFFFF08B8B8B8B
        8B8B0FFFFFFFFFF0B800000000B80FFFFFFFFFF080888888880B0FFFFFFFFFF0
        B088888888080FFFFFFFFFF080888888880B0FFFFFFFFFF0B088888888080FFF
        FFFFFFF08088888888000FFFFFFFFFF0B088888888080FFFFFFFFFF000000000
        00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFF0000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btPesoSClick
    end
    object btPesoDel: TSpeedButton
      Left = 176
      Top = 176
      Width = 23
      Height = 22
      Hint = 'Apagar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888889800008898888888888888898800008899
        88777777777798880000889990000000000998880000888990BFFFBFFF998888
        0000888899FCCCCCCF97888800008888999FBFFFB9978888000088888999CCC9
        990788880000888880999FB99F0788880000888880FC9999CF07888800008888
        80FF9999BF0788880000888880FC9999000788880000888880B99F099F078888
        0000888880999F099998888800008888999FBF0F089988880000889999000000
        8889988800008899988888888888898800008888888888888888889800008888
        88888888888888880000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btPesoDelClick
    end
    object lbQt2: TLabel
      Left = 253
      Top = 201
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbQt2'
    end
    object pvInic: TJvValidateEdit
      Left = 88
      Top = 125
      Width = 65
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 0
    end
    object pvFim: TJvValidateEdit
      Left = 88
      Top = 149
      Width = 65
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 1
    end
    object pvValor: TJvValidateEdit
      Left = 88
      Top = 173
      Width = 65
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object JvDBGrid2: TJvDBGrid
      Left = 1
      Top = 220
      Width = 280
      Height = 165
      Align = alBottom
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = JvDBGrid2CellClick
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
          FieldName = 'INICIO'
          Title.Caption = 'In'#237'cio'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIM'
          Title.Caption = 'Fim'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 71
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 24
      Top = 1
      Width = 244
      Height = 84
      Color = 10932991
      ParentBackground = False
      TabOrder = 4
      object Label18: TLabel
        Left = 16
        Top = 16
        Width = 43
        Height = 13
        Caption = 'Motorista'
      end
      object lbM: TLabel
        Left = 64
        Top = 16
        Width = 17
        Height = 13
        Caption = 'lbM'
      end
      object cbMot: TComboBox
        Left = 86
        Top = 13
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'cbMot'
      end
      object btCopiaCancel: TBitBtn
        Left = 16
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Cancela'
        TabOrder = 1
        OnClick = btCopiaCancelClick
      end
      object btCopiaOK: TBitBtn
        Left = 152
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Copia'
        TabOrder = 2
        OnClick = btCopiaOKClick
      end
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM3.cdsPag1
    Left = 232
    Top = 272
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsPag5
    Left = 593
    Top = 337
  end
end
