object WEBsinc2: TWEBsinc2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Notas para sincronizar com a WEB'
  ClientHeight = 512
  ClientWidth = 924
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
    Width = 924
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 642
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 102
      Height = 13
      Caption = 'Quantidade de Notas'
    end
    object LbQT: TLabel
      Left = 136
      Top = 8
      Width = 25
      Height = 13
      Caption = 'LbQT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 42
      Width = 561
      Height = 38
      AutoSize = False
      Caption = 
        'As notas que aparecem aqui s'#227'o aquelas nas quais a ocorr'#234'ncia fo' +
        'i alterada aqui na Flaydel. O objetivo '#233' n'#227'o deixar as informa'#231#245 +
        'es da WEB diferentes das informa'#231#245'es no Conteiner. '
      WordWrap = True
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 81
    Width = 924
    Height = 431
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    TitleButtons = True
    AlternateRowColor = clSkyBlue
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
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Cliente'
        Width = 246
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENT'
        Title.Caption = 'Data Entrega'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HRENT'
        Title.Caption = 'Hora Entrega'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCORR'
        Title.Caption = 'Oc'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Ocorr'#234'ncia'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SBAIXA'
        Title.Caption = 'Acontecimento'
        Width = 148
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsWebS
    Left = 264
    Top = 240
  end
end
