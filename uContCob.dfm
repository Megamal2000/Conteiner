object ContCob: TContCob
  Left = 216
  Top = 207
  BorderIcons = [biSystemMenu]
  Caption = 'Contrato - Cobran'#231'a C'#225'lculos'
  ClientHeight = 441
  ClientWidth = 719
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
    Left = 0
    Top = 0
    Width = 719
    Height = 73
    Align = alTop
    Color = 13091017
    TabOrder = 0
    ExplicitWidth = 727
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object SpeedButton1: TSpeedButton
      Left = 392
      Top = 37
      Width = 25
      Height = 25
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
      OnClick = SpeedButton1Click
    end
    object cbCli: TComboBox
      Left = 100
      Top = 13
      Width = 277
      Height = 21
      TabOrder = 0
    end
    object dat1: TDateTimePicker
      Left = 100
      Top = 40
      Width = 121
      Height = 21
      Date = 40179.755726805560000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40179.755726805560000000
      TabOrder = 1
      OnChange = dat1Change
    end
    object dat2: TDateTimePicker
      Left = 264
      Top = 40
      Width = 113
      Height = 21
      Date = 40179.755800231480000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40179.755800231480000000
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 315
    Width = 719
    Height = 126
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 319
    ExplicitWidth = 727
    object Panel3: TPanel
      Left = 13
      Top = 10
      Width = 468
      Height = 103
      TabOrder = 0
      object Label2: TLabel
        Left = 24
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Valor Contrato'
      end
      object Label3: TLabel
        Left = 24
        Top = 32
        Width = 49
        Height = 13
        Caption = 'km Avulso'
      end
      object Label4: TLabel
        Left = 24
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Hora extra'
      end
      object Label5: TLabel
        Left = 24
        Top = 80
        Width = 34
        Height = 13
        Caption = 'Seguro'
      end
      object lbMes: TLabel
        Left = 237
        Top = 8
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbkma: TLabel
        Left = 138
        Top = 32
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
      object lbKmb: TLabel
        Left = 179
        Top = 32
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
      end
      object lbKmc: TLabel
        Left = 237
        Top = 32
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbHrc: TLabel
        Left = 236
        Top = 56
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbHrb: TLabel
        Left = 179
        Top = 56
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
      end
      object lbHra: TLabel
        Left = 117
        Top = 56
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
      end
      object lbSegb: TLabel
        Left = 179
        Top = 80
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
      end
      object lbSegc: TLabel
        Left = 236
        Top = 80
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = '00,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbTot: TLabel
        Left = 396
        Top = 64
        Width = 58
        Height = 27
        Alignment = taRightJustify
        Caption = '00,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 312
        Top = 49
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Bevel1: TBevel
        Left = 304
        Top = 63
        Width = 155
        Height = 3
      end
      object Label7: TLabel
        Left = 312
        Top = 24
        Width = 47
        Height = 13
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbDesc: TLabel
        Left = 427
        Top = 24
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object btCalc: TBitBtn
      Left = 560
      Top = 23
      Width = 89
      Height = 25
      Caption = 'Calcular'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDD777777777777DDDD0000DDD00000000000007DDD0000DD0F
        EFEFEFEFEFEF07DD0000DD0E00000E00000E07DD0000DD0F88880F88880F07DD
        0000DD0EFEFEFEFEFEFE07DD0000DD0F00E00F00E00F07DD0000DD0E80F80E80
        F80E07DD0000DD0FEFEFEFEFEFEF07DD0000DD0E00F00E00F00E07DD0000DD0F
        80E80F80E80F07DD0000DD0EFEFEFEFEFEFE07DD0000DD0F00000000000F07DD
        0000DD0E08181881880E07DD0000DD0F08818818180F07DD0000DD0E00000000
        000E07DD0000DD0FEFEFEFEFEFEF0DDD0000DDD0000000000000DDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      TabOrder = 1
      OnClick = btCalcClick
    end
    object btSalvar: TBitBtn
      Left = 560
      Top = 63
      Width = 89
      Height = 25
      Caption = 'Salvar'
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
      TabOrder = 2
      OnClick = btSalvarClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 719
    Height = 242
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    AlternateRowColor = 14679293
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Data Romaneio'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Romaneio'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HRINICIO'
        Title.Caption = 'Hora 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HRFIM'
        Title.Caption = 'Hora 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HREXTRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Hora Extra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VHR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Valor Hora E'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KMINICIO'
        Title.Caption = 'km 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KMFIM'
        Title.Caption = 'km 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KMEXTRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'km Avulso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VKM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Valor km Av'
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM3.cdsFT5b
    Left = 424
    Top = 104
  end
end
