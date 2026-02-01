object WebBaixa: TWebBaixa
  Left = 0
  Top = 0
  Caption = 'Completa as notas sem Baixa na Web'
  ClientHeight = 386
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Datas'
    end
    object dt1: TDateTimePicker
      Left = 96
      Top = 22
      Width = 121
      Height = 21
      Date = 43684.640781539350000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43684.640781539350000000
      TabOrder = 0
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 256
      Top = 22
      Width = 121
      Height = 21
      Date = 43684.640781539350000000
      Format = 'dd/MM/yyyy ddd'
      Time = 43684.640781539350000000
      TabOrder = 1
    end
    object btBaixa: TBitBtn
      Left = 440
      Top = 19
      Width = 121
      Height = 25
      Caption = 'Verifica'
      TabOrder = 2
      OnClick = btBaixaClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 367
    Width = 671
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 65
    Width = 671
    Height = 302
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
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
        FieldName = 'NFid'
        Title.Caption = 'id'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFnum'
        Title.Caption = 'Nota Fiscal'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RetornoNUM'
        Title.Caption = 'ret'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RetornoDescr'
        Title.Caption = 'Retorno'
        Width = 361
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 376
    Top = 104
    Width = 273
    Height = 241
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 280
    Top = 152
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'NFid'
        DataType = ftInteger
      end
      item
        Name = 'NFnum'
        DataType = ftInteger
      end
      item
        Name = 'RetornoNUM'
        DataType = ftInteger
      end
      item
        Name = 'RetornoDescr'
        DataType = ftString
        Size = 40
      end>
    Left = 344
    Top = 160
    object TabNFid: TIntegerField
      FieldName = 'NFid'
      DisplayFormat = '#,##0'
    end
    object TabNFnum: TIntegerField
      FieldName = 'NFnum'
      DisplayFormat = '#,##0'
    end
    object TabRetornoNUM: TIntegerField
      FieldName = 'RetornoNUM'
    end
    object TabRetornoDescr: TStringField
      FieldName = 'RetornoDescr'
      Size = 40
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 232
    Top = 224
  end
end
