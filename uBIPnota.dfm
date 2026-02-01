object BIPnota: TBIPnota
  Left = 0
  Top = 0
  Caption = 'Confer'#234'ncia de Entrada - BIP por N'#250'mero de Nota'
  ClientHeight = 425
  ClientWidth = 726
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
    Width = 726
    Height = 113
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 20
      Height = 13
      Caption = 'Dias'
    end
    object Bevel1: TBevel
      Left = 157
      Top = 16
      Width = 2
      Height = 91
    end
    object Bevel2: TBevel
      Left = 254
      Top = 16
      Width = 2
      Height = 91
    end
    object JvDBGrid1: TJvDBGrid
      Left = 3
      Top = 21
      Width = 151
      Height = 86
      DataSource = JvDataSource1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
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
          FieldName = 'DTCRIADA'
          Title.Caption = 'Dia'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NTS'
          Title.Caption = 'Notas'
          Width = 34
          Visible = True
        end>
    end
    object btInic: TBitBtn
      Left = 168
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Inicia'
      TabOrder = 1
      OnClick = btInicClick
    end
    object btFim: TBitBtn
      Left = 168
      Top = 45
      Width = 75
      Height = 25
      Caption = 'Finaliza'
      TabOrder = 2
    end
    object btCorrige: TBitBtn
      Left = 168
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Corrige'
      TabOrder = 3
    end
    object Panel3: TPanel
      Left = 272
      Top = 8
      Width = 313
      Height = 99
      TabOrder = 4
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 81
        Height = 13
        Caption = 'Dia selecionado: '
      end
      object lbBdia: TLabel
        Left = 120
        Top = 8
        Width = 34
        Height = 13
        Caption = 'lbBdia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 32
        Width = 81
        Height = 13
        Caption = 'Total de Volumes'
      end
      object Label5: TLabel
        Left = 16
        Top = 52
        Width = 94
        Height = 13
        Caption = 'Volumes Conferidos'
      end
      object Label6: TLabel
        Left = 16
        Top = 73
        Width = 72
        Height = 13
        Caption = 'Volumes a mais'
      end
      object lbBtotal: TLabel
        Left = 120
        Top = 32
        Width = 36
        Height = 13
        Caption = 'lbBtotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbBconf: TLabel
        Left = 120
        Top = 52
        Width = 35
        Height = 13
        Caption = 'lbBconf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbBmail: TLabel
        Left = 120
        Top = 73
        Width = 32
        Height = 13
        Caption = 'lbBmail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object btRel: TBitBtn
      Left = 608
      Top = 55
      Width = 97
      Height = 25
      Caption = 'Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object ckSimples: TCheckBox
      Left = 616
      Top = 80
      Width = 73
      Height = 17
      Caption = 'Reduzido'
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 726
    Height = 48
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 32
      Top = 16
      Width = 82
      Height = 13
      Caption = 'C'#243'digo de Barras'
    end
    object lbResposta: TLabel
      Left = 392
      Top = 16
      Width = 53
      Height = 13
      Caption = 'lbResposta'
    end
    object edCod: TEdit
      Left = 128
      Top = 6
      Width = 254
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edCodKeyPress
    end
  end
  object JvDBGrid2: TJvDBGrid
    Left = 0
    Top = 161
    Width = 265
    Height = 245
    Align = alLeft
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid2DrawColumnCell
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'BIPE'
        Title.Caption = '...'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNOTA'
        Title.Caption = 'Nota F'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Vol Cli'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIPVOL'
        Title.Caption = 'Vol Conf'
        Width = 48
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 406
    Width = 726
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
  object MemoRel: TMemo
    Left = 265
    Top = 161
    Width = 461
    Height = 245
    Align = alClient
    Lines.Strings = (
      'MemoRel')
    TabOrder = 4
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsBIPt
    Left = 64
    Top = 56
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsBIPn
    Left = 32
    Top = 320
  end
end
