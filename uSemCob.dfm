object SemCob: TSemCob
  Left = 228
  Top = 110
  Width = 696
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Notas sem Cobran'#231'a'
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
    Height = 65
    Align = alTop
    Color = 9091818
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Pesquisa por data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9961471
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 35
      Width = 188
      Height = 13
      Caption = 'De                                                     a   '
    end
    object dat1: TDateTimePicker
      Left = 64
      Top = 32
      Width = 121
      Height = 21
      Date = 41535.725755023150000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41535.725755023150000000
      TabOrder = 0
      OnChange = dat1Change
    end
    object dat2: TDateTimePicker
      Left = 227
      Top = 32
      Width = 118
      Height = 21
      Date = 41535.726150891210000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41535.726150891210000000
      TabOrder = 1
    end
    object Pesquisar: TBitBtn
      Left = 368
      Top = 30
      Width = 113
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = PesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 688
    Height = 48
    Align = alTop
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbSemCob: TLabel
      Left = 112
      Top = 24
      Width = 48
      Height = 13
      Caption = 'lbSemCob'
    end
    object lbDevolvidos: TLabel
      Left = 336
      Top = 24
      Width = 61
      Height = 13
      Caption = 'lbDevolvidos'
    end
    object lbSembaixa: TLabel
      Left = 560
      Top = 24
      Width = 54
      Height = 13
      Caption = 'lbSembaixa'
    end
    object btSemBaixa: TBitBtn
      Left = 480
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sem Baixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btDevolvidos: TBitBtn
      Left = 256
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Devolvidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btSemCob: TBitBtn
      Left = 32
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sem Cob'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 113
    Width = 688
    Height = 314
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Observa'#231#245'es'
        Width = 394
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsSCob
    Left = 432
    Top = 216
  end
end
