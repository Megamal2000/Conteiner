object Rotas: TRotas
  Left = 212
  Top = 110
  Hint = 'Inserir NOVO'
  BorderIcons = [biSystemMenu]
  Caption = 'Roteiriza'#231#227'o - Cadastro de Rotas'
  ClientHeight = 485
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 485
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 33
      Width = 62
      Height = 13
      Caption = 'Selecione ou'
    end
    object btNovo1: TSpeedButton
      Left = 144
      Top = 28
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41924E3D8F493A8C4436
        894032873C2F84372C8133287F30FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4999584596534199507DC28F96D0A696CFA678BE89368D422C8134297F
        30FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF519F614D9C5D64B478A8DBB587CC9866
        BC7D64BA7C86CB98A5D9B458AA6B2C8134297F30FFFFFFFFFFFFFFFFFF59A66B
        56A3666AB97DA8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B35AAA
        6C2C8234297F30FFFFFFFFFFFF5DA97053AB68AADDB464C1795FBE7160BC77FF
        FFFFFFFFFF59B87058B56E5CB774A6DAB4388F432C8234FFFFFFFFFFFF61AC75
        8ACC9889D3966BC67A63C17055AB65FFFFFFFFFFFF59B87059B8705BB97285CC
        977BBE8D308539FFFFFFFFFFFF65AF7AA9DDB37DCF8A75CC81FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF59B87067BE7D9CD4AB34883DFFFFFFFFFFFF69B27E
        B6E2BE8BD5977AC986FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF59B87069C1
        7E9DD4AA388B42FFFFFFFFFFFF6DB583ACDDB6A6DFAF81CB8C7CC9866EBD79FF
        FFFFFFFFFF5BAC6A60BC775CBA738BD19980C5923C8E47FFFFFFFFFFFF70B887
        85C797D2EED795D9A08AD3947FC889FFFFFFFFFFFF79CD856BC37C6FC77EACDF
        B5459E5740914CFFFFFFFFFFFF73BA8A70B887AADAB7D8F1DC92D89D88CD9384
        CC8E8BD4968AD49583D28EAFE0B76BB97D489856449451FFFFFFFFFFFFFFFFFF
        73BB8B70B887AFDCBBDCF2E0B6E4BD9BDBA596D9A0A5DFAFC0E8C579C28A509E
        5F4C9B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73BB8B71B88794CEA4C3E6CBCF
        EBD4C9E9CEAFDDB86DB97F58A56954A165FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF74BB8B71B9886EB6846AB38067B17C63AE7760AB735CA86EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btNovo1Click
    end
    object lbMens: TLabel
      Left = 24
      Top = 56
      Width = 34
      Height = 13
      Caption = 'lbMens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btSalvar1: TSpeedButton
      Left = 248
      Top = 72
      Width = 23
      Height = 22
      Hint = 'Salvar ROTA '
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C811F1B7E1F1B7A1F1A
        731E1A701E1B711F1B711F1B6C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF1C8A211B831F42A05287CA9A9BD3AB9BD2AB83C7963D974C1A6E1E1B70
        1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C912B1B8A206DBE83A8DBB587CC9866
        BC7D64BA7C86CB98A5D9B466B77D1A6C1D1B711FFFFFFFFFFFFFFFFFFF1D9B36
        1C962F72C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
        7F1A711E1B711FFFFFFFFFFFFF1EA43D4CB064AADDB464C1795FBE7175C585D4
        ECD98ACD9956B66C58B56E5CB774A6DAB4419B4E1B771FFFFFFFFFFFFF1FA942
        91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
        9787C79A1B781FFFFFFFFFFFFF1FAD42A6DCAF70CA7F73CA80F0F9F1FFFFFFEB
        F7EDFFFFFFFBFDFC88CD965BB97167BE7DA0D7AF1B7A1EFFFFFFFFFFFF26B44B
        A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
        7EA1D7AE1B7F1EFFFFFFFFFFFF2DBB5495D7A191D79B69C97664C66F61C46E61
        C36F61C26FB9E4C0FFFFFFE3F4E68BD1998BCE9D1C8820FFFFFFFFFFFF34BE59
        57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
        B548A95E1C8F26FFFFFFFFFFFF39C25C34BE557FCE90AEE1B56DCC7A6ACA7668
        C87268C87468C8756BC979ACDFB476C4891C962D1C942DFFFFFFFFFFFFFFFFFF
        3BC55E34C0557FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B1D9D
        321D9D36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3DC76036C25959C27496D7A3A5
        DCAEA5DCAE95D6A150B96A1FAB421FA942FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF40C9623BC55E39C25B31BD542DBB522BB9522BB75228B44EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btSalvar1Click
    end
    object lbObs: TLabel
      Left = 24
      Top = 112
      Width = 137
      Height = 13
      Caption = '.: <SEM CEPs cadastrados> '
    end
    object btApagar1: TSpeedButton
      Left = 165
      Top = 108
      Width = 23
      Height = 22
      Hint = 'Apagar ROTA'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F54C33A50C23853BE35
        51BD304BBC2E4EB82B4CB72748B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4658C84255C63C52CC757AE88F92EE8F92EE7178E4334DC12B4AB7294B
        B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D5ACD4959CB5C65E0A1A6F57E86EF5B
        63E9595DE77D84EE9EA0F4515DD72B4AB7294BB5FFFFFFFFFFFFFFFFFF545FD2
        5361CF616BE3A1ACF5545FEC505CEA4D59E94E59E64C56E65056E69EA2F45460
        D62A4AB8294BB5FFFFFFFFFFFF5860D44B56DBA2ABF65664F05266EE4D59E94D
        59E94D59E94D59E94C58E6525AE69FA3F53450C42A4AB8FFFFFFFFFFFF5C62D7
        818CEE7E91F75D73F34D59E94D59E94D59E94D59E94D59E94D59E94F5BE97B83
        F0757BE22E4BBAFFFFFFFFFFFF5F63DAA1ABF77086F86882F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4D59E95C66EA969CF13250BCFFFFFFFFFFFF6469DB
        AFB9F97F93FA7085F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D59E95E6A
        EE969DF1364FBEFFFFFFFFFFFF676ADEA5AFF59DABFA778CF0545FEC545FEC54
        5FEC545FEC545FEC545FEC6377F2818EF4787FE93A53C0FFFFFFFFFFFF6A69E0
        7D83EACDD4FC8B9DFA7E93F7758AEE6C84F66C84F66C84F66C84F66379F3A4AF
        F83E4FD03E54C2FFFFFFFFFFFF6C6CE16A69E0A3A7F3D4DBFD879AFA7F91F07A
        8EF17F94F87E92F9768CF8A8B6F8636EE34557C74156C5FFFFFFFFFFFFFFFFFF
        6D6CE36A69E0AAADF2D8DCFDAEBAFA91A3FA8B9DFA9CA9FBBAC7FC707BE94C5B
        CC4858CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6CE36A6ADF8E93EDBEC3F8CC
        D3F9C4CBF9AAB4F46670E2535ED1505DCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF6D6DE26B6AE1686ADD6364DC6164DA5D63D95B63D65862D4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btApagar1Click
    end
    object Label2: TLabel
      Left = 24
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Rotas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edRota: TEdit
      Left = 24
      Top = 72
      Width = 220
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
      Text = 'edRota'
      OnKeyPress = edRotaKeyPress
    end
    object JvDBGrid1: TJvDBGrid
      Left = 24
      Top = 134
      Width = 249
      Height = 307
      DataSource = JvDataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = JvDBGrid1CellClick
      OnDblClick = JvDBGrid1DblClick
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
          FieldName = 'ROTA'
          Title.Caption = 'Rota'
          Width = 200
          Visible = True
        end>
    end
    object btImprimir: TBitBtn
      Left = 197
      Top = 451
      Width = 75
      Height = 25
      Caption = 'Imprimir'
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
      TabOrder = 2
      OnClick = btImprimirClick
    end
  end
  object Panel2: TPanel
    Left = 289
    Top = 0
    Width = 296
    Height = 485
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object Label3: TLabel
      Left = 72
      Top = 33
      Width = 62
      Height = 13
      Caption = 'Selecione ou'
    end
    object btNovo2: TSpeedButton
      Left = 144
      Top = 28
      Width = 23
      Height = 22
      Hint = 'Inserir NOVOS CEPs'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41924E3D8F493A8C4436
        894032873C2F84372C8133287F30FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4999584596534199507DC28F96D0A696CFA678BE89368D422C8134297F
        30FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF519F614D9C5D64B478A8DBB587CC9866
        BC7D64BA7C86CB98A5D9B458AA6B2C8134297F30FFFFFFFFFFFFFFFFFF59A66B
        56A3666AB97DA8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B35AAA
        6C2C8234297F30FFFFFFFFFFFF5DA97053AB68AADDB464C1795FBE7160BC77FF
        FFFFFFFFFF59B87058B56E5CB774A6DAB4388F432C8234FFFFFFFFFFFF61AC75
        8ACC9889D3966BC67A63C17055AB65FFFFFFFFFFFF59B87059B8705BB97285CC
        977BBE8D308539FFFFFFFFFFFF65AF7AA9DDB37DCF8A75CC81FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF59B87067BE7D9CD4AB34883DFFFFFFFFFFFF69B27E
        B6E2BE8BD5977AC986FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF59B87069C1
        7E9DD4AA388B42FFFFFFFFFFFF6DB583ACDDB6A6DFAF81CB8C7CC9866EBD79FF
        FFFFFFFFFF5BAC6A60BC775CBA738BD19980C5923C8E47FFFFFFFFFFFF70B887
        85C797D2EED795D9A08AD3947FC889FFFFFFFFFFFF79CD856BC37C6FC77EACDF
        B5459E5740914CFFFFFFFFFFFF73BA8A70B887AADAB7D8F1DC92D89D88CD9384
        CC8E8BD4968AD49583D28EAFE0B76BB97D489856449451FFFFFFFFFFFFFFFFFF
        73BB8B70B887AFDCBBDCF2E0B6E4BD9BDBA596D9A0A5DFAFC0E8C579C28A509E
        5F4C9B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73BB8B71B88794CEA4C3E6CBCF
        EBD4C9E9CEAFDDB86DB97F58A56954A165FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF74BB8B71B9886EB6846AB38067B17C63AE7760AB735CA86EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btNovo2Click
    end
    object lbMens2: TLabel
      Left = 24
      Top = 56
      Width = 34
      Height = 13
      Caption = 'lbMens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btSalvar2: TSpeedButton
      Left = 168
      Top = 72
      Width = 23
      Height = 22
      Hint = 'Salvar CEPs'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C811F1B7E1F1B7A1F1A
        731E1A701E1B711F1B711F1B6C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF1C8A211B831F42A05287CA9A9BD3AB9BD2AB83C7963D974C1A6E1E1B70
        1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C912B1B8A206DBE83A8DBB587CC9866
        BC7D64BA7C86CB98A5D9B466B77D1A6C1D1B711FFFFFFFFFFFFFFFFFFF1D9B36
        1C962F72C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
        7F1A711E1B711FFFFFFFFFFFFF1EA43D4CB064AADDB464C1795FBE7175C585D4
        ECD98ACD9956B66C58B56E5CB774A6DAB4419B4E1B771FFFFFFFFFFFFF1FA942
        91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
        9787C79A1B781FFFFFFFFFFFFF1FAD42A6DCAF70CA7F73CA80F0F9F1FFFFFFEB
        F7EDFFFFFFFBFDFC88CD965BB97167BE7DA0D7AF1B7A1EFFFFFFFFFFFF26B44B
        A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
        7EA1D7AE1B7F1EFFFFFFFFFFFF2DBB5495D7A191D79B69C97664C66F61C46E61
        C36F61C26FB9E4C0FFFFFFE3F4E68BD1998BCE9D1C8820FFFFFFFFFFFF34BE59
        57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
        B548A95E1C8F26FFFFFFFFFFFF39C25C34BE557FCE90AEE1B56DCC7A6ACA7668
        C87268C87468C8756BC979ACDFB476C4891C962D1C942DFFFFFFFFFFFFFFFFFF
        3BC55E34C0557FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B1D9D
        321D9D36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3DC76036C25959C27496D7A3A5
        DCAEA5DCAE95D6A150B96A1FAB421FA942FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF40C9623BC55E39C25B31BD542DBB522BB9522BB75228B44EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btSalvar2Click
    end
    object lbObs2: TLabel
      Left = 24
      Top = 112
      Width = 122
      Height = 13
      Caption = '.: Apagar item selcionado '
    end
    object btApagar2: TSpeedButton
      Left = 153
      Top = 108
      Width = 23
      Height = 22
      Hint = 'Apagar CEPs'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F54C33A50C23853BE35
        51BD304BBC2E4EB82B4CB72748B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4658C84255C63C52CC757AE88F92EE8F92EE7178E4334DC12B4AB7294B
        B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D5ACD4959CB5C65E0A1A6F57E86EF5B
        63E9595DE77D84EE9EA0F4515DD72B4AB7294BB5FFFFFFFFFFFFFFFFFF545FD2
        5361CF616BE3A1ACF5545FEC505CEA4D59E94E59E64C56E65056E69EA2F45460
        D62A4AB8294BB5FFFFFFFFFFFF5860D44B56DBA2ABF65664F05266EE4D59E94D
        59E94D59E94D59E94C58E6525AE69FA3F53450C42A4AB8FFFFFFFFFFFF5C62D7
        818CEE7E91F75D73F34D59E94D59E94D59E94D59E94D59E94D59E94F5BE97B83
        F0757BE22E4BBAFFFFFFFFFFFF5F63DAA1ABF77086F86882F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4D59E95C66EA969CF13250BCFFFFFFFFFFFF6469DB
        AFB9F97F93FA7085F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D59E95E6A
        EE969DF1364FBEFFFFFFFFFFFF676ADEA5AFF59DABFA778CF0545FEC545FEC54
        5FEC545FEC545FEC545FEC6377F2818EF4787FE93A53C0FFFFFFFFFFFF6A69E0
        7D83EACDD4FC8B9DFA7E93F7758AEE6C84F66C84F66C84F66C84F66379F3A4AF
        F83E4FD03E54C2FFFFFFFFFFFF6C6CE16A69E0A3A7F3D4DBFD879AFA7F91F07A
        8EF17F94F87E92F9768CF8A8B6F8636EE34557C74156C5FFFFFFFFFFFFFFFFFF
        6D6CE36A69E0AAADF2D8DCFDAEBAFA91A3FA8B9DFA9CA9FBBAC7FC707BE94C5B
        CC4858CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6CE36A6ADF8E93EDBEC3F8CC
        D3F9C4CBF9AAB4F46670E2535ED1505DCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF6D6DE26B6AE1686ADD6364DC6164DA5D63D95B63D65862D4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btApagar2Click
    end
    object Label6: TLabel
      Left = 24
      Top = 8
      Width = 80
      Height = 13
      Caption = 'CEPs da Rota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRota: TLabel
      Left = 112
      Top = 8
      Width = 38
      Height = 13
      Caption = 'lbRota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvDBGrid2: TJvDBGrid
      Left = 24
      Top = 134
      Width = 249
      Height = 307
      DataSource = JvDataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = JvDBGrid2DblClick
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
          FieldName = 'CEPINIC'
          Title.Caption = 'CEP inicial'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEPFIM'
          Title.Caption = 'CEP Final'
          Width = 80
          Visible = True
        end>
    end
    object vCEP1: TJvValidateEdit
      Left = 24
      Top = 72
      Width = 57
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      OnKeyPress = vCEP1KeyPress
    end
    object vCEP2: TJvValidateEdit
      Left = 104
      Top = 72
      Width = 57
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnKeyPress = vCEP2KeyPress
    end
  end
  object JvDataSource1: TJvDataSource
    DataSet = DM5.cdsRota
    Left = 240
    Top = 104
  end
  object JvDataSource2: TJvDataSource
    DataSet = DM5.cdsRCEP
    Left = 520
    Top = 96
  end
  object RelRotas: TppReport
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
    Template.FileName = 'F:\00Trab\FlaydelSofts\Singular\RELS\RelRotasComp.rtm'
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
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 56
    Top = 456
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Flaydel - Rotas e CEPs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 4763
        mmTop = 2117
        mmWidth = 38354
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        DisplayFormat = 'dd/MM/yyyy ddd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 82550
        mmTop = 2381
        mmWidth = 24469
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'ROTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 9260
        mmWidth = 9906
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 5292
        mmTop = 14023
        mmWidth = 171450
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'ROTA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 1058
        mmWidth = 86784
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Pen.Color = clGray
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 5027
        mmTop = 6085
        mmWidth = 172509
        BandType = 4
        LayerName = Foreground1
      end
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer2
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipeline2
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
          DataPipelineName = 'ppDBPipeline2'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText1'
              HyperlinkEnabled = False
              DataField = 'CEPINIC'
              DataPipeline = ppDBPipeline2
              DisplayFormat = '00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4064
              mmLeft = 30163
              mmTop = 170
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText2: TppDBText
              DesignLayer = ppDesignLayer1
              UserName = 'DBText2'
              HyperlinkEnabled = False
              DataField = 'CEPFIM'
              DataPipeline = ppDBPipeline2
              DisplayFormat = '00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4064
              mmLeft = 58738
              mmTop = 0
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppSummaryBand1: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
          end
          object ppGroup2: TppGroup
            BreakName = 'LIGROTA'
            DataPipeline = ppDBPipeline2
            GroupFileSettings.NewFile = False
            GroupFileSettings.EmailFile = False
            KeepTogether = True
            OutlineSettings.CreateNode = True
            StartOnOddPage = False
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDBPipeline2'
            NewFile = False
            object ppGroupHeaderBand2: TppGroupHeaderBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              Background.Brush.Style = bsClear
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppDesignLayers1: TppDesignLayers
            object ppDesignLayer1: TppDesignLayer
              UserName = 'Foreground'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc1'
        HyperlinkEnabled = False
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 60854
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Rotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 79375
        mmTop = 1852
        mmWidth = 9260
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ID'
      DataPipeline = ppDBPipeline1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DM5.dsRota
    UserName = 'DBPipeline1'
    Left = 104
    Top = 456
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'ROTA'
      FieldName = 'ROTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = JvDataSource3
    UserName = 'DBPipeline2'
    OnMasterRecordPositionChange = ppDBPipeline2MasterRecordPositionChange
    Left = 144
    Top = 456
    MasterDataPipelineName = 'ppDBPipeline1'
  end
  object JvDataSource3: TJvDataSource
    DataSet = DM5.cdsRCEP2
    Left = 168
    Top = 424
  end
end
