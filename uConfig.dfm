object Config: TConfig
  Left = 242
  Top = 192
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o'
  ClientHeight = 329
  ClientWidth = 421
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
  object Label5: TLabel
    Left = 336
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label5'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 409
    Height = 297
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Pastas'
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Aplicativos'
      end
      object Label2: TLabel
        Left = 16
        Top = 57
        Width = 27
        Height = 13
        Caption = 'Listas'
      end
      object Label3: TLabel
        Left = 16
        Top = 81
        Width = 47
        Height = 13
        Caption = 'Relat'#243'rios'
      end
      object Label6: TLabel
        Left = 336
        Top = 0
        Width = 31
        Height = 13
        Caption = 'B0002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btSalvar: TBitBtn
        Left = 88
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = btSalvarClick
      end
      object pasta1: TJvDirectoryEdit
        Left = 88
        Top = 29
        Width = 257
        Height = 21
        DialogKind = dkWin32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'pasta1'
      end
      object pasta2: TJvDirectoryEdit
        Left = 88
        Top = 54
        Width = 257
        Height = 21
        DialogKind = dkWin32
        TabOrder = 2
        Text = 'pasta2'
      end
      object pasta3: TJvDirectoryEdit
        Left = 88
        Top = 79
        Width = 257
        Height = 21
        DialogKind = dkWin32
        TabOrder = 3
        Text = 'pasta3'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Outros'
      ImageIndex = 1
      object Label4: TLabel
        Left = 16
        Top = 32
        Width = 211
        Height = 13
        Caption = 'Altera Numera'#231#227'o do Romaneio (Ano Novo) '
      end
      object Label8: TLabel
        Left = 16
        Top = 72
        Width = 150
        Height = 13
        Caption = 'Data In'#237'cio de Pesquisa Normal'
      end
      object btSalvarDT: TSpeedButton
        Left = 305
        Top = 67
        Width = 25
        Height = 25
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770080000000800770330888887703077033088888770307703308888877
          0307703300000000030770333333333333077030000000003307703077777777
          0307703077777777030770307777777703077030777777770307703077777777
          0007703077777777070770000000000000077777777777777777}
        OnClick = btSalvarDTClick
      end
      object Label17: TLabel
        Left = 16
        Top = 109
        Width = 36
        Height = 13
        Caption = 'Rel BIP'
      end
      object btSailvaBip: TSpeedButton
        Left = 349
        Top = 102
        Width = 25
        Height = 25
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770080000000800770330888887703077033088888770307703308888877
          0307703300000000030770333333333333077030000000003307703077777777
          0307703077777777030770307777777703077030777777770307703077777777
          0007703077777777070770000000000000077777777777777777}
        OnClick = btSailvaBipClick
      end
      object Label18: TLabel
        Left = 16
        Top = 152
        Width = 118
        Height = 13
        Caption = 'Ambiente Envio de CT-e '
      end
      object btSalvaAmb: TSpeedButton
        Left = 303
        Top = 146
        Width = 25
        Height = 25
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770080000000800770330888887703077033088888770307703308888877
          0307703300000000030770333333333333077030000000003307703077777777
          0307703077777777030770307777777703077030777777770307703077777777
          0007703077777777070770000000000000077777777777777777}
        OnClick = btSalvaAmbClick
      end
      object Label19: TLabel
        Left = 16
        Top = 200
        Width = 116
        Height = 13
        Caption = #218'ltima Chamada no SAC'
      end
      object lbNumCham: TLabel
        Left = 152
        Top = 200
        Width = 67
        Height = 13
        Caption = 'lbNumCham'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btAno: TBitBtn
        Left = 248
        Top = 27
        Width = 81
        Height = 25
        Caption = 'Zerar'
        TabOrder = 0
        OnClick = btAnoClick
      end
      object dataPesq: TDateTimePicker
        Left = 172
        Top = 69
        Width = 129
        Height = 21
        Date = 42439.729189988430000000
        Format = 'dd/MM/yyyy ddd'
        Time = 42439.729189988430000000
        TabOrder = 1
      end
      object dirBip: TJvDirectoryEdit
        Left = 88
        Top = 105
        Width = 257
        Height = 21
        DialogKind = dkWin32
        TabOrder = 2
        Text = 'dirBip'
      end
      object cbAmb: TComboBox
        Left = 152
        Top = 149
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 3
        Text = 'Produ'#231#227'o (Oficial)'
        Items.Strings = (
          'Produ'#231#227'o (Oficial)'
          'Homologa'#231#227'o (Testes)')
      end
      object btSAC: TBitBtn
        Left = 305
        Top = 195
        Width = 75
        Height = 25
        Caption = 'Ajusta SAC'
        TabOrder = 4
        OnClick = btSACClick
      end
      object BitBtn1: TBitBtn
        Left = 168
        Top = 224
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        TabOrder = 5
        OnClick = BitBtn1Click
      end
    end
    object tbPags: TTabSheet
      Caption = 'Pagamentos'
      ImageIndex = 2
      object Label7: TLabel
        Left = 24
        Top = 40
        Width = 124
        Height = 13
        Caption = 'Sal'#225'rio M'#233'dio do Ajudante'
      end
      object SalAjud: TJvValidateEdit
        Left = 172
        Top = 38
        Width = 121
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfFloat
        DecimalPlaces = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btPags: TBitBtn
        Left = 208
        Top = 66
        Width = 85
        Height = 25
        Caption = 'Salvar'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770080000000800770330888887703077033088888770307703308888877
          0307703300000000030770333333333333077030000000003307703077777777
          0307703077777777030770307777777703077030777777770307703077777777
          0007703077777777070770000000000000077777777777777777}
        TabOrder = 1
        OnClick = btPagsClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'SMS'
      ImageIndex = 3
      object Label9: TLabel
        Left = 56
        Top = 29
        Width = 26
        Height = 13
        Caption = 'Login'
      end
      object Label10: TLabel
        Left = 56
        Top = 54
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object Label11: TLabel
        Left = 56
        Top = 76
        Width = 44
        Height = 13
        Caption = 'Retorno1'
      end
      object Label12: TLabel
        Left = 56
        Top = 100
        Width = 44
        Height = 13
        Caption = 'Retorno2'
      end
      object Label13: TLabel
        Left = 56
        Top = 125
        Width = 50
        Height = 13
        Caption = 'Local REL'
      end
      object Label14: TLabel
        Left = 296
        Top = 152
        Width = 38
        Height = 13
        Caption = 'Label14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 56
        Top = 152
        Width = 26
        Height = 13
        Caption = 'Frase'
      end
      object Label16: TLabel
        Left = 56
        Top = 240
        Width = 22
        Height = 13
        Caption = 'URL'
      end
      object edSMSlogin: TEdit
        Left = 104
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'edSMSlogin'
      end
      object edSMSSenha: TEdit
        Left = 104
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'edSMSSenha'
      end
      object edSMSret1: TEdit
        Left = 103
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'edSMSret1'
      end
      object edSMSret2: TEdit
        Left = 104
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'edSMSret2'
      end
      object btSalvaSMS: TBitBtn
        Left = 305
        Top = 239
        Width = 85
        Height = 25
        Caption = 'Salvar'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770080000000800770330888887703077033088888770307703308888877
          0307703300000000030770333333333333077030000000003307703077777777
          0307703077777777030770307777777703077030777777770307703077777777
          0007703077777777070770000000000000077777777777777777}
        TabOrder = 4
        OnClick = btSalvaSMSClick
      end
      object edREL: TEdit
        Left = 104
        Top = 121
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'edREL'
      end
      object Memo1: TMemo
        Left = 104
        Top = 144
        Width = 185
        Height = 81
        Hint = 'CCC = Cliente e XXX=n'#250'mero NF (m'#225'x 138 caracteres)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Memo1')
        MaxLength = 159
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnChange = Memo1Change
      end
      object edURL: TEdit
        Left = 104
        Top = 237
        Width = 185
        Height = 21
        MaxLength = 160
        TabOrder = 7
        Text = 'edURL'
      end
    end
  end
end
