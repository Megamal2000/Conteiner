object AvisoPQ: TAvisoPQ
  Left = 207
  Top = 110
  Width = 696
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Procura Avisos'
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
    Width = 688
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 106
      Height = 13
      Caption = 'Procura por Descri'#231#227'o'
    end
    object edDescr: TEdit
      Left = 147
      Top = 11
      Width = 358
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edDescrKeyPress
    end
    object btPesq: TBitBtn
      Left = 523
      Top = 11
      Width = 94
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesqClick
      Glyph.Data = {
        1E010000424D1E010000000000007600000028000000140000000E0000000100
        040000000000A800000000000000000000001000000000000000000000000000
        C00000C0000000C0C000C0000000C000C000C0C00000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777778000777777777777777777778300777777777777700777778FFF7777
        77777777000777778FFF777777777770007777778FFF77777770000007777777
        8000777777077700777777778777777770777770777777778077777770777770
        7777777787077777707777707777777787077777770777077777777787077777
        7770007777777777870777777777777777777777870777777777777777777777
        80A0}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 688
    Height = 48
    Align = alTop
    Color = 16776176
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 203
      Height = 13
      Caption = 'Entre Datas                                                -'
    end
    object Label3: TLabel
      Left = 480
      Top = 16
      Width = 18
      Height = 13
      Caption = 'ver '
    end
    object dat1: TDateTimePicker
      Left = 88
      Top = 14
      Width = 121
      Height = 21
      Date = 41347.670016087960000000
      Format = 'dd/MM/yyyy. ddd'
      Time = 41347.670016087960000000
      TabOrder = 0
      OnChange = dat1Change
    end
    object dat2: TDateTimePicker
      Left = 243
      Top = 13
      Width = 126
      Height = 21
      Date = 41347.670384467600000000
      Format = 'dd/MM/yyyy. ddd'
      Time = 41347.670384467600000000
      TabOrder = 1
    end
    object cbVer: TComboBox
      Left = 511
      Top = 12
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 5
      TabOrder = 2
      Text = 'N'#227'o conclu'#237'dos'
      Items.Strings = (
        'n'#227'o Lido'
        'Lido'
        'Finalizado'
        'Cancelado'
        'Todos'
        'N'#227'o conclu'#237'dos'
        'Conclu'#237'dos')
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 688
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
    Top = 97
    Width = 688
    Height = 330
    Align = alClient
    DataSource = JvDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = clInfoBk
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DT'
        Title.Caption = 'Data'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Descri'#231#227'o'
        Width = 322
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTE'
        Title.Caption = 'parte'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORPREV'
        Title.Caption = 'Vlr Previsto'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVST'
        Title.Caption = 'Status'
        Width = 81
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPQav
    Left = 184
    Top = 152
  end
end
