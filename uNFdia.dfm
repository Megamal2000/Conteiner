object NFdia: TNFdia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Acompanhamento de NF por dia'
  ClientHeight = 474
  ClientWidth = 724
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
    Width = 724
    Height = 81
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 41
      Width = 694
      Height = 2
    end
    object Label1: TLabel
      Left = 20
      Top = 57
      Width = 63
      Height = 13
      Caption = 'Procura Nota'
    end
    object lbNota: TLabel
      Left = 200
      Top = 57
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbCli: TComboBox
      Left = 64
      Top = 13
      Width = 297
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
    end
    object btPesq: TBitBtn
      Left = 525
      Top = 11
      Width = 91
      Height = 25
      Caption = 'Mostrar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000D00DDDDDDDDDDDDDD0000000D000DDDDDDDDDDDDD0000000DD00
        0DDDDDDDDDDDD0000000DDD000D800008DDDD0000000DDDD0000777700DDD000
        0000DDDDD08EE777780DD0000000DDDD807E77777708D0000000DDDD07E77777
        7770D0000000DDDD077777777770D0000000DDDD077777777E70D0000000DDDD
        077777777E70D0000000DDDD80777777EE08D0000000DDDDD08777EEE80DD000
        0000DDDDDD00777700DDD0000000DDDDDDD800008DDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
      TabOrder = 1
      OnClick = btPesqClick
    end
    object btExcel: TBitBtn
      Left = 622
      Top = 11
      Width = 91
      Height = 25
      Caption = 'Excel'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      TabOrder = 2
      OnClick = btExcelClick
    end
    object DataP: TDateTimePicker
      Left = 404
      Top = 13
      Width = 105
      Height = 21
      Date = 44497.898137407400000000
      Format = 'dd/MM/yy ddd'
      Time = 44497.898137407400000000
      TabOrder = 3
    end
    object vNota: TJvValidateEdit
      Left = 96
      Top = 54
      Width = 57
      Height = 21
      AllowEmpty = True
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 4
      OnKeyPress = vNotaKeyPress
    end
    object btProcNF: TBitBtn
      Left = 159
      Top = 52
      Width = 26
      Height = 25
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777770000000777770000000777770FFFFF07777700000007777
        70F111F0777770000000777770F1FFF0777770000000777770F111F077777000
        0000777770FFF1F0777770000000700000F11FF074477000000070FFF0FFFFF0
        74477000000070FF0000000077777000000070FF0FF0777774477000000070FF
        0FF0777774447000000070F00FF0777777744000000070FF0FF0777447744000
        000070FFFFF07774444440000000700000007777444470000000777777777777
        777770000000}
      TabOrder = 5
      OnClick = btProcNFClick
    end
    object btSalvar: TBitBtn
      Left = 404
      Top = 49
      Width = 93
      Height = 25
      Hint = 'Salvar Recebedores Alterados'
      Caption = 'Salvar Marcados'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btSalvarClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 81
    Width = 724
    Height = 374
    Align = alClient
    DataSource = JvDataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    FixedCols = 6
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
        FieldName = 'Entrada'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumNF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tenta'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Recebedor'
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marca'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 455
    Width = 724
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 160
    Width = 649
    Height = 257
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEDEST'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECEBEDOR'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCORR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HRENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDNF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VFRETE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCDEST'
        Width = 64
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 624
    Top = 176
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Entrada'
        DataType = ftDate
      end
      item
        Name = 'NumNF'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tenta'
        DataType = ftInteger
      end
      item
        Name = 'DataE'
        DataType = ftDate
      end
      item
        Name = 'Recebedor'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Marca'
        DataType = ftString
        Size = 1
      end>
    Left = 632
    Top = 224
    object TabEntrada: TDateField
      FieldName = 'Entrada'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object TabNumNF: TIntegerField
      FieldName = 'NumNF'
      DisplayFormat = '#,##0'
    end
    object TabValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#,##0.00'
    end
    object TabStatus: TStringField
      FieldName = 'Status'
    end
    object TabTenta: TIntegerField
      FieldName = 'Tenta'
    end
    object TabDataE: TDateField
      FieldName = 'DataE'
    end
    object TabRecebedor: TStringField
      FieldName = 'Recebedor'
      OnChange = TabRecebedorChange
      Size = 40
    end
    object TabMarca: TStringField
      FieldName = 'Marca'
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = DM5.cdsNFac
    Left = 96
    Top = 288
  end
end
