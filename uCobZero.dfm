object CobZero: TCobZero
  Left = 204
  Top = 118
  BorderIcons = [biSystemMenu]
  Caption = 'Mostra Notas com Frete igual a ZERO'
  ClientHeight = 342
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 830
    Height = 253
    Align = alClient
    DataSource = DataSource1
    FixedColor = 14142873
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 14737632
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'Nota F'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCAL'
        Title.Caption = 'Local'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Localidade'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Volume'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PONTO'
        Title.Caption = 'pt pt'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVICO2'
        Title.Caption = 'Servi'#231'o Cob'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VFRETE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Frete Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Observa'#231#227'o'
        Width = 192
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 89
    Align = alTop
    Color = 15592408
    TabOrder = 1
    ExplicitWidth = 838
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Notas Fiscais'
    end
    object lbRel: TLabel
      Left = 111
      Top = 8
      Width = 30
      Height = 13
      Caption = 'lbRel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btAtualiza: TBitBtn
      Left = 32
      Top = 56
      Width = 97
      Height = 25
      Caption = 'Atualiza'
      TabOrder = 0
      OnClick = btAtualizaClick
    end
    object GroupBox1: TGroupBox
      Left = 424
      Top = 8
      Width = 337
      Height = 73
      Caption = 'Resumo'
      TabOrder = 1
      object Label2: TLabel
        Left = 11
        Top = 24
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object Label3: TLabel
        Left = 13
        Top = 48
        Width = 38
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object lb1: TLabel
        Left = 80
        Top = 24
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'lb1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb2: TLabel
        Left = 80
        Top = 48
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'lb2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DM3.cdsRelN
    Left = 648
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 608
    Top = 128
    object CalculaUM1: TMenuItem
      Caption = 'Calcula UM'
      OnClick = CalculaUM1Click
    end
    object CalculaTODOS1: TMenuItem
      Caption = 'Calcula TODOS'
      OnClick = CalculaTODOS1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AlteraPonto1: TMenuItem
      Caption = 'Altera Ponto'
      OnClick = AlteraPonto1Click
    end
    object AlteraServioCob1: TMenuItem
      Caption = 'Altera Servi'#231'o Cob'
      OnClick = AlteraServioCob1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Romaneio1: TMenuItem
      Caption = 'Romaneio'
      OnClick = Romaneio1Click
    end
  end
end
