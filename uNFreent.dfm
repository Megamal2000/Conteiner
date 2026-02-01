object NFreent: TNFreent
  Left = 239
  Top = 117
  Width = 706
  Height = 356
  BorderIcons = [biSystemMenu]
  Caption = 'Notas Fiscais com mais de duas Reeentregas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlue
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Data do Romaneio'
    end
    object dtR: TDateTimePicker
      Left = 131
      Top = 13
      Width = 126
      Height = 21
      Date = 41387.693595914360000000
      Format = 'dd/MM/yyyy, ddd'
      Time = 41387.693595914360000000
      TabOrder = 0
    end
    object btPesq: TBitBtn
      Left = 272
      Top = 11
      Width = 113
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesqClick
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 698
    Height = 24
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 698
    Height = 249
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 16776176
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
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTAREENT'
        Title.Caption = 'Quant Reentregas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 246
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 496
    Top = 264
    Width = 185
    Height = 41
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 17
      Top = 6
      Width = 95
      Height = 13
      Caption = 'Procurando Notas...'
    end
    object pg: TJvSpecialProgress
      Left = 18
      Top = 20
      Width = 150
      Height = 15
      Caption = 'pg'
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsNFre
    Left = 24
    Top = 176
  end
end
