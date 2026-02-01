object OcorreCli: TOcorreCli
  Left = 0
  Top = 0
  Caption = 'Ocorr'#234'ncias do Cliente'
  ClientHeight = 369
  ClientWidth = 690
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
    Width = 690
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 72
      Top = 16
      Width = 23
      Height = 13
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btSalvar: TBitBtn
      Left = 552
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btSalvarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 350
    Width = 690
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 690
    Height = 301
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Padr'#227'o Proceda'
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 682
        Height = 273
        Align = alClient
        DataSource = JvDataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = JvDBGrid1DrawColumnCell
        FixedCols = 2
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'pDescricao'
            Title.Caption = 'Ocorr'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pNum'
            Title.Caption = 'Padr'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'novoNum'
            Title.Caption = 'Cliente'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ocorr'#234'ncias Internas'
      ImageIndex = 1
      object JvDBGrid2: TJvDBGrid
        Left = 0
        Top = 0
        Width = 682
        Height = 273
        Align = alClient
        DataSource = JvDataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = JvDBGrid2DrawColumnCell
        FixedCols = 2
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'pInterno'
            Title.Caption = 'Ocorr'#234'ncia Interna'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pCod'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numCli'
            Title.Caption = 'Cliente'
            Visible = True
          end>
      end
    end
  end
  object ProgressBar1: TProgressBar
    Left = 328
    Top = 352
    Width = 354
    Height = 17
    TabOrder = 3
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab1
    Left = 40
    Top = 120
  end
  object Tab1: TJvMemoryData
    FieldDefs = <
      item
        Name = 'pDescricao'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'pNum'
        DataType = ftInteger
      end
      item
        Name = 'novoNum'
        DataType = ftInteger
      end>
    Left = 40
    Top = 176
    object Tab1pDescricao: TStringField
      FieldName = 'pDescricao'
      Size = 55
    end
    object Tab1pNum: TIntegerField
      FieldName = 'pNum'
    end
    object Tab1novoNum: TIntegerField
      FieldName = 'novoNum'
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = Tab2
    Left = 604
    Top = 129
  end
  object Tab2: TJvMemoryData
    FieldDefs = <
      item
        Name = 'pInterno'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'pCod'
        DataType = ftInteger
      end
      item
        Name = 'numCli'
        DataType = ftInteger
      end>
    Left = 604
    Top = 185
    object Tab2pInterno: TStringField
      FieldName = 'pInterno'
      Size = 55
    end
    object Tab2pCod: TIntegerField
      FieldName = 'pCod'
    end
    object Tab2numCli: TIntegerField
      FieldName = 'numCli'
    end
  end
end
