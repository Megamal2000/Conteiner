object PagPago: TPagPago
  Left = 228
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Registro do Valor pago'
  ClientHeight = 287
  ClientWidth = 483
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
    Width = 483
    Height = 129
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 491
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object Label2: TLabel
      Left = 16
      Top = 94
      Width = 52
      Height = 13
      Caption = 'Valor Pago'
    end
    object lbMot: TLabel
      Left = 81
      Top = 8
      Width = 32
      Height = 13
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 65
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object Label4: TLabel
      Left = 16
      Top = 32
      Width = 27
      Height = 13
      Caption = 'Modo'
    end
    object lbConta: TLabel
      Left = 264
      Top = 64
      Width = 3
      Height = 13
    end
    object edValorP: TJvValidateEdit
      Left = 80
      Top = 91
      Width = 81
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edValorPKeyPress
    end
    object btSalvar: TBitBtn
      Left = 166
      Top = 90
      Width = 65
      Height = 25
      Caption = 'Salvar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888000088877777777777777778000088000000000000000778000080BF
        B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
        000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
        FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
        BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
        000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
        F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
        88888888888888880000}
      TabOrder = 1
      OnClick = btSalvarClick
    end
    object cbBanco: TComboBox
      Left = 80
      Top = 62
      Width = 177
      Height = 21
      TabOrder = 2
      Text = 'cbBanco'
      OnChange = cbBancoChange
    end
    object cbModo: TComboBox
      Left = 81
      Top = 30
      Width = 145
      Height = 21
      TabOrder = 3
      Text = 'cbModo'
      Items.Strings = (
        'nao pago'
        'transfere'
        'deposito'
        'dinheiro'
        'cheque')
    end
    object ListBox1: TListBox
      Left = 328
      Top = 16
      Width = 121
      Height = 97
      ItemHeight = 13
      TabOrder = 4
      Visible = False
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 129
    Width = 483
    Height = 158
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
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
        FieldName = 'DTPAGM'
        Title.Caption = 'Data do Pagamento'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPAGO'
        Title.Caption = 'Vlr Pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VCALCM'
        Title.Caption = 'Vlr Motor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODO'
        Title.Caption = 'Modo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTA'
        Title.Caption = 'Conta'
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsPagI2
    Left = 424
    Top = 176
  end
end
