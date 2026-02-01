object ContDias: TContDias
  Left = 266
  Top = 150
  BorderIcons = [biSystemMenu]
  Caption = 'Inserir dias - Contrato'
  ClientHeight = 442
  ClientWidth = 673
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
    Width = 673
    Height = 169
    Align = alTop
    Color = 13091017
    TabOrder = 0
    ExplicitWidth = 681
    object Label1: TLabel
      Left = 80
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 80
      Top = 44
      Width = 43
      Height = 13
      Caption = 'Motorista'
    end
    object btCli: TSpeedButton
      Left = 48
      Top = 11
      Width = 23
      Height = 22
      Flat = True
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
      OnClick = btCliClick
    end
    object btMot: TSpeedButton
      Left = 48
      Top = 40
      Width = 23
      Height = 22
      Flat = True
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
      OnClick = btMotClick
    end
    object lbCli: TLabel
      Left = 152
      Top = 16
      Width = 66
      Height = 13
      Caption = 'sem Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbMot: TLabel
      Left = 152
      Top = 44
      Width = 79
      Height = 13
      Caption = 'sem Motorista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 21
      Top = 129
      Width = 16
      Height = 13
      Caption = 'Dia'
    end
    object Label4: TLabel
      Left = 112
      Top = 128
      Width = 29
      Height = 13
      Caption = 'Hora1'
    end
    object Label5: TLabel
      Left = 160
      Top = 128
      Width = 29
      Height = 13
      Caption = 'Hora2'
    end
    object Label6: TLabel
      Left = 240
      Top = 128
      Width = 24
      Height = 13
      Caption = 'Km 1'
    end
    object Label7: TLabel
      Left = 296
      Top = 128
      Width = 24
      Height = 13
      Caption = 'Km 2'
    end
    object Label8: TLabel
      Left = 376
      Top = 128
      Width = 46
      Height = 13
      Caption = 'Desconto'
    end
    object Label9: TLabel
      Left = 440
      Top = 128
      Width = 19
      Height = 13
      Caption = 'Obs'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 120
      Width = 633
      Height = 3
    end
    object Label10: TLabel
      Left = 80
      Top = 72
      Width = 57
      Height = 13
      Caption = 'Mostrar dias'
    end
    object btMostrar: TSpeedButton
      Left = 395
      Top = 67
      Width = 23
      Height = 22
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000F0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
        FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
        FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
        00F0FFFFFFFFFFFFFFF0}
      OnClick = btMostrarClick
    end
    object dt: TDateTimePicker
      Left = 16
      Top = 144
      Width = 89
      Height = 21
      Date = 40832.596243668980000000
      Time = 40832.596243668980000000
      TabOrder = 0
      OnKeyPress = dtKeyPress
    end
    object hr1: TMaskEdit
      Left = 112
      Top = 144
      Width = 36
      Height = 21
      EditMask = '##:##'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnKeyPress = hr1KeyPress
    end
    object hr2: TMaskEdit
      Left = 160
      Top = 144
      Width = 40
      Height = 21
      EditMask = '##:##'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      OnKeyPress = hr2KeyPress
    end
    object km1: TEdit
      Left = 240
      Top = 144
      Width = 50
      Height = 21
      TabOrder = 3
      Text = 'km1'
      OnKeyPress = km1KeyPress
    end
    object km2: TEdit
      Left = 296
      Top = 144
      Width = 50
      Height = 21
      TabOrder = 4
      Text = 'km2'
      OnKeyPress = km2KeyPress
    end
    object edDesc: TEdit
      Left = 376
      Top = 144
      Width = 57
      Height = 21
      TabOrder = 5
      Text = 'edDesc'
      OnKeyPress = edDescKeyPress
    end
    object edObs: TEdit
      Left = 440
      Top = 144
      Width = 145
      Height = 21
      TabOrder = 6
      Text = 'edObs'
      OnKeyPress = edObsKeyPress
    end
    object btSalvar: TBitBtn
      Left = 544
      Top = 93
      Width = 99
      Height = 25
      Caption = 'Salvar Tabela'
      TabOrder = 7
      OnClick = btSalvarClick
    end
    object dt1: TDateTimePicker
      Left = 152
      Top = 68
      Width = 113
      Height = 21
      Date = 40832.616075115740000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40832.616075115740000000
      TabOrder = 8
      OnChange = dt1Change
    end
    object dt2: TDateTimePicker
      Left = 280
      Top = 68
      Width = 105
      Height = 21
      Date = 40832.616167893520000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40832.616167893520000000
      TabOrder = 9
    end
    object btRomas: TBitBtn
      Left = 544
      Top = 16
      Width = 97
      Height = 25
      Caption = 'Romaneios'
      TabOrder = 10
      OnClick = btRomasClick
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 169
    Width = 673
    Height = 251
    Align = alClient
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    AlternateRowColor = 15137787
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'tmpData'
        Title.Caption = 'Dia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpHr1'
        Title.Caption = 'Hora Entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpHr2'
        Title.Caption = 'Hora Sa'#237'da'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpKm1'
        Title.Caption = 'Km Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpkm2'
        Title.Caption = 'Km Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpDesc'
        Title.Caption = 'Despesas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpMot'
        Title.Caption = 'Motivo'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmpRoma'
        Title.Caption = 'Romaneio'
        Visible = True
      end>
  end
  object JvDBGridFooter1: TJvDBGridFooter
    Left = 0
    Top = 420
    Width = 673
    Height = 22
    SizeGrip = True
    Columns = <>
    ExplicitTop = 424
    ExplicitWidth = 681
  end
  object tab1: TJvMemoryData
    FieldDefs = <
      item
        Name = 'tmpData'
        DataType = ftDate
      end
      item
        Name = 'tmpHr1'
        DataType = ftTime
      end
      item
        Name = 'tmpHr2'
        DataType = ftTime
      end
      item
        Name = 'tmpKm1'
        DataType = ftInteger
      end
      item
        Name = 'tmpkm2'
        DataType = ftInteger
      end
      item
        Name = 'tmpDesc'
        DataType = ftCurrency
      end
      item
        Name = 'tmpMot'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tmpRoma'
        DataType = ftInteger
      end
      item
        Name = 'tmpNUM'
        DataType = ftLargeint
      end>
    Left = 568
    Top = 120
    object tab1tmpData: TDateField
      FieldName = 'tmpData'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object tab1tmpHr1: TTimeField
      FieldName = 'tmpHr1'
      DisplayFormat = 'hh:nn'
    end
    object tab1tmpHr2: TTimeField
      FieldName = 'tmpHr2'
      DisplayFormat = 'hh:nn'
    end
    object tab1tmpKm1: TIntegerField
      FieldName = 'tmpKm1'
    end
    object tab1tmpkm2: TIntegerField
      FieldName = 'tmpkm2'
    end
    object tab1tmpDesc: TCurrencyField
      FieldName = 'tmpDesc'
    end
    object tab1tmpMot: TStringField
      FieldName = 'tmpMot'
    end
    object tab1tmpRoma: TIntegerField
      FieldName = 'tmpRoma'
    end
    object tab1tmpNUM: TLargeintField
      FieldName = 'tmpNUM'
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = tab1
    Left = 608
    Top = 120
  end
  object JvGridFilter1: TJvGridFilter
    Left = 528
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 120
    object ApagarLinha1: TMenuItem
      Caption = 'Apagar Linha'
      OnClick = ApagarLinha1Click
    end
  end
end
