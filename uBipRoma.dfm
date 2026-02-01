object BipRoma: TBipRoma
  Left = 116
  Top = 199
  Caption = 'Confere Notas no Romaneio'
  ClientHeight = 502
  ClientWidth = 879
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
    Width = 879
    Height = 105
    Align = alTop
    Color = clMoneyGreen
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
    object Panel5: TPanel
      Left = 584
      Top = 6
      Width = 294
      Height = 91
      Color = clSilver
      TabOrder = 3
      Visible = False
      object Label6: TLabel
        Left = 16
        Top = 10
        Width = 94
        Height = 13
        Caption = 'Assinar Confer'#234'ncia'
      end
      object Label7: TLabel
        Left = 16
        Top = 32
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Label8: TLabel
        Left = 16
        Top = 52
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object EdUsuario: TEdit
        Left = 69
        Top = 29
        Width = 108
        Height = 21
        TabOrder = 0
        Text = 'EdUsuario'
        OnKeyPress = EdUsuarioKeyPress
      end
      object EdSenha: TEdit
        Left = 69
        Top = 52
        Width = 108
        Height = 21
        PasswordChar = '@'
        TabOrder = 1
        Text = 'EdSenha'
        OnKeyPress = EdSenhaKeyPress
      end
      object btOk: TBitBtn
        Left = 198
        Top = 13
        Width = 75
        Height = 25
        Caption = 'Conferido'
        TabOrder = 2
        OnClick = btOkClick
      end
      object btSair: TBitBtn
        Left = 243
        Top = 56
        Width = 29
        Height = 25
        Caption = 'Sair'
        TabOrder = 3
        OnClick = btSairClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 56
      Width = 225
      Height = 43
      Caption = 'Usar'
      TabOrder = 4
      object rbCEP: TRadioButton
        Left = 16
        Top = 16
        Width = 89
        Height = 17
        Caption = 'CEP'
        TabOrder = 0
        OnClick = rbCEPClick
      end
      object rbNF: TRadioButton
        Left = 120
        Top = 16
        Width = 113
        Height = 17
        Caption = 'N'#250'mero da NF'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = rbNFClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 879
    Height = 397
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 667
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
      Width = 320
      Height = 395
      Align = alLeft
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 10
        Width = 162
        Height = 18
        Caption = 'Selecionar Romaneio'
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
        Width = 290
        Height = 297
        DataSource = JvDataSource1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
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
            FieldName = 'DTROMA'
            Title.Caption = 'Data Romaneio'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ROMANEIO'
            Title.Caption = 'N'#250'm. Romaneio'
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
      Left = 321
      Top = 1
      Width = 337
      Height = 395
      Align = alLeft
      TabOrder = 1
      object Label3: TLabel
        Left = 20
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
      object lbVol: TLabel
        Left = 154
        Top = 333
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
      object lbVolBip: TLabel
        Left = 190
        Top = 333
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object JvDBGrid2: TJvDBGrid
        Left = 14
        Top = 30
        Width = 315
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
          end
          item
            Expanded = False
            FieldName = 'idcli'
            Title.Caption = 'Cli'
            Width = 23
            Visible = True
          end>
      end
    end
    object JvDBGrid3: TJvDBGrid
      Left = 666
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
    DataSet = DM5.cdsBipR
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
      end
      item
        Name = 'idcli'
        DataType = ftInteger
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
    object Tab1idcli: TIntegerField
      FieldName = 'idcli'
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
