object ImprimeXML: TImprimeXML
  Left = 185
  Top = 212
  Caption = 'ImprimeXML'
  ClientHeight = 317
  ClientWidth = 715
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
    Width = 715
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 16
      Width = 115
      Height = 13
      Caption = 'Local dos Arquivos XML'
    end
    object Label2: TLabel
      Left = 168
      Top = 48
      Width = 103
      Height = 13
      Caption = 'Arquivos encontrados'
    end
    object lbNum: TLabel
      Left = 280
      Top = 48
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pasta: TJvDirectoryEdit
      Left = 168
      Top = 14
      Width = 481
      Height = 21
      DialogKind = dkWin32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'C:\'
      OnChange = pastaChange
    end
    object btProc: TBitBtn
      Left = 327
      Top = 43
      Width = 75
      Height = 25
      Caption = 'Processar'
      TabOrder = 1
      OnClick = btProcClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 715
    Height = 160
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object JvDBGrid1: TJvDBGrid
      Left = 88
      Top = 16
      Width = 561
      Height = 120
      DataSource = JvDataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      MultiSelect = True
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
          FieldName = 'Nota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Volume'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Arquivo'
          Width = 389
          Visible = True
        end>
    end
    object arq: TFileListBox
      Left = 448
      Top = 64
      Width = 145
      Height = 97
      ItemHeight = 13
      Mask = '*.XML'
      TabOrder = 1
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 16
      Width = 73
      Height = 49
      Caption = 'Selec Todas'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777744477777777777774447700000000077444777777777
        7777777777777777777777777777777777774447777777777777444770000000
        0077444777777777777777777777777777777777777777777777444777777777
        7777444770000000007744477777777777777777777777777777}
      Layout = blGlyphTop
      TabOrder = 2
      WordWrap = True
      OnClick = BitBtn1Click
    end
  end
  object btImpNF: TBitBtn
    Left = 88
    Top = 256
    Width = 113
    Height = 25
    Caption = 'Imprimir NF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
      000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
      0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
      7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
      0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
      0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
      FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
      DDDDDDDDDDDDDDDD0000}
    ParentFont = False
    TabOrder = 2
    OnClick = btImpNFClick
  end
  object btImpEtiq: TBitBtn
    Left = 440
    Top = 256
    Width = 169
    Height = 25
    Caption = 'Imprimir Etiquetas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000012000000120000000100
      040000000000D800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDD000000DDD00000000000DDDD000000DD0777777777070DDD000000D000
      000000000070DD000000D0777777FFF77000DD000000D077777799977070DD00
      0000D0000000000000770D000000D0777777777707070D000000DD0000000000
      70700D000000DDD0FFFFFFFF07070D000000DDDD0FCCCCCF0000DD000000DDDD
      0FFFFFFFF0DDDD000000DDDDD0FCCCCCF0DDDD000000DDDDD0FFFFFFFF0DDD00
      0000DDDDDD000000000DDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
      DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    ParentFont = False
    TabOrder = 3
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab
    Left = 680
    Top = 113
  end
  object Tab: TJvMemoryData
    FieldDefs = <
      item
        Name = 'Nota'
        DataType = ftInteger
      end
      item
        Name = 'Arquivo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Volume'
        DataType = ftInteger
      end>
    Left = 680
    Top = 145
    object TabNota: TIntegerField
      FieldName = 'Nota'
      DisplayFormat = '#,##0'
    end
    object TabArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 60
    end
    object TabVolume: TIntegerField
      FieldName = 'Volume'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 680
    Top = 89
    object AlterarVolume1: TMenuItem
      Caption = 'Alterar Volume'
      OnClick = AlterarVolume1Click
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 296
    Top = 272
  end
end
