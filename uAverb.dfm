object Averb: TAverb
  Left = 243
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Gerar Averba'#231#227'o'
  ClientHeight = 350
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 22
    Top = 23
    Width = 483
    Height = 305
    ActivePage = tb1
    TabOrder = 0
    object tb1: TTabSheet
      Caption = 'Criar Averba'#231#227'o'
      object Shape1: TShape
        Left = 16
        Top = 104
        Width = 433
        Height = 81
        Brush.Color = clMoneyGreen
        Pen.Color = clMoneyGreen
        Shape = stRoundRect
      end
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 206
        Height = 13
        Caption = 'Per'#237'odo:                                                     a'
      end
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Minutas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 16
        Top = 56
        Width = 433
        Height = 2
      end
      object Label3: TLabel
        Left = 24
        Top = 128
        Width = 118
        Height = 13
        Caption = 'Descri'#231#227'o da Averba'#231#227'o'
        Transparent = True
      end
      object Label15: TLabel
        Left = 152
        Top = 190
        Width = 3
        Height = 13
      end
      object btMes: TSpeedButton
        Left = 312
        Top = 64
        Width = 25
        Height = 25
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000F0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
          FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
          FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
          00F0FFFFFFFFFFFFFFF0}
        OnClick = btMesClick
      end
      object dt1: TDateTimePicker
        Left = 78
        Top = 30
        Width = 120
        Height = 21
        Date = 38300.737923958300000000
        Time = 38300.737923958300000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dt2: TDateTimePicker
        Left = 233
        Top = 29
        Width = 122
        Height = 21
        Date = 38300.738086689800000000
        Time = 38300.738086689800000000
        TabOrder = 1
      end
      object Cbmes: TComboBox
        Left = 78
        Top = 64
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'm'#234's'
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
          'Dezembro')
      end
      object EdDesc: TEdit
        Left = 148
        Top = 126
        Width = 277
        Height = 21
        MaxLength = 30
        TabOrder = 3
      end
      object BtCriar: TButton
        Left = 148
        Top = 150
        Width = 97
        Height = 25
        Caption = 'Criar'
        TabOrder = 4
        OnClick = BtCriarClick
      end
      object btEscolhe: TBitBtn
        Left = 24
        Top = 240
        Width = 97
        Height = 25
        Caption = 'Excluir'
        TabOrder = 5
        OnClick = btEscolheClick
      end
      object ListaN: TComboBox
        Left = 130
        Top = 242
        Width = 145
        Height = 21
        TabOrder = 6
        Text = 'ListaN'
        Visible = False
      end
      object nAno: TJvSpinEdit
        Left = 232
        Top = 64
        Width = 73
        Height = 21
        Decimal = 0
        MaxValue = 2100.000000000000000000
        MinValue = 2011.000000000000000000
        Value = 2011.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object pb: TProgressBar
        Left = 24
        Top = 192
        Width = 401
        Height = 17
        TabOrder = 8
        Visible = False
      end
    end
    object tb2: TTabSheet
      Caption = 'Abrir Averba'#231#227'o'
      ImageIndex = 1
      object BtMostrar: TButton
        Left = 24
        Top = 248
        Width = 75
        Height = 25
        Caption = 'Mostrar'
        TabOrder = 0
        OnClick = BtMostrarClick
      end
      object JvDBGrid1: TJvDBGrid
        Left = 8
        Top = 8
        Width = 457
        Height = 225
        DataSource = JvDataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = JvDBGrid1DblClick
        AlternateRowColor = 16245729
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCR'
            Title.Caption = 'Averba'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Valor'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT'
            Title.Caption = 'Notas'
            Width = 75
            Visible = True
          end>
      end
    end
    object tb3: TTabSheet
      Caption = 'Analisar'
      ImageIndex = 2
      object Shape2: TShape
        Left = 16
        Top = 72
        Width = 433
        Height = 81
        Brush.Color = clMoneyGreen
        Pen.Color = clMoneyGreen
        Shape = stRoundRect
      end
      object Label4: TLabel
        Left = 32
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Averba'#231#227'o'
      end
      object Label5: TLabel
        Left = 32
        Top = 96
        Width = 67
        Height = 13
        Caption = 'Total sugerido'
        Transparent = True
      end
      object Label6: TLabel
        Left = 64
        Top = 216
        Width = 3
        Height = 13
      end
      object Label7: TLabel
        Left = 64
        Top = 232
        Width = 3
        Height = 13
      end
      object Label8: TLabel
        Left = 64
        Top = 248
        Width = 3
        Height = 13
      end
      object lbDesc: TLabel
        Left = 112
        Top = 24
        Width = 33
        Height = 13
        Caption = 'lbDesc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbTot: TLabel
        Left = 112
        Top = 48
        Width = 24
        Height = 13
        Caption = 'lbTot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btAnalise: TButton
        Left = 109
        Top = 119
        Width = 75
        Height = 25
        Caption = 'Submeter'
        TabOrder = 0
        OnClick = btAnaliseClick
      end
      object vVirtual: TJvValidateEdit
        Left = 109
        Top = 95
        Width = 113
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        TabOrder = 1
      end
      object pb2: TProgressBar
        Left = 40
        Top = 160
        Width = 385
        Height = 17
        TabOrder = 2
        Visible = False
      end
      object lbFinal: TStaticText
        Left = 64
        Top = 184
        Width = 4
        Height = 4
        TabOrder = 3
      end
    end
    object tb4: TTabSheet
      Caption = 'Excel'
      ImageIndex = 3
      object Label9: TLabel
        Left = 16
        Top = 24
        Width = 84
        Height = 13
        Caption = 'Criar Excel de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 16
        Top = 80
        Width = 457
        Height = 2
      end
      object Label10: TLabel
        Left = 40
        Top = 112
        Width = 38
        Height = 13
        Caption = 'Label10'
      end
      object Label14: TLabel
        Left = 40
        Top = 94
        Width = 46
        Height = 13
        Caption = 'Label14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDesc2: TLabel
        Left = 104
        Top = 24
        Width = 39
        Height = 13
        Caption = 'lbDesc2'
      end
      object btExcel: TBitBtn
        Left = 16
        Top = 48
        Width = 89
        Height = 25
        Caption = 'Criar Arquivo'
        TabOrder = 0
        OnClick = btExcelClick
      end
      object FileListBox1: TFileListBox
        Left = 32
        Top = 128
        Width = 401
        Height = 129
        ItemHeight = 13
        Mask = '*.xls'
        TabOrder = 1
      end
      object Barra: TProgressBar
        Left = 152
        Top = 56
        Width = 313
        Height = 16
        TabOrder = 2
        Visible = False
      end
      object JvDBGrid2: TJvDBGrid
        Left = 104
        Top = 112
        Width = 320
        Height = 120
        DataSource = JvDataSource2
        TabOrder = 3
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
            FieldName = 'num'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Minuta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Placa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PlacaF'
            Visible = True
          end>
      end
    end
    object tb5: TTabSheet
      Caption = 'Enviar Arquivo'
      ImageIndex = 4
      object Label11: TLabel
        Left = 32
        Top = 32
        Width = 77
        Height = 13
        Caption = 'Enviar o arquivo'
      end
      object Label12: TLabel
        Left = 32
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Label12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 32
        Top = 80
        Width = 21
        Height = 13
        Caption = 'para'
      end
      object Edit2: TEdit
        Left = 96
        Top = 78
        Width = 281
        Height = 21
        TabOrder = 0
      end
      object Memo1: TMemo
        Left = 32
        Top = 104
        Width = 409
        Height = 129
        Lines.Strings = (
          '')
        TabOrder = 1
      end
      object btEnvia: TButton
        Left = 48
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Enviar'
        TabOrder = 2
      end
    end
    object tb6: TTabSheet
      Caption = 'Outros formatos'
      ImageIndex = 5
      object Label16: TLabel
        Left = 40
        Top = 104
        Width = 80
        Height = 13
        Caption = 'Local do Arquivo'
      end
      object lbresp: TLabel
        Left = 40
        Top = 192
        Width = 401
        Height = 13
        AutoSize = False
      end
      object rbCSV: TRadioButton
        Left = 40
        Top = 24
        Width = 113
        Height = 17
        Caption = 'exportar para CSV'
        TabOrder = 0
      end
      object rbESP: TRadioButton
        Left = 40
        Top = 56
        Width = 225
        Height = 17
        Caption = 'exportar para separado por espa'#231'os'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object btCriar2: TBitBtn
        Left = 40
        Top = 144
        Width = 105
        Height = 25
        Caption = 'Criar arquivo'
        TabOrder = 2
        OnClick = btCriar2Click
      end
      object Pasta: TJvDirectoryEdit
        Left = 131
        Top = 99
        Width = 294
        Height = 21
        DialogKind = dkWin32
        TabOrder = 3
        Text = 'C:\'
      end
      object pbCSV: TProgressBar
        Left = 40
        Top = 208
        Width = 393
        Height = 17
        TabOrder = 4
      end
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsAv1
    Left = 346
    Top = 311
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'idM'
        DataType = ftInteger
      end
      item
        Name = 'VlrOut'
        DataType = ftFloat
      end>
    Left = 386
    Top = 311
    object TabidM: TIntegerField
      FieldName = 'idM'
    end
    object TabVlrOut: TFloatField
      FieldName = 'VlrOut'
    end
  end
  object TabMin2: TJvMemoryData
    FieldDefs = <
      item
        Name = 'num'
        DataType = ftInteger
      end
      item
        Name = 'numR'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Placa'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Minuta'
        DataType = ftInteger
      end
      item
        Name = 'CodLib'
        DataType = ftString
        Size = 12
      end>
    KeyFieldNames = 'Minuta'
    Left = 290
    Top = 311
    object TabMin2num: TIntegerField
      FieldName = 'num'
    end
    object TabMin2numR: TIntegerField
      FieldName = 'numR'
    end
    object TabMin2nome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object TabMin2CPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object TabMin2Placa: TStringField
      FieldName = 'Placa'
      Size = 8
    end
    object TabMin2Minuta: TIntegerField
      FieldName = 'Minuta'
    end
    object TabMin2CodLib: TStringField
      FieldName = 'CodLib'
      Size = 12
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = TabMin2
    Left = 250
    Top = 311
  end
end
