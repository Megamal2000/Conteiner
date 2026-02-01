object cliGP: TcliGP
  Left = 228
  Top = 110
  Width = 542
  Height = 541
  BorderIcons = [biSystemMenu]
  Caption = 'Grupo de Clientes'
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
    Width = 534
    Height = 121
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Shape1: TShape
      Left = 24
      Top = 8
      Width = 481
      Height = 105
      Brush.Color = clGreen
      Pen.Color = clGreen
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 36
      Top = 16
      Width = 80
      Height = 13
      Caption = 'Pesquisa Grupos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edPesq: TEdit
      Left = 128
      Top = 14
      Width = 209
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edPesqKeyPress
    end
    object JvDBGrid1: TJvDBGrid
      Left = 128
      Top = 40
      Width = 281
      Height = 65
      DataSource = DataSource1
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = JvDBGrid1DblClick
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
          FieldName = 'NOMEG'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Width = 42
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 534
    Height = 41
    Align = alTop
    Color = clSkyBlue
    TabOrder = 1
    object btSalvarN: TSpeedButton
      Left = 350
      Top = 10
      Width = 23
      Height = 22
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      OnClick = btSalvarNClick
    end
    object btNovo: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir Novo'
      TabOrder = 0
      OnClick = btNovoClick
    end
    object edNovo: TEdit
      Left = 128
      Top = 10
      Width = 209
      Height = 21
      TabOrder = 1
      Text = 'edNovo'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 162
    Width = 534
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Selecionado'
    end
    object lbSel: TLabel
      Left = 135
      Top = 15
      Width = 23
      Height = 13
      Caption = 'lbSel'
      Visible = False
    end
    object btSalvarA: TSpeedButton
      Left = 350
      Top = 10
      Width = 23
      Height = 22
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000130B0000130B00001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770990770000990777099077000099077709907700009
        90777099000000099077709999999999907770990000000990777090FFFFFFF0
        90777090F9999FF090777090FF999FF090777097F9999FF000777077999F9FF0
        8077777999777700007777999777777777777779777777777777}
      OnClick = btSalvarAClick
    end
    object btApagar: TSpeedButton
      Left = 416
      Top = 10
      Width = 23
      Height = 22
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888889800008898888888888888898800008899
        88777777777798880000889990000000000998880000888990BFFFBFFF998888
        0000888899FCCCCCCF97888800008888999FBFFFB9978888000088888999CCC9
        990788880000888880999FB99F0788880000888880FC9999CF07888800008888
        80FF9999BF0788880000888880FC9999000788880000888880B99F099F078888
        0000888880999F099998888800008888999FBF0F089988880000889999000000
        8889988800008899988888888888898800008888888888888888889800008888
        88888888888888880000}
      OnClick = btApagarClick
    end
    object edSel: TEdit
      Left = 129
      Top = 11
      Width = 208
      Height = 21
      TabOrder = 0
      Text = 'edSel'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 488
    Width = 534
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 0
    Top = 203
    Width = 217
    Height = 285
    Align = alLeft
    DataSource = JvDataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
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
        FieldName = 'NOME'
        Title.Caption = 'Clientes no grupo'
        Width = 188
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 217
    Top = 203
    Width = 317
    Height = 285
    Align = alClient
    TabOrder = 5
    object Label3: TLabel
      Left = 32
      Top = 256
      Width = 151
      Height = 13
      Caption = 'Selecione o Cliente e clique em '
    end
    object btRetirar: TBitBtn
      Left = 12
      Top = 10
      Width = 117
      Height = 25
      Caption = 'Retira da Lista'
      TabOrder = 0
      OnClick = btRetirarClick
    end
    object BitBtn1: TBitBtn
      Left = 12
      Top = 42
      Width = 117
      Height = 25
      Caption = 'Mostra sem grupo'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object JvDBGrid3: TJvDBGrid
      Left = 12
      Top = 72
      Width = 285
      Height = 169
      DataSource = JvDataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
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
          FieldName = 'NomeGrupo'
          Title.Caption = 'Clientes sem Grupo'
          Width = 256
          Visible = True
        end>
    end
    object btInsere: TBitBtn
      Left = 201
      Top = 252
      Width = 83
      Height = 25
      Caption = 'Acrescentar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btInsereClick
    end
  end
  object DataSource1: TDataSource
    DataSet = DM4.cdsGR
    Left = 448
    Top = 64
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsGRcli
    Left = 200
    Top = 202
  end
  object JvDataSource2: TJvDataSource
    DataSet = Tab
    Left = 497
    Top = 275
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'idGrupo'
        DataType = ftInteger
      end
      item
        Name = 'NomeGrupo'
        DataType = ftString
        Size = 25
      end>
    Left = 489
    Top = 243
    object TabidGrupo: TIntegerField
      FieldName = 'idGrupo'
    end
    object TabNomeGrupo: TStringField
      FieldName = 'NomeGrupo'
      Size = 25
    end
  end
end
