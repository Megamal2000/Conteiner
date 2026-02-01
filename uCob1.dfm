object Cob1: TCob1
  Left = 266
  Top = 124
  Caption = 'Cobran'#231'a - Conjunto de Relat'#243'rios'
  ClientHeight = 442
  ClientWidth = 622
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
    Width = 622
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 585
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel
      Left = 160
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edNum: TEdit
      Left = 80
      Top = 30
      Width = 57
      Height = 21
      TabOrder = 0
      Text = 'edNum'
      OnKeyPress = edNumKeyPress
    end
    object edTexto: TEdit
      Left = 216
      Top = 29
      Width = 297
      Height = 21
      TabOrder = 1
      Text = 'edTexto'
      OnKeyPress = edTextoKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 622
    Height = 56
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 585
    object Label4: TLabel
      Left = 24
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 28
      Width = 51
      Height = 13
      Caption = 'Descri'#231#227'o '
    end
    object Label6: TLabel
      Left = 360
      Top = 28
      Width = 62
      Height = 13
      Caption = 'Prevista para'
    end
    object edDesc: TEdit
      Left = 82
      Top = 26
      Width = 263
      Height = 21
      TabOrder = 0
      Text = 'edDesc'
      OnKeyPress = edDescKeyPress
    end
    object dtPrev: TDateTimePicker
      Left = 431
      Top = 25
      Width = 114
      Height = 21
      Date = 40855.679601770840000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40855.679601770840000000
      TabOrder = 1
      OnChange = dtPrevChange
    end
    object btSalva: TBitBtn
      Left = 559
      Top = 23
      Width = 43
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btSalvaClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 113
    Width = 622
    Height = 329
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Descri'#231#227'o'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPREV'
        Title.Caption = 'Data Prevista'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 166
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsCred
    Left = 456
    Top = 152
  end
end
