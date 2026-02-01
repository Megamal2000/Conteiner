object PendVisual: TPendVisual
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Visualiza Pend'#234'ncias'
  ClientHeight = 351
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 332
    Width = 657
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 57
    Align = alTop
    TabOrder = 1
    object btOBS: TBitBtn
      Left = 360
      Top = 16
      Width = 113
      Height = 25
      Caption = 'Altera OBS'
      TabOrder = 0
      OnClick = btOBSClick
    end
    object btRetira: TBitBtn
      Left = 504
      Top = 16
      Width = 113
      Height = 25
      Caption = 'Retira da Pend'#234'ncia'
      TabOrder = 1
      OnClick = btRetiraClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 57
    Width = 657
    Height = 275
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        FieldName = 'DTCRIA'
        Title.Caption = 'Data'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Nota F'
        Width = 59
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
        Title.Caption = 'Cliente'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Obs'
        Width = 236
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 368
    Top = 200
    Width = 289
    Height = 132
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Nota'
    end
    object lbNF: TLabel
      Left = 56
      Top = 8
      Width = 25
      Height = 16
      Caption = 'lbNF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 35
      Width = 180
      Height = 13
      Caption = 'Dever'#225' ser retirada das pend'#234'ncias e'
    end
    object Bevel1: TBevel
      Left = 22
      Top = 25
      Width = 249
      Height = 2
    end
    object rbReent: TRadioButton
      Left = 24
      Top = 54
      Width = 193
      Height = 17
      Caption = 'encaminhada para REENTREGA'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbDevol: TRadioButton
      Left = 24
      Top = 75
      Width = 113
      Height = 17
      Caption = 'ser'#225' DEVOLVIDA'
      TabOrder = 1
    end
    object btCancel: TBitBtn
      Left = 24
      Top = 100
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btCancelClick
    end
    object btOk: TBitBtn
      Left = 192
      Top = 100
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 3
      OnClick = btOkClick
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsPende
    Left = 264
    Top = 128
  end
end
