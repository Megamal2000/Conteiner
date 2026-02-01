object TikDev: TTikDev
  Left = 242
  Top = 124
  BorderIcons = [biSystemMenu]
  Caption = 'Administra'#231#227'o de Devolu'#231#245'es - Motoristas'
  ClientHeight = 450
  ClientWidth = 665
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
    Width = 665
    Height = 89
    Align = alTop
    Color = clMaroon
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 56
      Top = 32
      Width = 78
      Height = 13
      Caption = 'N'#250'mero da Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 56
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 536
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Notas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbNota: TLabel
      Left = 576
      Top = 64
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pqNum: TEdit
      Left = 144
      Top = 30
      Width = 73
      Height = 21
      TabOrder = 0
      OnKeyPress = pqNumKeyPress
    end
    object pqData: TDateTimePicker
      Left = 144
      Top = 56
      Width = 105
      Height = 21
      Date = 41142.711323414360000000
      Time = 41142.711323414360000000
      TabOrder = 1
      Visible = False
    end
    object btAtual: TBitBtn
      Left = 560
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Atualiza'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      TabOrder = 2
      OnClick = btAtualClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 431
    Width = 665
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
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 665
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 32
      Top = 13
      Width = 231
      Height = 13
      Caption = 'Digite o n'#250'mero da nota devolvida pelo Motorista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbMsg: TLabel
      Left = 381
      Top = 13
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dvNum: TEdit
      Left = 280
      Top = 10
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = dvNumKeyPress
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 130
    Width = 665
    Height = 301
    Align = alClient
    DataSource = JvDataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    MultiSelect = True
    AlternateRowColor = 16776176
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
        Title.Caption = 'Data Roma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Motorista'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Motivo'
        Width = 201
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM3.cdsDev1
    Left = 568
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 608
    Top = 176
    object Nodevolvida1: TMenuItem
      Caption = 'N'#227'o devolvida'
      OnClick = Nodevolvida1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Criarrecibotodas1: TMenuItem
      Caption = 'Criar Recibo Todas'
      OnClick = Criarrecibotodas1Click
    end
    object CriarReciboSelecionadas1: TMenuItem
      Caption = 'Criar Recibo Selecionadas'
      OnClick = CriarReciboSelecionadas1Click
    end
    object InserirNotanoRecibo1: TMenuItem
      Caption = 'Inserir Nota no Recibo'
      OnClick = InserirNotanoRecibo1Click
    end
  end
end
