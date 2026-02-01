object PagVe: TPagVe
  Left = 55
  Top = 234
  Width = 720
  Height = 344
  BorderIcons = [biSystemMenu]
  Caption = 'Visualiza Pagamentos do Ano'
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
    Width = 712
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object SpeedButton1: TSpeedButton
      Left = 184
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Atualizar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = SpeedButton1Click
    end
    object edAno: TEdit
      Left = 53
      Top = 9
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'edAno'
    end
    object btCriar: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Criar Lista'
      TabOrder = 1
      OnClick = btCriarClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDDDDDDD0000000DD0000000000000DD0000000D068
        686868686860D0000000D086800000008680D0000000D06860FFFFF06860D000
        0000D08680F444F08680D0000000D06860FFFFF06860D0000000D08680F44FF0
        8680D0000000D06860FFFFF06860D0000000D08680F444F08680D0000000D068
        60FFFFF06860D0000000D086800000008680D0000000D068686868686860D000
        0000DD0000000000000DD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 41
    Width = 712
    Height = 269
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'ANO'
        Title.Caption = 'Ano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTINICIO'
        Title.Caption = 'In'#237'cio'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTFIM'
        Title.Caption = 'Fim'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCALC'
        Title.Caption = 'Vlr Sistema'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPAG'
        Title.Caption = 'Vlr Pago'
        Width = 79
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPagG
    Left = 288
    Top = 80
  end
end
