object Prazo2: TPrazo2
  Left = 183
  Top = 100
  Caption = 'Relat'#243'rio de Notas e Prazos'
  ClientHeight = 489
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Relat'#243'rio entre'
    end
    object dt1: TDateTimePicker
      Left = 112
      Top = 12
      Width = 120
      Height = 21
      Date = 43512.672182384260000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43512.672182384260000000
      TabOrder = 0
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 264
      Top = 12
      Width = 120
      Height = 21
      Date = 43512.672389375000000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43512.672389375000000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 77
    Width = 618
    Height = 104
    Align = alTop
    TabOrder = 1
    object Dig: TJvgDigits
      Left = 528
      Top = 66
      Width = 42
      DigitSize.X = 10
      DigitSize.Y = 21
      ActiveColor = clBlue
      PassiveColor = clBtnFace
      BackgroundColor = clBtnFace
      Bevel.Inner = bvNone
      Bevel.Outer = bvNone
      Bevel.Bold = False
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
    end
    object btProcNao: TBitBtn
      Left = 16
      Top = 9
      Width = 137
      Height = 25
      Caption = 'Calcular N'#227'o Feitos'
      TabOrder = 0
      OnClick = btProcNaoClick
    end
    object btProcTodos: TBitBtn
      Left = 16
      Top = 40
      Width = 137
      Height = 25
      Caption = 'Recalcular Todos'
      TabOrder = 1
      OnClick = btProcTodosClick
    end
    object lbEntrega: TStaticText
      Left = 231
      Top = 6
      Width = 203
      Height = 17
      Caption = 'Selecionando a Data de Entrega [Parado]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Transparent = False
    end
    object lbDias: TStaticText
      Left = 231
      Top = 25
      Width = 190
      Height = 17
      Caption = 'Calculando Dias para Entrega [Parado]'
      TabOrder = 3
      Transparent = False
    end
    object lbPrazo: TStaticText
      Left = 231
      Top = 44
      Width = 133
      Height = 17
      Caption = 'Copiando o prazo [Parado]'
      TabOrder = 4
      Transparent = False
    end
    object pb: TProgressBar
      Left = 231
      Top = 80
      Width = 265
      Height = 17
      TabOrder = 5
    end
    object lbPb: TStaticText
      Left = 194
      Top = 80
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = 'lbPb'
      TabOrder = 6
    end
    object btadmI: TBitBtn
      Left = 16
      Top = 71
      Width = 137
      Height = 25
      Caption = 'Adm Dias N'#227'o '#218'teis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btadmIClick
    end
    object lbFinal: TStaticText
      Left = 231
      Top = 63
      Width = 153
      Height = 17
      Caption = 'Anotando o resultado [Parado]'
      TabOrder = 8
      Transparent = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 181
    Width = 618
    Height = 40
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    object lbResult: TLabel
      Left = 122
      Top = 11
      Width = 38
      Height = 13
      Caption = 'lbResult'
    end
    object btMostra: TBitBtn
      Left = 16
      Top = 6
      Width = 89
      Height = 25
      Caption = 'Mostra Notas'
      TabOrder = 0
      OnClick = btMostraClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 221
    Width = 241
    Height = 268
    Align = alLeft
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        Title.Caption = 'Clientes'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CRIADAS'
        Title.Caption = 'Notas'
        Width = 38
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 241
    Top = 221
    Width = 377
    Height = 268
    Align = alClient
    TabOrder = 4
    object lbGeral: TLabel
      Left = 24
      Top = 40
      Width = 33
      Height = 13
      Caption = 'lbGeral'
    end
    object lbPorDia: TLabel
      Left = 23
      Top = 62
      Width = 297
      Height = 27
      AutoSize = False
      Caption = 'lbPorDia'
      WordWrap = True
    end
    object lbOk: TLabel
      Left = 24
      Top = 87
      Width = 21
      Height = 13
      Caption = 'lbOk'
    end
    object SpeedButton1: TSpeedButton
      Left = 160
      Top = 200
      Width = 23
      Height = 22
      Visible = False
      OnClick = SpeedButton1Click
    end
    object btGera: TBitBtn
      Left = 23
      Top = 6
      Width = 178
      Height = 25
      Caption = 'Gerar Relat'#243'rio de Performance'
      TabOrder = 0
      OnClick = btGeraClick
    end
    object btExcel: TBitBtn
      Left = 24
      Top = 144
      Width = 177
      Height = 25
      Caption = 'Exportar notas para o Excel'
      TabOrder = 1
      OnClick = btExcelClick
    end
    object Memo1: TMemo
      Left = 207
      Top = 40
      Width = 160
      Height = 180
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
      Visible = False
    end
    object ckJunto: TCheckBox
      Left = 32
      Top = 176
      Width = 153
      Height = 17
      Caption = 'Todos na mesma planilha'
      TabOrder = 3
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 49
    Width = 618
    Height = 28
    Align = alTop
    TabOrder = 5
    object ckSabado: TCheckBox
      Left = 65
      Top = 5
      Width = 167
      Height = 17
      Caption = 'Incluir S'#225'bado como dia '#250'til'
      TabOrder = 0
    end
    object ckDomingo: TCheckBox
      Left = 296
      Top = 6
      Width = 209
      Height = 17
      Caption = 'Incluir Domingo como dia '#250'til'
      TabOrder = 1
    end
  end
  object TimerProc: TJvThreadTimer
    OnTimer = TimerProcTimer
    Left = 512
    Top = 9
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsPrE1
    Left = 136
    Top = 280
  end
end
