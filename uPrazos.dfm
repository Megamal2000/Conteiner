object Prazos: TPrazos
  Left = 0
  Top = 0
  Caption = 'Prazos'
  ClientHeight = 472
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 82
    Width = 526
    Height = 120
    Align = alTop
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    OnDblClick = JvDBGrid1DblClick
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
        FieldName = 'DESCREVE'
        Title.Caption = 'Descri'#231#227'o'
        Width = 284
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALIDADE'
        Title.Caption = 'Validade'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 14
      Width = 122
      Height = 13
      Caption = 'Mostrando             prazos'
    end
    object lbpqt: TLabel
      Left = 79
      Top = 14
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbpqt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btNovoP: TBitBtn
      Left = 408
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Inserir Novo'
      TabOrder = 0
      OnClick = btNovoPClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 202
    Width = 526
    Height = 48
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 7
      Top = 3
      Width = 87
      Height = 13
      Caption = 'Prazo Selecionado'
    end
    object lbSelPrazo: TLabel
      Left = 104
      Top = 3
      Width = 59
      Height = 13
      Caption = 'lbSelPrazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 24
      Width = 105
      Height = 13
      Caption = 'Quantidade de Faixas'
    end
    object lbQTf: TLabel
      Left = 120
      Top = 24
      Width = 29
      Height = 13
      Caption = 'lbQTf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btNovoF: TBitBtn
      Left = 280
      Top = 16
      Width = 114
      Height = 25
      Caption = 'Inserir Nova faixa'
      TabOrder = 0
      OnClick = btNovoFClick
    end
    object btCopiaF: TBitBtn
      Left = 400
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Copiar Faixas'
      TabOrder = 1
      OnClick = btCopiaFClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 526
    Height = 41
    Align = alTop
    TabOrder = 3
    object Label2: TLabel
      Left = 4
      Top = 11
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 254
      Top = 11
      Width = 14
      Height = 13
      Caption = 'Val'
    end
    object btSalvarPr: TBitBtn
      Left = 382
      Top = 6
      Width = 60
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btSalvarPrClick
    end
    object btCancelPr: TBitBtn
      Left = 448
      Top = 6
      Width = 64
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btCancelPrClick
    end
    object edDescr: TEdit
      Left = 56
      Top = 8
      Width = 185
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
      Text = 'edDescr'
    end
    object dtVal: TDateTimePicker
      Left = 274
      Top = 8
      Width = 97
      Height = 21
      Date = 43505.483649027780000000
      Time = 43505.483649027780000000
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 346
    Width = 526
    Height = 126
    ActivePage = TabSheet1
    Align = alClient
    PopupMenu = PopupMenu3
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Faixas de CEP'
      object JvDBGrid3: TJvDBGrid
        Left = 0
        Top = 0
        Width = 518
        Height = 98
        Align = alClient
        DataSource = JvDataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = JvDBGrid3DblClick
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
            FieldName = 'CEPI'
            Title.Caption = 'CEP inicial'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEPF'
            Title.Caption = 'CEP final'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRAZO'
            Title.Caption = 'Prazo (dias)'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AREARISCO'
            Title.Caption = #193'rea de Risco'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 1
      object JvDBGrid2: TJvDBGrid
        Left = 0
        Top = 33
        Width = 270
        Height = 65
        Align = alClient
        DataSource = JvDataSource3
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        MultiSelect = True
        AlternateRowColor = 12574719
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Num'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Cliente com Prazo Selecionado'
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRAZO'
            Title.Caption = 'Padr'#227'o'
            Width = 31
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 518
        Height = 33
        Align = alTop
        TabOrder = 1
        object lbCli1: TLabel
          Left = 8
          Top = 8
          Width = 25
          Height = 13
          Caption = 'lbCli1'
        end
        object lbCli2: TLabel
          Left = 485
          Top = 7
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'lbCli2'
        end
        object btCliretira: TBitBtn
          Left = 39
          Top = 2
          Width = 144
          Height = 25
          Caption = 'Retirar Cliente da Lista'
          TabOrder = 0
          OnClick = btCliretiraClick
        end
        object btCliinsere: TBitBtn
          Left = 295
          Top = 2
          Width = 184
          Height = 25
          Caption = 'Inserir Clientes no Prazo'
          TabOrder = 1
          OnClick = btCliinsereClick
        end
      end
      object JvDBGrid4: TJvDBGrid
        Left = 270
        Top = 33
        Width = 248
        Height = 65
        Align = alRight
        DataSource = JvDataSource4
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        MultiSelect = True
        AlternateRowColor = 15138764
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
            Title.Caption = 'Cliente sem Prazos'
            Width = 202
            Visible = True
          end>
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 298
    Width = 526
    Height = 48
    Align = alTop
    TabOrder = 5
    object Label5: TLabel
      Left = 7
      Top = 3
      Width = 87
      Height = 13
      Caption = 'Prazo Selecionado'
    end
    object lbSelPrazo2: TLabel
      Left = 104
      Top = 3
      Width = 59
      Height = 13
      Caption = 'lbSelPrazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 47
      Height = 13
      Caption = 'CEP inicial'
    end
    object Label8: TLabel
      Left = 128
      Top = 24
      Width = 42
      Height = 13
      Caption = 'CEP final'
    end
    object Label9: TLabel
      Left = 241
      Top = 24
      Width = 57
      Height = 13
      Caption = 'Prazo (dias)'
    end
    object btCancelF: TBitBtn
      Left = 456
      Top = 15
      Width = 64
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btCancelFClick
    end
    object btSalvarF: TBitBtn
      Left = 392
      Top = 15
      Width = 60
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btSalvarFClick
    end
    object edFinic: TEdit
      Left = 61
      Top = 21
      Width = 60
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'edFinic'
      OnKeyPress = edFinicKeyPress
    end
    object edFfim: TEdit
      Left = 174
      Top = 21
      Width = 57
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'edFfim'
      OnKeyPress = edFfimKeyPress
    end
    object edFdias: TEdit
      Left = 297
      Top = 21
      Width = 32
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'edFdias'
      OnKeyPress = edFdiasKeyPress
    end
    object ckRisco: TCheckBox
      Left = 335
      Top = 22
      Width = 51
      Height = 17
      Caption = 'Risco'
      TabOrder = 5
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 250
    Width = 526
    Height = 48
    Align = alTop
    TabOrder = 6
    object Label6: TLabel
      Left = 7
      Top = 3
      Width = 87
      Height = 13
      Caption = 'Prazo Selecionado'
    end
    object lbSelPrazo3: TLabel
      Left = 104
      Top = 3
      Width = 59
      Height = 13
      Caption = 'lbSelPrazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Copia de '
    end
    object btCopia: TBitBtn
      Left = 319
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Copiar'
      TabOrder = 0
      OnClick = btCopiaClick
    end
    object btCancel3: TBitBtn
      Left = 400
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btCancel3Click
    end
    object cbPraz: TComboBox
      Left = 64
      Top = 21
      Width = 225
      Height = 21
      TabOrder = 2
      Text = 'cbPraz'
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsPr1
    Left = 456
    Top = 96
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsPr2
    Left = 24
    Top = 424
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 152
    object Apagar1: TMenuItem
      Caption = 'Apagar'
      OnClick = Apagar1Click
    end
    object Alterar1: TMenuItem
      Caption = 'Alterar'
      OnClick = Alterar1Click
    end
  end
  object JvDataSource3: TJvDataSource
    DataSet = DM5.cdsPrCli1
    Left = 336
    Top = 416
  end
  object JvDataSource4: TJvDataSource
    DataSet = DM5.cdsPrCli2
    Left = 440
    Top = 416
  end
  object PopupMenu2: TPopupMenu
    Left = 380
    Top = 402
    object Apagar2: TMenuItem
      Caption = 'Apagar'
      OnClick = Apagar2Click
    end
    object Alterar2: TMenuItem
      Caption = 'Alterar'
      OnClick = Alterar2Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 140
    Top = 434
    object AlterarPadro1: TMenuItem
      Caption = 'Alterar Padr'#227'o'
      OnClick = AlterarPadro1Click
    end
  end
end
