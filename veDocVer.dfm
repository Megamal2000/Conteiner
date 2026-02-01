object DocVer: TDocVer
  Left = 0
  Top = 0
  Caption = 'Visualizar o Documento'
  ClientHeight = 396
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 137
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 491
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel
      Left = 312
      Top = 8
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label4: TLabel
      Left = 16
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label5: TLabel
      Left = 16
      Top = 80
      Width = 34
      Height = 13
      Caption = 'Volume'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 102
      Width = 457
      Height = 3
    end
    object lbOpcArm: TLabel
      Left = 19
      Top = 108
      Width = 68
      Height = 13
      Caption = 'Armazenagem'
      Transparent = False
    end
    object lbOpcMov: TLabel
      Left = 104
      Top = 108
      Width = 69
      Height = 13
      Caption = 'Movimenta'#231#227'o'
      Transparent = False
    end
    object lbOpcSeg: TLabel
      Left = 198
      Top = 108
      Width = 34
      Height = 13
      Caption = 'Seguro'
      Transparent = False
    end
    object lbOpcPack: TLabel
      Left = 255
      Top = 108
      Width = 36
      Height = 13
      Caption = 'Packing'
      Transparent = False
    end
    object lbOpcExped: TLabel
      Left = 310
      Top = 108
      Width = 49
      Height = 13
      Caption = 'Expedi'#231#227'o'
      Transparent = False
    end
    object lbDoc: TLabel
      Left = 88
      Top = 8
      Width = 26
      Height = 13
      Caption = 'lbDoc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTipo: TLabel
      Left = 344
      Top = 8
      Width = 28
      Height = 13
      Caption = 'lbTipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNF: TLabel
      Left = 72
      Top = 32
      Width = 23
      Height = 13
      Caption = 'lbNF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDataNF: TLabel
      Left = 56
      Top = 56
      Width = 44
      Height = 13
      Caption = 'lbDataNF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbVol: TLabel
      Left = 64
      Top = 80
      Width = 22
      Height = 13
      Caption = 'lbVol'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btImprimir: TBitBtn
      Left = 390
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 137
    Width = 562
    Height = 186
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
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
    Columns = <
      item
        Expanded = False
        FieldName = 'LIGSUB'
        Title.Caption = 'id'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'C'#243'd Cli'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMESUB'
        Title.Caption = 'Produto'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VUNIT'
        Title.Caption = 'Valor unit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANT'
        Title.Caption = 'Quant'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VSUBT'
        Title.Caption = 'Total'
        Width = 80
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 323
    Width = 562
    Height = 73
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 491
    object Label11: TLabel
      Left = 16
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Origem'
    end
    object Label12: TLabel
      Left = 16
      Top = 27
      Width = 48
      Height = 13
      Caption = 'Criada em'
    end
    object Label13: TLabel
      Left = 16
      Top = 45
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object Label14: TLabel
      Left = 288
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Valor Produtos'
    end
    object Label15: TLabel
      Left = 288
      Top = 27
      Width = 40
      Height = 13
      Caption = 'Valor NF'
    end
    object Label16: TLabel
      Left = 288
      Top = 45
      Width = 64
      Height = 13
      Caption = 'N'#250'm de Itens'
    end
    object lbOrig: TLabel
      Left = 80
      Top = 8
      Width = 28
      Height = 13
      Caption = 'lbOrig'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDataCria: TLabel
      Left = 80
      Top = 27
      Width = 50
      Height = 13
      Caption = 'lbDataCria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbStatus: TLabel
      Left = 80
      Top = 46
      Width = 39
      Height = 13
      Caption = 'lbStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbVProd: TLabel
      Left = 393
      Top = 8
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbVProd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbVnf: TLabel
      Left = 405
      Top = 27
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbVnf'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbItens: TLabel
      Left = 396
      Top = 45
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbItens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = eDM.cdsNFi
    Left = 192
    Top = 176
  end
end
