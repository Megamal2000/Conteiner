object pqCarC: TpqCarC
  Left = 279
  Top = 211
  Width = 670
  Height = 475
  BorderIcons = [biSystemMenu]
  Caption = 'Carros Flaydel - Pesquisa Carro por Data'
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
    Width = 662
    Height = 89
    Align = alTop
    Color = 9619189
    TabOrder = 0
    object Bevel1: TBevel
      Left = 24
      Top = 48
      Width = 409
      Height = 1
    end
    object Label1: TLabel
      Left = 32
      Top = 56
      Width = 197
      Height = 13
      Caption = 'De                                                        at'#233
    end
    object Label2: TLabel
      Left = 32
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Carro'
    end
    object dat1: TDateTimePicker
      Left = 67
      Top = 52
      Width = 121
      Height = 21
      Date = 41281.701663587960000000
      Format = 'dd/MM/yyy. ddd'
      Time = 41281.701663587960000000
      TabOrder = 0
      OnChange = dat1Change
    end
    object dat2: TDateTimePicker
      Left = 243
      Top = 52
      Width = 121
      Height = 21
      Date = 41281.701663587960000000
      Format = 'dd/MM/yyy. ddd'
      Time = 41281.701663587960000000
      TabOrder = 1
    end
    object btPesq: TBitBtn
      Left = 472
      Top = 35
      Width = 113
      Height = 33
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesqClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000001000000000000FFFF
        FF00BDA4A500DDC4C500613030006E3D3D00A28A8A00A9919100B69E9E00C4AB
        AB00BDA5A500CAB2B200C9B1B100D0B8B800D7BFBF00D6BEBE00E5CCCC00DDC5
        C500EBD3D300EAD3D300DED2D200D7CCCC00D0C5C500E6E1E100D9D4D400F3F0
        F000E6E3E300AF999800003061000D3D6E00566E8600ABB7C300B6C2CE007E97
        B1007991AA00627B99008DA5C8007289AF007E97C2009DB4DF00F2F2F2006E6E
        6E000D0D0D00C0C0C00000000000000000000000000000000000000000000000
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
        00000000000000000000000000000000000000000000000000002B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B282B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B1D1C01282B2B2B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2A27261C2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
        2B2B2A2425271D2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A2123242A2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A221E212A2B2B2B2B2B2B2B2B2B2B2B
        2B01280128012B2A201E222A2B2B2B2B2B2B2B2B2B2B2B280504050405280100
        1F202A2B2B2B2B2B2B2B2B2B2B2B0405110A100912050429002A2B2B2B2B2B2B
        2B2B2B2B2B04150E08110A1009130B04012B2B2B2B2B2B2B2B2B2B2B2B050D1B
        0E080D0A1009130528012B2B2B2B2B2B2B2B2B2B2A14070D1B0E1B0302100912
        05282B2B2B2B2B2B2B2B2B2B00160C070D1B0D08110A100904012B2B2B2B2B2B
        2B2B2B2B2A18170D1B0D1B0D1B0D0A1005282B2B2B2B2B2B2B2B2B2B000F1A06
        0C070D1B0E08110A04012B2B2B2B2B2B2B2B2B2B2A18191A060C1B0D1B0E0803
        052B2B2B2B2B2B2B2B2B2B2B2B2A11171A060D070D1B0E05282B2B2B2B2B2B2B
        2B2B2B2B2B001618191A170C070D15042B2B2B2B2B2B2B2B2B2B2B2B2B2B002A
        180F1816142A002B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A002A002A2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B}
    end
    object cbCar: TComboBox
      Left = 69
      Top = 21
      Width = 252
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'cbCar'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 662
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
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 662
    Height = 278
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = JvDBGrid1TitleClick
    SortMarker = smUp
    TitleButtons = True
    AlternateRowColor = clYellow
    SortedField = 'dtRoma'
    TitleArrow = True
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
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Motorista'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRETE'
        Title.Caption = 'Receita'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPAG'
        Title.Caption = 'Despesas'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LUCRO'
        Title.Caption = 'Lucro'
        Width = 81
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 367
    Width = 662
    Height = 55
    Align = alBottom
    TabOrder = 3
    object lbRomas: TLabel
      Left = 72
      Top = 21
      Width = 41
      Height = 13
      Caption = 'lbRomas'
    end
    object lbRec: TLabel
      Left = 369
      Top = 21
      Width = 48
      Height = 13
      Caption = '12.000,00'
    end
    object lbDesp: TLabel
      Left = 457
      Top = 21
      Width = 48
      Height = 13
      Caption = '12.000,00'
    end
    object lbLucro: TLabel
      Left = 544
      Top = 20
      Width = 58
      Height = 13
      Caption = '12.000,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPQcar
    Left = 472
    Top = 72
  end
end
