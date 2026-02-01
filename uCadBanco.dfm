object CadBanco: TCadBanco
  Left = 53
  Top = 68
  Caption = 'Banco da Transportadora'
  ClientHeight = 313
  ClientWidth = 458
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
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 458
    Height = 112
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 74
      Height = 13
      Caption = 'Nome do Banco'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Ag'#234'ncia'
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 29
      Height = 13
      Caption = 'Conta'
    end
    object lbAtivo: TLabel
      Left = 372
      Top = 79
      Width = 58
      Height = 19
      Alignment = taRightJustify
      Caption = 'lbAtivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDesc: TEdit
      Left = 100
      Top = 5
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edDesc'
    end
    object edBanco: TEdit
      Left = 101
      Top = 29
      Width = 218
      Height = 21
      TabOrder = 1
      Text = 'edBanco'
    end
    object edAgNum: TJvValidateEdit
      Left = 101
      Top = 53
      Width = 60
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      MaxLength = 4
      TabOrder = 2
      ZeroEmpty = True
    end
    object edAgDig: TJvValidateEdit
      Left = 167
      Top = 53
      Width = 33
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      MaxLength = 1
      TabOrder = 3
      ZeroEmpty = True
    end
    object edContaNum: TJvValidateEdit
      Left = 101
      Top = 77
      Width = 81
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      MaxLength = 10
      TabOrder = 4
      ZeroEmpty = True
    end
    object edContaDig: TJvValidateEdit
      Left = 200
      Top = 77
      Width = 41
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      MaxLength = 2
      TabOrder = 5
      ZeroEmpty = True
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 161
    Width = 458
    Height = 152
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawDataCell = JvDBGrid1DrawDataCell
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
        FieldName = 'DESCREVE'
        Title.Caption = 'Banco (descri'#231#227'o)'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMAGENCIA'
        Title.Caption = 'Ag'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMCONTA'
        Title.Caption = 'N'#250'm da Conta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIGCONTA'
        Title.Caption = 'D'#237'gito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Title.Caption = 'at'
        Width = 33
        Visible = True
      end>
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 458
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [sbAllowDrag, sbFlatBtns, sbGrayedBtns]
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 34
    BtnHeight = 33
    Color = 14480884
    TabOrder = 2
    InternalVer = 1
    object JvSpeedBarSection1: TJvSpeedBarSection
      Caption = 'Normais'
    end
    object JvSpeedBarSection2: TJvSpeedBarSection
      Caption = 'Outros'
    end
    object btNovo: TJvSpeedItem
      Caption = 'btNovo'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Hint = 'Inserir um novo Usu'#225'rio'
      Spacing = 1
      Left = 20
      Top = 3
      Visible = True
      OnClick = btNovoClick
      SectionName = 'Normais'
    end
    object btSalvar: TJvSpeedItem
      Caption = 'btSalvar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      Hint = 'Salvar / Gravar as modifica'#231#245'es'
      Spacing = 1
      Left = 54
      Top = 3
      Visible = True
      OnClick = btSalvarClick
      SectionName = 'Normais'
    end
    object btApagar: TJvSpeedItem
      Caption = 'btApagar'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000071F77777777777777000000011F771577777777770000000711F
        11F7777777777000000077151777777777777000000077511F77000000007000
        0000511771F70FBFBFB070000000157770000BFBFBF070000000777770FF0000
        000070000000777770FFFFF0777770000000777770F888F07777700000007777
        70FFFFF0777770000000777770F888F0777770000000777770FFFFF077777000
        0000777770000000777770000000777777777777777770000000777777777777
        777770000000}
      Hint = 'Ativar / Desativar'
      Spacing = 1
      Left = 88
      Top = 3
      Visible = True
      OnClick = btApagarClick
      SectionName = 'Normais'
    end
    object btSenha: TJvSpeedItem
      Caption = 'btSenha'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777777777000777777777777033007777777777030B30777777777030B
        0B077777770030B0B000770000330B0B08F070333300B0B0FFF0037B7B3B0B08
        F8F007BB3B73B0FFFFF00BB3B3BB00F8F8F088303B3B70FFFFF0070703B3B0F8
        F8F00B803B3B70CCCCC070BB8BB7000000007700800077777777}
      Hint = 'btSenha|'
      Spacing = 1
      Left = 139
      Top = 3
      SectionName = 'Outros'
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsCC
    Left = 224
    Top = 200
  end
end
