object Frete: TFrete
  Left = 0
  Top = 0
  Caption = 'Frete - C'#225'lculo'
  ClientHeight = 477
  ClientWidth = 819
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
    Width = 819
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 28
      Top = 18
      Width = 170
      Height = 13
      Caption = 'De                                               at'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dt1: TDateTimePicker
      Left = 48
      Top = 14
      Width = 121
      Height = 21
      Date = 41982.655885949080000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41982.655885949080000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 216
      Top = 14
      Width = 121
      Height = 21
      Date = 41982.655885949080000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41982.655885949080000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btExecuta: TBitBtn
      Left = 480
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 2
      OnClick = btExecutaClick
    end
    object StaticText1: TStaticText
      Left = 568
      Top = 18
      Width = 16
      Height = 17
      Caption = '00'
      TabOrder = 3
    end
    object btResumo: TBitBtn
      Left = 352
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Resumo'
      TabOrder = 4
      OnClick = btResumoClick
    end
    object StaticText2: TStaticText
      Left = 568
      Top = 2
      Width = 59
      Height = 17
      Caption = 'StaticText2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 819
    Height = 428
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 386
      Width = 817
      Height = 41
      Align = alBottom
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 817
      Height = 385
      ActivePage = tsResumo
      Align = alClient
      TabOrder = 1
      object tsResumo: TTabSheet
        Caption = 'Resumo'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 809
          Height = 65
          Align = alTop
          TabOrder = 0
          object lbTit: TLabel
            Left = 24
            Top = 8
            Width = 25
            Height = 13
            Caption = 'lbTit'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbRes: TLabel
            Left = 24
            Top = 32
            Width = 26
            Height = 13
            Caption = 'lbRes'
          end
        end
        object JvDBGrid1: TJvDBGrid
          Left = 0
          Top = 65
          Width = 281
          Height = 292
          Align = alLeft
          DataSource = JvDataSource1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
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
              FieldName = 'CPDTROMA'
              Title.Caption = 'Data Romaneio'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Title.Caption = 'Qt Notas'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORES'
              Title.Caption = 'Total Frete'
              Width = 78
              Visible = True
            end>
        end
        object JvDBGrid2: TJvDBGrid
          Left = 281
          Top = 65
          Width = 528
          Height = 292
          Align = alClient
          DataSource = JvDataSource2
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
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
              Width = 281
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Title.Caption = 'Qt Notas'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORES'
              Title.Caption = 'Total Frete'
              Width = 83
              Visible = True
            end>
        end
      end
      object tsNotasOk: TTabSheet
        Caption = 'Notas Calculadas'
        ImageIndex = 1
        object JvDBGrid3: TJvDBGrid
          Left = 0
          Top = 0
          Width = 313
          Height = 357
          Align = alLeft
          DataSource = JvDataSource2
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = JvDBGrid3CellClick
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
              Width = 209
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Title.Caption = 'Qt Notas'
              Width = 50
              Visible = True
            end>
        end
        object JvDBGrid4: TJvDBGrid
          Left = 313
          Top = 0
          Width = 496
          Height = 357
          Align = alClient
          DataSource = JvDataSource3
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AlternateRowColor = 16764159
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CPDTROMA'
              Title.Caption = 'Data Romaneio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPNUMNF'
              Title.Caption = 'Nota Fiscal'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VFRETETOTAL'
              Title.Caption = 'Frete'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VFRETESERV'
              Title.Caption = 'Servi'#231'o'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ICVALOR'
              Title.Caption = 'ICMS'
              Visible = True
            end>
        end
      end
      object tsExporta: TTabSheet
        Caption = 'Exporta Excel'
        ImageIndex = 2
        object JvDBGrid5: TJvDBGrid
          Left = 0
          Top = 0
          Width = 313
          Height = 357
          Align = alLeft
          DataSource = JvDataSource2
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = JvDBGrid3CellClick
          MultiSelect = True
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
              Width = 209
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Title.Caption = 'Qt Notas'
              Width = 50
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 313
          Top = 0
          Width = 496
          Height = 357
          Align = alClient
          TabOrder = 1
          object Label1: TLabel
            Left = 40
            Top = 16
            Width = 187
            Height = 13
            Caption = 'Exporta Lista de Notas para Excel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 40
            Top = 48
            Width = 82
            Height = 13
            Caption = 'Nome do Arquivo'
          end
          object Label4: TLabel
            Left = 136
            Top = 48
            Width = 75
            Height = 13
            Caption = 'FLAYDEL_COB_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 343
            Top = 48
            Width = 56
            Height = 13
            Caption = '_Cliente.xls'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 40
            Top = 199
            Width = 102
            Height = 13
            Caption = 'Clientes selecionados'
          end
          object lbqtSel: TLabel
            Left = 152
            Top = 200
            Width = 32
            Height = 13
            Caption = 'lbqtSel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edDesc: TEdit
            Left = 216
            Top = 45
            Width = 121
            Height = 21
            TabOrder = 0
            TextHint = 'Digite sua descri'#231#227'o'
          end
          object RadioGroup1: TRadioGroup
            Left = 40
            Top = 88
            Width = 369
            Height = 89
            Caption = 'Exportar para '
            TabOrder = 1
          end
          object rbJuntos: TRadioButton
            Left = 65
            Top = 104
            Width = 113
            Height = 17
            Caption = #218'nica PLanilha'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
          object rbSeparados: TRadioButton
            Left = 65
            Top = 152
            Width = 113
            Height = 17
            Caption = 'Arquivos diferentes'
            TabOrder = 3
          end
          object rbPlanilhas: TRadioButton
            Left = 65
            Top = 128
            Width = 113
            Height = 17
            Caption = 'V'#225'rias Planilhas'
            TabOrder = 4
          end
          object btExcel: TBitBtn
            Left = 40
            Top = 218
            Width = 75
            Height = 25
            Caption = 'Exporta'
            TabOrder = 5
            OnClick = btExcelClick
          end
          object StaticText3: TStaticText
            Left = 40
            Top = 256
            Width = 4
            Height = 4
            TabOrder = 6
          end
          object pb: TProgressBar
            Left = 40
            Top = 274
            Width = 337
            Height = 17
            TabOrder = 7
          end
          object StaticText4: TStaticText
            Left = 41
            Top = 296
            Width = 59
            Height = 17
            Caption = 'StaticText4'
            TabOrder = 8
          end
        end
      end
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsFrtDia
    Left = 24
    Top = 385
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsFrtCli
    Left = 349
    Top = 386
  end
  object JvDataSource3: TJvDataSource
    DataSet = DM5.cdsFrtNotas
    Left = 493
    Top = 386
  end
end
