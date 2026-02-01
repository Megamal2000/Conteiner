object cadUser1: TcadUser1
  Left = 265
  Top = 166
  Width = 422
  Height = 369
  BorderIcons = [biSystemMenu]
  Caption = 'Usu'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 26
    Height = 13
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 24
    Top = 104
    Width = 24
    Height = 13
    Caption = 'Nivel'
  end
  object edNome: TEdit
    Left = 72
    Top = 68
    Width = 145
    Height = 21
    MaxLength = 12
    TabOrder = 0
    Text = 'edNome'
  end
  object cbTipo: TComboBox
    Left = 72
    Top = 100
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'cbTipo'
    Items.Strings = (
      'Expedi'#231#227'o'
      'Estoque'
      'Funcion'#225'rio'
      'Gerente'
      'Administrador ')
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 152
    Width = 377
    Height = 169
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Caption = 'Login (nome)'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTACESSO'
        Title.Caption = #218'ltimo Acesso'
        Width = 98
        Visible = True
      end>
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 0
    Top = 0
    Width = 414
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
    TabOrder = 3
    InternalVer = 1
    object Label3: TLabel
      Left = 376
      Top = 4
      Width = 30
      Height = 13
      Caption = 'B0001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
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
      Hint = 'Apagar um registro'
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
      Visible = True
      OnClick = btSenhaClick
      SectionName = 'Outros'
    end
  end
  object rgStatus: TRadioGroup
    Left = 264
    Top = 56
    Width = 116
    Height = 81
    Caption = 'Status'
    ItemIndex = 1
    Items.Strings = (
      'Inativo'
      'Ativo'
      'Bloqueado')
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = DM2.cdsUser
    Left = 344
    Top = 136
  end
end
