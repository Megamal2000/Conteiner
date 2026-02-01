object ContSalv: TContSalv
  Left = 243
  Top = 110
  Width = 631
  Height = 330
  BorderIcons = [biSystemMenu]
  Caption = 'Salvar Contrato'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 97
    Align = alTop
    Color = 13091017
    TabOrder = 0
    object Label1: TLabel
      Left = 26
      Top = 21
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbCli: TLabel
      Left = 66
      Top = 21
      Width = 239
      Height = 13
      AutoSize = False
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 360
      Top = 21
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Bevel1: TBevel
      Left = 23
      Top = 43
      Width = 586
      Height = 3
    end
    object Label2: TLabel
      Left = 26
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel
      Left = 336
      Top = 56
      Width = 64
      Height = 13
      Caption = 'Data Prevista'
    end
    object btInsere: TSpeedButton
      Left = 533
      Top = 51
      Width = 25
      Height = 25
      Hint = 'Grava Altera'#231#245'es'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555500005577777777777777777500005000000000000000007500005088
        80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
        0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
        0F44F0750000508880FF0078088880750000508180F400007844807500005088
        80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
        0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
        00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
        55555555550BFFBB0000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btInsereClick
    end
    object btNovo: TSpeedButton
      Left = 568
      Top = 51
      Width = 25
      Height = 25
      Hint = 'Insere novo Contrato'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = btNovoClick
    end
    object vAno: TJvSpinEdit
      Left = 389
      Top = 19
      Width = 57
      Height = 21
      Value = 2012.000000000000000000
      TabOrder = 0
    end
    object edDesc: TEdit
      Left = 88
      Top = 53
      Width = 241
      Height = 21
      TabOrder = 1
    end
    object dtPrev: TDateTimePicker
      Left = 412
      Top = 52
      Width = 109
      Height = 21
      Date = 40899.310224780090000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40899.310224780090000000
      TabOrder = 2
    end
    object btPesq: TBitBtn
      Left = 482
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Mostrar'
      TabOrder = 3
      OnClick = btPesqClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 97
    Width = 623
    Height = 199
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = clSilver
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Descri'#231#227'o'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPREV'
        Title.Caption = 'Data Prevista'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCALC'
        Title.Caption = 'Valor'
        Width = 88
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM3.cdsCred2
    Left = 392
    Top = 80
  end
end
