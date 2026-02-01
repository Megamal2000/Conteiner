object Tktxls: TTktxls
  Left = 228
  Top = 110
  Width = 696
  Height = 480
  Caption = 'Exporta An'#225'lise dos Tickets para Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 216
    Top = 280
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 40
      Top = 38
      Width = 259
      Height = 13
      Caption = 
        'Datas: de                                                       ' +
        '   a           '
    end
    object btExcel: TSpeedButton
      Left = 608
      Top = 8
      Width = 26
      Height = 25
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
      OnClick = btExcelClick
    end
    object Barra: TJvSpecialProgress
      Left = 440
      Top = 40
      Width = 225
      Height = 15
      Caption = 'Barra'
    end
    object btAtual: TBitBtn
      Left = 512
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Pesquisa'
      TabOrder = 0
      OnClick = btAtualClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333300003333333333333333333300003333333330033003300300003333
        3333300330033003000033303333333333333333000033000333333333333333
        000030F000333333333333330000330F000333333333333300003330F0000000
        73333333000033330F0078887033333300003333300788FF8703333300003333
        30788888F877333300003333308888888F80333300003333307888888F803333
        000033333078FF8888803333000033333777FF88887733330000333333077888
        8703333300003333333077777033333300003333333370007333333300003333
        33333333333333330000}
    end
    object dta: TDateTimePicker
      Left = 104
      Top = 34
      Width = 129
      Height = 21
      Date = 41421.740310509260000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41421.740310509260000000
      TabOrder = 1
      OnChange = dtaChange
    end
    object dtb: TDateTimePicker
      Left = 280
      Top = 33
      Width = 129
      Height = 21
      Date = 41421.740832245370000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41421.740832245370000000
      TabOrder = 2
    end
    object cbCli: TComboBox
      Left = 104
      Top = 6
      Width = 305
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'cbCli'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 688
    Height = 32
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 554
      Height = 13
      Caption = 
        'Recebidos                                       n'#227'o Recebidos   ' +
        '                                    Devolu'#231#245'es                  ' +
        '                 Coletas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbC1: TLabel
      Left = 96
      Top = 8
      Width = 21
      Height = 13
      Caption = 'lbC1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbC3: TLabel
      Left = 456
      Top = 8
      Width = 21
      Height = 13
      Caption = 'lbC3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbC2: TLabel
      Left = 280
      Top = 8
      Width = 21
      Height = 13
      Caption = 'lbC2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbC4: TLabel
      Left = 602
      Top = 8
      Width = 21
      Height = 13
      Caption = 'lbC4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 97
    Width = 688
    Height = 330
    Align = alClient
    DataSource = JvDataSource1
    TabOrder = 3
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
        FieldName = 'DTROMA'
        Title.Caption = 'Data Romaneio'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Obs'
        Width = 353
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsTKm
    Left = 608
    Top = 144
  end
end
