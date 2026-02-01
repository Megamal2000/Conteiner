object SMSenv: TSMSenv
  Left = 251
  Top = 130
  Caption = 'Envia SMS para Clientes Marcados'
  ClientHeight = 502
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 49
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object btMostrar: TSpeedButton
      Left = 392
      Top = 16
      Width = 23
      Height = 22
      Hint = 'Mostrar as notas'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btMostrarClick
    end
    object btEnviar: TBitBtn
      Left = 503
      Top = 13
      Width = 113
      Height = 25
      Caption = 'Enviar'
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000C0600000FFE00000FBE00000F1E00000E0E00000C0600000F1E0
        0000F1E00000F1E00000FFE00000}
      TabOrder = 0
      OnClick = btEnviarClick
    end
    object ckTipo: TCheckBox
      Left = 24
      Top = 18
      Width = 201
      Height = 17
      Caption = 'Mostrar somente os n'#227'o enviados'
      TabOrder = 1
    end
    object dt: TDateTimePicker
      Left = 248
      Top = 16
      Width = 129
      Height = 21
      Date = 42917.772538148150000000
      Format = 'dd/MM/yyyy. ddd'
      Time = 42917.772538148150000000
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 483
    Width = 626
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 49
    Width = 626
    Height = 379
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
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
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONEDEST'
        Title.Caption = 'Telefone'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENVIASMS'
        Title.Caption = '..'
        Width = 22
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 428
    Width = 626
    Height = 55
    Align = alBottom
    TabOrder = 3
    object Shape1: TShape
      Left = 368
      Top = 9
      Width = 249
      Height = 41
      Brush.Color = clMoneyGreen
      Shape = stRoundRect
    end
    object tNF: TLabel
      Left = 376
      Top = 24
      Width = 14
      Height = 13
      Caption = 'NF'
      Transparent = True
    end
    object tNum: TLabel
      Left = 394
      Top = 24
      Width = 25
      Height = 13
      Caption = 'tNum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btTel: TBitBtn
      Left = 272
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Altera Tel'
      TabOrder = 0
      OnClick = btTelClick
    end
    object btReenvia: TBitBtn
      Left = 24
      Top = 16
      Width = 129
      Height = 25
      Caption = 'Reenvia Selecionados'
      TabOrder = 1
      OnClick = btReenviaClick
    end
    object edTel: TEdit
      Left = 450
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edTel'
      OnKeyPress = edTelKeyPress
    end
    object btSalva: TBitBtn
      Left = 580
      Top = 17
      Width = 29
      Height = 25
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
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
      TabOrder = 3
      OnClick = btSalvaClick
    end
    object btAnula: TBitBtn
      Left = 184
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Anula/Valida'
      TabOrder = 4
      OnClick = btAnulaClick
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsSMS
    Left = 256
    Top = 128
  end
end
