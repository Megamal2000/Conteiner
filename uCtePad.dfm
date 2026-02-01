object CTePad: TCTePad
  Left = 313
  Top = 190
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o Padr'#227'o do CT-e'
  ClientHeight = 443
  ClientWidth = 613
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
    Width = 613
    Height = 73
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Transportadora'
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 91
      Height = 13
      Caption = #218'ltimo CT-e gerado'
    end
    object lbULT: TLabel
      Left = 128
      Top = 48
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbTransp: TComboBox
      Left = 114
      Top = 15
      Width = 327
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'cbTransp'
      OnChange = cbTranspChange
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 613
    Height = 351
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Emitente'
      object Label3: TLabel
        Left = 24
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label4: TLabel
        Left = 24
        Top = 48
        Width = 74
        Height = 13
        Caption = 'Nome  Fantasia'
      end
      object Label5: TLabel
        Left = 24
        Top = 80
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label6: TLabel
        Left = 24
        Top = 112
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label7: TLabel
        Left = 24
        Top = 144
        Width = 16
        Height = 13
        Caption = 'I.E.'
      end
      object Label8: TLabel
        Left = 24
        Top = 176
        Width = 38
        Height = 13
        Caption = 'RNTRC'
      end
      object edRazaoS: TEdit
        Left = 120
        Top = 14
        Width = 441
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edRazaoS'
      end
      object edFantasia: TEdit
        Left = 120
        Top = 46
        Width = 441
        Height = 21
        TabOrder = 1
        Text = 'edFantasia'
      end
      object edTels: TMaskEdit
        Left = 120
        Top = 78
        Width = 115
        Height = 21
        EditMask = '!\(99\) 00000-0000;1;_'
        MaxLength = 15
        TabOrder = 2
        Text = '(  )      -    '
      end
      object edCNPJ: TMaskEdit
        Left = 120
        Top = 110
        Width = 145
        Height = 21
        EditMask = '00.000.000/0000\-00;1;_'
        MaxLength = 18
        TabOrder = 3
        Text = '  .   .   /    -  '
      end
      object edIE: TEdit
        Left = 120
        Top = 142
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'edIE'
      end
      object edRNTRC: TEdit
        Left = 120
        Top = 175
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'edRNTRC'
      end
      object btSalva1: TBitBtn
        Left = 376
        Top = 264
        Width = 161
        Height = 33
        Caption = 'Salva1 - Emitente'
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000FFFFFF00CCCC
          CC00999999006666660000000000C0C0C0000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000555555555555
          5555555555555555555555555555555555555555000000000000000055555554
          4444444444444444055555401200000000000011405555401211111111111011
          4055554012000000000000114055554012111111111110114055554012000000
          0000001140555540121111111111101140555540120000000000001140555540
          1222222222222211405555401111111111111111405555401100000000000111
          4055554012111333333330114055554012111333311130114055554012111333
          3111301140555540121113333111301140555540121113333111301140555540
          1211133331113011405555400200033333333000455555544444444444444444
          5555555555555555555555555555555555555555555555555555}
        TabOrder = 6
        OnClick = btSalva1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Endere'#231'o do Emitente'
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
      object BitBtn1: TBitBtn
        Left = 376
        Top = 264
        Width = 161
        Height = 33
        Caption = 'Salva2 - Endere'#231'o'
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000FFFFFF00CCCC
          CC00999999006666660000000000C0C0C0000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000555555555555
          5555555555555555555555555555555555555555000000000000000055555554
          4444444444444444055555401200000000000011405555401211111111111011
          4055554012000000000000114055554012111111111110114055554012000000
          0000001140555540121111111111101140555540120000000000001140555540
          1222222222222211405555401111111111111111405555401100000000000111
          4055554012111333333330114055554012111333311130114055554012111333
          3111301140555540121113333111301140555540121113333111301140555540
          1211133331113011405555400200033333333000455555544444444444444444
          5555555555555555555555555555555555555555555555555555}
        TabOrder = 7
        OnClick = BitBtn1Click
      end
      object edCmun: TJvValidateEdit
        Left = 75
        Top = 213
        Width = 78
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 8
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Padr'#245'es'
      ImageIndex = 2
      object Label14: TLabel
        Left = 24
        Top = 16
        Width = 76
        Height = 13
        Caption = 'Tipo de Imposto'
      end
      object Label15: TLabel
        Left = 24
        Top = 64
        Width = 52
        Height = 13
        Caption = 'Pasta XML'
      end
      object Label16: TLabel
        Left = 24
        Top = 96
        Width = 54
        Height = 13
        Caption = 'Pasta  PDF'
      end
      object Label17: TLabel
        Left = 24
        Top = 144
        Width = 105
        Height = 13
        Caption = 'Produto Predominante'
      end
      object Label18: TLabel
        Left = 20
        Top = 176
        Width = 114
        Height = 13
        Caption = ' C'#243'digo da Unid Medida'
      end
      object Label20: TLabel
        Left = 24
        Top = 208
        Width = 74
        Height = 13
        Caption = 'Tipo de Medida'
      end
      object Label22: TLabel
        Left = 24
        Top = 242
        Width = 44
        Height = 13
        Caption = 'Ambiente'
      end
      object Label23: TLabel
        Left = 24
        Top = 275
        Width = 24
        Height = 13
        Caption = 'S'#233'rie'
      end
      object Label24: TLabel
        Left = 349
        Top = 176
        Width = 43
        Height = 13
        Caption = 'Motorista'
      end
      object Label25: TLabel
        Left = 349
        Top = 208
        Width = 37
        Height = 13
        Caption = 'Ve'#237'culo'
      end
      object Label26: TLabel
        Left = 349
        Top = 240
        Width = 27
        Height = 13
        Caption = 'Placa'
      end
      object cbICMS: TComboBox
        Left = 152
        Top = 14
        Width = 345
        Height = 21
        TabOrder = 0
        Text = 'cbICMS'
        Items.Strings = (
          '00 - Tributa'#231#227'o normal do ICMS'
          '20 - Tributa'#231#227'o com redu'#231#227'o de BC do ICMS'
          '40 - ICMS isen'#231#227'o'
          '41 - ICMS n'#227'o tributado'
          '51 - ICMS diferido'
          '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
          '90 - ICMS outros'
          
            '90 - ICMS devido '#224' UF de origem da presta'#231#227'o, quando diferente d' +
            'a UF do Simples Nacional'
          '99 - Simples Nacional')
      end
      object edXML: TJvDirectoryEdit
        Left = 152
        Top = 61
        Width = 345
        Height = 21
        DialogKind = dkWin32
        TabOrder = 1
        Text = 'edXML'
      end
      object edPDF: TJvDirectoryEdit
        Left = 152
        Top = 91
        Width = 345
        Height = 21
        DialogKind = dkWin32
        TabOrder = 2
        Text = 'edPDF'
      end
      object edPredom: TEdit
        Left = 152
        Top = 142
        Width = 329
        Height = 21
        TabOrder = 3
        Text = 'edPredom'
      end
      object cbUnid: TComboBox
        Left = 152
        Top = 174
        Width = 145
        Height = 21
        ItemIndex = 3
        TabOrder = 4
        Text = 'UNIDADE'
        Items.Strings = (
          'M3'
          'KG'
          'TON'
          'UNIDADE'
          'LITROS')
      end
      object edMedida: TEdit
        Left = 152
        Top = 206
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'edMedida'
      end
      object BitBtn2: TBitBtn
        Left = 376
        Top = 280
        Width = 161
        Height = 33
        Caption = 'Salva3 - Padr'#245'es'
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000FFFFFF00CCCC
          CC00999999006666660000000000C0C0C0000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000555555555555
          5555555555555555555555555555555555555555000000000000000055555554
          4444444444444444055555401200000000000011405555401211111111111011
          4055554012000000000000114055554012111111111110114055554012000000
          0000001140555540121111111111101140555540120000000000001140555540
          1222222222222211405555401111111111111111405555401100000000000111
          4055554012111333333330114055554012111333311130114055554012111333
          3111301140555540121113333111301140555540121113333111301140555540
          1211133331113011405555400200033333333000455555544444444444444444
          5555555555555555555555555555555555555555555555555555}
        TabOrder = 6
        OnClick = BitBtn2Click
      end
      object cbAmb: TComboBox
        Left = 152
        Top = 240
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 7
        Text = 'Produ'#231#227'o'
        Items.Strings = (
          'Produ'#231#227'o'
          'Teste')
      end
      object edMot: TEdit
        Left = 408
        Top = 173
        Width = 99
        Height = 21
        MaxLength = 20
        TabOrder = 8
        Text = 'edMot'
      end
      object EdVeic: TEdit
        Left = 408
        Top = 206
        Width = 99
        Height = 21
        MaxLength = 20
        TabOrder = 9
        Text = 'EdVeic'
      end
      object edPLaca: TEdit
        Left = 408
        Top = 237
        Width = 99
        Height = 21
        MaxLength = 9
        TabOrder = 10
        Text = 'edPLaca'
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 424
    Width = 613
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
end
