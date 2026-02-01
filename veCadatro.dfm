object eCadastro: TeCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastros'
  ClientHeight = 614
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
  object SV: TSplitView
    Left = 0
    Top = 50
    Width = 200
    Height = 564
    CloseStyle = svcCompact
    Color = clBlack
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 0
    object catMenuItems: TCategoryButtons
      Left = 0
      Top = -20
      Width = 194
      Height = 177
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 40
      ButtonWidth = 100
      ButtonOptions = [boFullSize, boShowCaptions, boCaptionOnlyBorder]
      Categories = <
        item
          Color = clNone
          Collapsed = False
          Items = <
            item
              Action = actCli
            end
            item
              Action = actProd
              Caption = '   Produtos'
            end
            item
              Action = actKits
            end>
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      HotButtonColor = 12477460
      Images = imlIcons
      RegularButtonColor = clNone
      SelectedButtonColor = clNone
      TabOrder = 0
    end
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 12477460
    ParentBackground = False
    TabOrder = 1
    object imgMenu: TImage
      Left = 10
      Top = 10
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF40000002B744558744372656174696F6E2054696D65
        0053756E20322041756720323031352031373A30353A3430202D30363030AB9D
        78EE0000000774494D4507DF0802160936B3167602000000097048597300002E
        2300002E230178A53F760000000467414D410000B18F0BFC61050000003B4944
        415478DAEDD3310100200C0341EA5F3454020BA1C3BD81DC925A9F2B00809180
        DD3D19EB00AE00C9000066BE00201900C0CC1700240300003859BE2421B37CDF
        370000000049454E44AE426082}
      OnClick = imgMenuClick
    end
    object lblTitle: TLabel
      Left = 68
      Top = 12
      Width = 78
      Height = 21
      Caption = 'Cadastros '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 434
      Top = 18
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbPadrao: TLabel
      Left = 477
      Top = 16
      Width = 228
      Height = 13
      AutoSize = False
      Caption = 'lbPadrao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 200
    Top = 50
    Width = 529
    Height = 519
    ActivePage = tsProd
    Style = tsFlatButtons
    TabOrder = 2
    object tsCli: TTabSheet
      Caption = 'Clientes'
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 131
        Height = 13
        Caption = 'Clientes com Armazenagem'
      end
      object Label2: TLabel
        Left = 24
        Top = 160
        Width = 143
        Height = 13
        Caption = 'Cliente Padr'#227'o desta M'#225'quina'
      end
      object JvDBGrid1: TJvDBGrid
        Left = 16
        Top = 27
        Width = 473
        Height = 120
        DataSource = dsCli
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
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
            FieldName = 'ID'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Cliente'
            Width = 248
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTACNPJ'
            Title.Caption = 'CNPJ emissor'
            Width = 138
            Visible = True
          end>
      end
      object cbcPadrao: TComboBox
        Left = 24
        Top = 179
        Width = 273
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Sorted = True
        TabOrder = 1
        Text = 'cbcPadrao'
      end
      object btNovo: TBitBtn
        Left = 24
        Top = 224
        Width = 75
        Height = 25
        Caption = 'Novo Cliente'
        TabOrder = 2
        OnClick = btNovoClick
      end
      object CliPanel: TPanel
        Left = 24
        Top = 255
        Width = 417
        Height = 105
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 3
        object Label3: TLabel
          Left = 16
          Top = 8
          Width = 173
          Height = 13
          Caption = 'Escolha o Cliente e Clique em Inserir'
        end
        object Label5: TLabel
          Left = 18
          Top = 79
          Width = 105
          Height = 13
          Caption = 'CNPJ emissor da Nota'
        end
        object cbcCli: TComboBox
          Left = 16
          Top = 28
          Width = 273
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Sorted = True
          TabOrder = 0
          Text = 'cbcCli'
        end
        object btcInserir: TBitBtn
          Left = 300
          Top = 26
          Width = 75
          Height = 25
          Caption = 'Inserir'
          TabOrder = 1
          OnClick = btcInserirClick
        end
        object ckEmite: TCheckBox
          Left = 16
          Top = 56
          Width = 127
          Height = 17
          Caption = 'N'#243's emitimos a nota'
          TabOrder = 2
          OnClick = ckEmiteClick
        end
        object edCNPJ: TMaskEdit
          Left = 152
          Top = 75
          Width = 136
          Height = 21
          EditMask = '00.000.000/0000-00'
          MaxLength = 18
          TabOrder = 3
          Text = '  .   .   /    -  '
          TextHint = 'CNPJ emissor'
        end
      end
      object btGravar: TBitBtn
        Left = 303
        Top = 177
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 4
        OnClick = btGravarClick
      end
      object cli_altera: TPanel
        Left = 24
        Top = 224
        Width = 417
        Height = 137
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 5
        Visible = False
        object Label20: TLabel
          Left = 24
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object cli_ID: TLabel
          Left = 72
          Top = 16
          Width = 32
          Height = 13
          Caption = 'cli_ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cli_nome: TLabel
          Left = 110
          Top = 16
          Width = 267
          Height = 13
          AutoSize = False
          Caption = 'cli_nome'
        end
        object Label21: TLabel
          Left = 24
          Top = 113
          Width = 137
          Height = 13
          Caption = 'CNPJ emissor da  Nota Fiscal'
        end
        object cli_btcvoltar: TSpeedButton
          Left = 362
          Top = 35
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000000
            87777777770AAAAA00877777770AAAAAA2077777770AAAAA2A20777777000000
            A220777777777777002077777777777777007777077777777700777007777777
            0020770A00000000A22070AAAAAAAAAA2A200AAAAAAAAAAAA20770AAAAAAAAAA
            0077770A00000000877777700777777777777777077777777777}
          OnClick = cli_btcvoltarClick
        end
        object cli_btcsalvar: TSpeedButton
          Left = 364
          Top = 68
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777770000000000007770330770000330777033077000033077703307700003
            30777033000000033077703333333333307770330000000330777030FFFFFFF0
            30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
            8077777CCC777700007777CCC77777777777777C777777777777}
          OnClick = cli_btcsalvarClick
        end
        object cli_ckalt: TCheckBox
          Left = 24
          Top = 85
          Width = 217
          Height = 17
          Caption = 'N'#243's emitimos a Nota Fiscal de Sa'#237'da'
          TabOrder = 0
          OnClick = cli_ckaltClick
        end
        object cli_ckaltativo: TCheckBox
          Left = 24
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Cliente ATIVO'
          TabOrder = 1
        end
        object cli_altcnpj: TMaskEdit
          Left = 200
          Top = 108
          Width = 120
          Height = 21
          EditMask = '00.000.000/0000-00'
          MaxLength = 18
          TabOrder = 2
          Text = '  .   .   /    -  '
        end
      end
    end
    object tsProd: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 1
      object ProdPanel1: TPanel
        Left = 0
        Top = 0
        Width = 521
        Height = 346
        Align = alTop
        TabOrder = 0
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 519
          Height = 32
          Align = alTop
          Alignment = taLeftJustify
          Caption = 'Produtos'
          TabOrder = 0
        end
        object JvDBGrid3: TJvDBGrid
          Left = 1
          Top = 68
          Width = 519
          Height = 168
          Align = alTop
          DataSource = dsProd
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = JvDBGrid3CellClick
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
              FieldName = 'NOMELONGO'
              Title.Caption = 'Produto'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECURTO'
              Title.Caption = 'Nome Curto'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTMIN'
              Title.Caption = 'M'#237'nima'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Caption = 'Quant Estoque'
              Visible = True
            end>
        end
        object JvDBGrid4: TJvDBGrid
          Left = 1
          Top = 236
          Width = 519
          Height = 109
          Align = alClient
          DataSource = dsProdS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 2
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
              FieldName = 'NOMESUB'
              Title.Caption = 'Produto'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODCLI'
              Title.Caption = 'C'#243'd Cliente'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODTRANSP'
              Title.Caption = 'C'#243'd Transp'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTSUB'
              Title.Caption = 'Quant'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTUM'
              Title.Caption = 'Qt por Unid'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTCALC'
              Title.Caption = 'Qt Calc'
              Width = 48
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 1
          Top = 33
          Width = 519
          Height = 35
          Align = alTop
          Color = clSilver
          ParentBackground = False
          TabOrder = 3
          object Label26: TLabel
            Left = 16
            Top = 11
            Width = 41
            Height = 13
            Caption = 'Procurar'
          end
          object btPesq: TSpeedButton
            Left = 392
            Top = 8
            Width = 23
            Height = 22
            Hint = 'Procura o produto digitado (m'#237'nimo 4 letras)'
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333300003333333333333333333300003333333330033003300300003333
              3333300330033003000033303333333333333333000033000333333333333333
              000030F000333333333333330000330F000333333333333300003330F0000000
              73333333000033330F0078887033333300003333300788FF8703333300003333
              30788888F877333300003333308888888F80333300003333307888888F803333
              000033333078FF8888803333000033333777FF88887733330000333333077888
              8703333300003333333077777033333300003333333370007333333300003333
              33333333333333330000}
            OnClick = btPesqClick
          end
          object lbErro: TLabel
            Left = 457
            Top = 11
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edPesq: TEdit
            Left = 73
            Top = 8
            Width = 304
            Height = 21
            TabOrder = 0
            TextHint = 'Pesquise [nome] ou  #[codtransp] ou @[codcli] '
            OnKeyPress = edPesqKeyPress
          end
        end
        object JvDBGrid6: TJvDBGrid
          Left = 2
          Top = 69
          Width = 519
          Height = 167
          DataSource = dsProdTemp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = JvDBGrid6CellClick
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
              FieldName = 'CodCli'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Produto'
              Width = 202
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeCurto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Minima'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quant'
              Visible = True
            end>
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 346
        Width = 521
        Height = 142
        Align = alClient
        TabOrder = 1
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 519
          Height = 36
          Align = alTop
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object pLbSel: TLabel
            Left = 237
            Top = 11
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pbtInsere: TBitBtn
            Left = 16
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Inserir'
            TabOrder = 0
            OnClick = pbtInsereClick
          end
          object pbtAlterar: TBitBtn
            Left = 118
            Top = 5
            Width = 113
            Height = 25
            Caption = 'Alterar Selecionado'
            TabOrder = 1
            Visible = False
            OnClick = pbtAlterarClick
          end
          object pbtImporta: TBitBtn
            Left = 424
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 2
            OnClick = pbtImportaClick
          end
        end
        object ProdPanel2: TPanel
          Left = 1
          Top = 37
          Width = 519
          Height = 104
          Align = alClient
          TabOrder = 1
          object Label6: TLabel
            Left = 8
            Top = 16
            Width = 59
            Height = 13
            Caption = 'Nome Longo'
          end
          object Label7: TLabel
            Left = 8
            Top = 40
            Width = 57
            Height = 13
            Caption = 'Nome Curto'
          end
          object Label8: TLabel
            Left = 8
            Top = 64
            Width = 65
            Height = 13
            Caption = 'Quant M'#237'nima'
          end
          object Label9: TLabel
            Left = 8
            Top = 96
            Width = 94
            Height = 13
            Caption = 'Classifica'#231#227'o1 Local'
          end
          object Label10: TLabel
            Left = 9
            Top = 119
            Width = 67
            Height = 13
            Caption = 'Classifica'#231#227'o2'
          end
          object Label11: TLabel
            Left = 10
            Top = 142
            Width = 67
            Height = 13
            Caption = 'Classifica'#231#227'o3'
          end
          object Label12: TLabel
            Left = 9
            Top = 165
            Width = 67
            Height = 13
            Caption = 'Classifica'#231#227'o4'
          end
          object Label13: TLabel
            Left = 208
            Top = 64
            Width = 82
            Height = 13
            Caption = 'Quant por Palete'
          end
          object Bevel1: TBevel
            Left = 8
            Top = 192
            Width = 393
            Height = 2
          end
          object Label14: TLabel
            Left = 176
            Top = 224
            Width = 72
            Height = 13
            Caption = 'C'#243'd. de Barras'
          end
          object Label15: TLabel
            Left = 176
            Top = 247
            Width = 55
            Height = 13
            Caption = 'C'#243'd Cliente'
          end
          object Label16: TLabel
            Left = 176
            Top = 270
            Width = 59
            Height = 13
            Caption = 'C'#243'd. Transp'
          end
          object Label17: TLabel
            Left = 10
            Top = 224
            Width = 39
            Height = 13
            Caption = 'Unidade'
          end
          object Label18: TLabel
            Left = 9
            Top = 247
            Width = 68
            Height = 13
            Caption = 'Itens por Unid'
          end
          object Label19: TLabel
            Left = 10
            Top = 270
            Width = 65
            Height = 13
            Caption = 'Quant M'#237'nima'
          end
          object pbtSalvarP: TSpeedButton
            Left = 400
            Top = 161
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
            OnClick = pbtSalvarPClick
          end
          object pbtSalvarU: TSpeedButton
            Left = 399
            Top = 266
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
            OnClick = pbtSalvarUClick
          end
          object pbtVoltar: TSpeedButton
            Left = 481
            Top = 13
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000000
              87777777770AAAAA00877777770AAAAAA2077777770AAAAA2A20777777000000
              A220777777777777002077777777777777007777077777777700777007777777
              0020770A00000000A22070AAAAAAAAAA2A200AAAAAAAAAAAA20770AAAAAAAAAA
              0077770A00000000877777700777777777777777077777777777}
            OnClick = pbtVoltarClick
          end
          object pbtNovoU: TSpeedButton
            Left = 399
            Top = 239
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
              0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
              0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
              8888880FFFFFF008888888000000008888888888888888888888}
            OnClick = pbtNovoUClick
          end
          object plbContaL: TLabel
            Left = 408
            Top = 16
            Width = 47
            Height = 13
            Caption = 'plbContaL'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Calibri Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object plbContaC: TLabel
            Left = 232
            Top = 40
            Width = 48
            Height = 13
            Caption = 'plbContaC'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Calibri Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object pLbSalvo1: TLabel
            Left = 424
            Top = 166
            Width = 47
            Height = 13
            Caption = 'pLbSalvo1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Calibri Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object plbSalvo2: TLabel
            Left = 424
            Top = 272
            Width = 44
            Height = 13
            Caption = 'plbSalvo2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Calibri Light'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 8
            Top = 200
            Width = 49
            Height = 13
            Caption = 'Nome SUB'
          end
          object Label24: TLabel
            Left = 249
            Top = 200
            Width = 30
            Height = 13
            Caption = 'Quant'
          end
          object pedQtEstoque: TLabel
            Left = 302
            Top = 200
            Width = 21
            Height = 13
            Caption = '000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pedBtQt: TSpeedButton
            Left = 350
            Top = 195
            Width = 23
            Height = 22
            Hint = 'Altera Quantidade'
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000F0000000E0000000100
              0400000000007000000000000000000000001000000000000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
              FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
              FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
              00F0FFFFFFFFFFFFFFF0}
            ParentShowHint = False
            ShowHint = True
            OnClick = pedBtQtClick
          end
          object Label25: TLabel
            Left = 192
            Top = 384
            Width = 120
            Height = 13
            Caption = 'Quantidade unit'#225'ria total'
          end
          object pedLbTot: TLabel
            Left = 332
            Top = 384
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'pedLbTot'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pbApagar: TSpeedButton
            Left = 480
            Top = 72
            Width = 23
            Height = 22
            Hint = 'Excluir o Produto'
            Flat = True
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777770000000777777777777777770000000777777777777770F700000007777
              0F777777777770000000777000F7777770F770000000777000F777770F777000
              00007777000F77700F777000000077777000F700F7777000000077777700000F
              7777700000007777777000F777777000000077777700000F7777700000007777
              7000F70F7777700000007770000F77700F7770000000770000F7777700F77000
              00007700F7777777700F70000000777777777777777770000000777777777777
              777770000000}
            OnClick = pbApagarClick
          end
          object pedLongo: TEdit
            Left = 80
            Top = 13
            Width = 313
            Height = 21
            MaxLength = 40
            TabOrder = 0
            Text = 'pedLongo'
            OnKeyUp = pedLongoKeyUp
          end
          object pedCurto: TEdit
            Left = 80
            Top = 37
            Width = 145
            Height = 21
            MaxLength = 15
            TabOrder = 1
            Text = 'Edit2'
            OnKeyUp = pedCurtoKeyUp
          end
          object pckValidade: TCheckBox
            Left = 304
            Top = 101
            Width = 97
            Height = 17
            Caption = 'Usa Validade'
            TabOrder = 8
          end
          object pckFIFO: TCheckBox
            Left = 304
            Top = 124
            Width = 97
            Height = 17
            Caption = 'Usa FIFO'
            TabOrder = 9
          end
          object pedClass1: TEdit
            Left = 111
            Top = 93
            Width = 121
            Height = 21
            MaxLength = 20
            TabOrder = 4
            Text = 'Edit2'
          end
          object pedClass2: TEdit
            Left = 111
            Top = 116
            Width = 121
            Height = 21
            MaxLength = 20
            TabOrder = 5
            Text = 'pedClass2'
          end
          object pedClass3: TEdit
            Left = 111
            Top = 139
            Width = 121
            Height = 21
            MaxLength = 20
            TabOrder = 6
            Text = 'pedClass3'
          end
          object pedClass4: TEdit
            Left = 111
            Top = 162
            Width = 121
            Height = 21
            MaxLength = 20
            TabOrder = 7
            Text = 'pedClass4'
          end
          object piMinP: TJvValidateEdit
            Left = 88
            Top = 61
            Width = 41
            Height = 21
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            TabOrder = 2
          end
          object piPalete: TJvValidateEdit
            Left = 304
            Top = 61
            Width = 89
            Height = 21
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            TabOrder = 3
          end
          object pbtSalvar1: TBitBtn
            Left = 318
            Top = 294
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 16
            OnClick = pbtSalvar1Click
          end
          object pedCodB: TEdit
            Left = 272
            Top = 221
            Width = 121
            Height = 21
            TabOrder = 13
            Text = 'pedCodB'
          end
          object pedCodC: TEdit
            Left = 272
            Top = 244
            Width = 121
            Height = 21
            TabOrder = 14
            Text = 'pedCodC'
          end
          object pedCodT: TEdit
            Left = 272
            Top = 267
            Width = 121
            Height = 21
            TabOrder = 15
            Text = 'pedCodT'
          end
          object pedUnid: TEdit
            Left = 73
            Top = 221
            Width = 97
            Height = 21
            MaxLength = 5
            TabOrder = 10
            Text = 'pedUnid'
          end
          object piItens: TJvValidateEdit
            Left = 112
            Top = 244
            Width = 41
            Height = 21
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            TabOrder = 11
          end
          object piMinU: TJvValidateEdit
            Left = 112
            Top = 267
            Width = 42
            Height = 21
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            TabOrder = 12
          end
          object JvDBGrid5: TJvDBGrid
            Left = 10
            Top = 291
            Width = 383
            Height = 91
            DataSource = dsProdS2
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 17
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = JvDBGrid5DblClick
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'NOMESUB'
                Title.Caption = 'Produto'
                Width = 146
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODCLI'
                Title.Caption = 'C'#243'd Cliente'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODBARRAS'
                Title.Caption = 'C'#243'd Barras'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTSUB'
                Title.Caption = 'Quantidade'
                Width = 35
                Visible = True
              end>
          end
          object pckAtivo: TCheckBox
            Left = 304
            Top = 160
            Width = 97
            Height = 17
            Caption = 'Ativo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object pedNome: TEdit
            Left = 63
            Top = 194
            Width = 169
            Height = 21
            TabOrder = 19
            Text = 'pedNome'
          end
        end
      end
    end
    object tsKit: TTabSheet
      Caption = 'Kits'
      ImageIndex = 3
      object Label22: TLabel
        Left = 24
        Top = 16
        Width = 98
        Height = 13
        Caption = 'em desenvolvimento'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      TabVisible = False
      object JvDBGrid2: TJvDBGrid
        Left = 24
        Top = 35
        Width = 433
        Height = 120
        TabOrder = 0
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
      end
      object BitBtn1: TBitBtn
        Left = 32
        Top = 168
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object Edit1: TEdit
        Left = 24
        Top = 8
        Width = 425
        Height = 21
        TabOrder = 2
        Text = 'SELECT * FROM TBE_CLIENTE WHERE id=1'
      end
    end
  end
  object ActionList1: TActionList
    Images = imlIcons
    Left = 72
    Top = 212
    object actCli: TAction
      Caption = '   Clientes'
      ImageIndex = 1
      OnExecute = actCliExecute
    end
    object actProd: TAction
      Caption = '                      Produtos'
      ImageIndex = 2
      OnExecute = actProdExecute
    end
    object actKits: TAction
      Caption = '  Kits'
      ImageIndex = 3
      OnExecute = actKitsExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object imlIcons: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 72
    Top = 292
    Bitmap = {
      494C010104008000740120002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
      FAFFDDDDDDFFC2C2C2FFAEAEAEFF8B8B8BFF8B8B8BFF8B8B8BFF939393FFA1A1
      A1FFB3B3B3FFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCFFACACACFF858585FF5757
      57FF5B5B5BFF5E5E5EFF606060FF636363FF636363FF636363FF626262FF6161
      61FF5F5F5FFF5C5C5CFF5D5D5DFF7A7A7AFFA0A0A0FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD8D8D8FF909090FF5A5A5AFF606060FF646464FF6868
      68FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF686868FF656565FF616161FF5E5E5EFF8A8A8AFFE2E2
      E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF747474FF656565FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF5959
      59FFE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7C7C7CFF656565FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF5A5A
      5AFFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF8D8D8DFF636363FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF5A5A
      5AFFE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF9F9F9FFF616161FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF686868FF5E5E
      5EFFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD4D4D4FF5C5C5CFF686868FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF656565FF7878
      78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5
      F5FF858585FF858585FF818181FFABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6FFBFBFBFFF9F9F9FFF858585FF8484
      84FF939393FFADADADFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
      FBFFC1C1C1FFC1C1C1FFBEBEBEFFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFDADADAFFC1C1C1FFC0C0
      C0FFCFCFCFFFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF4F4F4FF5B5B5BFF686868FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF616161FFA5A5
      A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF646464FF646464FF5D5D5DFF959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE3E3E3FFAEAEAEFF808080FF595959FF5E5E5EFF616161FF646464FF6464
      64FF626262FF606060FF5A5A5AFF7D7D7DFFC2C2C2FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3
      F3FF5E5E5EFF5E5E5EFF575757FF919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEEEEEEFFBEBEBEFF6E6E6EFF595959FF5B5B5BFF5E5E5EFF5E5E
      5EFF5C5C5CFF585858FF828282FFBABABAFFF9F9F9FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF5D5D5DFF585858FF5A5A5AFF5A5A5AFF5A5A5AFF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF616161FF5A5A5AFF5A5A5AFF5A5A5AFF4E4E4EFFD2D2
      D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFFFFFFFFFF6F6F6FFC3C3C3FF6565
      65FF5A5A5AFF606060FF646464FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF686868FF646464FF5C5C5CFFB3B3B3FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFFFFFFFFFFFFFFFFFFAFAFAFF9595
      95FF6B6B6BFF595959FF5E5E5EFF666666FF686868FF696969FF696969FF6969
      69FF696969FF696969FF646464FF5E5E5EFF5B5B5BFFEFEFEFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC0C0C0FFC4C4C4FFC6C6C6FFC3C3C3FFD5D5D5FFFFFFFFFF6565
      65FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FFB7B7B7FFF7F7F7FFC1C1C1FFC6C6C6FFC6C6C6FFBCBC
      BCFFF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFCFCFCFFF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF656565FF5858
      58FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFCECECEFF585858FF686868FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF686868FF5D5D5DFF6F6F
      6FFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5C5C5CFF5C5C5CFF5D5D5DFF565656FF888888FFFFFFFFFF6565
      65FF696969FF696969FF696969FF636363FF5E5E5EFF626262FF696969FF6969
      69FF696969FF696969FFB9B9B9FFD1D1D1FF505050FF5C5C5CFF5E5E5EFF5050
      50FFE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF686868FF6868
      68FF686868FF686868FF686868FF696969FF696969FF696969FF696969FF6868
      68FF575757FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6868
      68FF686868FF686868FF696969FF696969FF696969FF696969FF686868FF6464
      64FF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF666666FF666666FF6A6A6AFF646464FF929292FFFFFFFFFF6565
      65FF696969FF696969FF686868FF8B8B8BFFC4C4C4FF999999FF676767FF6969
      69FF696969FF696969FFB8B8B8FFD5D5D5FF5F5F5FFF6B6B6BFF676767FF5A5A
      5AFFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF686868FF676767FF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5D5D5DFF666666FF686868FF696969FF696969FF6969
      69FF686868FFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF686868FF5F5F5FFF5C5C
      5CFF5C5C5CFF5C5C5CFF636363FF686868FF696969FF696969FF696969FF6969
      69FF656565FFFCFCFCFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF666666FF5A5A5AFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFF6464
      64FF696969FF686868FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFF6868
      68FF696969FF696969FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF565656FF5A5A
      5AFFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF686868FF5F5F5FFF616161FFEAEAEAFFE8E8
      E8FFE7E7E7FFE7E7E7FFCECECEFF6B6B6BFF606060FF696969FF696969FF6969
      69FF636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF686868FF666666FF5B5B5BFFBBBBBBFFE7E7
      E7FFFCFCFCFFFCFCFCFF8D8D8DFF5A5A5AFF666666FF696969FF696969FF6969
      69FF666666FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF585858FF4B4B4BFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3
      D3FF676767FF5E5E5EFFFFFFFFFFD6D6D6FFADADADFFC3C3C3FFFFFFFFFF8989
      89FF585858FFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF474747FF4B4B
      4BFFE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF676767FFF1F1F1FFEBEBEBFFE8E8E8FFE6E6
      E6FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5CFF686868FF6161
      61FF878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF686868FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF999999FF474747FFABABABFFFFFFFFFF646464FF696969FF6666
      66FF666666FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEEEEEEFFEDEDEDFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCACACAFFFFFFFFFF585858FF5F5F5FFF5C5C5CFFCBCBCBFFFDFD
      FDFFD2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECECFFEDED
      EDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF686868FF5B5B5BFF5A5A5AFF5A5A5AFF5858
      58FF626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191FF606060FF6969
      69FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF686868FF7C7C7CFF717171FF707070FF707070FF6B6B
      6BFF989898FFFFFFFFFFF9F9F9FFEFEFEFFFFFFFFFFF646464FF5F5F5FFF5555
      55FFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF666666FF686868FF696969FF696969FF565656FFC0C0
      C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6868
      68FF5E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACAFF525252FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF666666FF666666FF666666FF666666FF6565
      65FF5B5B5BFFFFFFFFFFB0B0B0FFB0B0B0FFABABABFFFFFFFFFF929292FFCACA
      CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE0E0E0FF575757FF686868FF696969FF696969FF696969FF696969FF6464
      64FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF686868FF6868
      68FF686868FF686868FF686868FF686868FF686868FF686868FF686868FF6767
      67FF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FF515151FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFD0D0D0FF5C5C5CFF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6767
      67FF5E5E5EFFFFFFFFFF696969FF696969FF696969FF606060FF757575FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF939393FF626262FF696969FF696969FF696969FF696969FF696969FF6868
      68FF595959FFE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFCBCBCBFF4D4D4DFF595959FF5959
      59FF595959FF595959FF595959FF676767FF5A5A5AFF595959FF595959FF5353
      53FFB9B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FF515151FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF696969FF696969FF626262FF989898FFCCCCCCFF515151FF5D5D5DFF5D5D
      5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5858
      58FF818181FFDFDFDFFF5D5D5DFF5D5D5DFF5D5D5DFF595959FF747474FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF626262FF676767FF696969FF696969FF696969FF696969FF696969FF6969
      69FF5F5F5FFFB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3
      F3FF5E5E5EFF5E5E5EFF575757FF919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FF515151FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF656565FF656565FF5F5F5FFF969696FFEEEEEEFFC5C5C5FFCACACAFFCACA
      CAFFCACACAFFCACACAFFCACACAFFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFCFCF
      CFFFFFFFFFFFDADADAFFD1D1D1FFD1D1D1FFD1D1D1FFD0D0D0FFD7D7D7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7
      C7FF5C5C5CFF686868FF696969FF696969FF696969FF696969FF696969FF6969
      69FF676767FF646464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
      FAFFC2C2C2FFC2C2C2FFBFBFBFFFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FF515151FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4
      F4FF767676FF767676FF717171FFA2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFC5C5C5FFC9C9C9FFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD1D1D1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D
      8DFF626262FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF686868FF5C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7FF515151FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF595959FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF656565FF7D7D7DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7
      D7FF5C5C5CFF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF686868FF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5CFFEAEAEAFFEBEBEBFFEAEAEAFFEAEA
      EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFB8B8B8FF545454FFF7F7
      F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E
      5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5A5A5AFF747474FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9FF5F5F5FFF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF686868FF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF4A4A4AFF484848FF484848FF4848
      48FF484848FF484848FF484848FF484848FF484848FF4E4E4EFF4B4B4BFFF4F4
      F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFBFBFBFFFC9C9C9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6
      A6FF606060FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF5C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1
      C1FF5C5C5CFF686868FF696969FF696969FF696969FF696969FF696969FF6969
      69FF686868FF595959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF6E6E6EFF636363FFD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF5D5D5DFF676767FF696969FF696969FF696969FF696969FF696969FF6868
      68FF5F5F5FFF868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060FF6363
      63FFE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF646464FF585858FFD3D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD2D2D2FF555555FF676767FF696969FF696969FF696969FF656565FF5959
      59FF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF535353FF5858
      58FFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF666666FF616161FF9C9C9CFFADADADFFC4C4C4FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF9F9F9FF727272FF5C5C5CFF696969FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4FFA9A9A9FFB8B8B8FF606060FF5A5A
      5AFFE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF616161FF626262FF5D5D5DFF555555FF878787FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4FFC8C8C8FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7FF4F4F4FFF5A5A5AFF636363FF5555
      55FFE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF8A8A8AFF8A8A8AFF8B8B8BFF878787FFAAAAAAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7FF838383FF8B8B8BFF8B8B8BFF8181
      81FFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object dsCli: TJvDataSource
    DataSet = eDM.cdsCli
    Left = 684
    Top = 61
  end
  object dsProd: TJvDataSource
    DataSet = eDM.cdsProd
    Left = 676
    Top = 189
  end
  object dsProdS2: TDataSource
    DataSet = eDM.cdsProdS
    Left = 549
    Top = 423
  end
  object dsProdS: TJvDataSource
    DataSet = eDM.cdsProdS
    Left = 684
    Top = 237
  end
  object ProdTemp: TJvMemoryData
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NomeCurto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Minima'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftInteger
      end
      item
        Name = 'CodCli'
        DataType = ftString
        Size = 20
      end>
    Left = 620
    Top = 197
    object ProdTempid: TIntegerField
      FieldName = 'id'
    end
    object ProdTempProduto: TStringField
      FieldName = 'Produto'
    end
    object ProdTempNomeCurto: TStringField
      FieldName = 'NomeCurto'
    end
    object ProdTempMinima: TIntegerField
      FieldName = 'Minima'
    end
    object ProdTempQuant: TIntegerField
      FieldName = 'Quant'
    end
    object ProdTempCodCli: TStringField
      FieldName = 'CodCli'
    end
  end
  object dsProdTemp: TJvDataSource
    DataSet = ProdTemp
    Left = 532
    Top = 197
  end
end
