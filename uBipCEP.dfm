object BipCEP: TBipCEP
  Left = 195
  Top = 161
  BorderIcons = [biSystemMenu]
  Caption = 'Confere Notas utilizando CEP'
  ClientHeight = 507
  ClientWidth = 878
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
    Width = 878
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 29
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object lb1: TLabel
      Left = 280
      Top = 8
      Width = 14
      Height = 13
      Caption = 'lb1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lb2: TLabel
      Left = 280
      Top = 27
      Width = 14
      Height = 13
      Caption = 'lb2'
    end
    object lb3: TLabel
      Left = 280
      Top = 45
      Width = 14
      Height = 13
      Caption = 'lb3'
    end
    object edCEP: TEdit
      Left = 80
      Top = 21
      Width = 169
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edCEP'
      OnKeyPress = edCEPKeyPress
    end
    object hist: TJvRichEdit
      Left = 273
      Top = 6
      Width = 496
      Height = 91
      Font.Charset = ANSI_CHARSET
      Font.Color = clFuchsia
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      SelText = ''
      TabOrder = 1
    end
    object btSalvar: TBitBtn
      Left = 792
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888000088877777777777777778000088000000000000000778000080BF
        B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
        000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
        FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
        BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
        000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
        F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
        88888888888888880000}
      TabOrder = 2
      OnClick = btSalvarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 878
    Height = 402
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 622
      Top = 10
      Width = 58
      Height = 18
      Caption = 'ERROS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 272
      Height = 400
      Align = alLeft
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 10
        Width = 129
        Height = 18
        Caption = 'Selecionar Rotas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object JvDBGrid1: TJvDBGrid
        Left = 15
        Top = 30
        Width = 233
        Height = 297
        DataSource = JvDataSource1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
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
            FieldName = 'ROTA'
            Title.Caption = 'Rota'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Notas'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VOL'
            Title.Caption = 'Vol'
            Width = 33
            Visible = True
          end>
      end
      object btSel: TBitBtn
        Left = 174
        Top = 336
        Width = 75
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 1
        OnClick = btSelClick
      end
    end
    object Panel4: TPanel
      Left = 273
      Top = 1
      Width = 328
      Height = 400
      Align = alLeft
      TabOrder = 1
      object Label3: TLabel
        Left = 14
        Top = 10
        Width = 133
        Height = 18
        Caption = 'Volumes por CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 210
        Top = 339
        Width = 3
        Height = 13
        Alignment = taRightJustify
      end
      object JvDBGrid2: TJvDBGrid
        Left = 8
        Top = 30
        Width = 297
        Height = 297
        DataSource = JvDataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = JvDBGrid2DrawColumnCell
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 20
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'origem'
            Title.Caption = '..'
            Width = 15
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'volTot'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'volBip'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numnf'
            Title.Caption = 'Nota F'
            Width = 66
            Visible = True
          end>
      end
    end
    object JvDBGrid3: TJvDBGrid
      Left = 621
      Top = 30
      Width = 206
      Height = 297
      DataSource = JvDataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 2
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
      RowsHeight = 20
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vol'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ERRO'
          Visible = True
        end>
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsRconta
    Left = 185
    Top = 170
  end
  object Tab1: TJvMemoryData
    FieldDefs = <
      item
        Name = 'CEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'volTot'
        DataType = ftInteger
      end
      item
        Name = 'volBip'
        DataType = ftInteger
      end
      item
        Name = 'numnf'
        DataType = ftInteger
      end
      item
        Name = 'origem'
        DataType = ftString
        Size = 1
      end>
    Left = 353
    Top = 170
    object Tab1CEP: TStringField
      FieldName = 'CEP'
    end
    object Tab1volTot: TIntegerField
      FieldName = 'volTot'
    end
    object Tab1volBip: TIntegerField
      FieldName = 'volBip'
    end
    object Tab1numnf: TIntegerField
      FieldName = 'numnf'
      DisplayFormat = '#,##0'
    end
    object Tab1origem: TStringField
      FieldName = 'origem'
      Size = 1
    end
  end
  object Tab2: TJvMemoryData
    FieldDefs = <
      item
        Name = 'CEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'vol'
        DataType = ftInteger
      end
      item
        Name = 'ERRO'
        DataType = ftString
        Size = 2
      end>
    Left = 608
    Top = 177
    object Tab2CEP: TStringField
      FieldName = 'CEP'
    end
    object Tab2vol: TIntegerField
      FieldName = 'vol'
    end
    object Tab2ERRO: TStringField
      FieldName = 'ERRO'
      Size = 2
    end
  end
  object JvDataSource2: TJvDataSource
    DataSet = Tab1
    Left = 321
    Top = 170
  end
  object JvDataSource3: TJvDataSource
    DataSet = Tab2
    Left = 576
    Top = 177
  end
end
