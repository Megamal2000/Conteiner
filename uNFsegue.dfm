object NFsegue: TNFsegue
  Left = 39
  Top = 202
  Width = 672
  Height = 438
  BorderIcons = [biSystemMenu]
  Caption = 'Nota Fiscal  - Rastreio'
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
    Width = 664
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 32
      Top = 53
      Width = 48
      Height = 13
      Caption = 'Num Nota'
    end
    object cbCli: TComboBox
      Left = 94
      Top = 14
      Width = 291
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Text = 'cbCli'
    end
    object edNota: TEdit
      Left = 95
      Top = 49
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edNota'
      OnKeyPress = edNotaKeyPress
    end
    object btMostra: TBitBtn
      Left = 392
      Top = 48
      Width = 97
      Height = 25
      Caption = 'Mostrar'
      TabOrder = 2
      OnClick = btMostraClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 664
    Height = 272
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        FieldName = 'NUMNOTA'
        Title.Caption = 'Nota F'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEV'
        Title.Caption = 'Data do Evento'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Evento'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Caption = 'Usu'#225'rio'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMROMA'
        Title.Caption = 'Romaneio'
        Width = 87
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM5.cdsINT
    Left = 280
    Top = 160
  end
end
