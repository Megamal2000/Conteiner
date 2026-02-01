object DM5: TDM5
  OldCreateOrder = False
  Height = 781
  Width = 979
  object cdsRota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRota'
    Left = 128
    Top = 16
    object cdsRotaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRotaROTA: TStringField
      FieldName = 'ROTA'
    end
  end
  object sdsRota: TSQLDataSet
    CommandText = 'select * from TB_ROTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 16
  end
  object dspRota: TDataSetProvider
    DataSet = sdsRota
    Left = 72
    Top = 16
  end
  object cdsRCEP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRCEP'
    Left = 128
    Top = 64
    object cdsRCEPID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRCEPCEPINIC: TIntegerField
      FieldName = 'CEPINIC'
      DisplayFormat = '00000'
    end
    object cdsRCEPCEPFIM: TIntegerField
      FieldName = 'CEPFIM'
      DisplayFormat = '00000'
    end
    object cdsRCEPLIGROTA: TIntegerField
      FieldName = 'LIGROTA'
    end
  end
  object sdsRCEP: TSQLDataSet
    CommandText = 'select * from TB_ROTACEP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 64
  end
  object dspRCEP: TDataSetProvider
    DataSet = sdsRCEP
    Left = 72
    Top = 64
  end
  object cdsRsem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRsem'
    Left = 128
    Top = 168
    object cdsRsemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRsemNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsRsemCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsRsemNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsRsemLIGROT: TIntegerField
      FieldName = 'LIGROT'
    end
    object cdsRsemLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRsemSERIENF: TSmallintField
      FieldName = 'SERIENF'
    end
  end
  object sdsRsem: TSQLDataSet
    CommandText = 
      'select id, NumNF, CEP, Nroma, LigRot, LigCli, SerieNF '#13#10'from TB_' +
      'NOTAF where (nRoma = 0 or nRoma is Null) and (LigRot = 0 or LigR' +
      'ot is Null)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 168
  end
  object dspRsem: TDataSetProvider
    DataSet = sdsRsem
    Left = 72
    Top = 168
  end
  object cdsRconta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRConta'
    Left = 128
    Top = 224
    object cdsRcontaROTA: TStringField
      FieldName = 'ROTA'
      ReadOnly = True
    end
    object cdsRcontaLIGROT: TIntegerField
      FieldName = 'LIGROT'
      ReadOnly = True
    end
    object cdsRcontaQT: TIntegerField
      FieldName = 'QT'
      ReadOnly = True
      Required = True
      DisplayFormat = '#,##0'
    end
    object cdsRcontaVOL: TLargeintField
      FieldName = 'VOL'
      ReadOnly = True
    end
  end
  object sdsRconta: TSQLDataSet
    CommandText = 
      'select a.ROTA, b.ligRoT, Count(*) as qt, sum(b.volume) as vol fr' +
      'om TB_ROTA a, TB_NOTAF b WHERE a.id = b.LIGROT GROUP BY b.LIGROT' +
      ', a.ROTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 224
  end
  object dspRConta: TDataSetProvider
    DataSet = sdsRconta
    Left = 72
    Top = 224
  end
  object cdsRmostra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRmostra'
    Left = 128
    Top = 272
    object cdsRmostraNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsRmostraCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsRmostraLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsRmostraID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRmostraVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsRmostraFLAG_IMP: TSmallintField
      FieldName = 'FLAG_IMP'
    end
    object cdsRmostraORIGEM: TSmallintField
      FieldName = 'ORIGEM'
    end
    object cdsRmostraLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRmostraDIA: TDateField
      FieldName = 'DIA'
      DisplayFormat = 'dd/mmm'
    end
  end
  object sdsRmostra: TSQLDataSet
    CommandText = 
      'select a.ID, a.NUMNF, a.CEP, a.Locali, a.Volume, a.FLAG_IMP, a.O' +
      'RIGEM, a.LigCli, b.DTCRIADA as dia  '#13#10'FROM TB_notaf a, TB_NFUNIC' +
      'A b  '#13#10'WHERE (a.NUMNF = b.NUMNOTA and a.LIGCLI = b.LIGCLI) and L' +
      'igRot=1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 272
  end
  object dspRmostra: TDataSetProvider
    DataSet = sdsRmostra
    Left = 72
    Top = 272
  end
  object cdsRCEP2: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'LIGROTA'
    MasterFields = 'ID'
    MasterSource = dsRota
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspRCEP2'
    Left = 128
    Top = 120
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CEPINIC'
      DisplayFormat = '00000'
    end
    object IntegerField3: TIntegerField
      FieldName = 'CEPFIM'
      DisplayFormat = '00000'
    end
    object IntegerField4: TIntegerField
      FieldName = 'LIGROTA'
    end
  end
  object sdsRCEP2: TSQLDataSet
    CommandText = 'select * from TB_ROTACEP'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIGROTA'
        ParamType = ptInput
        Value = 1
      end>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 120
  end
  object dspRCEP2: TDataSetProvider
    DataSet = sdsRCEP2
    Left = 72
    Top = 120
  end
  object dsRota: TDataSource
    DataSet = cdsRota
    Left = 182
    Top = 16
  end
  object cdsPrazo2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrazo2'
    Left = 128
    Top = 336
    object cdsPrazo2NUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
    end
    object cdsPrazo2DTIMPORTA: TDateField
      FieldName = 'DTIMPORTA'
      ReadOnly = True
    end
    object cdsPrazo2DTENTREGA: TDateField
      FieldName = 'DTENTREGA'
      ReadOnly = True
    end
    object cdsPrazo2IDNF: TIntegerField
      FieldName = 'IDNF'
      ReadOnly = True
    end
    object cdsPrazo2OCOR: TSmallintField
      FieldName = 'OCOR'
      ReadOnly = True
    end
    object cdsPrazo2DIAS: TSmallintField
      FieldName = 'DIAS'
      ReadOnly = True
    end
  end
  object sdsPrazo2: TSQLDataSet
    CommandText = 
      'select a.numnf, MIN(CAST(a.dtcria as DATE)) as DTimporta, '#13#10' MAX' +
      '(a.dtent) as DTentrega, MAX(a.id) as idNF, MIN(NOCORR) as OCOR,'#13 +
      #10'MAX(a.DIASENT) as dias '#13#10'from tb_notaf a'#13#10'where  a.ligcli=106 '#13 +
      #10'and a.dtcria > '#39'2017-07-31'#39#13#10'group by a.numnf'#13#10'having MIN(a.noc' +
      'orr) > 0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 336
  end
  object dspPrazo2: TDataSetProvider
    DataSet = sdsPrazo2
    Left = 72
    Top = 336
  end
  object cdsSemC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSemC'
    Left = 128
    Top = 392
    object cdsSemCID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSemCNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsSemCVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsSemCVOLUME: TIntegerField
      FieldName = 'VOLUME'
      DisplayFormat = '#,##0'
    end
    object cdsSemCPESO: TFMTBCDField
      FieldName = 'PESO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsSemCCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsSemCLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
  end
  object sdsSemC: TSQLDataSet
    CommandText = 
      'Select  ID, NUMNF, VALOR, VOLUME, PESO, CEP, LOCALI  FROM TB_NOT' +
      'AF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 392
  end
  object dspSemC: TDataSetProvider
    DataSet = sdsSemC
    Left = 72
    Top = 392
  end
  object cdsDiaC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiaC'
    Left = 128
    Top = 448
    object cdsDiaCDTNOTA: TDateField
      FieldName = 'DTNOTA'
      ReadOnly = True
    end
    object cdsDiaCNFQUANT: TIntegerField
      FieldName = 'NFQUANT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsDiaC: TSQLDataSet
    CommandText = 
      'select dtnota, count(*) as NFquant  from TB_NOTAF '#13#10'WHERE (dtCri' +
      'a>CURRENT_DATE - 20)  and (origem  > 0 and origem <>4) '#13#10'and  li' +
      'gcli=17 '#13#10'group by dtnota'#13#10'order by dtnota'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 448
  end
  object dspDiaC: TDataSetProvider
    DataSet = sdsDiaC
    Left = 72
    Top = 448
  end
  object cdsMarq: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'QUANTNF'
        ParamType = ptOutput
        Value = 0
      end>
    ProviderName = 'dspMarq'
    Left = 128
    Top = 504
  end
  object dspMarq: TDataSetProvider
    DataSet = sspMarq
    Left = 72
    Top = 504
  end
  object sspMarq: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'QUANTNF'
        ParamType = ptOutput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FLG'
        ParamType = ptInput
      end>
    SQLConnection = DM1.Conexao
    StoredProcName = 'SP_COB2_MARCAR'
    Left = 184
    Top = 392
  end
  object sdsMarq: TSQLDataSet
    CommandText = 'SP_COB2_MARCAR'
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FLG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QUANTNF'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 504
  end
  object sspZero: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftSmallint
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FIM'
        ParamType = ptInput
      end>
    SQLConnection = DM1.Conexao
    StoredProcName = 'SP_COB2_ZERAR'
    Left = 184
    Top = 448
  end
  object cdsBipR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBipR'
    Left = 128
    Top = 558
    object cdsBipRDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsBipRNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsBipRROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsBipRLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
      ReadOnly = True
    end
    object cdsBipRCONFERIDOPOR: TIntegerField
      FieldName = 'CONFERIDOPOR'
      ReadOnly = True
    end
    object cdsBipRCONFERE: TSmallintField
      FieldName = 'CONFERE'
      ReadOnly = True
    end
  end
  object dspBipR: TDataSetProvider
    DataSet = sdsBipR
    Left = 72
    Top = 558
  end
  object sdsBipR: TSQLDataSet
    CommandText = 
      'select dtroma, num, num -extract(YEAR from dtRoma)* 1000000 as R' +
      'omaneio, ligMot, CONFERIDOPOR, confere '#13#10'from Tb_roma where dtro' +
      'ma >= CURRENT_DATE - 10'#13#10'order by num desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 558
  end
  object cdsCr1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCr1'
    Left = 360
    Top = 16
    object cdsCr1DTCRIADA: TDateField
      FieldName = 'DTCRIADA'
      ReadOnly = True
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsCr1QT: TIntegerField
      FieldName = 'QT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsCr1: TSQLDataSet
    CommandText = 
      'select dtcriada, count(*) as qt  from tb_NFunica'#13#10'where status =' +
      ' 0'#13#10'group by dtcriada'#13#10'order by dtcriada'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 16
  end
  object dspCr1: TDataSetProvider
    DataSet = sdsCr1
    Left = 304
    Top = 16
  end
  object cdsCr2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCr2'
    Left = 360
    Top = 64
    object cdsCr2DTCRIADA: TDateField
      FieldName = 'DTCRIADA'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsCr2NUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      DisplayFormat = '#,##0'
    end
    object cdsCr2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCr2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCr2IDU: TIntegerField
      FieldName = 'IDU'
      Required = True
    end
  end
  object sdsCr2: TSQLDataSet
    CommandText = 
      'select a.dtCriada, a.numnota, a.ligcli, b.nome, a.id as idU  fro' +
      'm TB_NFunica a, TB_Cliente b where a.ligcli=b.id and  a.status =' +
      '0'#13#10'order by a.dtcriada'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 64
  end
  object dspCr2: TDataSetProvider
    DataSet = sdsCr2
    Left = 304
    Top = 64
  end
  object cdsCr3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCr3'
    Left = 360
    Top = 120
    object cdsCr3NROMA: TIntegerField
      FieldName = 'NROMA'
      DisplayFormat = '#,##0'
    end
    object cdsCr3NUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsCr3ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCr3VALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCr3OBS: TStringField
      FieldName = 'OBS'
      Size = 55
    end
  end
  object sdsCr3: TSQLDataSet
    CommandText = 'select nRoma, numnf, id, valor, obs  from Tb_Notaf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 120
  end
  object dspCr3: TDataSetProvider
    DataSet = sdsCr3
    Left = 304
    Top = 120
  end
  object cdsINT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspINT'
    Left = 360
    Top = 168
    object cdsINTNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      DisplayFormat = '#,##0'
    end
    object cdsINTDTEV: TSQLTimeStampField
      FieldName = 'DTEV'
      DisplayFormat = 'dd/MM/yyyy HH:mm ddd'
    end
    object cdsINTDESCR: TStringField
      FieldName = 'DESCR'
      Size = 35
    end
    object cdsINTLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 12
    end
    object cdsINTNUMROMA: TIntegerField
      FieldName = 'NUMROMA'
      DisplayFormat = '#,##0'
    end
  end
  object sdsINT: TSQLDataSet
    CommandText = 
      'select a.numnota, a.DTEV, c.DESCR, b.Login, a.numroma'#13#10'from tb_N' +
      'Fstatus a, TB_Usuarios b, TB_INTERNO c'#13#10'where a.LIGUSER = b.ID a' +
      'nd a.NUMEVENTO = c.CODINT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 168
  end
  object dspINT: TDataSetProvider
    DataSet = sdsINT
    Left = 304
    Top = 168
  end
  object cdsFinC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinC'
    Left = 360
    Top = 224
    object cdsFinCID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFinCNIVEL: TSmallintField
      FieldName = 'NIVEL'
    end
    object cdsFinCPERMISSAO: TSmallintField
      FieldName = 'PERMISSAO'
    end
    object cdsFinCSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsFinCNOMECONTA: TStringField
      FieldName = 'NOMECONTA'
    end
    object cdsFinCDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsFinCDTALT: TSQLTimeStampField
      FieldName = 'DTALT'
    end
  end
  object sdsFinC: TSQLDataSet
    CommandText = 'select * from TB_FinConta'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 224
  end
  object dspFinC: TDataSetProvider
    DataSet = sdsFinC
    Left = 304
    Top = 224
  end
  object cdsFinCo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinC'
    Left = 408
    Top = 224
    object IntegerField5: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'NIVEL'
    end
    object SmallintField2: TSmallintField
      FieldName = 'PERMISSAO'
    end
    object SmallintField3: TSmallintField
      FieldName = 'STATUS'
    end
    object StringField1: TStringField
      FieldName = 'NOMECONTA'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'DTALT'
    end
  end
  object cdsFinanc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinanc'
    Left = 360
    Top = 273
    object cdsFinancID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFinancDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsFinancDTCONTAB: TDateField
      FieldName = 'DTCONTAB'
    end
    object cdsFinancDTPREV: TDateField
      FieldName = 'DTPREV'
    end
    object cdsFinancVALORCONTAB: TFMTBCDField
      FieldName = 'VALORCONTAB'
      Precision = 9
      Size = 2
    end
    object cdsFinancVALORPREV: TFMTBCDField
      FieldName = 'VALORPREV'
      Precision = 9
      Size = 2
    end
    object cdsFinancDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsFinancSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsFinancLIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsFinancLIGCONTA: TIntegerField
      FieldName = 'LIGCONTA'
    end
  end
  object sdsFinanc: TSQLDataSet
    CommandText = 'select * from TB_Financ'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 273
  end
  object dspFinanc: TDataSetProvider
    DataSet = sdsFinanc
    Left = 304
    Top = 273
  end
  object cdsPende: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPende'
    Left = 360
    Top = 329
    object cdsPendeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPendeNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsPendeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPendeNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsPendeOBS: TStringField
      FieldName = 'OBS'
      Size = 55
    end
    object cdsPendeDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
      DisplayFormat = 'dd/MMM'
    end
    object cdsPendeLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsPende: TSQLDataSet
    CommandText = 
      'select a.id, a.numnf, a.valor, b.NOME,  a.obs, a.dtcria, a.LigCl' +
      'i  from tb_notaf a, TB_Cliente b '#13#10'where a.LIGCLI = b.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 248
    Top = 329
  end
  object dspPende: TDataSetProvider
    DataSet = sdsPende
    Left = 304
    Top = 329
  end
  object cdsPr1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPr1'
    Left = 352
    Top = 393
    object cdsPr1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPr1DESCREVE: TStringField
      FieldName = 'DESCREVE'
      Size = 30
    end
    object cdsPr1VALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
  end
  object sdsPr1: TSQLDataSet
    CommandText = 'select * from TB_Prazo'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 240
    Top = 393
  end
  object dspPr1: TDataSetProvider
    DataSet = sdsPr1
    Left = 296
    Top = 393
  end
  object cdsPr2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPr2'
    Left = 352
    Top = 449
    object cdsPr2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPr2CEPI: TIntegerField
      FieldName = 'CEPI'
      DisplayFormat = '00000'
    end
    object cdsPr2CEPF: TIntegerField
      FieldName = 'CEPF'
      DisplayFormat = '00000'
    end
    object cdsPr2PRAZO: TSmallintField
      FieldName = 'PRAZO'
      DisplayFormat = '00'
    end
    object cdsPr2LIGPRAZOL: TIntegerField
      FieldName = 'LIGPRAZOL'
    end
    object cdsPr2AREARISCO: TStringField
      FieldName = 'AREARISCO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsPr2: TSQLDataSet
    CommandText = 'select * from TB_PrazoCEP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 240
    Top = 449
  end
  object dspPr2: TDataSetProvider
    DataSet = sdsPr2
    Left = 296
    Top = 449
  end
  object sdsPrCli1: TSQLDataSet
    CommandText = 'select id, Nome, Ligprazo, Prazo from TB_Cliente'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 240
    Top = 505
  end
  object dspPrCli1: TDataSetProvider
    DataSet = sdsPrCli1
    Left = 296
    Top = 505
  end
  object cdsPrCli1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrCli1'
    Left = 352
    Top = 505
    object cdsPrCli1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPrCli1NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsPrCli1LIGPRAZO: TIntegerField
      FieldName = 'LIGPRAZO'
    end
    object cdsPrCli1PRAZO: TSmallintField
      FieldName = 'PRAZO'
    end
  end
  object sdsPrCli2: TSQLDataSet
    CommandText = 'select id, Nome, Ligprazo from TB_Cliente'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 240
    Top = 561
  end
  object dspPrCli2: TDataSetProvider
    DataSet = sdsPrCli2
    Left = 296
    Top = 561
  end
  object cdsPrCli2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrCli2'
    Left = 352
    Top = 561
    object cdsPrCli2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPrCli2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsPrCli2LIGPRAZO: TIntegerField
      FieldName = 'LIGPRAZO'
    end
  end
  object sdsPrDia: TSQLDataSet
    CommandText = 
      'select  dtentrega, COUNT(*) as Qt2  from TB_NFUNICA '#13#10'where not ' +
      '(dtentrega is null) and dtcriada = '#39'2019-01-16'#39#13#10'group by dtEntr' +
      'ega'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 240
    Top = 625
  end
  object dspPrDia: TDataSetProvider
    DataSet = sdsPrDia
    Left = 296
    Top = 625
  end
  object cdsPrDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrDia'
    Left = 352
    Top = 625
    object cdsPrDiaDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsPrDiaQT2: TIntegerField
      FieldName = 'QT2'
      Required = True
    end
  end
  object sdsPrCep: TSQLDataSet
    CommandText = 
      'select a.id, b.CEP, b.ligcli from TB_NFUNICA a, TB_NOTAF b'#13#10'wher' +
      'e a.numnota = b.numnf and a.ligcli=b.LIGCLI'#13#10'and a.status=1 and ' +
      'a.DTCRIADA = '#39'2019-01-16'#39#13#10'order by  b.ligcli, b.CEP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 393
  end
  object dspPrCep: TDataSetProvider
    DataSet = sdsPrCep
    Left = 472
    Top = 393
  end
  object cdsPrCep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrCep'
    Left = 528
    Top = 393
    object cdsPrCepID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPrCepCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPrCepLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsPrCli: TSQLDataSet
    CommandText = 
      'select ligcli, COUNT(*) as qt from TB_NFUNICA'#13#10'where status=1 an' +
      'd DTCRIADA = '#39'2019-01-16'#39#13#10'group by ligcli'#13#10'order by count(*) de' +
      'sc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 457
  end
  object dspPrCli: TDataSetProvider
    DataSet = sdsPrCli
    Left = 472
    Top = 457
  end
  object cdsPrCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrCli'
    Left = 528
    Top = 457
    object cdsPrCliLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsPrCliQT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
  end
  object cdsPrE1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrE1'
    Left = 528
    Top = 16
    object cdsPrE1LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsPrE1NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsPrE1CRIADAS: TIntegerField
      FieldName = 'CRIADAS'
      Required = True
    end
  end
  object sdsPrE1: TSQLDataSet
    CommandText = 
      'select ligcli, b.NOME, count(*) as criadas '#13#10'from TB_NFUNICA a, ' +
      'TB_CLIENTE b '#13#10'where a.ligcli = b.id'#13#10'and a.DTCRIADA>='#39'2019-01-1' +
      '5'#39' and dtcriada <= '#39'2019-01-31'#39#13#10'group by a.ligcli, b.nome'#13#10'orde' +
      'r by b.nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 16
  end
  object dspPrE1: TDataSetProvider
    DataSet = sdsPrE1
    Left = 472
    Top = 16
  end
  object cdsPrE2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrE2'
    Left = 528
    Top = 64
    object cdsPrE2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsPrE2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsPrE2NUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsPrE2CEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPrE2DTCRIADA: TDateField
      FieldName = 'DTCRIADA'
    end
    object cdsPrE2DTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsPrE2DIASENTREGA: TSmallintField
      FieldName = 'DIASENTREGA'
    end
    object cdsPrE2PRAZO: TSmallintField
      FieldName = 'PRAZO'
    end
    object cdsPrE2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsPrE2TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPrE2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPrE2PRIMSAIDA: TDateField
      FieldName = 'PRIMSAIDA'
    end
    object cdsPrE2PRIMOCOR: TSQLTimeStampField
      FieldName = 'PRIMOCOR'
    end
    object cdsPrE2PRAZORESP: TSmallintField
      FieldName = 'PRAZORESP'
    end
    object cdsPrE2NOCOR: TIntegerField
      FieldName = 'NOCOR'
    end
    object cdsPrE2OC_PRIM: TSmallintField
      FieldName = 'OC_PRIM'
    end
  end
  object sdsPrE2: TSQLDataSet
    CommandText = 
      'Select distinct a.ligcli, c.NOME,  a.numnota,  b.cep, a.DTCRIADA' +
      ', a.dtentrega, a.diasentrega, a.prazo, a.status, b.tipolocal, a.' +
      'id, a.primsaida, a.primocor, a.prazoresp, a.nocor, b.nocorr as o' +
      'c_prim      '#13#10'from TB_NFUNICA a, TB_NOTAF b, TB_Cliente c'#13#10'where' +
      ' a.NUMNOTA=b.numnf and a.ligcli=b.ligcli and a.ligcli=c.id and d' +
      'tcriada >= '#39'2019-01-16'#39' and dtCriada <= '#39'2019-01-31'#39#13#10'order by a' +
      '.status, a.ligcli, numnota'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 64
  end
  object dspPrE2: TDataSetProvider
    DataSet = sdsPrE2
    Left = 472
    Top = 64
  end
  object cdsPrDias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrDias'
    Left = 528
    Top = 120
    object cdsPrDiasDIASENTREGA: TSmallintField
      FieldName = 'DIASENTREGA'
    end
    object cdsPrDiasNOTAS: TIntegerField
      FieldName = 'NOTAS'
      Required = True
    end
  end
  object sdsPrDias: TSQLDataSet
    CommandText = 
      'select diasentrega, count(*) as notas from TB_NFUnica '#13#10'where dt' +
      'criada >='#39'2019-01-16'#39' and dtcriada<='#39'2019-01-18'#39' and ligcli=98'#13#10 +
      'and status=1'#13#10'group by diasEntrega'#13#10' order by  diasEntrega'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 120
  end
  object dspPrDias: TDataSetProvider
    DataSet = sdsPrDias
    Left = 472
    Top = 120
  end
  object sdsInu: TSQLDataSet
    CommandText = 'Select * from TB_INUTEIS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 273
  end
  object dspInu: TDataSetProvider
    DataSet = sdsInu
    Left = 472
    Top = 273
  end
  object cdsInu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInu'
    Left = 528
    Top = 273
    object cdsInuID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsInuDIA_INUTIL: TDateField
      FieldName = 'DIA_INUTIL'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
  end
  object sdsObs2: TSQLDataSet
    CommandText = 
      'Select a.DTOBS, b.LOGIN, a.OBS2, a.TIPOOBS  from Tb_NFOBS a, TB_' +
      'USUARIOS b'#13#10'where a.LIGUSER = b.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 329
  end
  object dspObs2: TDataSetProvider
    DataSet = sdsObs2
    Left = 472
    Top = 329
  end
  object cdsObs2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspObs2'
    Left = 528
    Top = 329
    object cdsObs2DTOBS: TSQLTimeStampField
      FieldName = 'DTOBS'
      DisplayFormat = 'dd/MMM ddd'
    end
    object cdsObs2LOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 12
    end
    object cdsObs2OBS2: TStringField
      FieldName = 'OBS2'
      Size = 50
    end
    object cdsObs2TIPOOBS: TSmallintField
      FieldName = 'TIPOOBS'
    end
  end
  object sdsBIPt: TSQLDataSet
    CommandText = 
      'Select dtcriada, count(*) as nts from TB_NFUNICA '#13#10' group by dtc' +
      'riada order by dtcriada desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 505
  end
  object dspBIPt: TDataSetProvider
    DataSet = sdsBIPt
    Left = 472
    Top = 505
  end
  object cdsBIPt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBIPt'
    Left = 528
    Top = 505
    object cdsBIPtDTCRIADA: TDateField
      FieldName = 'DTCRIADA'
    end
    object cdsBIPtNTS: TIntegerField
      FieldName = 'NTS'
      Required = True
    end
  end
  object sdsBIPn: TSQLDataSet
    CommandText = 
      'Select distinct a.id, a.numnota, b.VOLUME, a.bipe, a.BIPVOL from' +
      ' TB_NFUNICA a, TB_NOTAF b'#13#10'where a.NUMNOTA=b.NUMNF and a.ligcli=' +
      'b.LIGCLI'#13#10'and dtcriada = '#39'2019-01-17'#39#13#10'order by a.numnota'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 561
  end
  object dspBIPn: TDataSetProvider
    DataSet = sdsBIPn
    Left = 472
    Top = 561
  end
  object cdsBIPn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBIPn'
    Left = 528
    Top = 561
    object cdsBIPnID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBIPnNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      DisplayFormat = '#,##0'
    end
    object cdsBIPnVOLUME: TIntegerField
      FieldName = 'VOLUME'
      DisplayFormat = '#,##0'
    end
    object cdsBIPnBIPE: TSmallintField
      FieldName = 'BIPE'
    end
    object cdsBIPnBIPVOL: TSmallintField
      FieldName = 'BIPVOL'
      DisplayFormat = '#,##0'
    end
  end
  object cdsBIP2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBIP2'
    Left = 704
    Top = 16
    object cdsBIP2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBIP2DTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsBIP2DTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsBIP2DTULTCONF: TSQLTimeStampField
      FieldName = 'DTULTCONF'
    end
    object cdsBIP2NOTASENT: TIntegerField
      FieldName = 'NOTASENT'
    end
  end
  object sdsBIP2: TSQLDataSet
    CommandText = 'select * from TB_BIP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 16
  end
  object dspBIP2: TDataSetProvider
    DataSet = sdsBIP2
    Left = 648
    Top = 16
  end
  object cdsBIP2nf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBIP2nf'
    Left = 704
    Top = 72
    object cdsBIP2nfID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBIP2nfLIGBIP: TIntegerField
      FieldName = 'LIGBIP'
    end
    object cdsBIP2nfEDTCRIA: TSQLTimeStampField
      FieldName = 'EDTCRIA'
    end
    object cdsBIP2nfEDTALTERA: TSQLTimeStampField
      FieldName = 'EDTALTERA'
    end
    object cdsBIP2nfENUMNF: TIntegerField
      FieldName = 'ENUMNF'
    end
    object cdsBIP2nfEVOL: TIntegerField
      FieldName = 'EVOL'
    end
    object cdsBIP2nfESTATUS: TSmallintField
      FieldName = 'ESTATUS'
    end
  end
  object sdsBIP2nf: TSQLDataSet
    CommandText = 'select * from TB_BIP_NF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 72
  end
  object dspBIP2nf: TDataSetProvider
    DataSet = sdsBIP2nf
    Left = 648
    Top = 72
  end
  object cdsBIp2b: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBIP2'
    Left = 744
    Top = 32
    object IntegerField6: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLTimeStampField3: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object DateField1: TDateField
      FieldName = 'DTENTRADA'
    end
    object SQLTimeStampField4: TSQLTimeStampField
      FieldName = 'DTULTCONF'
    end
    object IntegerField7: TIntegerField
      FieldName = 'NOTASENT'
    end
  end
  object cdsNFcte: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFcte'
    Left = 712
    Top = 120
    object cdsNFcteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFcteNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNFcteVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFcteNCONH: TIntegerField
      FieldName = 'NCONH'
      DisplayFormat = '#,##0'
    end
    object cdsNFcteNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsNFcteLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFcteLIGDCOB: TIntegerField
      FieldName = 'LIGDCOB'
    end
    object cdsNFcteCTEGRUPO: TIntegerField
      FieldName = 'CTEGRUPO'
    end
    object cdsNFctePESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsNFcteSERIENF: TSmallintField
      FieldName = 'SERIENF'
    end
    object cdsNFcteCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsNFcteNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsNFctePONTO: TSmallintField
      FieldName = 'PONTO'
    end
    object cdsNFcteTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsNFcteVLRCOMBINADO: TFMTBCDField
      FieldName = 'VLRCOMBINADO'
      Precision = 9
      Size = 2
    end
    object cdsNFcteTIPO_COB: TSmallintField
      FieldName = 'TIPO_COB'
    end
  end
  object sdsNFcte: TSQLDataSet
    CommandText = 
      'select a.id, a.numnf, a.valor, a.nconh, b.NOME, a.ligcli, a.LIGD' +
      'COB, a.CteGrupo, a.PESO, a.SERIENF, a.CEP, a.NOMEDEST, a.PONTO, ' +
      'a.TIPOLOCAL, a.VLRCOMBINADO, a.TIPO_COB from TB_NOTAF a, TB_CLIE' +
      'NTE b WHERE a.LIGCLI=b.id and dtCria > '#39'2019-05-01'#39' order by num' +
      'nf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 600
    Top = 120
  end
  object dspNFcte: TDataSetProvider
    DataSet = sdsNFcte
    Left = 656
    Top = 120
  end
  object cdsCob: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCob'
    Left = 712
    Top = 184
    object cdsCobID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '#,##0'
    end
    object cdsCobLIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsCobLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCobLIGBANCO: TIntegerField
      FieldName = 'LIGBANCO'
    end
    object cdsCobDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCobDTVENC: TDateField
      FieldName = 'DTVENC'
    end
    object cdsCobVALORCOB: TFMTBCDField
      FieldName = 'VALORCOB'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCobTIPOCOB: TStringField
      FieldName = 'TIPOCOB'
      FixedChar = True
      Size = 3
    end
    object cdsCobVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCobVALORJUROS: TFMTBCDField
      FieldName = 'VALORJUROS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCobDESCDTLIMITE: TDateField
      FieldName = 'DESCDTLIMITE'
    end
    object cdsCobDESCVALOR: TFMTBCDField
      FieldName = 'DESCVALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCobNFTRANSP: TIntegerField
      FieldName = 'NFTRANSP'
    end
    object cdsCobOBS: TStringField
      FieldName = 'OBS'
      Size = 30
    end
    object cdsCobVALIDA: TSmallintField
      FieldName = 'VALIDA'
    end
    object cdsCobSTATUS_ENV: TSmallintField
      FieldName = 'STATUS_ENV'
    end
  end
  object sdsCob: TSQLDataSet
    CommandText = 'select * from TB_DOCCOB Where id = 17'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 600
    Top = 184
  end
  object dspCob: TDataSetProvider
    DataSet = sdsCob
    Left = 656
    Top = 184
  end
  object cdsCC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCC'
    Left = 712
    Top = 240
    object cdsCCID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCCDESCREVE: TStringField
      FieldName = 'DESCREVE'
    end
    object cdsCCNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 35
    end
    object cdsCCNUMAGENCIA: TSmallintField
      FieldName = 'NUMAGENCIA'
    end
    object cdsCCDIGAGENCIA: TSmallintField
      FieldName = 'DIGAGENCIA'
    end
    object cdsCCNUMCONTA: TIntegerField
      FieldName = 'NUMCONTA'
    end
    object cdsCCDIGCONTA: TSmallintField
      FieldName = 'DIGCONTA'
    end
    object cdsCCATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object sdsCC: TSQLDataSet
    CommandText = 'select * from TB_CONTABANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 600
    Top = 240
  end
  object dspCC: TDataSetProvider
    DataSet = sdsCC
    Left = 656
    Top = 240
  end
  object cdsCob2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCob'
    Left = 552
    Top = 216
    object IntegerField8: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField9: TIntegerField
      FieldName = 'LIGUSER'
    end
    object IntegerField10: TIntegerField
      FieldName = 'LIGCLI'
    end
    object IntegerField11: TIntegerField
      FieldName = 'LIGBANCO'
    end
    object DateField2: TDateField
      FieldName = 'DTEMISSAO'
    end
    object DateField3: TDateField
      FieldName = 'DTVENC'
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VALORCOB'
      Precision = 18
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'TIPOCOB'
      FixedChar = True
      Size = 3
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'VALORICMS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'VALORJUROS'
      Precision = 18
      Size = 2
    end
    object DateField4: TDateField
      FieldName = 'DESCDTLIMITE'
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'DESCVALOR'
      Precision = 18
      Size = 2
    end
    object IntegerField12: TIntegerField
      FieldName = 'NFTRANSP'
    end
    object StringField3: TStringField
      FieldName = 'OBS'
      Size = 30
    end
    object SmallintField4: TSmallintField
      FieldName = 'VALIDA'
    end
  end
  object cdsfuD1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspfuD1'
    Left = 704
    Top = 328
    object cdsfuD1DTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsfuD1NUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsfuD1ROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
    end
    object cdsfuD1QTNOTAS: TIntegerField
      FieldName = 'QTNOTAS'
      Required = True
    end
  end
  object sdsfuD1: TSQLDataSet
    CommandText = 
      'select d.dtRoma, d.num, d.num - extract(YEAR from d.dtRoma)* 100' +
      '0000 as Romaneio, count(*) as qtNotas from TB_NOTAF c, TB_ROMA d' +
      ' Where c.nroma=d.num'#13#10#13#10'and d.dtRoma>='#39'2019-04-21'#39' and d.dtRoma<' +
      '='#39'2019-05-20'#39' and d.ligmot=309 and c.nocorr<>20'#13#10#13#10'group by d.dt' +
      'Roma, d.num order by d.dtroma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 328
  end
  object dspfuD1: TDataSetProvider
    DataSet = sdsfuD1
    Left = 648
    Top = 328
  end
  object cdsfuD2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspfuD2'
    Left = 704
    Top = 392
    object cdsfuD2DTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsfuD2NUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsfuD2NOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsfuD2QTNOTAS: TIntegerField
      FieldName = 'QTNOTAS'
      Required = True
    end
    object cdsfuD2DESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
  end
  object sdsfuD2: TSQLDataSet
    CommandText = 
      'select b.dtRoma, b.num,  a.nocorr, count(*) as qtNotas, c.DESCR ' +
      '  from TB_NOTAF a, TB_ROMA b , TB_OCORRE c '#13#10'Where a.nroma=b.num' +
      '  and c.NUM =a.NOCORR '#13#10'and b.dtRoma>='#39'2019-04-21'#39' and b.dtRoma<' +
      '='#39'2019-05-20'#39' and b.ligmot=309'#13#10'group by b.dtRoma, b.num, a.noco' +
      'rr, c.DESCR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 392
  end
  object dspfuD2: TDataSetProvider
    DataSet = sdsfuD2
    Left = 648
    Top = 392
  end
  object cdsFuD3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspfuD2'
    Left = 744
    Top = 368
    object cdsFuD3DTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsFuD3NUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsFuD3NOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsFuD3QTNOTAS: TIntegerField
      FieldName = 'QTNOTAS'
      Required = True
    end
    object cdsFuD3DESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
  end
  object cdsCobCTe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobCTe'
    Left = 704
    Top = 288
    object cdsCobCTeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCobCTeNUMC: TIntegerField
      FieldName = 'NUMC'
    end
    object cdsCobCTeDATAC: TDateField
      FieldName = 'DATAC'
    end
    object cdsCobCTeLIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsCobCTeNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsCobCTeTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsCobCTeNOC: TSmallintField
      FieldName = 'NOC'
    end
  end
  object sdsCobCTe: TSQLDataSet
    CommandText = 
      'select a.id, a.NUMC, a.DATAC, a.LIGTRANSP, a.NUMNOTA, a.TOTAL,  ' +
      'b.nocorr as nOc from TB_Conhec a, TB_NOTAF b where a.lignota = b' +
      '.id'#13#10'  order by a.GRUPO desc, b.nocorr, a.numc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 288
  end
  object dspCobCTe: TDataSetProvider
    DataSet = sdsCobCTe
    Left = 648
    Top = 288
  end
  object cdsNfenvia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFenvia'
    Left = 704
    Top = 459
    object cdsNfenviaDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object cdsNfenviaNROMA: TIntegerField
      FieldName = 'NROMA'
      DisplayFormat = '#,##0'
    end
    object cdsNfenviaNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNfenviaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNfenviaROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      DisplayFormat = '#,##0'
    end
    object cdsNfenviaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsNfenviaDTOCOREN: TSQLTimeStampField
      FieldName = 'DTOCOREN'
      DisplayFormat = 'dd/MM/yyyy HH:mm'
    end
    object cdsNfenviaIDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsNfenviaNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
  end
  object sdsNFenvia: TSQLDataSet
    CommandText = 
      'select b.dtRoma, a.nRoma, a.NUMNF, a.VALOR, b.num - extract(YEAR' +
      ' from b.dtRoma)* 1000000 as Romaneio, c.NOME, a.DTocoren, a.ID a' +
      's idNF  , a.nocorr'#13#10'from TB_NOTAF a, TB_ROMA b , TB_CLIENTE c '#13#10 +
      'Where a.nroma=b.num  and a.LIGCLI=c.id '#13#10'and b.dtRoma='#39'2019-07-0' +
      '1'#39#13#10'order by a.nRoma, a.numnf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 459
  end
  object dspNFenvia: TDataSetProvider
    DataSet = sdsNFenvia
    Left = 648
    Top = 459
  end
  object cdsNFdia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFdia'
    Left = 704
    Top = 510
    object cdsNFdiaNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNFdiaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFdiaROMANEIO: TIntegerField
      FieldName = 'ROMANEIO'
      DisplayFormat = '#,##0'
    end
    object cdsNFdiaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsNFdiaDTOCOREN: TSQLTimeStampField
      FieldName = 'DTOCOREN'
      DisplayFormat = 'dd/MM/yyyy HH:mm'
    end
    object cdsNFdiaORIGEM2: TStringField
      FieldName = 'ORIGEM2'
      FixedChar = True
      Size = 15
    end
    object cdsNFdiaIDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
  end
  object sdsNFdia: TSQLDataSet
    CommandText = 
      'select a.NUMNF, a.VALOR, a.nRoma as Romaneio, c.NOME, a.DTocoren' +
      ', a.ID as idNF,'#13#10'case origem when 1 then '#39'Manual'#39' when 2 then '#39'C' +
      'oleta'#39' when 3 then '#39'Importada EDI'#39' when 4 then '#39'Reentrega'#39' when ' +
      '5 then '#39'Importada XML'#39' when 6 then '#39'Importada Excel'#39'  ELSE '#39'Outr' +
      'as Entradas'#39' end as origem2    '#13#10'from TB_NOTAF a, TB_CLIENTE c '#13 +
      #10'Where a.LIGCLI=c.id '#13#10'and a.dtCria>='#39'2019-07-01 00:01'#39' and a.dt' +
      'Cria<='#39'2019-07-01 23:59'#39#13#10'order by a.nRoma, a.numnf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 510
  end
  object dspNFdia: TDataSetProvider
    DataSet = sdsNFdia
    Left = 648
    Top = 510
  end
  object cdsRcria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRcria'
    Left = 704
    Top = 566
    object cdsRcriaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRcriaDTCRIADA: TDateField
      FieldName = 'DTCRIADA'
    end
    object cdsRcriaDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsRcriaNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsRcriaLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsRcriaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsRcriaLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRcriaNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsRcriaNROMA: TIntegerField
      FieldName = 'NROMA'
    end
  end
  object sdsRcria: TSQLDataSet
    CommandText = 
      'select b.ID, a.DTCRIADA, b.dtcria, b.numnf, b.locali, b.CEP, b.l' +
      'igcli, b.NOCORR, b.nroma  from tb_NFunica  a, TB_NOTAF b'#13#10'where ' +
      '(a.ligcli=b.LIGCLI and a.NUMNOTA=b.numnf and b.dtcria>a.dtcriada' +
      ' ) and (a.STATUS=0) and (a.ligcli=98) '#13#10'order by a.dtcriada, b.N' +
      'UMNF, b.id desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 566
  end
  object dspRcria: TDataSetProvider
    DataSet = sdsRcria
    Left = 648
    Top = 566
  end
  object sdsSAC: TSQLDataSet
    CommandText = 
      'select tb_roma.num - extract(YEAR from dtRoma)* 1000000 as Roman' +
      'eio,dtRoma, TB_CLIENTE.id as idC, TB_CLIENTE.NOME, numNF,'#13#10'nRoma' +
      ', Tb_NotaF.id as idNF, Tb_Roma.id as idR,'#13#10'CASE tb_ocorre.uso WH' +
      'EN 2 THEN '#39'Reentrega'#39' WHEN 3 THEN '#39'Devolu'#231#227'o'#39' ELSE '#39'-'#39' END as ti' +
      'potxt,'#13#10'nocorr, tb_ocorre.DESCR'#13#10'from Tb_ocorre, tb_Notaf,  TB_R' +
      'OMA, TB_CLIENTE'#13#10'where  tb_ocorre.num  = tb_notaf.nocorr and tb_' +
      'roma.num  = tb_notaf.nroma and TB_CLIENTE.id = TB_NOTAF.LIGCLI a' +
      'nd TB_NOTAF.nocorr>1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 626
  end
  object dspSAC: TDataSetProvider
    DataSet = sdsSAC
    Left = 472
    Top = 626
  end
  object cdsSAC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSAC'
    Left = 528
    Top = 626
    object cdsSACROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      DisplayFormat = '#,##0'
    end
    object cdsSACDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsSACIDC: TIntegerField
      FieldName = 'IDC'
      Required = True
    end
    object cdsSACNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsSACNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsSACNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsSACIDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsSACIDR: TIntegerField
      FieldName = 'IDR'
      Required = True
    end
    object cdsSACTIPOTXT: TStringField
      FieldName = 'TIPOTXT'
      FixedChar = True
      Size = 9
    end
    object cdsSACNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsSACDESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
  end
  object cdsRestN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRestN'
    Left = 128
    Top = 614
    object cdsRestNID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRestNNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsRestNLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRestNVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsRestNDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
    object cdsRestNNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
    object cdsRestNNROMA: TIntegerField
      FieldName = 'NROMA'
    end
  end
  object dspRestN: TDataSetProvider
    DataSet = sdsRestN
    Left = 72
    Top = 614
  end
  object sdsRestN: TSQLDataSet
    CommandText = 
      'select id, numnf, ligcli, valor, docdest, numped, nroma from tb_' +
      'notaf where nroma = 2020000077'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 614
  end
  object cdsRestR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRestR'
    Left = 128
    Top = 670
    object cdsRestRID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRestRNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsRestRDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsRestRLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
    end
    object cdsRestRROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
    end
  end
  object dspRestR: TDataSetProvider
    DataSet = sdsRestR
    Left = 72
    Top = 670
  end
  object sdsRestR: TSQLDataSet
    CommandText = 
      'select id, num, dtRoma, ligmot, num -extract(YEAR from dtRoma)* ' +
      '1000000 as Romaneio from Tb_roma where num = 2020000077'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 670
  end
  object cdsRestB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRestB'
    Left = 344
    Top = 670
    object cdsRestBID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRestBNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsRestBDTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsRestBHRENT: TTimeField
      FieldName = 'HRENT'
    end
    object cdsRestBBAIXA_FUNC: TIntegerField
      FieldName = 'BAIXA_FUNC'
    end
    object cdsRestBBAIXA_ORIG: TSmallintField
      FieldName = 'BAIXA_ORIG'
    end
    object cdsRestBRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 40
    end
  end
  object dspRestB: TDataSetProvider
    DataSet = sdsRestB
    Left = 288
    Top = 670
  end
  object sdsRestB: TSQLDataSet
    CommandText = 
      'select id, nocorr, dtent, hrent, baixa_func, baixa_orig, recebed' +
      'or from  tb_notaf  where baixa_orig >10 and nocorr>0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 670
  end
  object cdsFrtDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrtDia'
    Left = 920
    Top = 16
    object cdsFrtDiaCPDTROMA: TDateField
      FieldName = 'CPDTROMA'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsFrtDiaNOTAS: TIntegerField
      FieldName = 'NOTAS'
      Required = True
      DisplayFormat = '#,##0'
    end
    object cdsFrtDiaVALORES: TFMTBCDField
      FieldName = 'VALORES'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object sdsFrtDia: TSQLDataSet
    CommandText = 
      'select cpdtroma, count(*) as Notas,  SUM(VFRETETOTAL) as Valores' +
      '  from TB_COBVALOR where cpdtroma between '#39'2020-01-01'#39' and '#39'2020' +
      '-01-31'#39'  group by cpdtroma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 808
    Top = 16
  end
  object dspFrtDia: TDataSetProvider
    DataSet = sdsFrtDia
    Left = 864
    Top = 16
  end
  object cdsFrtCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrtCli'
    Left = 920
    Top = 80
    object cdsFrtCliLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFrtCliNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsFrtCliNOTAS: TIntegerField
      FieldName = 'NOTAS'
      Required = True
      DisplayFormat = '#,##0'
    end
    object cdsFrtCliVALORES: TFMTBCDField
      FieldName = 'VALORES'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object sdsFrtCli: TSQLDataSet
    CommandText = 
      'select LIGCLI, TB_CLIENTE.NOME,  count(*) as Notas,  SUM(VFRETET' +
      'OTAL) as Valores  from TB_COBVALOR, tb_cliente where LIGCLI=TB_C' +
      'LIENTE.ID and cpdtroma between '#39'2020-01-01'#39' and '#39'2020-01-31'#39'  gr' +
      'oup by LIGCLI, TB_CLIENTE.NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 808
    Top = 80
  end
  object dspFrtCli: TDataSetProvider
    DataSet = sdsFrtCli
    Left = 864
    Top = 80
  end
  object cdsFrtNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrtNotas'
    Left = 920
    Top = 144
    object cdsFrtNotasLIGNF: TIntegerField
      FieldName = 'LIGNF'
      Required = True
    end
    object cdsFrtNotasLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFrtNotasFLGCOB: TSmallintField
      FieldName = 'FLGCOB'
    end
    object cdsFrtNotasCPNUMNF: TIntegerField
      FieldName = 'CPNUMNF'
    end
    object cdsFrtNotasCPNCTE: TIntegerField
      FieldName = 'CPNCTE'
    end
    object cdsFrtNotasCPPEDIDO: TStringField
      FieldName = 'CPPEDIDO'
      Size = 15
    end
    object cdsFrtNotasCPDTROMA: TDateField
      FieldName = 'CPDTROMA'
    end
    object cdsFrtNotasDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object cdsFrtNotasDTCRIA: TDateField
      FieldName = 'DTCRIA'
    end
    object cdsFrtNotasDTALT: TDateField
      FieldName = 'DTALT'
    end
    object cdsFrtNotasTIPOCOB: TSmallintField
      FieldName = 'TIPOCOB'
    end
    object cdsFrtNotasVFRETETOTAL: TFMTBCDField
      FieldName = 'VFRETETOTAL'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVFRETESERV: TFMTBCDField
      FieldName = 'VFRETESERV'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVADICPESO: TFMTBCDField
      FieldName = 'VADICPESO'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVADVALOR: TFMTBCDField
      FieldName = 'VADVALOR'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVGRIS: TFMTBCDField
      FieldName = 'VGRIS'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVPEDAGIO: TFMTBCDField
      FieldName = 'VPEDAGIO'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVTAXA: TFMTBCDField
      FieldName = 'VTAXA'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVTDE: TFMTBCDField
      FieldName = 'VTDE'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVPONTO: TFMTBCDField
      FieldName = 'VPONTO'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVREENT: TFMTBCDField
      FieldName = 'VREENT'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVDEVOLUCAO: TFMTBCDField
      FieldName = 'VDEVOLUCAO'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVOUTROS: TFMTBCDField
      FieldName = 'VOUTROS'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasVCOMBINA: TFMTBCDField
      FieldName = 'VCOMBINA'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasNPONTO: TSmallintField
      FieldName = 'NPONTO'
    end
    object cdsFrtNotasSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsFrtNotasCPNROMA: TIntegerField
      FieldName = 'CPNROMA'
    end
    object cdsFrtNotasCPLOCAL: TSmallintField
      FieldName = 'CPLOCAL'
    end
    object cdsFrtNotasICBASE: TFMTBCDField
      FieldName = 'ICBASE'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasICALIQ: TFMTBCDField
      FieldName = 'ICALIQ'
      Precision = 9
      Size = 2
    end
    object cdsFrtNotasICVALOR: TFMTBCDField
      FieldName = 'ICVALOR'
      Precision = 9
      Size = 2
    end
  end
  object sdsFrtNotas: TSQLDataSet
    CommandText = 
      'select * from TB_COBVALOR '#13#10'Where  cpdtroma between '#39'2020-01-01'#39 +
      ' and '#39'2020-01-31'#39' '#13#10'order by cpdtroma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 808
    Top = 144
  end
  object dspFrtNotas: TDataSetProvider
    DataSet = sdsFrtNotas
    Left = 864
    Top = 144
  end
  object cdsFrtNotas2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrtNotas'
    Left = 864
    Top = 192
    object IntegerField13: TIntegerField
      FieldName = 'LIGNF'
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'LIGCLI'
    end
    object SmallintField5: TSmallintField
      FieldName = 'FLGCOB'
    end
    object IntegerField15: TIntegerField
      FieldName = 'CPNUMNF'
    end
    object IntegerField16: TIntegerField
      FieldName = 'CPNCTE'
    end
    object StringField4: TStringField
      FieldName = 'CPPEDIDO'
      Size = 15
    end
    object DateField5: TDateField
      FieldName = 'CPDTROMA'
    end
    object DateField6: TDateField
      FieldName = 'DTPAGO'
    end
    object DateField7: TDateField
      FieldName = 'DTCRIA'
    end
    object DateField8: TDateField
      FieldName = 'DTALT'
    end
    object SmallintField6: TSmallintField
      FieldName = 'TIPOCOB'
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'VFRETETOTAL'
      Precision = 9
      Size = 2
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'VFRETESERV'
      Precision = 9
      Size = 2
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'VADICPESO'
      Precision = 9
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'VADVALOR'
      Precision = 9
      Size = 2
    end
    object FMTBCDField9: TFMTBCDField
      FieldName = 'VGRIS'
      Precision = 9
      Size = 2
    end
    object FMTBCDField10: TFMTBCDField
      FieldName = 'VPEDAGIO'
      Precision = 9
      Size = 2
    end
    object FMTBCDField11: TFMTBCDField
      FieldName = 'VTAXA'
      Precision = 9
      Size = 2
    end
    object FMTBCDField12: TFMTBCDField
      FieldName = 'VTDE'
      Precision = 9
      Size = 2
    end
    object FMTBCDField13: TFMTBCDField
      FieldName = 'VPONTO'
      Precision = 9
      Size = 2
    end
    object FMTBCDField14: TFMTBCDField
      FieldName = 'VREENT'
      Precision = 9
      Size = 2
    end
    object FMTBCDField15: TFMTBCDField
      FieldName = 'VDEVOLUCAO'
      Precision = 9
      Size = 2
    end
    object FMTBCDField16: TFMTBCDField
      FieldName = 'VOUTROS'
      Precision = 9
      Size = 2
    end
    object FMTBCDField17: TFMTBCDField
      FieldName = 'VCOMBINA'
      Precision = 9
      Size = 2
    end
    object SmallintField7: TSmallintField
      FieldName = 'NPONTO'
    end
    object SmallintField8: TSmallintField
      FieldName = 'STATUS'
    end
    object IntegerField17: TIntegerField
      FieldName = 'CPNROMA'
    end
    object SmallintField9: TSmallintField
      FieldName = 'CPLOCAL'
    end
    object FMTBCDField18: TFMTBCDField
      FieldName = 'ICBASE'
      Precision = 9
      Size = 2
    end
    object FMTBCDField19: TFMTBCDField
      FieldName = 'ICALIQ'
      Precision = 9
      Size = 2
    end
    object FMTBCDField20: TFMTBCDField
      FieldName = 'ICVALOR'
      Precision = 9
      Size = 2
    end
  end
  object cdsPrTent: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrTent'
    Left = 528
    Top = 176
    object cdsPrTentLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsPrTentNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsPrTentQT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
    object cdsPrTentNROMAN: TIntegerField
      FieldName = 'NROMAN'
    end
    object cdsPrTentDT_OCOR: TSQLTimeStampField
      FieldName = 'DT_OCOR'
    end
    object cdsPrTentDT_ROMA: TDateField
      FieldName = 'DT_ROMA'
    end
    object cdsPrTentNUMOC: TSmallintField
      FieldName = 'NUMOC'
    end
  end
  object sdsPrTent: TSQLDataSet
    CommandText = 
      'select b.ligcli, b.NUMNF, count(*) as qt, MIN(b.nRoma) nroman, M' +
      'IN(b.DTOCOREN) dt_ocor, MIN(c.dtroma) dt_roma, min(b.nocorr) as ' +
      'numOc '#13#10'from TB_NFUNICA a, TB_NOTAF b, TB_ROMA c  '#13#10'where a.numn' +
      'ota = b.numnf and a.ligcli=b.LIGCLI  and b.NROMA=c.num and a.LIG' +
      'CLI=155'#13#10'and (a.dtCriada between '#39'2021-02-08'#39'  and '#39'2021-02-08'#39')' +
      ' '#13#10'and a.status=1  '#13#10'group by b.NUMNF, b.ligcli  '#13#10'order by b.NU' +
      'MNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 176
  end
  object dspPrTent: TDataSetProvider
    DataSet = sdsPrTent
    Left = 472
    Top = 176
  end
  object cdsRestD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRestD'
    Left = 528
    Top = 678
    object cdsRestDID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRestDNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsRestDLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRestDVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsRestDPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsRestDVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsRestDDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsRestDDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
    object cdsRestDNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
  end
  object dspRestD: TDataSetProvider
    DataSet = sdsRestD
    Left = 472
    Top = 678
  end
  object sdsRestD: TSQLDataSet
    CommandText = 
      'select first 100 distinct b.id, a.numnf, a.ligcli, a.valor, a.pe' +
      'so, a.volume, a.DTCRIA, a.docdest, a.numped from tb_notaf a, tb_' +
      'nfunica b'#13#10'where a.ligcli = b.LIGCLI and a.numnf = b.NUMNOTA '#13#10'a' +
      'nd b.webcopia = 5'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 416
    Top = 678
  end
  object cdsRetR1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRetR1'
    Left = 920
    Top = 254
    object cdsRetR1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRetR1NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsRetR1NOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsRetR1DTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsRetR1HRENT: TTimeField
      FieldName = 'HRENT'
    end
    object cdsRetR1LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsRetR1: TSQLDataSet
    CommandText = 
      'select id, numnf, nocorr, dtent, hrent, ligcli from tb_notaf whe' +
      're numnf = 30617'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 808
    Top = 254
  end
  object dspRetR1: TDataSetProvider
    DataSet = sdsRetR1
    Left = 864
    Top = 254
  end
  object cdsRetR2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRetR2'
    Left = 920
    Top = 318
    object cdsRetR2NUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsRetR2DTEV: TSQLTimeStampField
      FieldName = 'DTEV'
    end
    object cdsRetR2DESCR: TStringField
      FieldName = 'DESCR'
      Size = 35
    end
    object cdsRetR2LOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 12
    end
    object cdsRetR2NUMROMA: TIntegerField
      FieldName = 'NUMROMA'
    end
  end
  object sdsRetR2: TSQLDataSet
    CommandText = 
      'select a.numnota, a.DTEV, c.DESCR, b.Login, a.numroma '#13#10' from tb' +
      '_NFstatus a, TB_Usuarios b, TB_INTERNO c '#13#10' where a.LIGUSER = b.' +
      'ID and a.NUMEVENTO = c.CODINT and a.DTEV > CURRENT_DATE - 90 '#13#10' ' +
      'and a.NUMnota = 30617'#13#10' order by a.DTEV'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 808
    Top = 318
  end
  object dspRetR2: TDataSetProvider
    DataSet = sdsRetR2
    Left = 864
    Top = 318
  end
  object cdsWebS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWebS'
    Left = 920
    Top = 374
    object cdsWebSID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsWebSNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsWebSNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsWebSDTENT: TDateField
      FieldName = 'DTENT'
      DisplayFormat = 'dd/MMM/yyyy'
    end
    object cdsWebSHRENT: TTimeField
      FieldName = 'HRENT'
      DisplayFormat = 'HH:mm'
    end
    object cdsWebSNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsWebSOBS: TStringField
      FieldName = 'OBS'
      Size = 55
    end
    object cdsWebSSBAIXA: TStringField
      FieldName = 'SBAIXA'
      FixedChar = True
      Size = 23
    end
  end
  object sdsWebS: TSQLDataSet
    CommandText = 
      'select nf.ID, nf.NUMNF, clt.NOME,  nf.DTENT, nf.HRENT,  nf.NOCOR' +
      'R, nf.OBS,'#13#10' case baixa_orig when 11 then '#39'Alterou baixa Flaydel' +
      #39' when 13 then '#39'Alterou baixa Motorista'#39' else '#39'Outras'#39' END as SB' +
      'AIXA'#13#10' from TB_NOTAF nf, TB_CLIENTE clt '#13#10' where TB_NOTAF.LigCli' +
      ' = TB_CLIENTE.id and  baixa_orig >10 and nocorr>0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 808
    Top = 374
  end
  object dspWebS: TDataSetProvider
    DataSet = sdsWebS
    Left = 864
    Top = 374
  end
  object cdsErro1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspErro1'
    Left = 912
    Top = 438
    object cdsErro1STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsErro1QT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
    object cdsErro1SERRO: TStringField
      FieldName = 'SERRO'
      FixedChar = True
      Size = 17
    end
  end
  object sdsErro1: TSQLDataSet
    CommandText = 
      'select STATUS, count(*) as Qt, '#13#10'case status when 90 then '#39'Valor' +
      ' = zero'#39' when 91 then '#39'Valor acima 1000'#39' when 204 then '#39'Duplicad' +
      'o'#39' '#13#10'when 208 then '#39'CNPJ errado'#39' when 424 then '#39'C'#243'digo Mun errad' +
      'o'#39' when 238 then '#39'Data Atrasada'#39' else '#39'Erro desconhecido'#39' end as' +
      ' sErro '#13#10'from TB_CONHEC'#13#10'where (status > 20) and (datac >= '#39'2021' +
      '-06-01'#39' and datac <= '#39'2021-07-30'#39') '#13#10'group by status'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 800
    Top = 438
  end
  object dspErro1: TDataSetProvider
    DataSet = sdsErro1
    Left = 856
    Top = 438
  end
  object cdsErro2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspErro2'
    Left = 912
    Top = 502
    object cdsErro2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsErro2NUMC: TIntegerField
      FieldName = 'NUMC'
      DisplayFormat = '#,##0'
    end
    object cdsErro2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsErro2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsErro2NUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      DisplayFormat = '#,##0'
    end
    object cdsErro2BASE: TFMTBCDField
      FieldName = 'BASE'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsErro2LIGNOTA: TIntegerField
      FieldName = 'LIGNOTA'
    end
  end
  object sdsErro2: TSQLDataSet
    CommandText = 
      'select id, numc, STATUS, ligcli, numnota, base, lignota from TB_' +
      'CONHEC'#13#10'where (status > 20) and (datac >= '#39'2021-06-01'#39' and datac' +
      ' <= '#39'2021-07-30'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 800
    Top = 502
  end
  object dspErro2: TDataSetProvider
    DataSet = sdsErro2
    Left = 856
    Top = 502
  end
  object cdsErro3Esp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspErro3'
    Left = 912
    Top = 566
    object cdsErro3EspID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsErro3EspDCNPJ: TStringField
      FieldName = 'DCNPJ'
      Size = 18
    end
    object cdsErro3EspDIE: TStringField
      FieldName = 'DIE'
      Size = 18
    end
    object cdsErro3EspCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsErro3EspCODMUNICIPIO: TStringField
      FieldName = 'CODMUNICIPIO'
      Size = 7
    end
    object cdsErro3EspNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsErro3EspLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsErro3: TSQLDataSet
    CommandText = 
      'select id, dcnpj, die, cidade, codmunicipio, numnf, ligcli from ' +
      'TB_Notas order by id desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM4.ConectaCONH
    Left = 800
    Top = 566
  end
  object dspErro3: TDataSetProvider
    DataSet = sdsErro3
    Left = 856
    Top = 566
  end
  object cdsNFac: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFac'
    Left = 696
    Top = 630
    object cdsNFacENTRADA: TDateField
      FieldName = 'ENTRADA'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsNFacNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNFacVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFacVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsNFacPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsNFacNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsNFacRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
    end
    object cdsNFacCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsNFacLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsNFacNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsNFacOBS: TStringField
      FieldName = 'OBS'
      Size = 55
    end
    object cdsNFacNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsNFacDTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsNFacHRENT: TTimeField
      FieldName = 'HRENT'
    end
    object cdsNFacIDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsNFacVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object cdsNFacDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
  end
  object dspNFac: TDataSetProvider
    DataSet = sdsNfac
    Left = 640
    Top = 630
  end
  object sdsNfac: TSQLDataSet
    CommandText = 
      'SELECT first 20  a.DTCRIADA as Entrada, b.NUMNF, b.Valor, b.VOLU' +
      'ME, b.PESO, b.NOMEDEST, b.RECEBEDOR, b.CEP, b.LOCALI, b.NOCORR, ' +
      'b.obs, b.NROMA, b.DTENT, b.HRENT, b.id as idNF, b.VFRETE, b.DOCD' +
      'EST    FROM TB_NFUNICA a, TB_NOTAF b where (a.LIGCLI = b.LIGCLI ' +
      'and a.NUMNOTA=b.NUMNF) order by a.DTCRIADA desc, b.NUMNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 584
    Top = 630
  end
  object cdsCODi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCODi'
    Left = 696
    Top = 686
    object cdsCODiCODINT: TSmallintField
      FieldName = 'CODINT'
    end
    object cdsCODiDESCR: TStringField
      FieldName = 'DESCR'
      Size = 35
    end
  end
  object dspCODi: TDataSetProvider
    DataSet = sdsCODi
    Left = 640
    Top = 686
  end
  object sdsCODi: TSQLDataSet
    CommandText = 'SELECT * from TB_INTERNO order by CODINT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 584
    Top = 686
  end
  object cdsOCcli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOCcli'
    Left = 872
    Top = 686
    object cdsOCcliID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsOCcliLIGGRUPO: TIntegerField
      FieldName = 'LIGGRUPO'
    end
    object cdsOCcliTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsOCcliCODPAD: TSmallintField
      FieldName = 'CODPAD'
    end
    object cdsOCcliCODNOVO: TSmallintField
      FieldName = 'CODNOVO'
    end
  end
  object dspOCcli: TDataSetProvider
    DataSet = sdsOCcli
    Left = 816
    Top = 686
  end
  object sdsOCcli: TSQLDataSet
    CommandText = 'SELECT * from TB_CLIOC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 760
    Top = 686
  end
  object cdsRcli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRcli'
    Left = 128
    Top = 720
    object cdsRcliLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRcliNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsRcliQT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
  end
  object sdsRcli: TSQLDataSet
    CommandText = 
      'select ligcli, cli.NOME, count(*) as qt from TB_NOTAF nf, tb_cli' +
      'ente cli '#13#10'    where (cli.id = nf.ligcli) and (nRoma = 0 or nRom' +
      'a is Null)'#13#10'    and (LigRot = 0 or LigRot is Null)'#13#10'    group by' +
      ' ligcli, cli.nome'#13#10'    order by cli.nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 16
    Top = 720
  end
  object dspRcli: TDataSetProvider
    DataSet = sdsRcli
    Left = 72
    Top = 720
  end
end
