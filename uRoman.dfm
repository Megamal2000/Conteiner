object Roman: TRoman
  Left = 322
  Top = 153
  BorderIcons = [biSystemMenu]
  Caption = 'Romaneio'
  ClientHeight = 615
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 576
    Top = 62
    Width = 3
    Height = 13
  end
  object SpeedButton1: TSpeedButton
    Left = 544
    Top = 56
    Width = 24
    Height = 24
    Flat = True
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777000000070000000007777777000000070FFFFFFF07777700000000070F7
      7777F07777000000000070F77777F07770007000000070F77780008700077000
      000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
      08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
      EFEFFF0770777000000077780000000708777000000077770077777807777000
      0000777770077700777770000000777777800087777770000000777777777777
      777770000000}
    Visible = False
    OnClick = btProcClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 261
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 16
      Top = 32
      Width = 705
      Height = 2
    end
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Romaneio'
    end
    object lbNum: TLabel
      Left = 88
      Top = 14
      Width = 45
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbNum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 144
      Top = 16
      Width = 5
      Height = 13
      Caption = '/'
    end
    object lbAno: TLabel
      Left = 160
      Top = 16
      Width = 27
      Height = 13
      Caption = 'lbAno'
    end
    object Data: TLabel
      Left = 312
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Bevel2: TBevel
      Left = 560
      Top = 40
      Width = 161
      Height = 165
    end
    object btMot: TSpeedButton
      Left = 32
      Top = 40
      Width = 24
      Height = 24
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
    object btAjud: TSpeedButton
      Left = 32
      Top = 96
      Width = 24
      Height = 24
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
      OnClick = btAjudClick
    end
    object btReg: TSpeedButton
      Left = 32
      Top = 128
      Width = 24
      Height = 24
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
      OnClick = btRegClick
    end
    object Label2: TLabel
      Left = 64
      Top = 46
      Width = 43
      Height = 13
      Caption = 'Motorista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 64
      Top = 104
      Width = 42
      Height = 13
      Caption = 'Ajudante'
    end
    object Label5: TLabel
      Left = 64
      Top = 136
      Width = 34
      Height = 13
      Caption = 'Regi'#227'o'
    end
    object btNovo: TSpeedButton
      Left = 568
      Top = 56
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      OnClick = btNovoClick
    end
    object btProc: TSpeedButton
      Left = 568
      Top = 89
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
      OnClick = btProcClick
    end
    object Label6: TLabel
      Left = 600
      Top = 64
      Width = 77
      Height = 13
      Caption = 'Novo Romaneio'
    end
    object Label7: TLabel
      Left = 600
      Top = 94
      Width = 40
      Height = 13
      Caption = 'Procurar'
    end
    object lbMot: TLabel
      Left = 120
      Top = 46
      Width = 425
      Height = 13
      AutoSize = False
      Caption = 'lbMot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAjud: TLabel
      Left = 120
      Top = 104
      Width = 36
      Height = 13
      Caption = 'lbAjud'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbReg: TLabel
      Left = 120
      Top = 136
      Width = 34
      Height = 13
      Caption = 'lbReg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btImp: TSpeedButton
      Left = 568
      Top = 151
      Width = 24
      Height = 24
      Flat = True
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
      OnClick = btImpClick
    end
    object Label9: TLabel
      Left = 600
      Top = 156
      Width = 48
      Height = 13
      Caption = 'Romaneio'
    end
    object lbMin: TLabel
      Left = 269
      Top = 16
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'lbMin'
    end
    object SpeedButton2: TSpeedButton
      Left = 568
      Top = 120
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = SpeedButton2Click
    end
    object Label12: TLabel
      Left = 600
      Top = 123
      Width = 37
      Height = 13
      Caption = 'Atualiza'
    end
    object btEspecial: TSpeedButton
      Left = 448
      Top = 64
      Width = 73
      Height = 22
      Caption = 'Especial'
      Flat = True
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000C0600000FFE00000FBE00000F1E00000E0E00000C0600000F1E0
        0000F1E00000F1E00000FFE00000}
      OnClick = btEspecialClick
    end
    object lbEsp: TLabel
      Left = 441
      Top = 68
      Width = 4
      Height = 20
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btCombina: TSpeedButton
      Left = 690
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Salva Pgto Combinado (Motorista)'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      OnClick = btCombinaClick
    end
    object lbCombina: TLabel
      Left = 608
      Top = 8
      Width = 75
      Height = 13
      Caption = 'COMBINADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btFrete: TSpeedButton
      Left = 578
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Salva Frete Combinado (Cliente)'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000130B0000130B00001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770990770000990777099077000099077709907700009
        90777099000000099077709999999999907770990000000990777090FFFFFFF0
        90777090F9999FF090777090FF999FF090777097F9999FF000777077999F9FF0
        8077777999777700007777999777777777777779777777777777}
      Visible = False
      OnClick = btFreteClick
    end
    object lbFrete: TLabel
      Left = 520
      Top = 8
      Width = 41
      Height = 13
      Caption = 'FRETE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbImp2: TLabel
      Left = 656
      Top = 156
      Width = 8
      Height = 13
      Caption = '**'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object btRec: TSpeedButton
      Left = 568
      Top = 178
      Width = 24
      Height = 24
      Flat = True
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
      OnClick = btRecClick
    end
    object Label16: TLabel
      Left = 600
      Top = 182
      Width = 39
      Height = 13
      Caption = 'Recibos'
    end
    object btSalvaObs: TSpeedButton
      Left = 641
      Top = 233
      Width = 65
      Height = 22
      Caption = 'Salvar Obs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btSalvaObsClick
    end
    object LbObs: TLabel
      Left = 648
      Top = 216
      Width = 37
      Height = 13
      Caption = 'LbObs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 6
      Top = 209
      Width = 19
      Height = 13
      Caption = 'Obs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbSaida: TComboBox
      Left = 118
      Top = 64
      Width = 123
      Height = 21
      TabOrder = 0
      Text = 'escolha Quantidade'
    end
    object btSalvar: TBitBtn
      Left = 448
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      TabOrder = 1
      OnClick = btSalvarClick
    end
    object dtRm: TDateTimePicker
      Left = 344
      Top = 10
      Width = 129
      Height = 21
      Date = 40783.660868958330000000
      Format = 'dd/MM/yyyy ddd'
      Time = 40783.660868958330000000
      TabOrder = 2
    end
    object edNum: TEdit
      Left = 644
      Top = 92
      Width = 69
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edNumKeyPress
    end
    object cbCarF: TComboBox
      Left = 328
      Top = 131
      Width = 113
      Height = 21
      TabOrder = 4
      Text = 'cbCarF'
    end
    object vCombina: TJvValidateEdit
      Left = 616
      Top = 6
      Width = 73
      Height = 21
      Hint = 'Pgto Combinado (Motorista)'
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object vFrete: TJvValidateEdit
      Left = 504
      Top = 6
      Width = 73
      Height = 21
      Hint = 'Frete Combinado (Cliente)'
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
    object ckTodosRec: TCheckBox
      Left = 656
      Top = 182
      Width = 50
      Height = 17
      Caption = 'Todos'
      TabOrder = 7
    end
    object btFinalizar: TBitBtn
      Left = 31
      Top = 178
      Width = 82
      Height = 25
      Caption = 'Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btFinalizarClick
    end
    object memoObs: TMemo
      Left = 31
      Top = 206
      Width = 604
      Height = 49
      Hint = 'Insira a Observa'#231#227'o. M'#237'nimo 3, M'#225'ximo 120 caracteres.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'Obs'
        '')
      MaxLength = 120
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnChange = memoObsChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 261
    Width = 739
    Height = 48
    Align = alTop
    Color = 14611434
    ParentBackground = False
    TabOrder = 1
    object Label8: TLabel
      Left = 24
      Top = 13
      Width = 108
      Height = 13
      Caption = 'N'#250'mero da Nota Fiscal'
    end
    object lbErros: TLabel
      Left = 638
      Top = 30
      Width = 30
      Height = 13
      Caption = 'Erros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbQtN: TLabel
      Left = 288
      Top = 16
      Width = 3
      Height = 13
    end
    object Label10: TLabel
      Left = 332
      Top = 13
      Width = 112
      Height = 13
      Caption = 'Alterar PESO (insira m3)'
    end
    object Label17: TLabel
      Left = 532
      Top = 13
      Width = 71
      Height = 13
      Caption = 'Alterar PESO 2'
    end
    object edNota: TEdit
      Left = 152
      Top = 8
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edNotaKeyPress
    end
    object edCUB: TEdit
      Left = 450
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 1
      OnKeyPress = edCUBKeyPress
    end
    object edCUB2: TEdit
      Left = 610
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 2
      OnKeyPress = edCUB2KeyPress
    end
  end
  object Rodape: TStatusBar
    Left = 0
    Top = 596
    Width = 739
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    OnDblClick = RodapeDblClick
  end
  object ListaErros: TListBox
    Left = 635
    Top = 309
    Width = 104
    Height = 287
    Align = alRight
    Color = clActiveBorder
    ItemHeight = 13
    TabOrder = 3
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 309
    Width = 635
    Height = 287
    Align = alClient
    DataSource = DataSource1
    FixedColor = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clGreen
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = JvDBGrid1DrawColumnCell
    OnDblClick = JvDBGrid1DblClick
    OnTitleClick = JvDBGrid1TitleClick
    MultiSelect = True
    AlternateRowColor = 16776176
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'STATUS_ENT'
        Title.Caption = '..'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNF'
        Title.Caption = 'Nota F'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Title.Caption = 'Vol'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Caption = 'Peso'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCONH'
        Title.Caption = 'Conhec'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALI'
        Title.Caption = 'Localidade'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDCLI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'nCli'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTAREENT'
        Title.Caption = 'Ree'
        Width = 30
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 455
    Top = 83
    Width = 177
    Height = 283
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    Visible = False
    object Label13: TLabel
      Left = 21
      Top = 8
      Width = 123
      Height = 24
      Caption = 'Carro Especial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 19
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 21
      Top = 96
      Width = 21
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btCno: TSpeedButton
      Left = 24
      Top = 240
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888889800008898888888888888898800008899
        88777777777798880000889990000000000998880000888990BFFFBFFF998888
        0000888899FCCCCCCF97888800008888999FBFFFB9978888000088888999CCC9
        990788880000888880999FB99F0788880000888880FC9999CF07888800008888
        80FF9999BF0788880000888880FC9999000788880000888880B99F099F078888
        0000888880999F099998888800008888999FBF0F089988880000889999000000
        8889988800008899988888888888898800008888888888888888889800008888
        88888888888888880000}
      OnClick = btCnoClick
    end
    object btCok: TSpeedButton
      Left = 128
      Top = 240
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
      OnClick = btCokClick
    end
    object cbCli: TComboBox
      Left = 16
      Top = 64
      Width = 145
      Height = 21
      Sorted = True
      TabOrder = 0
      Text = 'cbCli'
      OnChange = cbCliChange
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 109
      Width = 145
      Height = 120
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'SERVICO'
          Visible = True
        end>
    end
  end
  object PanelComb: TPanel
    Left = 352
    Top = 360
    Width = 277
    Height = 120
    TabOrder = 6
    Visible = False
    object Label18: TLabel
      Left = 16
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Notas Selecionadas'
    end
    object lbQuant: TLabel
      Left = 120
      Top = 8
      Width = 45
      Height = 13
      Caption = 'lbQuant'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNotas: TLabel
      Left = 16
      Top = 25
      Width = 241
      Height = 32
      AutoSize = False
      Caption = 'lbNotas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label19: TLabel
      Left = 16
      Top = 64
      Width = 80
      Height = 13
      Caption = 'Valor Combinado'
    end
    object vNFcomb: TJvValidateEdit
      Left = 137
      Top = 61
      Width = 57
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 0
    end
    object btCancel: TBitBtn
      Left = 19
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F10000F10000F100
        00F10000EF0000EF0000ED0000EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000F51A20F53C4CF93A49F83847F83545F83443F73242F7141BF10000
        EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F71D23F94453FA2429F91212F70F
        0FF60C0CF50909F5161BF53343F7141BF10000EDFFFFFFFFFFFFFFFFFF0000F9
        1F25FA4A58FB4247FBC9C9FD3B3BF91313F71010F63333F7C5C5FD3035F73444
        F7141BF20000EDFFFFFFFFFFFF0000FB4F5DFD3237FBCBCBFEF2F2FFEBEBFE3B
        3BF93939F8EAEAFEF1F1FEC5C5FD181DF63343F70000EFFFFFFFFFFFFF0000FD
        525FFD2828FC4747FCECECFFF2F2FFECECFFECECFEF1F1FFEAEAFE3434F70B0B
        F53545F80000EFFFFFFFFFFFFF0000FD5562FE2C2CFD2929FC4848FCEDEDFFF2
        F2FFF2F2FFECECFE3A3AF91212F70F0FF63848F80000F1FFFFFFFFFFFF0000FD
        5764FE3030FD2D2DFD4B4BFCEDEDFFF2F2FFF2F2FFECECFF3D3DF91616F81313
        F73C4BF80000F1FFFFFFFFFFFF0000FF5A67FE3333FE5050FDEDEDFFF3F3FFED
        EDFFEDEDFFF2F2FFECECFE3E3EFA1717F83F4EF90000F1FFFFFFFFFFFF0000FF
        5B68FF4347FECFCFFFF3F3FFEDEDFF4C4CFC4A4AFCECECFFF2F2FFCACAFE2A2F
        FA4251FA0000F3FFFFFFFFFFFF0000FF262BFF5D6AFF585BFFCFCFFF5252FE2F
        2FFD2C2CFD4B4BFCCCCCFE484CFB4957FB1D23F90000F5FFFFFFFFFFFFFFFFFF
        0000FF262BFF5D6AFF4347FF3434FE3232FE3030FD2D2DFD383CFC4F5DFC1F25
        FA0000F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF262BFF5C69FF5B68FF5A
        67FE5865FE5663FE5461FE2227FC0000FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FD0000FD0000FD0000FDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 1
      OnClick = btCancelClick
    end
    object btGrava: TBitBtn
      Left = 175
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FFFCFFF030777030FFCCCFF030777030FFFCCCF777777030FFFFCCC7
        C777700000077CCCC7777777777777CCC777777777777CCCC777}
      TabOrder = 2
      OnClick = btGravaClick
    end
  end
  object quantPanel: TPanel
    Left = 24
    Top = 354
    Width = 185
    Height = 223
    Caption = 'quantPanel'
    TabOrder = 7
    Visible = False
    object LbCli: TLabel
      Left = 24
      Top = 39
      Width = 23
      Height = 13
      Caption = 'LbCli'
    end
    object JvNavPanelHeader1: TJvNavPanelHeader
      Left = 7
      Top = 8
      Caption = ' Quantidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ImageIndex = 0
      object quantFechar: TSpeedButton
        Left = 147
        Top = 2
        Width = 23
        Height = 22
        Glyph.Data = {
          76030000424D76030000000000003600000028000000150000000D0000000100
          18000000000040030000330B0000330B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FFF7F7FFFFFFFFFFFFFFFFFFFFF4F4
          FFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE9E9FF4949FF5252FFE7E7FFFFFFFFC8C8FF3C3C
          FF6D6DFFFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF1F1FF4040FF0101FF8E8EFFF9F9FF5757FF0000
          FF7171FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8FF1111FF2222FF8E8EFF0E0EFF2222
          FFD5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF7070FF0000FF0707FF0101FF8E8E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2FF1A1AFF0000FF2020FFE1E1
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FFF0303FF0000FF0E0EFFB8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2FF2222FF1818FF3A3AFF0000FF4040
          FFEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF9F9FF5A5AFF0000FF7171FFCFCFFF1B1BFF0303
          FF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDEDFF3A3AFF2A2AFFD5D5FFFEFEFF8989FF0E0E
          FF5454FFF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFFDFDFFFFFFFFFFFFFFFF5F5FFD3D3
          FFE3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        OnClick = quantFecharClick
      end
    end
    object JvDBGrid2: TJvDBGrid
      Left = 8
      Top = 56
      Width = 169
      Height = 153
      DataSource = JvDataSource1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
          FieldName = 'DOCDEST'
          Title.Caption = 'Item'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT'
          Title.Caption = 'Quant'
          Width = 32
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = DM1.cdsRomaNF
    Left = 296
    Top = 216
  end
  object RelRom: TppReport
    AutoStop = False
    DataPipeline = pipRom
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'F:\00MZcode\FlaydelSofts\Singular\RELS\Roman5a.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 208
    Top = 217
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipRom'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Flaydel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 16
        Font.Style = []
        Transparent = True
        mmHeight = 7938
        mmLeft = 67733
        mmTop = 2117
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Log'#237'stica e Transporte'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 93134
        mmTop = 4233
        mmWidth = 56621
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Romaneio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Name = 'Arial Black'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 153723
        mmTop = 5292
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67998
        mmTop = 13229
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Ajudante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 67998
        mmTop = 19050
        mmWidth = 14023
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Pen.Color = clSilver
        Pen.Width = 0
        Weight = 0.250000000000000000
        mmHeight = 2380
        mmLeft = 3180
        mmTop = 39159
        mmWidth = 191031
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 43655
        mmWidth = 191030
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22243
        mmTop = 40217
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Nota F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 64051
        mmTop = 40217
        mmWidth = 11642
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 82037
        mmTop = 40217
        mmWidth = 7959
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vol.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 94197
        mmTop = 40217
        mmWidth = 6085
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 109802
        mmTop = 40217
        mmWidth = 7281
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Localidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 124619
        mmTop = 40217
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 40217
        mmWidth = 20638
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Label6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 176213
        mmTop = 5292
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Label17'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5821
        mmLeft = 176213
        mmTop = 13229
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label19'
        HyperlinkEnabled = False
        Caption = 'Label19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 13229
        mmWidth = 13208
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label20'
        HyperlinkEnabled = False
        Caption = 'Label20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 19050
        mmWidth = 13208
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label21'
        HyperlinkEnabled = False
        Caption = 'Conhecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 67998
        mmTop = 28840
        mmWidth = 22860
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label22'
        HyperlinkEnabled = False
        Caption = 'Label22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 93398
        mmTop = 28840
        mmWidth = 12531
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel33: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label33'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Label33'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 146315
        mmTop = 29104
        mmWidth = 36777
        BandType = 0
        LayerName = Foreground
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765A9140000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1EFFC000110800AD00C103012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FB2E
          8A28A0028A28A0028A28A0028A28A0028AF13F157ED3DF0C341D667D3165D575
          66818A3CFA7DBA3C3B81C1019DD777D4641EC4D64FFC35BFC33FFA05F8A7FF00
          0121FF00E3D4058FA0A8AF9F7FE1ADFE19FF00D02FC53FF8090FFF001EA3FE1A
          DFE19FFD02FC53FF008090FF00F1EA0763E82A2BE7DFF86B7F867FF40BF14FFE
          0243FF00C7A8FF0086B7F867FF0040BF14FF00E0243FFC7A80B1F41515F3EFFC
          35BFC33FFA05F8A7FF000121FF00E3D47FC35BFC33FF00A05F8A7FF0121FFE3D
          4058FA0A8AF9F7FE1ADFE19FFD02FC53FF008090FF00F1EA3FE1ADFE19FF00D0
          2FC53FF8090FFF001EA02C7D05457CFBFF000D6FF0CFFE817E29FF00C0487FF8
          F51FF0D6FF000CFF00E817E29FFC0487FF008F50163E82A2BE7DFF0086B7F867
          FF0040BF14FF00E0243FFC7A8FF86B7F867FF40BF14FFE0243FF00C7A80B1F41
          515C17C30F8BDE05F88AEF6FE1DD548BE45DEF63751F95385F500F0C3D4A938E
          F5DED020A28A2800A28A2800A28A2800A28A2800ACBF17D8DDEA9E13D634CB09
          FECF7977633C104B9C79723C6CAAD9F6241AD4A2803F29F5CD2752D0F56B8D2B
          57B29ECAFAD9CC734132ED6461FE7AF4354ABF56AFB4BD32FDD5EFB4EB3BA751
          8569A157207A0C8AADFF0008E787BFE805A5FF00E0247FE141573F2BA8AFD51F
          F8473C3DFF00402D2FFF000123FF000A3FE11CF0F7FD00B4BFFC048FFC280B9F
          95D457EA8FFC239E1EFF00A01697FF008091FF00851FF08E787BFE805A5FFE02
          47FE1405CFCAEA2BF547FE11CF0F7FD00B4BFF00C048FF00C28FF8473C3DFF00
          402D2FFF000123FF000A02E7E57515FAA3FF0008E787BFE805A5FF00E0247FE1
          47FC239E1EFF00A01697FF008091FF00850173F2BA8AFD51FF008473C3DFF402
          D2FF00F0123FF0A3FE11CF0F7FD00B4BFF00C048FF00C280B9F95D457EA8FF00
          C239E1EFFA01697FF8091FF857C75FB70788F4697C59A7F83343B2B18174B433
          DF3DBC4AA4CD201B50E07F0A73FF0003F6A0133C0FC39ACEA3E1ED7ACB5CD26E
          1ADEFACA659A1914F4607BFA83D08EE0915FA91A0DF8D5743B0D4D50A0BCB68E
          70A7F877A86C7EB5F983E05F0F5D78AFC63A4F872C81F3B51BA480103EE027E6
          63ECAB927D857EA3DAC115ADAC56D02048A1411C6A3A2A81803F2A0192514514
          1214514500145798FC52F8E7E01F877AA8D2358BABCBCD4828692D6C21123C40
          8C82E599541239C673820E3045719FF0D6FF000CFF00E817E28FFC0487FF008F
          50163E81A2BE7EFF0086B7F867FF0040BF147FE0243FFC7A8FF86B7F867FF40B
          F147FE0243FF00C7A81D8FA068AF9FBFE1ADFE19FF00D02FC51FF8090FFF001E
          A3FE1ADFE19FFD02FC51FF008090FF00F1EA02C7D03457CFDFF0D6FF000CFF00
          E817E28FFC0487FF008F51FF000D6FF0CFFE817E28FF00C0487FF8F50163E81A
          2BE7EFF86B7F867FF40BF147FE0243FF00C7A8FF0086B7F867FF0040BF147FE0
          243FFC7A80B1F40D15F3F7FC35BFC33FFA05F8A3FF000121FF00E3D47FC35BFC
          33FF00A05F8A3FF0121FFE3D4058FA068AF9FBFE1ADFE19FFD02FC51FF008090
          FF00F1EA3FE1ADFE19FF00D02FC51FF8090FFF001EA02C7D03457CFDFF000D6F
          F0CFFE817E28FF00C0487FF8F51FF0D6FF000CFF00E817E28FFC0487FF008F50
          163E81A2BE74D47F6BCF00C509361E1FF125CCBD9658A1897F31231FD2BCA3E2
          2FED55E36D7E096C7C35656DE1AB5938F3A37335D63D9C80ABF82E47634058FA
          0BF688F8D9A47C36D225D3B4E9A0BEF14CE98B7B40770B704712CB8E80750BD5
          B8ED923E02D46F2EB51D42E350BEB892E2EAE65696696439691D8E4B13EA49A6
          DE5CDCDE5D4B7779712DC5C4CE5E596572EEEC7A924F249F535EB1FB3BFC15D5
          FE256B315FDF43359F85ADE4FF004ABB23699F1D628BD49E85BA2FD70083D8F5
          0FD85FE1BCAD733FC4AD4E22B1A07B5D29587DE27E59651EC06507D5FD2BEB7A
          ABA469D63A46976DA5E996B15A595AC4B1410C4B854403000156A82585145140
          051451401F9CFF00B4DF86F5DD03E32F88A6D6619CC5A95F4B796770C0EC9617
          62CA14F7DA08523B6DAF32AFD5EBDB3B4BD87C9BDB582E63CE764D1875CFAE0D
          52FF008473C3DFF402D2FF00F0123FF0A0773F2BA8AFD51FF8473C3DFF00402D
          2FFF000123FF000A3FE11CF0F7FD00B4BFFC048FFC281DCFCAEA2BF547FE11CF
          0F7FD00B4BFF00C048FF00C28FF8473C3DFF00402D2FFF000123FF000A02E7E5
          7515FAA3FF0008E787BFE805A5FF00E0247FE147FC239E1EFF00A01697FF0080
          91FF00850173F2BA8AFD51FF008473C3DFF402D2FF00F0123FF0A3FE11CF0F7F
          D00B4BFF00C048FF00C280B9F95D4576FF001E355B6D63E30F89EF2CA2862B55
          BF7B7816240A9B22C4408038E4267F1AF48FD873C316FAE7C4FBFD4EFAD22B9B
          5D2F4E6216540EBE6C8C15720F1F77CCFCA819E01457EA8FFC239E1EFF00A016
          97FF008091FF00851FF08E787BFE805A5FFE0247FE140AE7E57515FAA3FF0008
          E787BFE805A5FF00E0247FE147FC239E1EFF00A01697FF008091FF00850173F2
          BC024800124F402BB1F087C2EF883E2CB848B44F09EA93237FCB792130C207BC
          8F85FD6BF49AD348D26D2412DA697656EE3A34502A91F881576815CF967E127E
          C9F69672C7A97C45BF8EF9D4865D32C9D845FF006D24C066FA2E3EA6BE9ED3AC
          ACF4DB082C34FB586D6D2DD0470C30A0448D474000E00AB145020A28A2800A28
          A2800A28A2800A28A2800A2A8788B57B0D0341BFD6F5397C9B2B0B77B89DF192
          11412703B9E381DCD7C8BAE7ED81E247D4A63A278534986C771110BC7924948E
          C58AB2804FA01C7A9EB4058FB268AF8A7FE1AFBC75FF0042DF86FF00EF89BFF8
          E51FF0D7DE3AFF00A16FC37FF7C4DFFC7281D8FB5A8AF8A7FE1AFBC75FF42DF8
          6FFEF89BFF008E51FF000D7DE3AFFA16FC37FF007C4DFF00C7280B1F6B56278F
          75B4F0D78275BF103903FB3EC26B9507BB2A12A3F1381F8D7C89FF000D7DE3AF
          FA16FC37FF007C4DFF00C72B9DF891FB4978C7C71E0BD43C2D7DA468D656B7C1
          16596D56512055757C0DCE473B7078E84D0163C52477924692462CEC4B331392
          49EA6BED7FD82B41FB0FC35D5B5F9136C9AAEA1B10E3EF450AE01FFBE9E41F85
          7C4D5EDFF0EBF692F14F81BC19A7785B4AF0FE8325A58A32A3CCB29772CECEC5
          B0E064963DA81B3EF6A2BE29FF0086BEF1D7FD0B7E1BFF00BE26FF00E3947FC3
          5F78EBFE85BF0DFF00DF137FF1CA0563ED6A2BE29FF86BEF1D7FD0B7E1BFFBE2
          6FFE3947FC35F78EBFE85BF0DFFDF137FF001CA02C7DAD457C53FF000D7DE3AF
          FA16FC37FF007C4DFF00C729D1FED7DE380EA64F0CF875933C85130247D779A0
          2C7DA94578FF00C08F8F3E1FF89B39D226B56D1B5F442E2D1E4DE93A8EA637C0
          C91D4A90081CF20123D828105145140051451400514514005145140183F10FC3
          9178BFC0FACF866698C0BA8DA3C025033E5B11F2B63BE0E0E3BD7C0DAE7C04F8
          B1A56A53591F085E5E88D8859ED0ACB1483B3020F7F4201F502BF45E8A069D8F
          CDBFF852BF15BFE844D67FEFD0FF001A3FE14AFC56FF00A11359FF00BF43FC6B
          F4928A02E7E6DFFC295F8ADFF4226B3FF7E87F8D1FF0A57E2B7FD089ACFF00DF
          A1FE35FA49450173F36FFE14AFC56FFA11359FFBF43FC68FF852BF15BFE844D6
          7FEFD0FF001AFD24A280B9F9B7FF000A57E2B7FD089ACFFDFA1FE347FC295F8A
          DFF4226B3FF7E87F8D7E9251405CFCDBFF00852BF15BFE844D67FEFD0FF1A3FE
          14AFC56FFA11359FFBF43FC6BF4928A02E7E6DFF00C295F8ADFF004226B3FF00
          7E87F8D1FF000A57E2B7FD089ACFFDFA1FE35FA49450173F36FF00E14AFC56FF
          00A11359FF00BF43FC6B9DF187837C51E1092DA3F1368977A53DD06302DC2805
          C2E3247D322BF515D9510BBB055519249C002BF3B3F69DF1FC5F103E29DE5ED8
          4FE6E9160A2CAC187474524B483FDE62C41F4DBE940D3B9C7FC35D4EF746F885
          E1FD4F4E665BAB7D46064DBFC5F38057E841208EE0D7EA257E777ECABE1293C5
          9F1A7465284DA696FF00DA572D8E00888283F190A0FA135FA234098514514082
          8A28A0028A28A0028A28A0028A28A0028AF16FDA33E3B5B7C2EB9B4D174DD363
          D535CB98BCF292B958ADE3C9019B1CB1241C28C74C93D3347F675FDA063F893A
          CCBE1BD6F4A874CD6444D35BB5BB930DC2AFDE00372AC0738C9C807A6280B1EE
          F451450014515F2CFC58FDAAEE344F16DE689E0FD0AC6F6DEC666825BCBD7722
          575386D8A8461411804939F41401F53515F14FFC35F78EBFE85BF0DFFDF137FF
          001CA3FE1AFBC75FF42DF86FFEF89BFF008E503B1F6B515F14FF00C35F78EBFE
          85BF0DFF00DF137FF1CA3FE1AFBC75FF0042DF86FF00EF89BFF8E50163ED6A8A
          F2EADACAD65BBBCB886DADE252F24B2B844451D4927802BE23D4BF6B6F88D710
          98ED34AF0E5931FF00968B6F2BB0FA6E908FD2BCA7C79F12BC71E39723C4DE23
          BCBD8376E5B60C23814F62235C2E47AE33EF4058F75FDA77F6878359B2BAF05F
          80AE5CD8C998B50D5138F3D7A18E2EFB0F42DFC5D070727E5D0092000493D00A
          5891E591628919DDC85555192C4F4007AD7D7BFB2FFECF53E957969E36F1E5AA
          A5DC78974FD2E45C985BAACB28FEF0EA13B1C13C8C007B1DEFEC93F0C5BC05E0
          3FED3D56DCC7AF6B4166B9571868221FEAE2F638259BDCE0FDDAF69A28A090A2
          8A2800A28A2800A28A2800A28A2800A28A8AF2E22B4B39AEEE1F6430C6D248DE
          8AA324FE42803F3C3F6ABD6BFB6FE3C7892557DD15A4C96518FEEF948A8C3FEF
          B0E7F1AE93F61FD21B51F8DD1DFE0ECD2F4F9EE09ED9602203F290FE55E31E20
          D4A5D635ED4357B8CF9D7D752DCC99FEF3B963FA9AFABBFE09F5A2ECD33C55E2
          274CF9B34365137A6C56771FF8FC7F95053D8FAA68A28A0932BC61AB2681E12D
          635C908DBA7D8CD7473FEC216FE95F96323BC9234923167725998F524F535FA1
          1FB5E6B5FD8DF01B5D0AFB65BF315947EFBE40587FDF0AF5F9EB4148EB3C2FF0
          DBC77E27D286ABE1FF000B6A5A8D8B3B209E18F2A587519F6AD5FF00852BF15B
          FE844D67FEFCFF00F5EBEDEFD9A346FEC2F817E15B429B5E6B2176FEA4CCC65E
          7F0703F0AF46A02E7E6DFF00C295F8ADFF004226B3FF007E7FFAF47FC295F8AD
          FF004226B3FF007E7FFAF5FA494502B9F9C765F027E2DDE4CB145E07D4559BBC
          CD1C4BF9BB002BD03C1DFB25F8E7519D5BC49A9E9BA1DB7F1046FB4CDF40AB85
          FC777E75F6E51405CF34F84DF04BC0DF0E82DD69D62DA86AC3AEA37B87957FDC
          18DB18FF007467D49AF4BA28A041451450014514500145145001451450014514
          50015E7FFB45EB5FD81F047C577E1F63B5835AA1EE1A622218F7F9F3F857A057
          CEFF00B79EB5F62F85BA668C8F89352D4D4B0F58E24663FF008F18E8047C455F
          A09FB1D68BFD8FF01F48959364BA8CD35EC831FDE728A7F144435F9F8A0B3055
          04927000EA6BF52FC09A38F0F782743D08003FB3F4F82D8E3B9440A4FE241341
          4CD9A28A0F0326824F973FE0A07AD795E1EF0BF8795F9B9BB96F24507A796811
          49FAF9ADF91AF91F48B19B53D56CF4DB6199EEE748231FED3B051FA9AF4BFDA9
          7C770F8EFE2CDEDD584FE7695A720B1B2707E575424BB8F6672D83DC6DA5FD94
          3C2F2F89FE3768988F75B694FF00DA570D8E1444414FCE42828296C7E83E9967
          0E9FA6DB585B2ED82DA148631E8AA001FA0AB145141214514500145145001451
          4500145145001451450014514500145145001451450015F17FEDFBAD7DABC7BA
          0682AFB92C34E6B861E8F339047D71129FC6BED0AFCE6FDA8B5AFEDCF8EFE27B
          857DD1DB5C8B241D97C9411B0FFBE958FE340D187F05745FF8487E2D785B4829
          BE39B5385A55F58D183BFF00E3AAD5FA6B5F98BF0A3C6971F0FBC6D69E2AB4D3
          ADAFEE6D12458A39D88505D0A13C739C31FCEBD9AFBF6BDF1BC9015B2F0DF87E
          DE43FC720964C7E1BC50368FB4A4748E3692475445059998E0003A926BE53FDA
          83F685B37B0BBF057806F84EF30315FEAB0B7C8A87868E161F789E85C7007032
          4E4782FC42F8C1F10BC751BDB6BDE219FEC2FD6CAD8086023D0AAFDEFF008113
          5C1D009095F79FEC79F0D64F057809B5DD52168F59D7952674618305B8C98D31
          D89C963F500FDDAF36FD977F67CBB7BDB4F1B78F6C7C9B68F12E9FA5CCBF3C8D
          D564954F451D421E49E4E00C1FAEE8136145145020A28A2800A28A2800A28A28
          00A28A2800A28A2800A28A2800A28A2800A28A2800AF85BF680F813E3BB2F88B
          ABEAFE1FD0EEF5BD2754BB92EE192D17CC78CC8C59A3741F30C124038C118E73
          903EE9A281A763F347FE151FC50FFA107C45FF0080127F854D6BF06BE2A5CCAB
          1C7E03D75598E0192D8C63F36C015FA51450173E12F08FECAFF12B56B84FEDA1
          A7F87EDBABB4F70B3498F648C904FB1615F47FC23FD9F7C0DE01923D42484EBD
          ACA1CADEDEC636C47D638F955FA9CB0F5AF5EA280B85145140828A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A00FFFD9}
        mmHeight = 23019
        mmLeft = 19050
        mmTop = 4233
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'NOME'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 4233
        mmLeft = 20920
        mmTop = 529
        mmWidth = 36777
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'NUMNF'
        DataPipeline = pipRom
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 4498
        mmLeft = 61648
        mmTop = 528
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'PESO'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 3969
        mmLeft = 81508
        mmTop = 529
        mmWidth = 8467
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'Volume'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 4498
        mmLeft = 93139
        mmTop = 528
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'CEP'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 3970
        mmLeft = 103717
        mmTop = 528
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'Locali'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 3969
        mmLeft = 123825
        mmTop = 529
        mmWidth = 30163
        BandType = 4
        LayerName = Foreground
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 157163
        mmTop = 5027
        mmWidth = 34131
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText20'
        DataField = 'PRIORID'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        DataPipelineName = 'pipRom'
        mmHeight = 3968
        mmLeft = 4233
        mmTop = 530
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText21'
        DataField = 'DOCDEST'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 4498
        mmLeft = 158486
        mmTop = 794
        mmWidth = 14552
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Pen.Color = clSilver
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 3970
        mmLeft = 4234
        mmTop = 1588
        mmWidth = 191031
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Flaydel log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9525
        mmTop = 3175
        mmWidth = 17272
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 3704
        mmWidth = 14023
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 33338
        mmTop = 1588
        mmWidth = 173038
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Entregas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 2381
        mmWidth = 12965
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Volumes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 152136
        mmTop = 2381
        mmWidth = 14023
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        HyperlinkEnabled = False
        DataField = 'NUMNF'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pipRom'
        mmHeight = 4498
        mmLeft = 53446
        mmTop = 2381
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'Volume'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 4498
        mmLeft = 169334
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 73554
        mmTop = 2646
        mmWidth = 7959
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc3'
        HyperlinkEnabled = False
        DataField = 'PESO'
        DataPipeline = pipRom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pipRom'
        mmHeight = 4233
        mmLeft = 83873
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer1
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pipRomSub1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8996
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pipRomSub1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Duplex = dpNone
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Version = '18.01'
          mmColumnWidth = 0
          DataPipelineName = 'pipRomSub1'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 14552
            mmPrintPosition = 0
            object ppLabel34: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'Label34'
              Caption = 'Quantidades Detalhadas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 16
              Font.Style = []
              Transparent = True
              mmHeight = 6350
              mmLeft = 6350
              mmTop = 1588
              mmWidth = 60854
              BandType = 1
              LayerName = Foreground2
            end
            object ppLabel35: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'Label35'
              Caption = 'Item descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 6350
              mmTop = 8731
              mmWidth = 26988
              BandType = 1
              LayerName = Foreground2
            end
            object ppLabel36: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'Label36'
              Caption = 'Quant'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 50800
              mmTop = 8731
              mmWidth = 10848
              BandType = 1
              LayerName = Foreground2
            end
            object ppLine15: TppLine
              DesignLayer = ppDesignLayer3
              UserName = 'Line15'
              Style = lsDouble
              Weight = 0.750000000000000000
              mmHeight = 794
              mmLeft = 2646
              mmTop = 13495
              mmWidth = 72496
              BandType = 1
              LayerName = Foreground2
            end
          end
          object ppDetailBand3: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLine16: TppLine
              DesignLayer = ppDesignLayer3
              UserName = 'Line16'
              Weight = 0.750000000000000000
              mmHeight = 794
              mmLeft = 2646
              mmTop = 6084
              mmWidth = 72496
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText22: TppDBText
              DesignLayer = ppDesignLayer3
              UserName = 'DBText22'
              DataField = 'DOCDEST'
              DataPipeline = pipRomSub1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pipRomSub1'
              mmHeight = 4498
              mmLeft = 6350
              mmTop = 794
              mmWidth = 39952
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText23: TppDBText
              DesignLayer = ppDesignLayer3
              UserName = 'DBText23'
              DataField = 'QT'
              DataPipeline = pipRomSub1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pipRomSub1'
              mmHeight = 4498
              mmLeft = 50800
              mmTop = 794
              mmWidth = 10583
              BandType = 4
              LayerName = Foreground2
            end
          end
          object ppSummaryBand2: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppDBCalc4: TppDBCalc
              DesignLayer = ppDesignLayer3
              UserName = 'DBCalc4'
              DataField = 'QT'
              DataPipeline = pipRomSub1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pipRomSub1'
              mmHeight = 4498
              mmLeft = 44450
              mmTop = 794
              mmWidth = 17198
              BandType = 7
              LayerName = Foreground2
            end
          end
          object ppDesignLayers3: TppDesignLayers
            object ppDesignLayer3: TppDesignLayer
              UserName = 'Foreground2'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pipRom: TppDBPipeline
    DataSource = DataSource1
    UserName = 'pipRom'
    Left = 248
    Top = 216
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 136
    object RetirarNota1: TMenuItem
      Caption = 'Retirar Nota'
      OnClick = RetirarNota1Click
    end
    object AtualizaValoresFrete1: TMenuItem
      Caption = 'Atualiza Valores Frete'
      OnClick = AtualizaValoresFrete1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ImprimeRecibos1: TMenuItem
      Caption = 'Imprime Recibos'
      OnClick = ImprimeRecibos1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object FreteCombinadoNF1: TMenuItem
      Caption = 'Frete Combinado NF'
      OnClick = FreteCombinadoNF1Click
    end
    object FreteFixoNF1: TMenuItem
      Caption = 'Frete Fixo NF'
      OnClick = FreteFixoNF1Click
    end
  end
  object ImageList1: TImageList
    Width = 23
    Left = 176
    Top = 248
    Bitmap = {
      494C010105000900A80017001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000005C000000200000000100200000000000002E
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
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
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
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
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
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
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
      00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
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
      0000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000005C000000200000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFE000000000000000000FFFFFE00
      0000000000000000FFFFFE000000000000000000FFFFFE000000000000000000
      C00006000000000000000000C00006000000000000000000C000060000000000
      00000000C00006000000000000000000C00006000000000000000000C0000600
      0000000000000000FFFFFE000000000000000000FFFFFE000000000000000000
      FFFFFE000000000000000000FFFFFE000000000000000000FFFFFE0000000000
      00000000FFFFFE000000000000000000FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFF
      FFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0
      FFFFFFFFFFFFFE1FFFFFFFF0FFFFFFFFFFFFF807FFFFFFF0FFFFFFFFFFFFF003
      FFFFFBF0FFFFFFFFFFFFF003FFFFF8F0FFFFFFF000FFE001FF000030FFFFFFF0
      00FFE001FFFFF8F0FFFFFFF801FFFFFFFFFFFBF0FFFFFFF801FFFFFFFFFFFFF0
      FFFFFFFC03FFFFFFFFFFFFF0FFFFFFFF0FFFFFFFFFFFFFF0FFFFFFFFFFFFFFFF
      FFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000
      000000000000}
  end
  object DataSource2: TDataSource
    DataSet = DM3.cdsCliCob
    Left = 280
    Top = 342
  end
  object RelREC: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'F:\00Trab\FlaydelSofts\Singular\RELS\RelFDrec2.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 160
    Top = 296
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 46302
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 42069
        mmLeft = 2117
        mmTop = 0
        mmWidth = 193675
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 29633
        mmLeft = 165100
        mmTop = 794
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label23'
        HyperlinkEnabled = False
        Caption = 'Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 173832
        mmTop = 5027
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 29369
        mmLeft = 18785
        mmTop = 1058
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 19050
        mmTop = 11377
        mmWidth = 146315
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NUMNF'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5556
        mmLeft = 167217
        mmTop = 9260
        mmWidth = 26194
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel26: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label26'
        HyperlinkEnabled = False
        Caption = 'RECEBEMOS OS PRODUTOS DA NOTA FISCAL AO LADO EMITIDA POR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20108
        mmTop = 1852
        mmWidth = 97102
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOMECli'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4995
        mmLeft = 20373
        mmTop = 5556
        mmWidth = 140759
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 29898
        mmWidth = 193411
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 129117
        mmTop = 17198
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel30: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label30'
        HyperlinkEnabled = False
        Caption = 'NOME LEG'#205'VEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 6085
        mmTop = 29898
        mmWidth = 20638
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBBarCode1: TppDBBarCode
        DesignLayer = ppDesignLayer2
        UserName = 'DBBarCode1'
        AlignBarCode = ahLeft
        AutoSizeFont = False
        BarCodeType = bcCode39
        BarColor = clWindowText
        DataField = 'NUMNF'
        DataPipeline = ppDBPipeline1
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 11377
        mmLeft = 137584
        mmTop = 30956
        mmWidth = 53975
        BandType = 4
        LayerName = Foreground1
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line12'
        Pen.Style = psDash
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 2117
        mmTop = 43656
        mmWidth = 191559
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NROMA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2822
        mmLeft = 171186
        mmTop = 794
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground1
      end
      object ppImage2: TppImage
        DesignLayer = ppDesignLayer2
        UserName = 'Image2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676523060000FFD8FFE000104A46494600010101004800
          480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
          090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
          24221E241C1E1F1EFFC0000B080065003501011100FFC4001F00000105010101
          01010100000000000000000102030405060708090A0BFFC400B5100002010303
          020403050504040000017D010203000411051221314106135161072271143281
          91A1082342B1C11552D1F02433627282090A161718191A25262728292A343536
          3738393A434445464748494A535455565758595A636465666768696A73747576
          7778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3
          B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7
          E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00FB2E8A28CD4704CB34
          3E6A06232C31DF8247F4A6C33991118C1321762BB59795C6793CF4E3F515246D
          BE357DACBB803861823D8D3A8A293BE73F8567690FBF4E996442EAAC46D03390
          543631F89A9AEFCA8224F3E76019F064794272548F607E9D3BF6AB16854DAC45
          4285D8B80A410063B638C7D2A4A28A86E2E1219ADA375626790C684018042337
          3F829ACCD1A46682EA1DB9C43130C0C924C407A8F4F51576D64486DD701E40CF
          B77C68581E3EF75271C75CF5AB16DCDB447F79F707FACFBDD3BFBD4945731ABD
          835D5EEA57835ED4ED22B5C192389C844C46AC7001E78E7EA69BA6E942DB51D2
          EFE5D6751BD5959BC9598EE5CB44C727278F97356749F323BE316E2167B18DD4
          2E031214018CF7EB5A57513DC46B1B44537CA7EFA2C8146C3CE3385E7EBFA9AB
          A8AA8811542AA8C00060014B4570BE281A7AEB57D1CDE289EC4CE17CEB64B776
          5FB8072470723F9D2F860D83EB5631C5E29B8BF30EEF2AD9EDDD57EE30E09E06
          0135692E9E1B9D32EDC61562D84E3B06653FA574F7B1F98224C6499383B49038
          3D70471DBD39C77A92D71F658B0A546C185230471D307A5494572D789E21B6D7
          3509B4CD3ACAE219DD0EF95C6EC88D463EF03F9FF5A758A788EEB5AB09B52D32
          CA082DDDD8C91302C331B2E3EF1E3247E955F56463600000476D752C23D79C11
          FD6B47C3BA989238ECE79023A71193D1C7403FCFB56EA821402C5881C93DE968
          AE4FC45797936A93D8E8BA3CAF7A8143DE86F2C29DA180246370C11C31C7B1AB
          DA3C3E2B4BB84EA777A7CB6C01F30460EF3C1C7F081D71552EA1CCBABDAB7CCE
          08B94F4001C9FC70D8AC5AF4185B7428DEAA0D54BBD52CED752B5D3E6942CF73
          BBCB1C638F5F4CF41EB8ABB5CBEBBA9EBEBAACD63671DA595B2A8D9797418212
          40E037DDCE4918C1E950F8421D4AFAFE7D4350D6269CDA5CC900893889C85C6E
          C0E3F8B8E3B55CD55D6CBC490DC1CF972A81267A11F74FE4306B1B52B63697D2
          DB9CE14FCA4F753D2BB4D38EED3ED9BD6253FA0AE1FC6302BFC41D2D37C83CD1
          092439047EF08F97FBBD3B77E6BA7D67C47A7E937F1D95D09BCD9103AEC40460
          923D7DAAEDC6A9A65B4CD0DC6A3690CABF79249955877E84D66ADDE90356B18F
          4B9ECDA49E67F356DE5FBC3CB73B9829C1E40FBC0D3FC5D6FE658A5C004985B9
          E7B1E3F9E2A818CEADA42C88A4DDDA808C00E5D7B7E3FF00D7F5AE874BFF0090
          65AFFD714FFD04570DE3DB94B2F1BE997722B3243146EC17A90246271EF58DE3
          0D6AD757D6EDEF6D52658E3895089000490CC7B13EB5BD77E24F085DDC3DC5CE
          913CB2BE373B42A49C0C0FE2F414FD335EF0B0D4ED574ED1E48EEA499638DFCB
          550BB8ED27209EC4D76B730A4F0490C9F75D4A9AE2E192E34BD44E3878D8AB0E
          CC3FC0FF008576B6F289ADE3994102450C01F719AF3BF8AF6F2AEAD697447EE9
          E0F2C1FF00695893FF00A10AE368ABDE1DFF00918B4DFF00AFB8BFF4315ED758
          1E2AD3CBA8BE8572546250076EC7FCFF004AD7D2FF00E4196BFF005C53FF0041
          14FBAB6B7BB84C3750453C64E76C8A1867E86BCBFC7F6B6165E238A0B5B71044
          214322AA1504E4E48F5E31D3F9E6BBE8B40D02589254D2EDF6BA86198C8383EA
          0F23F1A70F0E688B3C33A69F147242E24464CAE181C8E879FC6B569180652AC0
          1046083D0D2448B14491A0C2228551E8053AA86A9A3E9FA95C5B4F790091ED9F
          727A1F63EA33838F6F4C837E8A28A2BFFFD9}
        mmHeight = 21696
        mmLeft = 5821
        mmTop = 3440
        mmWidth = 10848
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel24: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label301'
        HyperlinkEnabled = False
        Caption = 'N'#186' do DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 73025
        mmTop = 29898
        mmWidth = 26458
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 166688
        mmTop = 15346
        mmWidth = 26988
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel25: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label302'
        HyperlinkEnabled = False
        Caption = 'Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 12171
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NOMEDest'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3133
        mmLeft = 37306
        mmTop = 12171
        mmWidth = 123561
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'Endereco'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 17727
        mmWidth = 105040
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText12'
        HyperlinkEnabled = False
        DataField = 'Numero'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 131498
        mmTop = 16933
        mmWidth = 11377
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        HyperlinkEnabled = False
        DataField = 'Complem'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 144198
        mmTop = 16933
        mmWidth = 19579
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        HyperlinkEnabled = False
        DataField = 'Bairro'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 23019
        mmWidth = 55827
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText15'
        HyperlinkEnabled = False
        DataField = 'Cidade'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 79904
        mmTop = 22754
        mmWidth = 46038
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText16'
        HyperlinkEnabled = False
        DataField = 'CEP'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 20902
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'FONEdest'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3683
        mmLeft = 140229
        mmTop = 25135
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel27: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Volume'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 17463
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VOLUME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5821
        mmLeft = 177800
        mmTop = 16404
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel28: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 167217
        mmTop = 26194
        mmWidth = 6477
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'Peso'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 175155
        mmTop = 26194
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel29: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 20902
        mmWidth = 5821
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel31: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 25135
        mmWidth = 7938
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel32: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label32'
        HyperlinkEnabled = False
        Caption = 'Volumes Recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106366
        mmTop = 29898
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 70384
        mmTop = 29898
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine13: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 103724
        mmTop = 29898
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 1323
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBPipeline1'
    OnDataChange = ppDBPipeline1DataChange
    Left = 200
    Top = 296
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMNF'
      FieldName = 'NUMNF'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NRoma'
      FieldName = 'NRoma'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'NOMECli'
      FieldName = 'NOMECli'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'NOMEDest'
      FieldName = 'NOMEDest'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VOLUME'
      FieldName = 'VOLUME'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'Endereco'
      FieldName = 'Endereco'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'Numero'
      FieldName = 'Numero'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'Complem'
      FieldName = 'Complem'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'Bairro'
      FieldName = 'Bairro'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'Cidade'
      FieldName = 'Cidade'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 9
      DisplayWidth = 9
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'FONEdest'
      FieldName = 'FONEdest'
      FieldLength = 16
      DisplayWidth = 16
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'Peso'
      FieldName = 'Peso'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object DataSource3: TDataSource
    DataSet = Tab
    Left = 240
    Top = 296
  end
  object Tab: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'NUMNF'
        DataType = ftInteger
      end
      item
        Name = 'NRoma'
        DataType = ftInteger
      end
      item
        Name = 'NOMECli'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMEDest'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'VOLUME'
        DataType = ftInteger
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Complem'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'FONEdest'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'Peso'
        DataType = ftFloat
      end>
    KeyFieldNames = 'NUMNF'
    Left = 288
    Top = 296
    object TabNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object TabNRoma: TIntegerField
      FieldName = 'NRoma'
    end
    object TabNOMECli: TStringField
      FieldName = 'NOMECli'
      Size = 50
    end
    object TabNOMEDest: TStringField
      FieldName = 'NOMEDest'
      Size = 40
    end
    object TabVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object TabEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object TabNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TabComplem: TStringField
      FieldName = 'Complem'
      Size = 15
    end
    object TabBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object TabFONEdest: TStringField
      FieldName = 'FONEdest'
      Size = 16
    end
    object TabPeso: TFloatField
      FieldName = 'Peso'
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM1.cdsRomaDoc
    Left = 128
    Top = 490
  end
  object pipRomSub1: TppDBPipeline
    DataSource = JvDataSource1
    UserName = 'pipRomSub1'
    Left = 344
    Top = 216
    object pipRomSub1ppField1: TppField
      FieldAlias = 'DOCDEST'
      FieldName = 'DOCDEST'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pipRomSub1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QT'
      FieldName = 'QT'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
  end
end
