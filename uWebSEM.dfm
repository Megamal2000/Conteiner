object WebSEM: TWebSEM
  Left = 394
  Top = 341
  Caption = 'Envia Notas para Web SEM Romaneio'
  ClientHeight = 275
  ClientWidth = 477
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
    Width = 477
    Height = 89
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 74
      Height = 13
      Caption = 'Data das Notas'
    end
    object Shape1: TShape
      Left = 24
      Top = 50
      Width = 433
      Height = 33
      Brush.Color = clTeal
      Shape = stRoundRect
    end
    object Label2: TLabel
      Left = 42
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Label2'
      Transparent = True
    end
    object DateTimePicker1: TDateTimePicker
      Left = 126
      Top = 21
      Width = 118
      Height = 21
      Date = 42269.747263587960000000
      Format = 'dd/MM/yyyy ddd'
      Time = 42269.747263587960000000
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 264
      Top = 21
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 368
      Top = 56
      Width = 75
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 256
    Width = 477
    Height = 19
    Panels = <>
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 89
    Width = 477
    Height = 167
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
end
