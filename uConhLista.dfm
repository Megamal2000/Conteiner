object ConhLista: TConhLista
  Left = 304
  Top = 227
  BorderIcons = [biSystemMenu]
  Caption = 'Lista Notas e Gera Conhecimentos'
  ClientHeight = 457
  ClientWidth = 929
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
    Width = 929
    Height = 105
    Align = alTop
    Color = 15591384
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object btproc: TSpeedButton
      Left = 377
      Top = 43
      Width = 25
      Height = 25
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000001000000000000FFFF
        FF00BDA4A500DDC4C500613030006E3D3D00A28A8A00A9919100B69E9E00C4AB
        AB00BDA5A500CAB2B200C9B1B100D0B8B800D7BFBF00D6BEBE00E5CCCC00DDC5
        C500EBD3D300EAD3D300DED2D200D7CCCC00D0C5C500E6E1E100D9D4D400F3F0
        F000E6E3E300AF999800003061000D3D6E00566E8600ABB7C300B6C2CE007E97
        B1007991AA00627B99008DA5C8007289AF007E97C2009DB4DF00F2F2F2006E6E
        6E000D0D0D00C0C0C00000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000002B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B282B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B1D1C01282B2B2B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2A27261C2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
        2B2B2A2425271D2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A2123242A2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A221E212A2B2B2B2B2B2B2B2B2B2B2B
        2B01280128012B2A201E222A2B2B2B2B2B2B2B2B2B2B2B280504050405280100
        1F202A2B2B2B2B2B2B2B2B2B2B2B0405110A100912050429002A2B2B2B2B2B2B
        2B2B2B2B2B04150E08110A1009130B04012B2B2B2B2B2B2B2B2B2B2B2B050D1B
        0E080D0A1009130528012B2B2B2B2B2B2B2B2B2B2A14070D1B0E1B0302100912
        05282B2B2B2B2B2B2B2B2B2B00160C070D1B0D08110A100904012B2B2B2B2B2B
        2B2B2B2B2A18170D1B0D1B0D1B0D0A1005282B2B2B2B2B2B2B2B2B2B000F1A06
        0C070D1B0E08110A04012B2B2B2B2B2B2B2B2B2B2A18191A060C1B0D1B0E0803
        052B2B2B2B2B2B2B2B2B2B2B2B2A11171A060D070D1B0E05282B2B2B2B2B2B2B
        2B2B2B2B2B001618191A170C070D15042B2B2B2B2B2B2B2B2B2B2B2B2B2B002A
        180F1816142A002B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A002A002A2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B
        2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B}
      OnClick = btprocClick
    end
    object Label3: TLabel
      Left = 656
      Top = 88
      Width = 28
      Height = 13
      Caption = 'Notas'
    end
    object lbNT: TLabel
      Left = 688
      Top = 88
      Width = 145
      Height = 13
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbCli: TComboBox
      Left = 88
      Top = 13
      Width = 265
      Height = 21
      TabOrder = 0
      Text = 'cbCli'
    end
    object dta: TDateTimePicker
      Left = 88
      Top = 45
      Width = 121
      Height = 21
      Date = 40962.582321678240000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40962.582321678240000000
      TabOrder = 1
      OnChange = dtaChange
    end
    object btGerar: TBitBtn
      Left = 746
      Top = 11
      Width = 127
      Height = 25
      Caption = 'Gerar '
      TabOrder = 2
      OnClick = btGerarClick
    end
    object dtb: TDateTimePicker
      Left = 232
      Top = 45
      Width = 121
      Height = 21
      Date = 40962.582321678240000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40962.582321678240000000
      TabOrder = 3
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 377
    Top = 105
    Width = 552
    Height = 352
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = 16776176
    TitleArrow = True
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROMANEIO'
        Title.Caption = 'Romaneio'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota Fiscal'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor NF'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTEGRUPO'
        Title.Caption = 'Agrupar'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCONH'
        Title.Caption = 'Conhec'
        Width = 50
        Visible = True
      end>
  end
  object pb: TProgressBar
    Left = 568
    Top = 49
    Width = 305
    Height = 17
    TabOrder = 2
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 377
    Height = 352
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 6
      Width = 92
      Height = 13
      Caption = 'Notas n'#227'o Geradas'
    end
    object JvDBGrid2: TJvDBGrid
      Left = 1
      Top = 25
      Width = 375
      Height = 326
      Align = alBottom
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = JvDBGrid2CellClick
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
          FieldName = 'LIGCLI'
          Title.Caption = 'nCli'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT'
          Title.Caption = 'Notas'
          Width = 37
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = DM4.cdsCT
    Left = 656
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 792
    Top = 184
    object RecolocaNmerodoCTe1: TMenuItem
      Caption = 'Recoloca N'#250'mero do CT-e'
      OnClick = RecolocaNmerodoCTe1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MostrarNotaFiscal1: TMenuItem
      Caption = 'Mostrar Nota Fiscal'
      OnClick = MostrarNotaFiscal1Click
    end
    object MostrarCTe1: TMenuItem
      Caption = 'Mostrar CT-e'
      OnClick = MostrarCTe1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Agruparnotasselecionadas1: TMenuItem
      Caption = 'Agrupar notas selecionadas'
      OnClick = Agruparnotasselecionadas1Click
    end
  end
  object DataSource2: TDataSource
    DataSet = DM4.cdsCTng
    Left = 280
    Top = 216
  end
end
