object CteDet: TCteDet
  Left = 275
  Top = 267
  BorderIcons = [biSystemMenu]
  Caption = 'CT-e - Detalhes'
  ClientHeight = 399
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 91
    Width = 302
    Height = 29
    Caption = 'Nenhum dado encontrado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btNovo: TBitBtn
    Left = 160
    Top = 136
    Width = 125
    Height = 25
    Caption = 'Inserir Novo'
    TabOrder = 4
    OnClick = btNovoClick
  end
  object btProcurar: TBitBtn
    Left = 16
    Top = 136
    Width = 113
    Height = 25
    Caption = 'Procurar Arquivos'
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 65
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Nota Fiscal'
    end
    object Label3: TLabel
      Left = 24
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbNF: TLabel
      Left = 88
      Top = 16
      Width = 27
      Height = 13
      Caption = 'lbNF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCli: TLabel
      Left = 69
      Top = 40
      Width = 377
      Height = 13
      AutoSize = False
      Caption = 'lbCli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 478
    Height = 280
    ActivePage = tb1
    Align = alTop
    TabOrder = 1
    object tb1: TTabSheet
      Caption = 'Dados Gerais'
      object lbDest: TLabel
        Left = 96
        Top = 16
        Width = 353
        Height = 13
        AutoSize = False
        Caption = 'lbDest'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 48
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label5: TLabel
        Left = 16
        Top = 80
        Width = 16
        Height = 13
        Caption = 'I.E.'
      end
      object Label6: TLabel
        Left = 16
        Top = 16
        Width = 56
        Height = 13
        Caption = 'Destinat'#225'rio'
      end
      object Label7: TLabel
        Left = 16
        Top = 113
        Width = 57
        Height = 13
        Caption = 'Chave NF-e'
      end
      object edCNPJ: TEdit
        Left = 94
        Top = 45
        Width = 147
        Height = 21
        TabOrder = 0
        Text = 'edCNPJ'
      end
      object edIE: TEdit
        Left = 94
        Top = 77
        Width = 147
        Height = 21
        TabOrder = 1
        Text = 'edIE'
      end
      object edChave: TEdit
        Left = 94
        Top = 109
        Width = 281
        Height = 21
        TabOrder = 2
        Text = 'edChave'
      end
      object Panel2: TPanel
        Left = 3
        Top = 152
        Width = 439
        Height = 73
        TabOrder = 3
        object lbTomador: TLabel
          Left = 13
          Top = 10
          Width = 42
          Height = 13
          Caption = 'Tomador'
        end
        object Label8: TLabel
          Left = 17
          Top = 40
          Width = 55
          Height = 13
          Caption = 'IE Tomador'
        end
        object cbToma: TComboBox
          Left = 101
          Top = 7
          Width = 233
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'cbToma'
          Items.Strings = (
            'Remetente'
            'Expedidor'
            'Recebedor'
            'Destinat'#225'rio'
            'Outros')
        end
        object cbIEtoma: TComboBox
          Left = 101
          Top = 37
          Width = 233
          Height = 21
          TabOrder = 1
          Text = 'cbIEtoma'
          Items.Strings = (
            'N'#227'o Contribuinte'
            'Contribuinte ICMS'
            'Contribuinte Isento')
        end
      end
    end
    object tb2: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object Label12: TLabel
        Left = 16
        Top = 32
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object procCEP: TSpeedButton
        Left = 208
        Top = 27
        Width = 97
        Height = 22
        Caption = 'Pesquisa CEP'
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
        OnClick = procCEPClick
      end
      object Label9: TLabel
        Left = 16
        Top = 72
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label19: TLabel
        Left = 16
        Top = 99
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label21: TLabel
        Left = 144
        Top = 99
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label10: TLabel
        Left = 16
        Top = 130
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label11: TLabel
        Left = 16
        Top = 160
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label13: TLabel
        Left = 16
        Top = 188
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label34: TLabel
        Left = 16
        Top = 217
        Width = 43
        Height = 13
        Caption = 'C'#243'd Mun'
      end
      object btCodM: TSpeedButton
        Left = 157
        Top = 212
        Width = 145
        Height = 24
        Caption = ' C'#243'd Munic'#237'pio'
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
        OnClick = btCodMClick
      end
      object edCEP: TEdit
        Left = 76
        Top = 28
        Width = 121
        Height = 21
        Color = 15662065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentFont = False
        TabOrder = 0
        Text = 'edCEP'
      end
      object edEnder: TEdit
        Left = 76
        Top = 69
        Width = 381
        Height = 21
        MaxLength = 80
        TabOrder = 1
        Text = 'edEnder'
      end
      object edNum: TJvValidateEdit
        Left = 76
        Top = 95
        Width = 53
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 2
      end
      object edComp: TEdit
        Left = 224
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'edComp'
      end
      object edBairro: TEdit
        Left = 76
        Top = 128
        Width = 213
        Height = 21
        MaxLength = 25
        TabOrder = 4
        Text = 'edBairro'
      end
      object edCidade: TEdit
        Left = 76
        Top = 156
        Width = 381
        Height = 21
        MaxLength = 30
        TabOrder = 5
        Text = 'edCidade'
      end
      object cbUF: TComboBox
        Left = 76
        Top = 184
        Width = 85
        Height = 21
        TabOrder = 6
        Text = 'UF'
      end
      object edCmun: TJvValidateEdit
        Left = 75
        Top = 213
        Width = 78
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 7
      end
    end
  end
  object btSalvar: TBitBtn
    Left = 368
    Top = 360
    Width = 97
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
    TabOrder = 3
    OnClick = btSalvarClick
  end
end
