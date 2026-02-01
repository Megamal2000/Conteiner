object NFenvio: TNFenvio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Notas e OCORENs de um DIA'
  ClientHeight = 396
  ClientWidth = 727
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
    Width = 727
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 414
      Top = 18
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object cbCli: TComboBox
      Left = 80
      Top = 15
      Width = 281
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
    end
    object dia: TDateTimePicker
      Left = 451
      Top = 14
      Width = 121
      Height = 21
      Date = 43676.686981087970000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43676.686981087970000000
      TabOrder = 1
    end
    object btPesq: TBitBtn
      Left = 616
      Top = 13
      Width = 88
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btPesqClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 727
    Height = 32
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 24
      Top = 8
      Width = 135
      Height = 13
      Caption = 'Notas com Romaneio no dia '
    end
    object nQt1: TLabel
      Left = 165
      Top = 8
      Width = 27
      Height = 13
      Caption = 'nQt1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 400
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Enviadas'
    end
    object nQt2: TLabel
      Left = 456
      Top = 8
      Width = 27
      Height = 13
      Caption = 'nQt2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 568
      Top = 8
      Width = 65
      Height = 13
      Caption = 'N'#227'o Enviadas'
    end
    object nQT3: TLabel
      Left = 645
      Top = 8
      Width = 29
      Height = 13
      Caption = 'nQT3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 81
    Width = 727
    Height = 168
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = clMoneyGreen
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
        FieldName = 'NUMNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Nota F'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTROMA'
        Title.Caption = 'Data Roma'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCORR'
        Title.Caption = 'OC'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTOCOREN'
        Title.Caption = 'Data da Ocorr'#234'ncia'
        Width = 128
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 0
    Top = 281
    Width = 727
    Height = 115
    Align = alBottom
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid2DrawColumnCell
    OnDblClick = JvDBGrid2DblClick
    OnTitleClick = JvDBGrid2TitleClick
    TitleButtons = True
    AlternateRowColor = clMoneyGreen
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
        FieldName = 'NUMNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Nota F'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTOCOREN'
        Title.Caption = 'Data ocorr'#234'ncia'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEM2'
        Title.Caption = 'Origem'
        Width = 102
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 249
    Width = 727
    Height = 32
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 4
    object Label9: TLabel
      Left = 24
      Top = 8
      Width = 109
      Height = 13
      Caption = 'Todas as Notas do dia '
    end
    object nQT4: TLabel
      Left = 139
      Top = 8
      Width = 29
      Height = 13
      Caption = 'nQT4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 400
      Top = 9
      Width = 100
      Height = 13
      Caption = 'Notas sem Romaneio'
    end
    object nQT5: TLabel
      Left = 512
      Top = 9
      Width = 29
      Height = 13
      Caption = 'nQT5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsNfenvia
    Left = 248
    Top = 128
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsNFdia
    Left = 296
    Top = 288
  end
end
