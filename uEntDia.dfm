object EntDia: TEntDia
  Left = 196
  Top = 114
  Width = 625
  Height = 312
  BorderIcons = [biSystemMenu]
  Caption = 'Todas Notas entradas no Dia'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 64
    Width = 545
    Height = 177
    Brush.Color = clSkyBlue
    Pen.Style = psClear
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 149
    Height = 13
    Caption = 'Clientes x Quantidade de Notas'
    Transparent = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 57
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 17
      Width = 136
      Height = 13
      Caption = 'Data de Importa'#231#227'o/Entrada'
    end
    object DiaE: TDateTimePicker
      Left = 177
      Top = 14
      Width = 126
      Height = 21
      Date = 42397.685223518520000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42397.685223518520000000
      TabOrder = 0
    end
    object btPesq: TBitBtn
      Left = 315
      Top = 13
      Width = 121
      Height = 25
      Caption = 'Mostrar'
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
  end
  object JvDBGrid1: TJvDBGrid
    Left = 22
    Top = 85
    Width = 507
    Height = 142
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
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
        Title.Caption = 'Cliente'
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTAS'
        Title.Caption = 'Qtd Notas'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG'
        Title.Caption = 'Entrada'
        Width = 121
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 259
    Width = 617
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM4.cdsOrig
    Left = 312
    Top = 48
  end
end
