object NFsegue2: TNFsegue2
  Left = 0
  Top = 0
  Caption = 
    'Notas Fiscais - Mostra Notas Retiradas do Romaneio que est'#227'o SEM' +
    ' Romaneio'
  ClientHeight = 405
  ClientWidth = 667
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
    Width = 667
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 699
    object Label1: TLabel
      Left = 24
      Top = 18
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label2: TLabel
      Left = 360
      Top = 18
      Width = 232
      Height = 13
      Caption = 'Mostra os '#250'ltimos 30 dias at'#233' a data selecionada'
    end
    object dtF: TDateTimePicker
      Left = 67
      Top = 15
      Width = 129
      Height = 21
      Date = 43524.647406678240000000
      Format = 'dd/MMM/yyyy ddd'
      Time = 43524.647406678240000000
      TabOrder = 0
    end
    object btMostrar: TBitBtn
      Left = 248
      Top = 13
      Width = 89
      Height = 25
      Caption = 'Mostrar'
      TabOrder = 1
      OnClick = btMostrarClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 57
    Width = 667
    Height = 329
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 386
    Width = 667
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitLeft = 360
    ExplicitTop = 376
    ExplicitWidth = 0
  end
  object DataSource1: TDataSource
    DataSet = DM5.cdsINT
    Left = 280
    Top = 160
  end
end
