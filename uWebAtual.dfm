object WebAtual: TWebAtual
  Left = 242
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza as Ocorr'#234'ncias na WEB'
  ClientHeight = 398
  ClientWidth = 562
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
    Width = 562
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 105
      Height = 13
      Caption = 'Todas as notas do dia'
    end
    object dat: TDateTimePicker
      Left = 152
      Top = 13
      Width = 137
      Height = 21
      Date = 41358.646434097220000000
      Format = 'dd/MM/yyyy. ddd'
      Time = 41358.646434097220000000
      TabOrder = 0
    end
    object btPesq1: TBitBtn
      Left = 304
      Top = 11
      Width = 97
      Height = 25
      Caption = 'Pesquisar'
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
      TabOrder = 1
      OnClick = btPesq1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 562
    Height = 48
    Align = alTop
    Color = clMedGray
    TabOrder = 1
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 139
      Height = 13
      Caption = 'Todas as notas do Romaneio'
    end
    object btPesq2: TBitBtn
      Left = 304
      Top = 13
      Width = 97
      Height = 25
      Caption = 'Pesquisar'
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
      TabOrder = 0
      OnClick = btPesq2Click
    end
    object edNum: TEdit
      Left = 184
      Top = 13
      Width = 89
      Height = 21
      TabOrder = 2
      OnKeyPress = edNumKeyPress
    end
    object ckBaixas: TCheckBox
      Left = 448
      Top = 28
      Width = 122
      Height = 17
      Caption = 'S'#243' Novos e Baixas'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object btEnviar: TBitBtn
      Left = 448
      Top = 4
      Width = 59
      Height = 25
      Caption = 'Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btEnviarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 379
    Width = 562
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 97
    Width = 562
    Height = 241
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = JvDBGrid1CellClick
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
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
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENT'
        Title.Caption = 'Data Entrega'
        Width = 106
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HRENT'
        Title.Caption = 'Hora Entrega'
        Width = 73
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 258
    Top = 287
    Width = 265
    Height = 49
    TabOrder = 4
    object lbTarefa: TLabel
      Left = 24
      Top = 8
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object barP: TJvSpecialProgress
      Left = 16
      Top = 22
      Width = 233
      Height = 19
      BorderStyle = bsSingle
      EndColor = clNavy
      GradientBlocks = True
      StartColor = 16776176
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 338
    Width = 562
    Height = 41
    Align = alBottom
    TabOrder = 5
    object Label3: TLabel
      Left = 41
      Top = 13
      Width = 161
      Height = 13
      Caption = 'Enviar apenas a nota selecionada'
    end
    object lbNota: TLabel
      Left = 216
      Top = 13
      Width = 5
      Height = 13
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btUMA: TBitBtn
      Left = 440
      Top = 8
      Width = 83
      Height = 25
      Caption = 'Enviar 1 Nota'
      TabOrder = 0
      OnClick = btUMAClick
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsWEBc
    Left = 464
    Top = 1
  end
end
