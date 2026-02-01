object DM3: TDM3
  OldCreateOrder = False
  Height = 686
  Width = 838
  object vsNFp: TSQLDataSet
    CommandText = 'select * from VIEW_NOTASPQ'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 24
  end
  object vdNFp: TDataSetProvider
    DataSet = vsNFp
    Left = 88
    Top = 24
  end
  object vcNFp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdNFp'
    Left = 152
    Top = 24
    object vcNFpROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
    end
    object vcNFpIDN: TIntegerField
      FieldName = 'IDN'
    end
    object vcNFpNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object vcNFpDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object vcNFpObs: TStringField
      FieldName = 'Obs'
      Size = 55
    end
    object vcNFpNomeC: TStringField
      FieldName = 'NomeC'
      Size = 40
    end
    object vcNFpnRoma: TIntegerField
      FieldName = 'nRoma'
    end
    object vcNFpCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object vcNFpLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object vcNFpNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object vcNFpVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object vcNFpDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
    object vcNFpNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
  end
  object vsWeb: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT tb_notaf.id as IDN, DTROMA, num -extract(YEAR from dtRoma' +
      ')* 1000000 as ROMANEIO , NUMNF, VALOR, STATUS_ENT, STATUS_WEB, L' +
      'IGCLI, LIGMOT, DOCDEST, NUMPED ,'#13#10'CASE status_web '#13#10'  when 0 the' +
      'n '#39'N'#227'o enviado               '#39' '#13#10'  when 1 then '#39'sem Cliente     ' +
      '          '#39' '#13#10'  when 2 then '#39'Cliente n'#227'o existe na WEB '#39#13#10'  when' +
      ' 3 then '#39'sem Nota                  '#39' '#13#10'  when 4 then '#39'sem Romane' +
      'io              '#39' '#13#10'  when 5 then '#39'sem Data                  '#39#13#10 +
      '  when 6 then '#39'Enviado                   '#39' '#13#10'  when 7 then '#39'sem ' +
      'Permiss'#227'o             '#39#13#10'end as MSG'#13#10' from tb_notaf, tb_roma'#13#10'WH' +
      'ERE nRoma = num'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 80
  end
  object vdWeb: TDataSetProvider
    DataSet = vsWeb
    Left = 88
    Top = 80
  end
  object vcWeb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdWeb'
    Left = 152
    Top = 80
    object vcWebIDN: TIntegerField
      FieldName = 'IDN'
      Required = True
    end
    object vcWebDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object vcWebROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object vcWebNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object vcWebVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object vcWebSTATUS_ENT: TSmallintField
      FieldName = 'STATUS_ENT'
      ReadOnly = True
    end
    object vcWebSTATUS_WEB: TSmallintField
      FieldName = 'STATUS_WEB'
      ReadOnly = True
    end
    object vcWebLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
      ReadOnly = True
    end
    object vcWebLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
      ReadOnly = True
    end
    object vcWebDOCDEST: TStringField
      FieldName = 'DOCDEST'
      ReadOnly = True
      Size = 18
    end
    object vcWebMSG: TStringField
      FieldName = 'MSG'
      ReadOnly = True
      FixedChar = True
      Size = 26
    end
    object vcWebNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
  end
  object vsC1: TSQLDataSet
    CommandText = 'select * from VIEW_CONTROL1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 136
  end
  object vsC2: TSQLDataSet
    CommandText = 'select * from VIEW_CONTROL2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 192
  end
  object vdC1: TDataSetProvider
    DataSet = vsC1
    Left = 88
    Top = 136
  end
  object vdC2: TDataSetProvider
    DataSet = vsC2
    Left = 88
    Top = 192
  end
  object vcC1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdC1'
    Left = 152
    Top = 136
    object vcC1Romaneio: TLargeintField
      FieldName = 'Romaneio'
    end
    object vcC1Motorista: TStringField
      FieldName = 'Motorista'
      Size = 40
    end
    object vcC1Regiao: TStringField
      FieldName = 'Regiao'
    end
    object vcC1Quant: TLargeintField
      FieldName = 'Quant'
    end
    object vcC1Peso: TFMTBCDField
      FieldName = 'Peso'
      Precision = 18
      Size = 2
    end
    object vcC1Notas: TIntegerField
      FieldName = 'Notas'
    end
    object vcC1DTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object vcC1NUM: TIntegerField
      FieldName = 'NUM'
    end
    object vcC1STATUS_DEV: TSmallintField
      FieldName = 'STATUS_DEV'
    end
  end
  object vcC2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdC2'
    Left = 152
    Top = 192
    object vcC2numnf: TIntegerField
      FieldName = 'numnf'
    end
    object vcC2nocorr: TSmallintField
      FieldName = 'nocorr'
    end
    object vcC2ocorrencia: TStringField
      FieldName = 'ocorrencia'
      Size = 55
    end
    object vcC2tipo: TIntegerField
      FieldName = 'tipo'
    end
    object vcC2nroma: TIntegerField
      FieldName = 'nroma'
    end
    object vcC2IDNF: TIntegerField
      FieldName = 'IDNF'
    end
    object vcC2STATUS_TKT: TSmallintField
      FieldName = 'STATUS_TKT'
    end
    object vcC2tipotxt: TStringField
      FieldName = 'tipotxt'
      FixedChar = True
      Size = 9
    end
    object vcC2PONTO: TSmallintField
      FieldName = 'PONTO'
    end
  end
  object vsC3: TSQLDataSet
    CommandText = 'select * from VIEW_CONTROL3'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 240
  end
  object vdC3: TDataSetProvider
    DataSet = vsC3
    Left = 88
    Top = 240
  end
  object vcC3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdC3'
    Left = 152
    Top = 240
    object vcC3dtRoma: TDateField
      FieldName = 'dtRoma'
    end
    object vcC3Num: TIntegerField
      FieldName = 'Num'
    end
    object vcC3Nome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object vcC3Romaneio: TLargeintField
      FieldName = 'Romaneio'
    end
  end
  object vsNFg: TSQLDataSet
    CommandText = 'select * from VIEW_NOTASGE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 344
  end
  object vdNFg: TDataSetProvider
    DataSet = vsNFg
    Left = 88
    Top = 344
  end
  object vcNFg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdNFg'
    Left = 152
    Top = 344
    object vcNFgidNF: TIntegerField
      FieldName = 'idNF'
    end
    object vcNFgnumNF: TIntegerField
      FieldName = 'numNF'
    end
    object vcNFgnRoma: TIntegerField
      FieldName = 'nRoma'
    end
    object vcNFgdtRoma: TDateField
      FieldName = 'dtRoma'
    end
    object vcNFgMotorista: TStringField
      FieldName = 'Motorista'
      Size = 40
    end
    object vcNFgLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
    end
  end
  object vsC4: TSQLDataSet
    CommandText = 'select * from VIEW_CONTROL4'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 288
  end
  object vdC4: TDataSetProvider
    DataSet = vsC4
    Left = 88
    Top = 288
  end
  object vcC4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'vdC4'
    Left = 152
    Top = 288
    object vcC4Romaneio: TLargeintField
      FieldName = 'Romaneio'
    end
    object vcC4dtRoma: TDateField
      FieldName = 'dtRoma'
    end
    object vcC4Motorista: TStringField
      FieldName = 'Motorista'
      Size = 40
    end
    object vcC4numNF: TIntegerField
      FieldName = 'numNF'
    end
    object vcC4nRoma: TIntegerField
      FieldName = 'nRoma'
    end
    object vcC4idNF: TIntegerField
      FieldName = 'idNF'
    end
    object vcC4idR: TIntegerField
      FieldName = 'idR'
    end
    object vcC4tipotxt: TStringField
      FieldName = 'tipotxt'
      FixedChar = True
      Size = 9
    end
    object vcC4NOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object vcC4DESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
    object vcC4CEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
  end
  object sdsFT1: TSQLDataSet
    CommandText = 'select * from TB_FRETE1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 24
  end
  object dspFT1: TDataSetProvider
    DataSet = sdsFT1
    Left = 280
    Top = 24
  end
  object cdsFT1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT1'
    Left = 344
    Top = 24
    object cdsFT1ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT1INICIO: TFMTBCDField
      FieldName = 'INICIO'
      Precision = 9
      Size = 2
    end
    object cdsFT1FIM: TFMTBCDField
      FieldName = 'FIM'
      Precision = 9
      Size = 2
    end
    object cdsFT1VCAP: TFMTBCDField
      FieldName = 'VCAP'
      Precision = 9
      Size = 2
    end
    object cdsFT1VGSP: TFMTBCDField
      FieldName = 'VGSP'
      Precision = 9
      Size = 2
    end
    object cdsFT1VINT: TFMTBCDField
      FieldName = 'VINT'
      Precision = 9
      Size = 2
    end
    object cdsFT1LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT1VINT2: TFMTBCDField
      FieldName = 'VINT2'
      Precision = 9
      Size = 2
    end
    object cdsFT1VOEST: TFMTBCDField
      FieldName = 'VOEST'
      Precision = 9
      Size = 2
    end
    object cdsFT1VOUT: TFMTBCDField
      FieldName = 'VOUT'
      Precision = 9
      Size = 2
    end
  end
  object sdsFT1a: TSQLDataSet
    CommandText = 'select * from TB_FRETE1a'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 72
  end
  object dspFT1a: TDataSetProvider
    DataSet = sdsFT1a
    Left = 280
    Top = 72
  end
  object cdsFT1a: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT1a'
    Left = 344
    Top = 72
    object cdsFT1aID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT1aLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT1aECAP: TFMTBCDField
      FieldName = 'ECAP'
      Precision = 9
      Size = 2
    end
    object cdsFT1aEGSP: TFMTBCDField
      FieldName = 'EGSP'
      Precision = 9
      Size = 2
    end
    object cdsFT1aEINT: TFMTBCDField
      FieldName = 'EINT'
      Precision = 9
      Size = 2
    end
    object cdsFT1aEINT2: TFMTBCDField
      FieldName = 'EINT2'
      Precision = 9
      Size = 2
    end
    object cdsFT1aEOEST: TFMTBCDField
      FieldName = 'EOEST'
      Precision = 9
      Size = 2
    end
    object cdsFT1aEOUT: TFMTBCDField
      FieldName = 'EOUT'
      Precision = 9
      Size = 2
    end
  end
  object sdsFT2: TSQLDataSet
    CommandText = 'select * from TB_FRETE2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 120
  end
  object dspFT2: TDataSetProvider
    DataSet = sdsFT2
    Left = 280
    Top = 120
  end
  object cdsFT2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT2'
    Left = 344
    Top = 120
    object cdsFT2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT2CAP_PORC: TFMTBCDField
      FieldName = 'CAP_PORC'
      Precision = 9
      Size = 3
    end
    object cdsFT2CAP_MINIMO: TFMTBCDField
      FieldName = 'CAP_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsFT2CAP_PESO: TFMTBCDField
      FieldName = 'CAP_PESO'
      Precision = 9
      Size = 2
    end
    object cdsFT2GSP_PORC: TFMTBCDField
      FieldName = 'GSP_PORC'
      Precision = 9
      Size = 3
    end
    object cdsFT2GSP_MINIMO: TFMTBCDField
      FieldName = 'GSP_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsFT2GSP_PESO: TFMTBCDField
      FieldName = 'GSP_PESO'
      Precision = 9
      Size = 2
    end
    object cdsFT2INT_PORC: TFMTBCDField
      FieldName = 'INT_PORC'
      Precision = 9
      Size = 3
    end
    object cdsFT2INT_MINIMO: TFMTBCDField
      FieldName = 'INT_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsFT2INT_PESO: TFMTBCDField
      FieldName = 'INT_PESO'
      Precision = 9
      Size = 2
    end
    object cdsFT2INT2_PORC: TFMTBCDField
      FieldName = 'INT2_PORC'
      Precision = 9
      Size = 2
    end
    object cdsFT2INT2_MINIMO: TFMTBCDField
      FieldName = 'INT2_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsFT2INT2_PESO: TFMTBCDField
      FieldName = 'INT2_PESO'
      Precision = 9
      Size = 2
    end
    object cdsFT2OEST_PORC: TFMTBCDField
      FieldName = 'OEST_PORC'
      Precision = 9
      Size = 2
    end
    object cdsFT2OEST_MINIMO: TFMTBCDField
      FieldName = 'OEST_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsFT2OEST_PESO: TFMTBCDField
      FieldName = 'OEST_PESO'
      Precision = 9
      Size = 2
    end
    object cdsFT2OUT_PORC: TFMTBCDField
      FieldName = 'OUT_PORC'
      Precision = 9
      Size = 2
    end
    object cdsFT2OUT_MINIMO: TFMTBCDField
      FieldName = 'OUT_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsFT2OUT_PESO: TFMTBCDField
      FieldName = 'OUT_PESO'
      Precision = 9
      Size = 2
    end
  end
  object sdsFT3: TSQLDataSet
    CommandText = 'select * from TB_FRETE3'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 168
  end
  object dspFT3: TDataSetProvider
    DataSet = sdsFT3
    Left = 280
    Top = 168
  end
  object cdsFT3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT3'
    Left = 344
    Top = 168
    object cdsFT3ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT3LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT3CAP_VALOR: TFMTBCDField
      FieldName = 'CAP_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsFT3GSP_VALOR: TFMTBCDField
      FieldName = 'GSP_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsFT3INT_VALOR: TFMTBCDField
      FieldName = 'INT_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsFT3INT2_VALOR: TFMTBCDField
      FieldName = 'INT2_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsFT3OEST_VALOR: TFMTBCDField
      FieldName = 'OEST_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsFT3OUT_VALOR: TFMTBCDField
      FieldName = 'OUT_VALOR'
      Precision = 9
      Size = 2
    end
  end
  object sdsRelG: TSQLDataSet
    CommandText = 
      'select dtRoma, num, num - extract(YEAR from dtRoma)* 1000000 as ' +
      'Romaneio, TB_CLIENTE.NOME, COUNT(numNF) as Notas, TB_Cliente.id ' +
      'as idCli'#13#10'from Tb_roma, Tb_Cliente, TB_NOTAF'#13#10'Where TB_ROMA.num ' +
      '= tb_notaf.nroma and TB_NOTAF.LIGCLI = TB_CLIENTE.id '#13#10'GROUP BY ' +
      'num, dtRoma, Nome, TB_Cliente.id'#13#10'ORDER BY dtRoma, num'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 24
  end
  object dspRelG: TDataSetProvider
    DataSet = sdsRelG
    Left = 472
    Top = 24
  end
  object cdsRelG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelG'
    Left = 536
    Top = 24
    object cdsRelGDTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsRelGNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsRelGROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsRelGNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsRelGNOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
    object cdsRelGIDCLI: TIntegerField
      FieldName = 'IDCLI'
      ReadOnly = True
      Required = True
    end
  end
  object sdsRelV: TSQLDataSet
    CommandText = 
      'select dtEmissao, id, numRoma, numRoma - extract(YEAR from dtemi' +
      'ssao)* 1000000 as Romaneio, vfretet, case status when 0 then '#39'em' +
      'itido'#39' when 1 then '#39'pronto'#39' when 2 then '#39'pago'#39' end as relStatus,' +
      ' nCob from TB_RELAT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 72
  end
  object dspRelV: TDataSetProvider
    DataSet = sdsRelV
    Constraints = False
    Left = 472
    Top = 72
  end
  object cdsRelV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelV'
    Left = 536
    Top = 72
    object cdsRelVDTEMISSAO: TSQLTimeStampField
      FieldName = 'DTEMISSAO'
    end
    object cdsRelVID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRelVNUMROMA: TIntegerField
      FieldName = 'NUMROMA'
    end
    object cdsRelVROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsRelVVFRETET: TFMTBCDField
      FieldName = 'VFRETET'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsRelVRELSTATUS: TStringField
      FieldName = 'RELSTATUS'
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object cdsRelVNCOB: TIntegerField
      FieldName = 'NCOB'
      ReadOnly = True
    end
  end
  object sdsRelN: TSQLDataSet
    CommandText = 
      'select TB_NOTAF.id, NUMNF, Locali, Valor, Volume, peso, vfrete, ' +
      'cep, tipolocal, ligCli, Ponto ,  '#13#10'nocorr, uso, descr, case tipo' +
      'local when 0 then '#39'SP'#39' when 1 then '#39'GSP'#39' when 2 then '#39'INT'#39' ELSE ' +
      #39'-'#39' end as Local, Carro, nRoma, tipo_cob,'#13#10'case tipo_cob when 1 ' +
      'then '#39'Peso'#39' when 2 then '#39'Taxa'#39' when 3 then '#39'Entrega'#39' when 3 then' +
      ' '#39'Sa'#237'da'#39' when 3 then '#39'Contrato'#39'   ELSE '#39'sem Serv'#39' end as Servico' +
      '2'#13#10'from TB_Notaf LEFT JOIN  TB_OCORRE ON TB_OCORRe.num = nocorr'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 120
  end
  object dspRelN: TDataSetProvider
    DataSet = sdsRelN
    Left = 472
    Top = 120
  end
  object cdsRelN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelN'
    Left = 536
    Top = 120
    object cdsRelNID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRelNNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsRelNLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsRelNVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsRelNVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsRelNPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsRelNVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRelNCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsRelNTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsRelNLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRelNPONTO: TSmallintField
      FieldName = 'PONTO'
    end
    object cdsRelNNOCORR: TSmallintField
      FieldName = 'NOCORR'
      DisplayFormat = '000'
    end
    object cdsRelNUSO: TIntegerField
      FieldName = 'USO'
    end
    object cdsRelNDESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
    object cdsRelNLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsRelNCARRO: TSmallintField
      FieldName = 'CARRO'
      ReadOnly = True
    end
    object cdsRelNNROMA: TIntegerField
      FieldName = 'NROMA'
      ReadOnly = True
    end
    object cdsRelNTIPO_COB: TSmallintField
      FieldName = 'TIPO_COB'
      ReadOnly = True
    end
    object cdsRelNSERVICO2: TStringField
      FieldName = 'SERVICO2'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
  end
  object sdsFT4: TSQLDataSet
    CommandText = 'select * from TB_FRETE4'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 216
  end
  object dspFT4: TDataSetProvider
    DataSet = sdsFT4
    Left = 280
    Top = 216
  end
  object cdsFT4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT4'
    Left = 344
    Top = 216
    object cdsFT4ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT4FAIXA: TSmallintField
      FieldName = 'FAIXA'
    end
    object cdsFT4COB_SP: TFMTBCDField
      FieldName = 'COB_SP'
      Precision = 9
      Size = 2
    end
    object cdsFT4PAG_SP: TFMTBCDField
      FieldName = 'PAG_SP'
      Precision = 9
      Size = 2
    end
    object cdsFT4COB_GSP: TFMTBCDField
      FieldName = 'COB_GSP'
      Precision = 9
      Size = 2
    end
    object cdsFT4PAG_GSP: TFMTBCDField
      FieldName = 'PAG_GSP'
      Precision = 9
      Size = 2
    end
    object cdsFT4COB_INT: TFMTBCDField
      FieldName = 'COB_INT'
      Precision = 9
      Size = 2
    end
    object cdsFT4PAG_INT: TFMTBCDField
      FieldName = 'PAG_INT'
      Precision = 9
      Size = 2
    end
    object cdsFT4COB_OUT: TFMTBCDField
      FieldName = 'COB_OUT'
      Precision = 9
      Size = 2
    end
    object cdsFT4PAG_OUT: TFMTBCDField
      FieldName = 'PAG_OUT'
      Precision = 9
      Size = 2
    end
    object cdsFT4LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT4COB_OEST: TFMTBCDField
      FieldName = 'COB_OEST'
      Precision = 9
      Size = 2
    end
    object cdsFT4PAG_OEST: TFMTBCDField
      FieldName = 'PAG_OEST'
      Precision = 9
      Size = 2
    end
    object cdsFT4COB_INT2: TFMTBCDField
      FieldName = 'COB_INT2'
      Precision = 9
      Size = 2
    end
    object cdsFT4PAG_INT2: TFMTBCDField
      FieldName = 'PAG_INT2'
      Precision = 9
      Size = 2
    end
  end
  object sdsFT5: TSQLDataSet
    CommandText = 'select * from TB_FRETE5'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 264
  end
  object dspFT5: TDataSetProvider
    DataSet = sdsFT5
    Left = 280
    Top = 264
  end
  object cdsFT5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT5'
    Left = 344
    Top = 264
    object cdsFT5ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT5VMENSAL: TFMTBCDField
      FieldName = 'VMENSAL'
      Precision = 9
      Size = 2
    end
    object cdsFT5VAVULSO_KM: TFMTBCDField
      FieldName = 'VAVULSO_KM'
      Precision = 9
      Size = 2
    end
    object cdsFT5VAVULSO_HORA: TFMTBCDField
      FieldName = 'VAVULSO_HORA'
      Precision = 9
      Size = 2
    end
    object cdsFT5LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT5KM: TIntegerField
      FieldName = 'KM'
    end
    object cdsFT5HORAS: TSmallintField
      FieldName = 'HORAS'
    end
    object cdsFT5TIPOCOB: TSmallintField
      FieldName = 'TIPOCOB'
    end
  end
  object sdsFT5a: TSQLDataSet
    CommandText = 'select * from TB_FRETE5A'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 320
  end
  object dspFT5a: TDataSetProvider
    DataSet = sdsFT5a
    Left = 280
    Top = 320
  end
  object cdsFT5a: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT5a'
    Left = 344
    Top = 320
    object cdsFT5aID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT5aDIA: TDateField
      FieldName = 'DIA'
    end
    object cdsFT5aHRINICIO: TTimeField
      FieldName = 'HRINICIO'
    end
    object cdsFT5aHRFIM: TTimeField
      FieldName = 'HRFIM'
    end
    object cdsFT5aKMINICIO: TIntegerField
      FieldName = 'KMINICIO'
    end
    object cdsFT5aKMFIM: TIntegerField
      FieldName = 'KMFIM'
    end
    object cdsFT5aDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsFT5aMOTIVO: TStringField
      FieldName = 'MOTIVO'
    end
    object cdsFT5aLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT5aLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
    end
    object cdsFT5aHREXTRA: TFMTBCDField
      FieldName = 'HREXTRA'
      Precision = 9
      Size = 1
    end
    object cdsFT5aKMEXTRA: TSmallintField
      FieldName = 'KMEXTRA'
    end
    object cdsFT5aVHR: TFMTBCDField
      FieldName = 'VHR'
      Precision = 9
      Size = 2
    end
    object cdsFT5aVKM: TFMTBCDField
      FieldName = 'VKM'
      Precision = 9
      Size = 2
    end
    object cdsFT5aVHRPAGO: TFMTBCDField
      FieldName = 'VHRPAGO'
      Precision = 9
      Size = 2
    end
    object cdsFT5aVKMPAGO: TFMTBCDField
      FieldName = 'VKMPAGO'
      Precision = 9
      Size = 2
    end
    object cdsFT5aNROMA: TIntegerField
      FieldName = 'NROMA'
    end
  end
  object sdsPGCont: TSQLDataSet
    CommandText = 'select * from TB_PAGCONT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 168
  end
  object dspPGCont: TDataSetProvider
    DataSet = sdsPGCont
    Left = 472
    Top = 168
  end
  object cdsPGCont: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPGCont'
    Left = 536
    Top = 168
    object cdsPGContID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPGContVMENSAL: TFMTBCDField
      FieldName = 'VMENSAL'
      Precision = 9
      Size = 2
    end
    object cdsPGContVAVULSO_KM: TFMTBCDField
      FieldName = 'VAVULSO_KM'
      Precision = 9
      Size = 2
    end
    object cdsPGContVAVULSO_HORA: TFMTBCDField
      FieldName = 'VAVULSO_HORA'
      Precision = 9
      Size = 2
    end
  end
  object sdsPGnota: TSQLDataSet
    CommandText = 'select * from TB_PAGNOTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 216
  end
  object dspPGnota: TDataSetProvider
    DataSet = sdsPGnota
    Left = 472
    Top = 216
  end
  object cdsPGnota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPGnota'
    Left = 536
    Top = 216
    object cdsPGnotaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPGnotaSP_NT1: TSmallintField
      FieldName = 'SP_NT1'
    end
    object cdsPGnotaSP_NT2: TSmallintField
      FieldName = 'SP_NT2'
    end
    object cdsPGnotaSP_MOT1: TFMTBCDField
      FieldName = 'SP_MOT1'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaSP_MOT2: TFMTBCDField
      FieldName = 'SP_MOT2'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaSP_MOT3: TFMTBCDField
      FieldName = 'SP_MOT3'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaSP_AJUD1: TFMTBCDField
      FieldName = 'SP_AJUD1'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaSP_AJUD2: TFMTBCDField
      FieldName = 'SP_AJUD2'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaSP_AJUD3: TFMTBCDField
      FieldName = 'SP_AJUD3'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaSP_EXTRA: TFMTBCDField
      FieldName = 'SP_EXTRA'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_NT1: TSmallintField
      FieldName = 'GSP_NT1'
    end
    object cdsPGnotaGSP_NT2: TSmallintField
      FieldName = 'GSP_NT2'
    end
    object cdsPGnotaGSP_MOT1: TFMTBCDField
      FieldName = 'GSP_MOT1'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_MOT2: TFMTBCDField
      FieldName = 'GSP_MOT2'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_MOT3: TFMTBCDField
      FieldName = 'GSP_MOT3'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_AJUD1: TFMTBCDField
      FieldName = 'GSP_AJUD1'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_AJUD2: TFMTBCDField
      FieldName = 'GSP_AJUD2'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_AJUD3: TFMTBCDField
      FieldName = 'GSP_AJUD3'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaGSP_EXTRA: TFMTBCDField
      FieldName = 'GSP_EXTRA'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_NT1: TSmallintField
      FieldName = 'INT_NT1'
    end
    object cdsPGnotaINT_NT2: TSmallintField
      FieldName = 'INT_NT2'
    end
    object cdsPGnotaINT_MOT1: TFMTBCDField
      FieldName = 'INT_MOT1'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_MOT2: TFMTBCDField
      FieldName = 'INT_MOT2'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_MOT3: TFMTBCDField
      FieldName = 'INT_MOT3'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_AJUD1: TFMTBCDField
      FieldName = 'INT_AJUD1'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_AJUD2: TFMTBCDField
      FieldName = 'INT_AJUD2'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_AJUD3: TFMTBCDField
      FieldName = 'INT_AJUD3'
      Precision = 9
      Size = 2
    end
    object cdsPGnotaINT_EXTRA: TFMTBCDField
      FieldName = 'INT_EXTRA'
      Precision = 9
      Size = 2
    end
  end
  object sdsPG: TSQLDataSet
    CommandText = 
      'select dtRoma, num - extract(YEAR from dtRoma)* 1000000 as Roman' +
      'eio, count(numnf) as Notas, '#13#10'case TB_ROMA.TIPO_PAG when 1 then ' +
      #39'Entrega'#39' when 2 then '#39'Km'#39' when 3 then '#39'Sa'#237'da'#39' when 4 then '#39'Cont' +
      'rato'#39' when 5 then '#39'Tratado'#39' when 6 then '#39'Alterado'#39#13#10'when 11 then' +
      ' '#39'Entrega*'#39' when 12 then '#39'Km*'#39' when 13 then '#39'Sa'#237'da*'#39' when 14 the' +
      'n '#39'Contrato*'#39' when 15 then '#39'Tratado*'#39'    '#13#10'else '#39'nao especificad' +
      'o'#39' END as Pagm, vPag, km, SUM(Ponto) as Pt, num, Tipo_Carro, TB_' +
      'ROMA.Tipo_pag, LigAjud, SUM(Peso) as Peso, ligReg'#13#10'from TB_ROMA,' +
      ' TB_NOTAF'#13#10'where TB_ROMA.num = TB_NOTAF.nRoma'#13#10'Group by dtRoma, ' +
      'num, TB_ROMA.tipo_pag, vPag, km, Tipo_Carro, LigAjud, ligReg'#13#10'Or' +
      'der by dtRoma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 264
  end
  object dspPG: TDataSetProvider
    DataSet = sdsPG
    Left = 472
    Top = 264
  end
  object cdsPG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPG'
    Left = 536
    Top = 264
    object cdsPGDTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsPGROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsPGNOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
    object cdsPGPAGM: TStringField
      FieldName = 'PAGM'
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
    object cdsPGVPAG: TFMTBCDField
      FieldName = 'VPAG'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPGKM: TSmallintField
      FieldName = 'KM'
      ReadOnly = True
    end
    object cdsPGPT: TLargeintField
      FieldName = 'PT'
      ReadOnly = True
    end
    object cdsPGNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsPGTIPO_CARRO: TSmallintField
      FieldName = 'TIPO_CARRO'
      ReadOnly = True
    end
    object cdsPGTIPO_PAG: TSmallintField
      FieldName = 'TIPO_PAG'
      ReadOnly = True
    end
    object cdsPGLIGAJUD: TIntegerField
      FieldName = 'LIGAJUD'
      ReadOnly = True
    end
    object cdsPGPESO: TFMTBCDField
      FieldName = 'PESO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPGLIGREG: TIntegerField
      FieldName = 'LIGREG'
    end
  end
  object sdsPagR1: TSQLDataSet
    CommandText = 
      'select ligMot, nome , Sum(vPag) as Valor '#13#10'from tb_roma Left Joi' +
      'n TB_FUNCS on tb_funcs.id = ligMot'#13#10'Group by LigMot,  nome'#13#10'Orde' +
      'r by Nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 320
  end
  object dspPagR1: TDataSetProvider
    DataSet = sdsPagR1
    Left = 472
    Top = 320
  end
  object cdsPagR1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagR1'
    Left = 536
    Top = 320
    object cdsPagR1LIGMOT: TIntegerField
      FieldName = 'LIGMOT'
      ReadOnly = True
    end
    object cdsPagR1NOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsPagR1VALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object sdsVale: TSQLDataSet
    CommandText = 'select *  from TB_VALES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 368
  end
  object dspVale: TDataSetProvider
    DataSet = sdsVale
    Left = 472
    Top = 368
  end
  object cdsVale: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVale'
    Left = 536
    Top = 368
    object cdsValeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValeDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsValeTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsValeDESCR: TStringField
      FieldName = 'DESCR'
    end
    object cdsValePAGO: TSmallintField
      FieldName = 'PAGO'
    end
    object cdsValeLIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsValeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
  end
  object sdsNFoc: TSQLDataSet
    CommandText = 
      'select tb_notaf.id, dtRoma, numnf, locali, nconh from tb_notaf, ' +
      'tb_roma where nRoma = num'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 224
    Top = 368
  end
  object dspNFoc: TDataSetProvider
    DataSet = sdsNFoc
    Left = 280
    Top = 368
  end
  object cdsNFoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFoc'
    Left = 344
    Top = 368
    object cdsNFocID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFocDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsNFocNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFocLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsNFocNCONH: TIntegerField
      FieldName = 'NCONH'
    end
  end
  object sdsCred: TSQLDataSet
    CommandText = 
      'select TB_FONTECRED.*, TB_CLIENTE.Nome from TB_FONTECRED, TB_CLI' +
      'ENTE where TB_CLIENTE.id = TB_FONTECRED.LIGCLI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 424
  end
  object dspCred: TDataSetProvider
    DataSet = sdsCred
    Left = 472
    Top = 424
  end
  object cdsCred: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCred'
    Left = 536
    Top = 424
    object cdsCredID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCredLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCredDESCR: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object cdsCredVCALC: TFMTBCDField
      FieldName = 'VCALC'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsCredVREAL: TFMTBCDField
      FieldName = 'VREAL'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsCredDATAPREV: TSQLTimeStampField
      FieldName = 'DATAPREV'
    end
    object cdsCredDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsCredOBS: TStringField
      FieldName = 'OBS'
      Size = 50
    end
    object cdsCredSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsCredNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object sdsRomaC: TSQLDataSet
    CommandText = 
      'Select DISTINCT dtRoma, ligMot,  NUm, ligCli, num - extract(YEAR' +
      ' from dtRoma)* 1000000 as Romaneio  from TB_Roma, TB_NOTAF where' +
      ' TB_NOTAF.nroma = TB_Roma.Num'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 216
    Top = 424
  end
  object dspRomaC: TDataSetProvider
    DataSet = sdsRomaC
    Left = 272
    Top = 424
  end
  object cdsRomaC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRomaC'
    Left = 336
    Top = 424
    object cdsRomaCDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsRomaCLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
    end
    object cdsRomaCNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsRomaCLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRomaCROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
  end
  object sdsFT5b: TSQLDataSet
    CommandText = 
      'select TB_FRETE5A.*,nRoma - extract(YEAR from dia)* 1000000 as R' +
      'omaneio from  TB_Frete5a'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 408
  end
  object dspFT5b: TDataSetProvider
    DataSet = sdsFT5b
    Left = 88
    Top = 408
  end
  object cdsFT5b: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT5B'
    Left = 152
    Top = 408
    object cdsFT5bID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFT5bDIA: TDateField
      FieldName = 'DIA'
    end
    object cdsFT5bHRINICIO: TTimeField
      FieldName = 'HRINICIO'
    end
    object cdsFT5bHRFIM: TTimeField
      FieldName = 'HRFIM'
    end
    object cdsFT5bKMINICIO: TIntegerField
      FieldName = 'KMINICIO'
    end
    object cdsFT5bKMFIM: TIntegerField
      FieldName = 'KMFIM'
    end
    object cdsFT5bDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsFT5bMOTIVO: TStringField
      FieldName = 'MOTIVO'
    end
    object cdsFT5bLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFT5bLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
    end
    object cdsFT5bHREXTRA: TFMTBCDField
      FieldName = 'HREXTRA'
      Precision = 9
      Size = 1
    end
    object cdsFT5bKMEXTRA: TSmallintField
      FieldName = 'KMEXTRA'
    end
    object cdsFT5bVHR: TFMTBCDField
      FieldName = 'VHR'
      Precision = 9
      Size = 2
    end
    object cdsFT5bVKM: TFMTBCDField
      FieldName = 'VKM'
      Precision = 9
      Size = 2
    end
    object cdsFT5bVHRPAGO: TFMTBCDField
      FieldName = 'VHRPAGO'
      Precision = 9
      Size = 2
    end
    object cdsFT5bVKMPAGO: TFMTBCDField
      FieldName = 'VKMPAGO'
      Precision = 9
      Size = 2
    end
    object cdsFT5bNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsFT5bROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
  end
  object sdsFT5n: TSQLDataSet
    CommandText = 'Select id, numNF, Valor, TipoLocal, Ponto from TB_Notaf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 456
  end
  object dspFT5n: TDataSetProvider
    DataSet = sdsFT5n
    Left = 88
    Top = 456
  end
  object cdsFT5n: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFT5n'
    Left = 152
    Top = 456
    object cdsFT5nID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFT5nNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsFT5nVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsFT5nTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsFT5nPONTO: TSmallintField
      FieldName = 'PONTO'
    end
  end
  object sdsCred2: TSQLDataSet
    CommandText = 
      'select TB_FONTECRED2.*, TB_CLIENTE.Nome from TB_FONTECRED2, TB_C' +
      'LIENTE where TB_CLIENTE.id = TB_FONTECRED2.LIGCLI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 480
  end
  object dspCred2: TDataSetProvider
    DataSet = sdsCred2
    Left = 472
    Top = 480
  end
  object cdsCred2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCred2'
    Left = 536
    Top = 480
    object cdsCred2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCred2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCred2DESCR: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object cdsCred2VCALC: TFMTBCDField
      FieldName = 'VCALC'
      Precision = 9
      Size = 2
    end
    object cdsCred2VREAL: TFMTBCDField
      FieldName = 'VREAL'
      Precision = 9
      Size = 2
    end
    object cdsCred2DATAPREV: TSQLTimeStampField
      FieldName = 'DATAPREV'
    end
    object cdsCred2DATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsCred2OBS: TStringField
      FieldName = 'OBS'
      Size = 50
    end
    object cdsCred2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsCred2STATUS_EDICOB: TSmallintField
      FieldName = 'STATUS_EDICOB'
    end
    object cdsCred2VMENSAL: TFMTBCDField
      FieldName = 'VMENSAL'
      Precision = 9
      Size = 2
    end
    object cdsCred2KM: TIntegerField
      FieldName = 'KM'
    end
    object cdsCred2KMC: TFMTBCDField
      FieldName = 'KMC'
      Precision = 9
      Size = 2
    end
    object cdsCred2VKM: TFMTBCDField
      FieldName = 'VKM'
      Precision = 9
      Size = 2
    end
    object cdsCred2HORA: TFMTBCDField
      FieldName = 'HORA'
      Precision = 9
      Size = 2
    end
    object cdsCred2HORAC: TFMTBCDField
      FieldName = 'HORAC'
      Precision = 9
      Size = 2
    end
    object cdsCred2VHORA: TFMTBCDField
      FieldName = 'VHORA'
      Precision = 9
      Size = 2
    end
    object cdsCred2SEGNOTAS: TFMTBCDField
      FieldName = 'SEGNOTAS'
      Precision = 9
      Size = 2
    end
    object cdsCred2VSEG: TFMTBCDField
      FieldName = 'VSEG'
      Precision = 9
      Size = 2
    end
    object cdsCred2DT1: TDateField
      FieldName = 'DT1'
    end
    object cdsCred2DT2: TDateField
      FieldName = 'DT2'
    end
    object cdsCred2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCred2VDESPESAS: TFMTBCDField
      FieldName = 'VDESPESAS'
      Precision = 9
      Size = 2
    end
  end
  object sdsRelseg: TSQLDataSet
    CommandText = 
      'select TB_Frete5a.dia, TB_Frete5a.nroma, TB_Frete5a.nroma - extr' +
      'act(YEAR from TB_Frete5a.dia)* 1000000 as Romaneio, hrextra, kme' +
      'xtra, vhr, vkm, ligCred2, numnf, locali, valor, vFrete from TB_N' +
      'OTAF, TB_FRETE5A where TB_FRETE5A.NROMA = TB_NOTAF.NROMA and TB_' +
      'NOTAF.Nroma > 0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 504
  end
  object dspRelSeg: TDataSetProvider
    DataSet = sdsRelseg
    Left = 88
    Top = 504
  end
  object cdsRelSeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelSeg'
    Left = 152
    Top = 504
    object cdsRelSegDIA: TDateField
      FieldName = 'DIA'
    end
    object cdsRelSegNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsRelSegROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsRelSegHREXTRA: TFMTBCDField
      FieldName = 'HREXTRA'
      ReadOnly = True
      Precision = 9
      Size = 1
    end
    object cdsRelSegKMEXTRA: TSmallintField
      FieldName = 'KMEXTRA'
      ReadOnly = True
    end
    object cdsRelSegVHR: TFMTBCDField
      FieldName = 'VHR'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object cdsRelSegVKM: TFMTBCDField
      FieldName = 'VKM'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object cdsRelSegLIGCRED2: TIntegerField
      FieldName = 'LIGCRED2'
      ReadOnly = True
    end
    object cdsRelSegNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
    end
    object cdsRelSegLOCALI: TStringField
      FieldName = 'LOCALI'
      ReadOnly = True
      Size = 25
    end
    object cdsRelSegVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsRelSegVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object sdsRomaPQ: TSQLDataSet
    CommandText = 
      'Select Num, km, num - extract(YEAR from dtRoma)* 1000000 as Roma' +
      'neio, Nome, Count(TB_Notaf.id) as SemBaixa, Sum(vFrete) as Frete' +
      ', SUM(Peso) as pesoR '#13#10'from TB_Roma Left Join Tb_Notaf on ((num=' +
      'nRoma)  and (Status_ENT=0)), TB_Funcs   '#13#10'where (TB_ROMA.LIGMOT ' +
      '= TB_FUNCS.id) and  (dtRoma = '#39'2012-05-24'#39') '#13#10'group by num, dtro' +
      'ma, Nome, km'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 216
    Top = 480
  end
  object dspRomaPQ: TDataSetProvider
    DataSet = sdsRomaPQ
    Left = 272
    Top = 480
  end
  object cdsRomaPQ: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUM'
        DataType = ftInteger
      end
      item
        Name = 'KM'
        DataType = ftSmallint
      end
      item
        Name = 'ROMANEIO'
        DataType = ftLargeint
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SEMBAIXA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FRETE'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'PESOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspRomaPQ'
    StoreDefs = True
    OnCalcFields = cdsRomaPQCalcFields
    Left = 336
    Top = 480
    object cdsRomaPQNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsRomaPQKM: TSmallintField
      FieldName = 'KM'
      ReadOnly = True
    end
    object cdsRomaPQROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsRomaPQNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsRomaPQSEMBAIXA: TIntegerField
      FieldName = 'SEMBAIXA'
      ReadOnly = True
      Required = True
    end
    object cdsRomaPQFRETE: TFMTBCDField
      FieldName = 'FRETE'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsRomaPQPESOR: TFMTBCDField
      FieldName = 'PESOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsRomaPQLINHA: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'LINHA'
      Calculated = True
    end
  end
  object sdsProx: TSQLDataSet
    CommandText = 
      'select dtRoma, NumNF, NRoma, ProxRoma, nRoma - Cast(nRoma/100000' +
      '0 as integer)*1000000 as Atual,ProxRoma - Cast(ProxRoma/1000000 ' +
      'as integer)*1000000 as Prox, TB_NOTAF.id as idNF, ligcli, nocorr' +
      ', dtbaixa '#13#10'from TB_Notaf, TB_Roma, TB_OCORRE '#13#10'where TB_Roma.Nu' +
      'm = Tb_Notaf.NRoma '#13#10'and TB_Ocorre.NUM = TB_Notaf.NOCORR'#13#10'and TB' +
      '_Ocorre.uso = 2'#13#10'order by Nroma, NumNf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 24
  end
  object dspProx: TDataSetProvider
    DataSet = sdsProx
    Left = 680
    Top = 24
  end
  object cdsProx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProx'
    Left = 736
    Top = 24
    object cdsProxDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsProxNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsProxNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsProxPROXROMA: TIntegerField
      FieldName = 'PROXROMA'
    end
    object cdsProxATUAL: TLargeintField
      FieldName = 'ATUAL'
      ReadOnly = True
    end
    object cdsProxPROX: TLargeintField
      FieldName = 'PROX'
      ReadOnly = True
    end
    object cdsProxIDNF: TIntegerField
      FieldName = 'IDNF'
      ReadOnly = True
      Required = True
    end
    object cdsProxLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsProxNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsProxDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
  end
  object sdsFuncLi: TSQLDataSet
    CommandText = 
      'select TB_FUNCS.ID, Nome, CPF, RG, DtCad, DtNasc,'#13#10'Ch, CHvalidad' +
      'e, CHcategoria, seg, segValidade, '#13#10' TB_FUNCENDER.ender, TB_FUNC' +
      'ENDER.Numero, Complemento, '#13#10'Bairro, Cidade, Estado, CEP, '#13#10'TB_F' +
      'UNCTEL.DESCRICAO, TB_FUNCTEL.NUMERO,'#13#10'TB_FUNCCAR.ANO, TB_FUNCCAR' +
      '.VEICULO, TB_FUNCCAR.PLaca'#13#10' '#13#10'from '#13#10'TB_FUNCS LEFT JOIN TB_FUNC' +
      'ENDER on TB_FUNCS.id = TB_FUNCENDER.FUNC_ID '#13#10'LEFT JOIN TB_FUNCT' +
      'EL on TB_FUNCS.id = TB_FUNCTEL.FUNC_ID'#13#10'LEFT JOIN TB_FUNCCAR on ' +
      'TB_FUNCS.id = TB_FUNCCAR.LIGFUNC'#13#10#13#10'Order by Nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 80
  end
  object dspFuncLi: TDataSetProvider
    DataSet = sdsFuncLi
    Left = 680
    Top = 80
  end
  object cdsFuncLi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncLi'
    Left = 736
    Top = 80
    object cdsFuncLiID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFuncLiNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsFuncLiCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsFuncLiRG: TStringField
      FieldName = 'RG'
      Size = 14
    end
    object cdsFuncLiDTCAD: TSQLTimeStampField
      FieldName = 'DTCAD'
    end
    object cdsFuncLiDTNASC: TSQLTimeStampField
      FieldName = 'DTNASC'
    end
    object cdsFuncLiCH: TStringField
      FieldName = 'CH'
      Size = 18
    end
    object cdsFuncLiCHVALIDADE: TSQLTimeStampField
      FieldName = 'CHVALIDADE'
    end
    object cdsFuncLiCHCATEGORIA: TStringField
      FieldName = 'CHCATEGORIA'
      Size = 4
    end
    object cdsFuncLiSEG: TSmallintField
      FieldName = 'SEG'
    end
    object cdsFuncLiSEGVALIDADE: TDateField
      FieldName = 'SEGVALIDADE'
    end
    object cdsFuncLiENDER: TStringField
      FieldName = 'ENDER'
      Size = 50
    end
    object cdsFuncLiNUMERO: TSmallintField
      FieldName = 'NUMERO'
    end
    object cdsFuncLiCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 10
    end
    object cdsFuncLiBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object cdsFuncLiCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsFuncLiESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsFuncLiCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsFuncLiDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsFuncLiNUMERO_1: TStringField
      FieldName = 'NUMERO_1'
      Size = 9
    end
    object cdsFuncLiANO: TSmallintField
      FieldName = 'ANO'
    end
    object cdsFuncLiVEICULO: TStringField
      FieldName = 'VEICULO'
      Size = 15
    end
    object cdsFuncLiPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
  end
  object sdsPag1: TSQLDataSet
    CommandText = 'select * from TB_FUNC_PG1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 136
  end
  object dspPag1: TDataSetProvider
    DataSet = sdsPag1
    Left = 680
    Top = 136
  end
  object cdsPag1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPag1'
    Left = 736
    Top = 136
    object cdsPag1ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPag1LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPag1TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPag1INICIO: TSmallintField
      FieldName = 'INICIO'
    end
    object cdsPag1FIM: TSmallintField
      FieldName = 'FIM'
    end
    object cdsPag1VALORMOT: TFMTBCDField
      FieldName = 'VALORMOT'
      Precision = 9
      Size = 2
    end
    object cdsPag1VALORAJUD: TFMTBCDField
      FieldName = 'VALORAJUD'
      Precision = 9
      Size = 2
    end
  end
  object sdsPag2: TSQLDataSet
    CommandText = 'select * from TB_FUNC_PG2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 200
  end
  object dspPag2: TDataSetProvider
    DataSet = sdsPag2
    Left = 680
    Top = 200
  end
  object cdsPag2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPag2'
    Left = 736
    Top = 200
    object cdsPag2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPag2LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPag2TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPag2ACIMADE: TSmallintField
      FieldName = 'ACIMADE'
    end
    object cdsPag2VALORMOT: TFMTBCDField
      FieldName = 'VALORMOT'
      Precision = 9
      Size = 2
    end
    object cdsPag2VALORAJUD: TFMTBCDField
      FieldName = 'VALORAJUD'
      Precision = 9
      Size = 2
    end
    object cdsPag2NOTA_EXTRA: TFMTBCDField
      FieldName = 'NOTA_EXTRA'
      Precision = 9
      Size = 2
    end
    object cdsPag2VMINIMO: TFMTBCDField
      FieldName = 'VMINIMO'
      Precision = 9
      Size = 2
    end
    object cdsPag2USAPESO: TSmallintField
      FieldName = 'USAPESO'
    end
  end
  object dspSPtot: TDataSetProvider
    DataSet = sdsSPtot
    Left = 680
    Top = 264
  end
  object cdsSPtot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSPtot'
    Left = 736
    Top = 264
  end
  object sdsSPtot: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 264
  end
  object dspFora: TDataSetProvider
    DataSet = sdsFora
    Left = 680
    Top = 320
  end
  object cdsFora: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFora'
    Left = 736
    Top = 320
    object cdsForaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsForaLIGNF: TIntegerField
      FieldName = 'LIGNF'
    end
    object cdsForaLIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsForaEVDATA: TSQLTimeStampField
      FieldName = 'EVDATA'
    end
    object cdsForaEVNUM: TSmallintField
      FieldName = 'EVNUM'
    end
    object cdsForaEVQUANT: TSmallintField
      FieldName = 'EVQUANT'
    end
    object cdsForaEVDESC: TStringField
      FieldName = 'EVDESC'
      Size = 35
    end
    object cdsForaNUMNOTA: TSmallintField
      FieldName = 'NUMNOTA'
    end
  end
  object sdsFora: TSQLDataSet
    CommandText = 'select * from TB_NOTAF_OBS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 320
  end
  object dspNFora: TDataSetProvider
    DataSet = sdsNFora
    Left = 680
    Top = 368
  end
  object cdsNFora: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFora'
    Left = 736
    Top = 368
    object cdsNForaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNForaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsNForaPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
  end
  object sdsNFora: TSQLDataSet
    CommandText = 'select ID, VALOR, Peso from TB_NOTAF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 368
  end
  object dspCta: TDataSetProvider
    DataSet = sdsCta
    Left = 680
    Top = 424
  end
  object cdsCta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCta'
    Left = 736
    Top = 424
    object cdsCtaORIGEM: TSmallintField
      FieldName = 'ORIGEM'
      ReadOnly = True
    end
    object cdsCtaQUANT: TIntegerField
      FieldName = 'QUANT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsCta: TSQLDataSet
    CommandText = 'select origem, count(*) as Quant from Tb_NOTAF group by origem'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 424
  end
  object sdsCliCob: TSQLDataSet
    CommandText = 'select * from TB_CLICOB'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 480
  end
  object dspCliCob: TDataSetProvider
    DataSet = sdsCliCob
    Left = 680
    Top = 480
  end
  object cdsCliCob: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliCob'
    Left = 736
    Top = 480
    object cdsCliCobID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCliCobLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCliCobSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 12
    end
  end
  object sdsNF: TSQLDataSet
    CommandText = 
      'SELECT tb_notaf.id as idN, dtRoma, num, num -extract(YEAR from d' +
      'tRoma)* 1000000 as Romaneio , numNF, Valor, Peso, Volume, Locali' +
      #13#10' from tb_notaf, tb_roma'#13#10'WHERE nRoma = num'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 216
    Top = 536
  end
  object dspNF: TDataSetProvider
    DataSet = sdsNF
    Left = 272
    Top = 536
  end
  object cdsNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNF'
    Left = 336
    Top = 536
    object cdsNFIDN: TIntegerField
      FieldName = 'IDN'
      Required = True
    end
    object cdsNFDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsNFNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsNFROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsNFNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
    end
    object cdsNFVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsNFPESO: TFMTBCDField
      FieldName = 'PESO'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object cdsNFVOLUME: TIntegerField
      FieldName = 'VOLUME'
      ReadOnly = True
    end
    object cdsNFLOCALI: TStringField
      FieldName = 'LOCALI'
      ReadOnly = True
      Size = 25
    end
  end
  object sdsDev1: TSQLDataSet
    CommandText = 
      'select TB_Notaf.id as idNF, dtRoma, nRoma,TB_ROMA.num -extract(Y' +
      'EAR from dtRoma)* 1000000 as Romaneio, numnf, Valor, Nome, TB_NO' +
      'TAF.obs, TB_NOTAF.STATUS_DEV '#13#10'from  TB_Notaf, TB_ROMA left join' +
      ' TB_FUNCS on TB_FUNCS.id = TB_ROMA.LIGMOT'#13#10'WHERE TB_NOTAF.nRoma ' +
      '= TB_ROMA.num '#13#10'and TB_NOTAF.status_dev between 1 and 2'#13#10'order b' +
      'y dtRoma desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 536
  end
  object dspDev1: TDataSetProvider
    DataSet = sdsDev1
    Left = 472
    Top = 536
  end
  object cdsDev1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDev1'
    Left = 536
    Top = 536
    object cdsDev1IDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsDev1DTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsDev1NROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsDev1ROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsDev1NUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsDev1VALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsDev1NOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsDev1OBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 55
    end
    object cdsDev1STATUS_DEV: TSmallintField
      FieldName = 'STATUS_DEV'
      ReadOnly = True
    end
  end
  object sdsDev2: TSQLDataSet
    CommandText = 
      'Select TB_NOTAF.id as idNF, Numdev, NumNF, Valor, RECDDATA, RECD' +
      'Nome, NUMRD, obs, volume, Recebedor from TB_VOLTAD, TB_Notaf whe' +
      're numDEV = TB_VOLTAD.id '#13#10'order by numDEV desc, TB_NOTAF.NUMNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 536
  end
  object dspDev2: TDataSetProvider
    DataSet = sdsDev2
    Left = 680
    Top = 536
  end
  object cdsDev2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDev2'
    Left = 736
    Top = 536
    object cdsDev2IDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsDev2NUMDEV: TIntegerField
      FieldName = 'NUMDEV'
    end
    object cdsDev2NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsDev2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsDev2RECDDATA: TSQLTimeStampField
      FieldName = 'RECDDATA'
    end
    object cdsDev2RECDNOME: TStringField
      FieldName = 'RECDNOME'
      Size = 25
    end
    object cdsDev2NUMRD: TIntegerField
      FieldName = 'NUMRD'
    end
    object cdsDev2OBS: TStringField
      FieldName = 'OBS'
      Size = 55
    end
    object cdsDev2VOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsDev2RECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
    end
  end
  object sdsPGconta: TSQLDataSet
    CommandText = 
      'select  num, count(numnf) as Notas '#13#10'from TB_ROMA, TB_NOTAF'#13#10'whe' +
      're TB_ROMA.num = TB_NOTAF.nRoma'#13#10'Group by dtRoma, num, TB_ROMA.t' +
      'ipo_pag, vPag, km, Tipo_Carro'#13#10'Order by dtRoma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 592
  end
  object dspPGconta: TDataSetProvider
    DataSet = sdsPGconta
    Left = 472
    Top = 592
  end
  object cdsPGconta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPGconta'
    Left = 536
    Top = 592
    object cdsPGcontaNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsPGcontaNOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
  end
  object sdsRomaPq2: TSQLDataSet
    CommandText = 
      'Select cc.id as idCLI,  cc.NOME, count(nn.NUMNF) from TB_notaf n' +
      'n, TB_ROMA rr, tb_cliente cc '#13#10'where rr.NUM = nn.NROMA '#13#10'and nn.' +
      'ligcli = cc.ID'#13#10'and nn.NROMA > 0'#13#10'and nn.STATUS_ENT = 0'#13#10'group b' +
      'y cc.ID, cc.NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 616
    Top = 592
  end
  object dspRomaPq2: TDataSetProvider
    DataSet = sdsRomaPq2
    Left = 680
    Top = 592
  end
  object cdsRomaPq2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRomaPq2'
    Left = 736
    Top = 592
    object cdsRomaPq2IDCLI: TIntegerField
      FieldName = 'IDCLI'
      ReadOnly = True
      Required = True
    end
    object cdsRomaPq2NOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsRomaPq2COUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsPed: TSQLDataSet
    CommandText = 
      'Select numnf, numped, ligcli from Tb_Notaf '#13#10'where dtcria > CURR' +
      'ENT_DATE - 180 and  not (numped is null)'#13#10'order by numped desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 600
  end
  object dspPed: TDataSetProvider
    DataSet = sdsPed
    Left = 88
    Top = 600
  end
  object cdsPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPed'
    Left = 152
    Top = 600
    object cdsPedNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsPedNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
    object cdsPedLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsPag5: TSQLDataSet
    CommandText = 'select * from TB_FUNC_PG5'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 216
    Top = 600
  end
  object dspPag5: TDataSetProvider
    DataSet = sdsPag5
    Left = 280
    Top = 600
  end
  object cdsPag5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPag5'
    Left = 336
    Top = 600
    object cdsPag5ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPag5LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPag5TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPag5INICIO: TFMTBCDField
      FieldName = 'INICIO'
      Precision = 9
      Size = 2
    end
    object cdsPag5FIM: TFMTBCDField
      FieldName = 'FIM'
      Precision = 9
      Size = 2
    end
    object cdsPag5VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 9
      Size = 2
    end
  end
  object sdsPGrepet: TSQLDataSet
    CommandText = 
      'select CEP, Count(CEP) from tb_Notaf'#13#10'where (nRoma = 2022000450)' +
      ' '#13#10'group by CEP'#13#10'having Count(CEP)>1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 32
    Top = 560
  end
  object dspPGrepet: TDataSetProvider
    DataSet = sdsPGrepet
    Left = 88
    Top = 560
  end
  object cdsPGrepet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPGrepet'
    Left = 152
    Top = 560
    object cdsPGrepetCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPGrepetCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
