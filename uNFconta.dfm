object NFconta: TNFconta
  Left = 207
  Top = 237
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'NFconta'
  ClientHeight = 383
  ClientWidth = 608
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
  object Shape16: TShape
    Left = 280
    Top = 128
    Width = 113
    Height = 73
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape15: TShape
    Left = 144
    Top = 128
    Width = 113
    Height = 73
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape14: TShape
    Left = 8
    Top = 128
    Width = 113
    Height = 73
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape3: TShape
    Left = 296
    Top = 40
    Width = 97
    Height = 65
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape5: TShape
    Left = 224
    Top = 40
    Width = 63
    Height = 65
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape7: TShape
    Left = 152
    Top = 40
    Width = 63
    Height = 65
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape9: TShape
    Left = 80
    Top = 40
    Width = 63
    Height = 65
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape11: TShape
    Left = 8
    Top = 40
    Width = 63
    Height = 65
    Brush.Color = clMoneyGreen
    Shape = stRoundRect
  end
  object Shape12: TShape
    Left = 26
    Top = 72
    Width = 27
    Height = 1
  end
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 608
    Height = 383
    Brush.Style = bsClear
    Pen.Color = clMaroon
    Pen.Width = 3
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 188
    Height = 13
    Caption = 'Data                                                   de'
  end
  object lbMan: TLabel
    Left = 15
    Top = 50
    Width = 50
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbEDI: TLabel
    Left = 88
    Top = 50
    Width = 50
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbCol: TLabel
    Left = 160
    Top = 50
    Width = 50
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbSEM: TLabel
    Left = 232
    Top = 50
    Width = 50
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btSair: TSpeedButton
    Left = 536
    Top = 40
    Width = 33
    Height = 33
    Hint = 'Fechar'
    Glyph.Data = {
      36010000424D3601000000000000760000002800000014000000100000000100
      040000000000C000000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777977777777
      7777977700007779977777777779777700007777977777777799777700007777
      990000000990077700007777799AAAAA99AA0777000077777999AA999AAA0777
      0000777777999999AAAA0777000077777709999AAAAA077700007777779999AA
      AAAA0777000077777999999AAAAA07770000777799999999AAAA077700007779
      999AAA9999000777000077999970007999777777000077999777777799977777
      0000777977777777799977770000777777777777779977770000}
    OnClick = btSairClick
  end
  object Label2: TLabel
    Left = 304
    Top = 80
    Width = 33
    Height = 13
    Caption = 'Soma: '
    Transparent = True
  end
  object Label3: TLabel
    Left = 304
    Top = 48
    Width = 41
    Height = 13
    Caption = 'Total NF'
    Transparent = True
  end
  object lbTot: TLabel
    Left = 352
    Top = 48
    Width = 30
    Height = 13
    Caption = 'lbTot'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbSoma: TLabel
    Left = 352
    Top = 80
    Width = 35
    Height = 13
    Caption = 'lbSoma'
    Transparent = True
  end
  object Label4: TLabel
    Left = 16
    Top = 136
    Width = 40
    Height = 13
    Caption = 'Com Rel'
    Transparent = True
  end
  object Label5: TLabel
    Left = 307
    Top = 130
    Width = 63
    Height = 13
    Caption = 'N'#227'o Cobrado'
    Transparent = True
  end
  object lbRelCom: TLabel
    Left = 70
    Top = 136
    Width = 45
    Height = 13
    Caption = 'lbRelCom'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbRelSem: TLabel
    Left = 306
    Top = 147
    Width = 60
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbRelSem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Shape2: TShape
    Left = 8
    Top = 118
    Width = 561
    Height = 3
  end
  object Label6: TLabel
    Left = 152
    Top = 136
    Width = 20
    Height = 13
    Caption = 'CTe'
    Transparent = True
  end
  object lbCTe: TLabel
    Left = 208
    Top = 136
    Width = 28
    Height = 13
    Caption = 'lbCTe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 16
    Top = 154
    Width = 43
    Height = 13
    Caption = 'No Excel'
    Transparent = True
  end
  object Label8: TLabel
    Left = 152
    Top = 153
    Width = 44
    Height = 13
    Caption = 'Enviados'
    Transparent = True
  end
  object lbRelCob: TLabel
    Left = 71
    Top = 154
    Width = 43
    Height = 13
    Caption = 'lbRelCob'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbCteCob: TLabel
    Left = 208
    Top = 153
    Width = 43
    Height = 13
    Caption = 'lbCteCob'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Shape4: TShape
    Left = 314
    Top = 72
    Width = 63
    Height = 1
  end
  object Shape6: TShape
    Left = 242
    Top = 72
    Width = 27
    Height = 1
  end
  object Shape8: TShape
    Left = 170
    Top = 72
    Width = 27
    Height = 1
  end
  object Shape10: TShape
    Left = 98
    Top = 72
    Width = 27
    Height = 1
  end
  object Shape13: TShape
    Left = 33
    Top = 172
    Width = 63
    Height = 1
  end
  object Shape17: TShape
    Left = 169
    Top = 171
    Width = 63
    Height = 1
  end
  object Shape18: TShape
    Left = 305
    Top = 171
    Width = 63
    Height = 1
  end
  object lbdesc: TLabel
    Left = 24
    Top = 216
    Width = 37
    Height = 13
    Caption = 'lbdesc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object dta: TDateTimePicker
    Left = 53
    Top = 13
    Width = 121
    Height = 21
    Date = 41088.668452141200000000
    Format = 'dd/MM/yyyy ddd'
    Time = 41088.668452141200000000
    TabOrder = 0
    OnChange = dtaChange
  end
  object btManual: TBitBtn
    Left = 14
    Top = 80
    Width = 50
    Height = 20
    Caption = 'manual'
    TabOrder = 1
    OnClick = btManualClick
  end
  object btEdi: TBitBtn
    Left = 88
    Top = 80
    Width = 50
    Height = 20
    Caption = 'edi'
    TabOrder = 2
    OnClick = btEdiClick
  end
  object btColeta: TBitBtn
    Left = 160
    Top = 80
    Width = 50
    Height = 20
    Caption = 'coleta'
    TabOrder = 3
    OnClick = btColetaClick
  end
  object btSem: TBitBtn
    Left = 232
    Top = 80
    Width = 50
    Height = 20
    Caption = 'reent'
    TabOrder = 4
    OnClick = btSemClick
  end
  object btDia: TBitBtn
    Left = 432
    Top = 40
    Width = 75
    Height = 20
    Caption = 'DIA'
    TabOrder = 5
    OnClick = btDiaClick
  end
  object btSemana: TBitBtn
    Left = 432
    Top = 64
    Width = 75
    Height = 20
    Caption = 'Intervalo'
    TabOrder = 6
    OnClick = btSemanaClick
  end
  object dtb: TDateTimePicker
    Left = 221
    Top = 13
    Width = 121
    Height = 21
    Date = 41088.668452141200000000
    Format = 'dd/MM/yyyy ddd'
    Time = 41088.668452141200000000
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 176
    Width = 50
    Height = 20
    Caption = 'Mostrar'
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 176
    Width = 50
    Height = 20
    Caption = 'Mostrar'
    TabOrder = 9
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 312
    Top = 176
    Width = 50
    Height = 20
    Caption = 'Mostrar'
    TabOrder = 10
    OnClick = BitBtn3Click
  end
  object JvDBGrid1: TJvDBGrid
    Left = 13
    Top = 232
    Width = 545
    Height = 137
    DataSource = JvDataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 11
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
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 311
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTAS'
        Title.Caption = 'Notas'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRETE'
        Title.Caption = 'Frete'
        Width = 84
        Visible = True
      end>
  end
  object JvDBGrid2: TJvDBGrid
    Left = 13
    Top = 232
    Width = 546
    Height = 138
    DataSource = JvDataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = JvDBGrid2DblClick
    AlternateRowColor = 8421631
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
        Title.Caption = 'Nota Fiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Localidade'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Volume'
        Width = 69
        Visible = True
      end>
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM4.cdsNum1
    Left = 440
    Top = 184
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM1.cdsNotas
    Left = 488
    Top = 184
  end
end
