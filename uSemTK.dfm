object SemTK: TSemTK
  Left = 235
  Top = 114
  Width = 376
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Notas n'#227'o Recebidas'
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
    Width = 368
    Height = 105
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 164
      Height = 13
      Caption = 'De                                             at'#233
    end
    object dt1: TDateTimePicker
      Left = 38
      Top = 21
      Width = 112
      Height = 21
      Date = 40925.618466064810000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40925.618466064810000000
      TabOrder = 0
    end
    object btPesq: TBitBtn
      Left = 208
      Top = 59
      Width = 89
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btPesqClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333300003333333333333333333300003333373333333333333300003333
        07733333333333330000333000773333333333330000330F0007733333333333
        00003330F000777777733333000033330F000000007733330000333330F00788
        87077333000033333300788FF870773300003333330788888F87073300003333
        3308888888F80733000033333307888888F807330000333333078FF888880733
        0000333333777FF8888773330000333333307788887033330000333333330777
        7703333300003333333337000733333300003333333333333333333300003333
        33333333333333330000}
    end
    object dt2: TDateTimePicker
      Left = 181
      Top = 21
      Width = 116
      Height = 21
      Date = 41176.617861145830000000
      Format = 'dd/MM/yyyy ddd'
      Time = 41176.617861145830000000
      TabOrder = 2
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 105
    Width = 368
    Height = 322
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
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
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATUAL'
        Title.Caption = 'Romaneio Atual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Width = 104
        Visible = True
      end>
  end
  object Rodape: TStatusBar
    Left = 0
    Top = 427
    Width = 368
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsProx
    Left = 288
    Top = 152
  end
end
