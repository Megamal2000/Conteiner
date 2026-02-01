object CteErros: TCteErros
  Left = 0
  Top = 0
  Caption = 'Lista CT-e com erros'
  ClientHeight = 396
  ClientWidth = 660
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
    Width = 660
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Datas'
    end
    object LbDT1: TLabel
      Left = 64
      Top = 16
      Width = 76
      Height = 13
      Caption = '20/07/2020 seg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 150
      Top = 16
      Width = 4
      Height = 13
      Caption = '-'
    end
    object LbDT2: TLabel
      Left = 169
      Top = 16
      Width = 76
      Height = 13
      Caption = '20/07/2020 seg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbMens: TLabel
      Left = 280
      Top = 2
      Width = 289
      Height = 40
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 377
    Width = 660
    Height = 19
    Panels = <>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 49
    Width = 273
    Height = 328
    Align = alLeft
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
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
        FieldName = 'STATUS'
        Title.Caption = 'Erro'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERRO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QT'
        Title.Caption = 'Quant'
        Width = 43
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 273
    Top = 49
    Width = 387
    Height = 328
    Align = alClient
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = JvDBGrid2DblClick
    MultiSelect = True
    AlternateRowColor = clSkyBlue
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMC'
        Title.Caption = 'CT-e'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Erro'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNOTA'
        Title.Caption = 'Nota Fiscal'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIGCLI'
        Title.Caption = 'Cliente'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE'
        Title.Caption = 'Frete'
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsErro1
    Left = 56
    Top = 152
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsErro2
    Left = 448
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 200
    object REcalcularCTe1: TMenuItem
      Caption = 'Recalcular CT-e'
      OnClick = REcalcularCTe1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object DuplicidadeCorrigir1: TMenuItem
      Caption = 'Duplicidade: Corrigir Selecionados'
      OnClick = DuplicidadeCorrigir1Click
    end
    object Atrasadoscorrigirselecionados1: TMenuItem
      Caption = 'Atrasados: corrigir selecionados'
      OnClick = Atrasadoscorrigirselecionados1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object AlterarCNPJ1: TMenuItem
      Caption = 'Alterar CNPJ'
      OnClick = AlterarCNPJ1Click
    end
    object ProcurarCdigodoMunicpio1: TMenuItem
      Caption = 'Procurar C'#243'digo do Munic'#237'pio'
      OnClick = ProcurarCdigodoMunicpio1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object RetirarMarcadeErro1: TMenuItem
      Caption = 'Retirar Marca de Erro'
      OnClick = RetirarMarcadeErro1Click
    end
    object ManterValorAlto1: TMenuItem
      Caption = 'Manter Valor Alto'
      OnClick = ManterValorAlto1Click
    end
  end
end
