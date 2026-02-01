object EstatCli: TEstatCli
  Left = 236
  Top = 166
  Width = 783
  Height = 540
  BorderIcons = [biSystemMenu]
  Caption = 'Estat'#237'sticas - Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Pan: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Datas '
    end
    object dt1: TDateTimePicker
      Left = 75
      Top = 13
      Width = 121
      Height = 21
      Date = 42446.686914965280000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42446.686914965280000000
      TabOrder = 0
    end
    object dt2: TDateTimePicker
      Left = 267
      Top = 13
      Width = 121
      Height = 21
      Date = 42446.686914965280000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42446.686914965280000000
      TabOrder = 1
    end
    object btPesq: TBitBtn
      Left = 577
      Top = 10
      Width = 121
      Height = 27
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesqClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 775
    Height = 88
    Align = alTop
    Color = clSkyBlue
    TabOrder = 1
    object bt1: TSpeedButton
      Left = 40
      Top = 8
      Width = 23
      Height = 22
      Caption = '1'
      Flat = True
    end
    object bt2: TSpeedButton
      Left = 40
      Top = 32
      Width = 23
      Height = 22
      Caption = '2'
      Flat = True
    end
    object bt3: TSpeedButton
      Left = 40
      Top = 56
      Width = 23
      Height = 22
      Caption = '3'
      Flat = True
    end
    object Label2: TLabel
      Left = 80
      Top = 16
      Width = 148
      Height = 13
      Caption = 'Total de Notas COM Romaneio'
    end
    object Label3: TLabel
      Left = 80
      Top = 40
      Width = 79
      Height = 13
      Caption = 'Notas Entregues'
    end
    object Label4: TLabel
      Left = 80
      Top = 64
      Width = 105
      Height = 13
      Caption = 'Notas N'#195'O Entregues'
    end
    object bt4: TSpeedButton
      Left = 376
      Top = 8
      Width = 23
      Height = 22
      Caption = '4'
      Flat = True
    end
    object bt5: TSpeedButton
      Left = 376
      Top = 32
      Width = 23
      Height = 22
      Caption = '5'
      Flat = True
    end
    object bt6: TSpeedButton
      Left = 376
      Top = 56
      Width = 23
      Height = 22
      Caption = '6'
      Flat = True
    end
    object Label5: TLabel
      Left = 416
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Reentregas'
    end
    object Label6: TLabel
      Left = 416
      Top = 40
      Width = 90
      Height = 13
      Caption = 'Problemas (Cliente)'
    end
    object Label7: TLabel
      Left = 416
      Top = 64
      Width = 91
      Height = 13
      Caption = 'Problemas (Transp)'
    end
    object Label11: TLabel
      Left = 273
      Top = 16
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 273
      Top = 40
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 273
      Top = 64
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 560
      Top = 16
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 560
      Top = 40
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 560
      Top = 64
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 775
    Height = 41
    Align = alTop
    TabOrder = 2
    object bt7: TSpeedButton
      Left = 40
      Top = 8
      Width = 23
      Height = 22
      Caption = '7'
      Flat = True
    end
    object bt8: TSpeedButton
      Left = 376
      Top = 8
      Width = 23
      Height = 22
      Caption = '8'
      Flat = True
    end
    object Label8: TLabel
      Left = 80
      Top = 16
      Width = 105
      Height = 13
      Caption = 'Notas SEM Romaneio'
    end
    object Label9: TLabel
      Left = 416
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Notas SEM Cliente'
    end
    object Label17: TLabel
      Left = 273
      Top = 16
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 560
      Top = 16
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 178
    Width = 775
    Height = 44
    Align = alTop
    Color = clSkyBlue
    TabOrder = 3
    object Label10: TLabel
      Left = 81
      Top = 7
      Width = 288
      Height = 27
      AutoSize = False
      Caption = 'Conceito Transportadora  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Black'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbConceito: TLabel
      Left = 376
      Top = 8
      Width = 6
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 222
    Width = 775
    Height = 265
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        FieldName = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 318
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalNF'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Entregues'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NEntregues'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Conceito'
        Width = 72
        Visible = True
      end>
  end
  object JvStatusBar1: TJvStatusBar
    Left = 0
    Top = 487
    Width = 775
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 200
      end
      item
        Width = 70
        Control = pb
      end>
    object pb: TJvProgressBar
      Left = 453
      Top = 3
      Width = 276
      Height = 15
      TabOrder = 0
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 376
    Top = 272
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TotalNF'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'Entregues'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'NEntregues'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'Nota'
        DataType = ftFloat
        Precision = 1
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    Left = 416
    Top = 272
    object TabCliente: TStringField
      FieldName = 'Cliente'
    end
    object TabTotalNF: TFloatField
      FieldName = 'TotalNF'
      DisplayFormat = '#,##0'
    end
    object TabEntregues: TFloatField
      FieldName = 'Entregues'
      DisplayFormat = '#,##0'
    end
    object TabNEntregues: TFloatField
      FieldName = 'NEntregues'
      DisplayFormat = '#,##0'
    end
    object TabNota: TFloatField
      FieldName = 'Nota'
      DisplayFormat = '#,##0.0'
    end
    object Tabid: TIntegerField
      FieldName = 'id'
    end
  end
  object JvThreadTimer1: TJvThreadTimer
    Interval = 200
    OnTimer = JvThreadTimer1Timer
    Left = 632
    Top = 264
  end
end
