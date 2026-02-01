object DM4: TDM4
  OldCreateOrder = False
  Height = 851
  Width = 964
  object Conecta2: TSQLConnection
    ConnectionName = 'FBAVERB'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=localhost:F:\03Bancos\Flaydel\Padrao\DBAVERB.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'Trim Char=False')
    Left = 40
    Top = 16
  end
  object sdsAv1: TSQLDataSet
    CommandText = 'select * from TB_AVERB'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conecta2
    Left = 40
    Top = 72
  end
  object dspAv1: TDataSetProvider
    DataSet = sdsAv1
    Left = 104
    Top = 72
  end
  object cdsAv1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAv1'
    Left = 168
    Top = 72
    object cdsAv1ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAv1DESCR: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object cdsAv1TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object cdsAv1QUANT: TSmallintField
      FieldName = 'QUANT'
    end
  end
  object sdsTEMP: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conecta2
    Left = 40
    Top = 128
  end
  object dspTEMP: TDataSetProvider
    DataSet = sdsTEMP
    Left = 104
    Top = 128
  end
  object cdsTEMP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTEMP'
    Left = 168
    Top = 128
  end
  object sdsAv2: TSQLDataSet
    CommandText = 'select * from TB_MINUTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conecta2
    Left = 40
    Top = 184
  end
  object dspAv2: TDataSetProvider
    DataSet = sdsAv2
    Left = 104
    Top = 184
  end
  object cdsAv2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAv2'
    Left = 168
    Top = 184
    object cdsAv2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAv2MINDATA: TSQLTimeStampField
      FieldName = 'MINDATA'
    end
    object cdsAv2MINNUM: TIntegerField
      FieldName = 'MINNUM'
      DisplayFormat = '#,##0'
    end
    object cdsAv2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsAv2VLROUTRO: TFMTBCDField
      FieldName = 'VLROUTRO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsAv2SINISTRO: TSmallintField
      FieldName = 'SINISTRO'
    end
  end
  object sdsMin: TSQLDataSet
    CommandText = 
      'select dtRoma, Minuta, SUM(Valor) as Total, count(valor) as Nota' +
      's, NUM '#13#10'from Tb_Roma, Tb_NotaF'#13#10'where TB_Roma.num = TB_NOTAF.nR' +
      'oma'#13#10'Group by dtRoma, Minuta, NUM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 248
  end
  object dspMin: TDataSetProvider
    DataSet = sdsMin
    Left = 104
    Top = 248
  end
  object cdsMin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMin'
    Left = 160
    Top = 248
    object cdsMinDTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsMinMINUTA: TIntegerField
      FieldName = 'MINUTA'
      ReadOnly = True
    end
    object cdsMinTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsMinNOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
    object cdsMinNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
  end
  object sdsConh: TSQLDataSet
    CommandText = 'select * from TB_Conhec'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 304
  end
  object dspConh: TDataSetProvider
    DataSet = sdsConh
    Left = 104
    Top = 304
  end
  object cdsConh: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConh'
    Left = 160
    Top = 304
    object cdsConhID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConhDATAC: TDateField
      FieldName = 'DATAC'
    end
    object cdsConhNUMC: TIntegerField
      FieldName = 'NUMC'
      DisplayFormat = '#,##0'
    end
    object cdsConhFRETEPESO: TFMTBCDField
      FieldName = 'FRETEPESO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhFRETEVALOR: TFMTBCDField
      FieldName = 'FRETEVALOR'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhSECCAT: TFMTBCDField
      FieldName = 'SECCAT'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhDESPACHO: TFMTBCDField
      FieldName = 'DESPACHO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhPEDAGIO: TFMTBCDField
      FieldName = 'PEDAGIO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhBASE: TFMTBCDField
      FieldName = 'BASE'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhALIQ: TFMTBCDField
      FieldName = 'ALIQ'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhICMS: TFMTBCDField
      FieldName = 'ICMS'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsConhSTATUS_EDI: TSmallintField
      FieldName = 'STATUS_EDI'
    end
    object cdsConhLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsConhNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      DisplayFormat = '#,##0'
    end
    object cdsConhLIGNOTA: TIntegerField
      FieldName = 'LIGNOTA'
    end
    object cdsConhMOTNOME: TStringField
      FieldName = 'MOTNOME'
    end
    object cdsConhMOTPLACA: TStringField
      FieldName = 'MOTPLACA'
      Size = 9
    end
    object cdsConhMOTVEICULO: TStringField
      FieldName = 'MOTVEICULO'
    end
    object cdsConhLIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsConhSERIE: TSmallintField
      FieldName = 'SERIE'
    end
    object cdsConhSTATUSENVIO: TSmallintField
      FieldName = 'STATUSENVIO'
    end
    object cdsConhSTATUSIMP: TSmallintField
      FieldName = 'STATUSIMP'
    end
    object cdsConhARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 50
    end
    object cdsConhADICPESO: TFMTBCDField
      FieldName = 'ADICPESO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhGRIS: TFMTBCDField
      FieldName = 'GRIS'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhTXCTE: TFMTBCDField
      FieldName = 'TXCTE'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhTDE: TFMTBCDField
      FieldName = 'TDE'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhPONTO: TFMTBCDField
      FieldName = 'PONTO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhDEVOLUCAO: TFMTBCDField
      FieldName = 'DEVOLUCAO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsConhSEFAZAMB: TSmallintField
      FieldName = 'SEFAZAMB'
    end
    object cdsConhGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object cdsConhLIGDCOB: TIntegerField
      FieldName = 'LIGDCOB'
    end
  end
  object sdsPG1: TSQLDataSet
    CommandText = 'select * from TB_FUNC_PG1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 360
  end
  object dspPG1: TDataSetProvider
    DataSet = sdsPG1
    Left = 104
    Top = 360
  end
  object cdsPG1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPG1'
    Left = 160
    Top = 360
    object cdsPG1ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPG1LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPG1TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPG1INICIO: TSmallintField
      FieldName = 'INICIO'
    end
    object cdsPG1FIM: TSmallintField
      FieldName = 'FIM'
    end
    object cdsPG1VALORMOT: TFMTBCDField
      FieldName = 'VALORMOT'
      Precision = 9
      Size = 2
    end
    object cdsPG1VALORAJUD: TFMTBCDField
      FieldName = 'VALORAJUD'
      Precision = 9
      Size = 2
    end
  end
  object sdsPG2: TSQLDataSet
    CommandText = 'select * from TB_FUNC_PG2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 416
  end
  object dspPG2: TDataSetProvider
    DataSet = sdsPG2
    Left = 104
    Top = 416
  end
  object cdsPG2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPG2'
    Left = 160
    Top = 416
    object cdsPG2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPG2LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPG2TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPG2ACIMADE: TSmallintField
      FieldName = 'ACIMADE'
    end
    object cdsPG2VALORMOT: TFMTBCDField
      FieldName = 'VALORMOT'
      Precision = 9
      Size = 2
    end
    object cdsPG2VALORAJUD: TFMTBCDField
      FieldName = 'VALORAJUD'
      Precision = 9
      Size = 2
    end
    object cdsPG2NOTA_EXTRA: TFMTBCDField
      FieldName = 'NOTA_EXTRA'
      Precision = 9
      Size = 2
    end
  end
  object sdsCT: TSQLDataSet
    CommandText = 
      'select dtRoma, numnf, valor, nConh, TipoLocal, TB_NOTAF.id As id' +
      'Nota, CEP,  TB_NOTAF.LigCli, nRoma, nRoma - extract(YEAR from dt' +
      'Roma)* 1000000 as Romaneio, CteGrupo, Peso'#13#10'  from tb_notaf, TB_' +
      'ROMA '#13#10'where nRoma = num'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 480
  end
  object dspCT: TDataSetProvider
    DataSet = sdsCT
    Left = 104
    Top = 480
  end
  object cdsCT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCT'
    Left = 160
    Top = 480
    object cdsCTDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object cdsCTNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsCTVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCTNCONH: TIntegerField
      FieldName = 'NCONH'
    end
    object cdsCTTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsCTIDNOTA: TIntegerField
      FieldName = 'IDNOTA'
      Required = True
    end
    object cdsCTCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsCTLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCTNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsCTROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsCTCTEGRUPO: TIntegerField
      FieldName = 'CTEGRUPO'
    end
    object cdsCTPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
  end
  object ConectaCONH: TSQLConnection
    ConnectionName = 'FBESPELHO'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=localhost:F:\03Bancos\Flaydel\Padrao\DBESPELHO.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'Trim Char=False')
    Left = 136
    Top = 16
  end
  object sdsEspelho: TSQLDataSet
    CommandText = 'select * from TB_NOTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConectaCONH
    Left = 40
    Top = 544
  end
  object dspEspelho: TDataSetProvider
    DataSet = sdsEspelho
    Left = 104
    Top = 544
  end
  object cdsEspelho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEspelho'
    Left = 160
    Top = 544
    object cdsEspelhoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEspelhoNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsEspelhoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsEspelhoVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsEspelhoPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsEspelhoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsEspelhoLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsEspelhoTRANSP_NOME: TStringField
      FieldName = 'TRANSP_NOME'
      Size = 25
    end
    object cdsEspelhoTRANSP_CNPJ: TStringField
      FieldName = 'TRANSP_CNPJ'
      Size = 18
    end
    object cdsEspelhoRAZAOS: TStringField
      FieldName = 'RAZAOS'
      Size = 40
    end
    object cdsEspelhoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object cdsEspelhoNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsEspelhoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 15
    end
    object cdsEspelhoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsEspelhoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsEspelhoCODMUNICIPIO: TStringField
      FieldName = 'CODMUNICIPIO'
      Size = 7
    end
    object cdsEspelhoESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsEspelhoLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsEspelhoNUMCONHEC: TIntegerField
      FieldName = 'NUMCONHEC'
    end
    object cdsEspelhoDCNPJ: TStringField
      FieldName = 'DCNPJ'
      Size = 18
    end
    object cdsEspelhoDIE: TStringField
      FieldName = 'DIE'
      Size = 18
    end
    object cdsEspelhoCHAVENFE: TStringField
      FieldName = 'CHAVENFE'
      Size = 50
    end
  end
  object sdsCarro: TSQLDataSet
    CommandText = 
      'select TB_Funcs.ID,Veiculo , NOME, chvalidade,Placa, ano, dtFich' +
      'a  from TB_funcs, TB_Funccar'#13#10'where TB_FUNCS.id = TB_FUNCCAR.LIG' +
      'FUNC'#13#10'and UPPER(veiculo) like '#39'%OM%'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 72
  end
  object dspCarro: TDataSetProvider
    DataSet = sdsCarro
    Left = 288
    Top = 72
  end
  object cdsCarro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarro'
    Left = 344
    Top = 72
    object cdsCarroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCarroVEICULO: TStringField
      FieldName = 'VEICULO'
      Size = 15
    end
    object cdsCarroNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCarroCHVALIDADE: TSQLTimeStampField
      FieldName = 'CHVALIDADE'
    end
    object cdsCarroPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object cdsCarroANO: TSmallintField
      FieldName = 'ANO'
    end
    object cdsCarroDTFICHA: TSQLTimeStampField
      FieldName = 'DTFICHA'
    end
  end
  object sdsTKpq: TSQLDataSet
    CommandText = 
      'select TB_NOTAF.id, nRoma, TB_ROMA.num -extract(YEAR from dtRoma' +
      ')* 1000000 as Romaneio, dtRoma, numnf, valor, nome from TB_ROMA,' +
      ' TB_NOTAF, TB_FUNCS '#13#10'where (TB_NOTAF.nRoma = TB_ROMA.num)'#13#10'and ' +
      '(TB_ROMA.LIGMOT = TB_FUNCS.ID)'#13#10'and (STATUS_TKT <> 1)'#13#10'and NOCOR' +
      'R IN (Select num from Tb_OCORRE where uso < 2)'#13#10'and ligcli = 1'#13#10 +
      'and dtRoma between '#39'2011-08-10'#39' and '#39'2011-09-20'#39#13#10'Order by dtRom' +
      'a, Nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 136
  end
  object dspTKpq: TDataSetProvider
    DataSet = sdsTKpq
    Left = 288
    Top = 136
  end
  object cdsTKpq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTKpq'
    Left = 344
    Top = 136
    object cdsTKpqID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTKpqNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsTKpqROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsTKpqDTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsTKpqNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsTKpqVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '#,##0,00'
      Precision = 18
      Size = 2
    end
    object cdsTKpqNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
  end
  object sdsCol: TSQLDataSet
    CommandText = 
      'select TB_Notaf.id as idNF, dtRoma, nRoma,TB_ROMA.num -extract(Y' +
      'EAR from dtRoma)* 1000000 as Romaneio, numnf, Valor, Nome, TB_NO' +
      'TAF.obs, TB_NOTAF.STATUS_DEV '#13#10'from  TB_Notaf, TB_ROMA left join' +
      ' TB_FUNCS on TB_FUNCS.id = TB_ROMA.LIGMOT'#13#10'WHERE TB_NOTAF.nRoma ' +
      '= TB_ROMA.num '#13#10'and TB_NOTAF.status_dev between 7 and 8'#13#10'order b' +
      'y dtRoma desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 200
  end
  object dspCol: TDataSetProvider
    DataSet = sdsCol
    Left = 288
    Top = 200
  end
  object cdsCol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCol'
    Left = 344
    Top = 200
    object cdsColIDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsColDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsColNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsColROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsColNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
    end
    object cdsColVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsColNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsColOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 55
    end
    object cdsColSTATUS_DEV: TSmallintField
      FieldName = 'STATUS_DEV'
      ReadOnly = True
    end
  end
  object sdsCol2: TSQLDataSet
    CommandText = 
      'Select TB_NOTAF.id as idNF, NumCOL, NumNF, Valor, RECCDATA, '#13#10'ca' +
      'se status_dev when 12 then '#39'Coleta Incompleta'#39' else RECCNOME END' +
      ' as NomeR, '#13#10'NUMRC, obs '#13#10'from TB_VOLTAC, TB_Notaf '#13#10'where numCO' +
      'L = TB_VOLTAC.id '#13#10'order by numCOL desc, TB_NOTAF.NUMNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 264
  end
  object dspCol2: TDataSetProvider
    DataSet = sdsCol2
    Left = 288
    Top = 264
  end
  object cdsCol2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCol2'
    Left = 344
    Top = 264
    object cdsCol2IDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsCol2NUMCOL: TIntegerField
      FieldName = 'NUMCOL'
    end
    object cdsCol2NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsCol2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsCol2RECCDATA: TSQLTimeStampField
      FieldName = 'RECCDATA'
    end
    object cdsCol2NOMER: TStringField
      FieldName = 'NOMER'
      ReadOnly = True
      Size = 25
    end
    object cdsCol2NUMRC: TIntegerField
      FieldName = 'NUMRC'
      ReadOnly = True
    end
    object cdsCol2OBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 55
    end
  end
  object sdsGerGM: TSQLDataSet
    CommandText = 
      'select dtRoma, num ,TB_ROMA.num -extract(YEAR from dtRoma)* 1000' +
      '000 as Romaneio, SUM(VFrete) as Receita, VPag as Despesa, SUM(VF' +
      'rete) - Vpag as Lucro, COUNT(TB_Notaf.id) as Notas,'#13#10'100*(SUM(VF' +
      'rete) - Vpag)/(SUM(VFrete)) as Porcento'#13#10'from  TB_Notaf, TB_ROMA' +
      ' '#13#10'WHERE TB_NOTAF.nRoma = TB_ROMA.num '#13#10'GROUP BY dtRoma, num, vP' +
      'ag'#13#10'Order by NUM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 320
  end
  object dspGerGM: TDataSetProvider
    DataSet = sdsGerGM
    Left = 288
    Top = 320
  end
  object cdsGerGM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGerGM'
    Left = 344
    Top = 320
    object cdsGerGMDTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsGerGMNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsGerGMROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsGerGMRECEITA: TFMTBCDField
      FieldName = 'RECEITA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGerGMDESPESA: TFMTBCDField
      FieldName = 'DESPESA'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object cdsGerGMLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGerGMNOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
    object cdsGerGMPORCENTO: TFMTBCDField
      FieldName = 'PORCENTO'
      ReadOnly = True
      DisplayFormat = '#,##0.0'
      Precision = 18
    end
  end
  object sdsCred: TSQLDataSet
    CommandText = 'Select * from TB_CRED'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 376
  end
  object dspCred: TDataSetProvider
    DataSet = sdsCred
    Left = 288
    Top = 376
  end
  object cdsCred: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCred'
    Left = 344
    Top = 376
    object cdsCredID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCredDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsCredTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsCredDESCR: TStringField
      FieldName = 'DESCR'
    end
    object cdsCredPAGO: TSmallintField
      FieldName = 'PAGO'
    end
    object cdsCredLIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsCredVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 9
      Size = 2
    end
  end
  object sdsPlote: TSQLDataSet
    CommandText = 'Select * from TB_PAGLOTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 432
  end
  object dspPlote: TDataSetProvider
    DataSet = sdsPlote
    Left = 288
    Top = 432
  end
  object cdsPlote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlote'
    Left = 344
    Top = 432
    object cdsPloteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPloteDESCR: TStringField
      FieldName = 'DESCR'
      Size = 35
    end
    object cdsPloteDATACRIA: TSQLTimeStampField
      FieldName = 'DATACRIA'
    end
    object cdsPloteQUANT: TSmallintField
      FieldName = 'QUANT'
    end
    object cdsPloteVTOTAL: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
  end
  object sdsServ: TSQLDataSet
    CommandText = 
      'select dtRoma, NUM, TB_ROMA.NUM -extract(YEAR from dtRoma)* 1000' +
      '000 as Romaneio, servico  '#13#10'from TB_ROMA, TB_CLICOB'#13#10'WHERE TB_RO' +
      'MA.EXTRANUM = TB_CLICOB.id and'#13#10' TB_ROMA.EXTRANUM > 0'#13#10' order by' +
      ' dtRoma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 480
  end
  object dspServ: TDataSetProvider
    DataSet = sdsServ
    Left = 288
    Top = 480
  end
  object cdsServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServ'
    Left = 344
    Top = 480
    object cdsServDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy, ddd'
    end
    object cdsServNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsServROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsServSERVICO: TStringField
      FieldName = 'SERVICO'
      ReadOnly = True
      Size = 12
    end
  end
  object sdsPG4: TSQLDataSet
    CommandText = 'SELECT * FROM TB_FUNC_PG4'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 136
  end
  object dspPG4: TDataSetProvider
    DataSet = sdsPG4
    Left = 480
    Top = 136
  end
  object cdsPG4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPG4'
    Left = 536
    Top = 136
    object cdsPG4ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPG4LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPG4TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPG4MINIMO: TFMTBCDField
      FieldName = 'MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsPG4VLR_ACIMA: TSingleField
      FieldName = 'VLR_ACIMA'
    end
  end
  object sdsPG3: TSQLDataSet
    CommandText = 'SELECT * FROM TB_FUNC_PG3'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 80
  end
  object dspPG3: TDataSetProvider
    DataSet = sdsPG3
    Left = 480
    Top = 80
  end
  object cdsPG3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPG3'
    Left = 536
    Top = 80
    object cdsPG3ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPG3LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPG3TIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsPG3INICIO: TSmallintField
      FieldName = 'INICIO'
    end
    object cdsPG3FIM: TSmallintField
      FieldName = 'FIM'
    end
    object cdsPG3VCOB: TFMTBCDField
      FieldName = 'VCOB'
      Precision = 9
      Size = 2
    end
    object cdsPG3VPAG: TFMTBCDField
      FieldName = 'VPAG'
      Precision = 9
      Size = 2
    end
  end
  object sdsCar: TSQLDataSet
    CommandText = 'select * from TB_CARRO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 200
  end
  object dspCar: TDataSetProvider
    DataSet = sdsCar
    Left = 480
    Top = 200
  end
  object cdsCar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCar'
    Left = 536
    Top = 200
    object cdsCarID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCarTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object cdsCarPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsCarCHASSI: TStringField
      FieldName = 'CHASSI'
    end
    object cdsCarCODLIBERA: TStringField
      FieldName = 'CODLIBERA'
      Size = 12
    end
  end
  object sdsPQcar: TSQLDataSet
    CommandText = 
      'select NUM, dtRoma,  tipo, placa, VPag,sum(vfrete) as frete, '#13#10's' +
      'um(vfrete) - VPag as lucro,  '#39'sem'#39' as Nome,'#13#10'num - CAST(num / 10' +
      '00000 AS INTEGER)* 1000000 as Romaneio'#13#10'from Tb_NOTAF, TB_ROMA, ' +
      'TB_CARRO'#13#10'where TB_ROMA.NUM = TB_NOTAF.nroma '#13#10'and TB_ROMA.LIGCA' +
      'RF = TB_CARRO.id'#13#10'group by NUM, dtRoma, tipo, placa, Vpag'#13#10'order' +
      ' by dtRoma'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 264
  end
  object dspPQcar: TDataSetProvider
    DataSet = sdsPQcar
    Left = 480
    Top = 264
  end
  object cdsPQcar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPQcar'
    Left = 536
    Top = 264
    object cdsPQcarNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsPQcarDTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsPQcarFRETE: TFMTBCDField
      FieldName = 'FRETE'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPQcarTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 15
    end
    object cdsPQcarPLACA: TStringField
      FieldName = 'PLACA'
      ReadOnly = True
      Size = 10
    end
    object cdsPQcarVPAG: TFMTBCDField
      FieldName = 'VPAG'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPQcarROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsPQcarLUCRO: TFMTBCDField
      FieldName = 'LUCRO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPQcarNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object sdsAgenda: TSQLDataSet
    CommandText = 'select * from TB_AGENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 320
  end
  object dspAgenda: TDataSetProvider
    DataSet = sdsAgenda
    Left = 480
    Top = 320
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgenda'
    Left = 536
    Top = 320
    object cdsAgendaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAgendaDIA: TDateField
      FieldName = 'DIA'
    end
    object cdsAgendaDESCR: TStringField
      FieldName = 'DESCR'
      Size = 80
    end
    object cdsAgendaVALORPREV: TFMTBCDField
      FieldName = 'VALORPREV'
      Precision = 9
      Size = 2
    end
    object cdsAgendaSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsAgendaREPETIR_FLAG: TSmallintField
      FieldName = 'REPETIR_FLAG'
    end
    object cdsAgendaREPETIR_VEZES: TSmallintField
      FieldName = 'REPETIR_VEZES'
    end
    object cdsAgendaREPETIR_TIPO: TSmallintField
      FieldName = 'REPETIR_TIPO'
    end
    object cdsAgendaAVISO_DIAS: TSmallintField
      FieldName = 'AVISO_DIAS'
    end
  end
  object sdsAviso: TSQLDataSet
    CommandText = 'select * from TB_AVISO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 376
  end
  object dspAviso: TDataSetProvider
    DataSet = sdsAviso
    Left = 480
    Top = 376
  end
  object cdsAviso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAviso'
    Left = 536
    Top = 376
    object cdsAvisoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAvisoLIGAG: TIntegerField
      FieldName = 'LIGAG'
    end
    object cdsAvisoDT: TDateField
      FieldName = 'DT'
    end
    object cdsAvisoPARTE: TSmallintField
      FieldName = 'PARTE'
    end
    object cdsAvisoSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
  end
  object sdsPQav: TSQLDataSet
    CommandText = 
      'select ag.ID as idAg, av.id as idAV, av.DT, ag.DESCR, av.PARTE, ' +
      ' ag.valorPrev,  '#13#10'case av.Status when 0 then '#39'n'#227'o lido'#39' when 1 t' +
      'hen '#39'lido'#39' when 2 then '#39'finalizado'#39' when 3 then '#39'cancelado'#39' end ' +
      'as avST '#13#10'from TB_AGENDA ag, TB_AVISO av '#13#10'where av.LIGAG = ag.i' +
      'd'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 432
  end
  object dspPQav: TDataSetProvider
    DataSet = sdsPQav
    Left = 480
    Top = 432
  end
  object cdsPQav: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPQav'
    Left = 536
    Top = 432
    object cdsPQavIDAG: TIntegerField
      FieldName = 'IDAG'
      Required = True
    end
    object cdsPQavIDAV: TIntegerField
      FieldName = 'IDAV'
      Required = True
    end
    object cdsPQavDT: TDateField
      FieldName = 'DT'
      DisplayFormat = 'dd/MM/yyyy, ddd'
    end
    object cdsPQavDESCR: TStringField
      FieldName = 'DESCR'
      Size = 80
    end
    object cdsPQavPARTE: TSmallintField
      FieldName = 'PARTE'
    end
    object cdsPQavVALORPREV: TFMTBCDField
      FieldName = 'VALORPREV'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPQavAVST: TStringField
      FieldName = 'AVST'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
  end
  object sdsMin2: TSQLDataSet
    CommandText = 
      'select dtRoma, Minuta, NUM, num - CAsT(num / 1000000 AS INTEGER)' +
      '* 1000000 as Romaneio, Nome, CPF, TB_FUNCCAR.PLACA, TB_CARRO.PLA' +
      'CA as PlacaF,TB_FUNCCAR.CODLIBERA,  TB_CARRO.CODLIBERA as CODLIB' +
      'ERAF '#13#10' from tb_roma left join TB_CARRO ON TB_CARRO.ID = TB_ROMA' +
      '.LIGCARF, TB_FUNCS left join TB_FUNCCAR on TB_FUNCS.ID = TB_FUNC' +
      'CAR.LIGFUNC '#13#10' where TB_FUNCS.id = TB_ROMA.LIGMOT '#13#10' and dtRoma ' +
      'between '#39'2013-01-01'#39' and '#39'2013-01-04'#39#13#10' order by TB_ROMA.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 480
  end
  object dspMin2: TDataSetProvider
    DataSet = sdsMin2
    Left = 488
    Top = 480
  end
  object cdsMin2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMin2'
    Left = 544
    Top = 480
    object cdsMin2DTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsMin2MINUTA: TIntegerField
      FieldName = 'MINUTA'
    end
    object cdsMin2NUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsMin2ROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsMin2NOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsMin2CPF: TStringField
      FieldName = 'CPF'
      ReadOnly = True
      Size = 14
    end
    object cdsMin2PLACA: TStringField
      FieldName = 'PLACA'
      ReadOnly = True
      Size = 8
    end
    object cdsMin2PLACAF: TStringField
      FieldName = 'PLACAF'
      ReadOnly = True
      Size = 10
    end
    object cdsMin2CODLIBERA: TStringField
      FieldName = 'CODLIBERA'
      Size = 12
    end
    object cdsMin2CODLIBERAF: TStringField
      FieldName = 'CODLIBERAF'
      Size = 12
    end
  end
  object sdsWEBc: TSQLDataSet
    CommandText = 
      'select nf.id, ro.dtRoma, nf.numNF, ro.num - CAST(ro.num / 100000' +
      '0 AS INTEGER)* 1000000 as Romaneio,  nf.valor, nf.DTENT, nf.HREN' +
      'T, nf.status_ent, nf.NOCORR, ro.LIGMOT, nf.DOCDEST, nf.Baixa_Ori' +
      'g, nf.flag_geral '#13#10'from tb_notaf nf, TB_ROMA ro'#13#10'where nf.NROMA ' +
      '= ro.NUM'#13#10'and nf.status_ent > 0'#13#10'order by ro.dtRoma, nf.numNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 544
  end
  object dspWEBc: TDataSetProvider
    DataSet = sdsWEBc
    Left = 288
    Top = 544
  end
  object cdsWEBc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWEBc'
    Left = 344
    Top = 544
    object cdsWEBcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsWEBcDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy, ddd'
    end
    object cdsWEBcNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsWEBcROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsWEBcVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsWEBcDTENT: TDateField
      FieldName = 'DTENT'
      ReadOnly = True
      DisplayFormat = 'dd/MM/yyyy, ddd'
    end
    object cdsWEBcHRENT: TTimeField
      FieldName = 'HRENT'
      ReadOnly = True
      DisplayFormat = 'hh:mm'
    end
    object cdsWEBcSTATUS_ENT: TSmallintField
      FieldName = 'STATUS_ENT'
      ReadOnly = True
    end
    object cdsWEBcNOCORR: TSmallintField
      FieldName = 'NOCORR'
      ReadOnly = True
    end
    object cdsWEBcLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
      ReadOnly = True
    end
    object cdsWEBcDOCDEST: TStringField
      FieldName = 'DOCDEST'
      ReadOnly = True
      Size = 18
    end
    object cdsWEBcBAIXA_ORIG: TSmallintField
      FieldName = 'BAIXA_ORIG'
    end
    object cdsWEBcFLAG_GERAL: TSmallintField
      FieldName = 'FLAG_GERAL'
    end
  end
  object sdsAvisoM: TSQLDataSet
    CommandText = 
      'select av.ID, av.DT, ag.DESCR, av.PARTE, av.dt-ag.AVISO_DIAS as ' +
      'aviso, ag.ValorPrev'#13#10'from tb_aviso av, TB_AGENDA ag'#13#10'where ag.id' +
      ' = av.LIGAG'#13#10'and av.dt-ag.AVISO_DIAS <= Current_date'#13#10'and av.STA' +
      'TUS < 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 544
  end
  object dspAvisoM: TDataSetProvider
    DataSet = sdsAvisoM
    Left = 480
    Top = 544
  end
  object cdsAvisoM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAvisoM'
    Left = 536
    Top = 544
    object cdsAvisoMID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAvisoMDT: TDateField
      FieldName = 'DT'
      DisplayFormat = 'dd/MMM/yyyy, ddd'
    end
    object cdsAvisoMDESCR: TStringField
      FieldName = 'DESCR'
      Size = 80
    end
    object cdsAvisoMPARTE: TSmallintField
      FieldName = 'PARTE'
    end
    object cdsAvisoMAVISO: TDateField
      FieldName = 'AVISO'
      ReadOnly = True
    end
    object cdsAvisoMVALORPREV: TFMTBCDField
      FieldName = 'VALORPREV'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
  end
  object sdsNFre: TSQLDataSet
    CommandText = 
      'select TB_NOTAF.id as idNF, TB_NOTAF.NUMNF, TB_NOTAF.PESO, TB_NO' +
      'TAF.VALOR, TB_NOTAF.CONTAREENT,'#13#10'TB_ROMA.dtRoma, TB_CLIENTE.NOME' +
      ' '#13#10'from TB_NOTAF, TB_ROMA, TB_CLIENTE'#13#10'WHERE TB_NOTAF.NROMA = TB' +
      '_ROMA.NUM'#13#10'and TB_NOTAF.LIGCLI = TB_CLIENTE.id'#13#10'and TB_NOTAF.CON' +
      'TAREENT > 1'#13#10'order by contareent desc, NUMNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 80
  end
  object dspNFre: TDataSetProvider
    DataSet = sdsNFre
    Left = 654
    Top = 80
  end
  object cdsNFre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFre'
    Left = 710
    Top = 80
    object cdsNFreIDNF: TIntegerField
      FieldName = 'IDNF'
      Required = True
    end
    object cdsNFreNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNFrePESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsNFreVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFreCONTAREENT: TSmallintField
      FieldName = 'CONTAREENT'
    end
    object cdsNFreDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy, ddd'
    end
    object cdsNFreNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object sdsNFre2: TSQLDataSet
    CommandText = 
      'select contareent, COUNT(*)  as Qt'#13#10'from TB_NOTAF, TB_ROMA'#13#10'WHER' +
      'E TB_NOTAF.NROMA = TB_ROMA.NUM'#13#10'and contareent >1'#13#10'group BY cont' +
      'areent'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 136
  end
  object dspNFre2: TDataSetProvider
    DataSet = sdsNFre2
    Left = 654
    Top = 136
  end
  object cdsNFre2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFre2'
    Left = 710
    Top = 136
    object cdsNFre2CONTAREENT: TSmallintField
      FieldName = 'CONTAREENT'
      ReadOnly = True
    end
    object cdsNFre2QT: TIntegerField
      FieldName = 'QT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsTKc: TSQLDataSet
    CommandText = 
      'select status_tkt, count(*) as conta '#13#10'from Tb_notaf, tb_roma'#13#10'w' +
      'here TB_ROMA.num=TB_NOTAF.nRoma'#13#10'and dtRoma = '#39'2012-07-20'#39' and L' +
      'igcli=1'#13#10'group by status_tkt'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 200
  end
  object dspTKc: TDataSetProvider
    DataSet = sdsTKc
    Left = 654
    Top = 200
  end
  object cdsTKc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTKc'
    Left = 710
    Top = 200
    object cdsTKcSTATUS_TKT: TSmallintField
      FieldName = 'STATUS_TKT'
      ReadOnly = True
    end
    object cdsTKcCONTA: TIntegerField
      FieldName = 'CONTA'
      ReadOnly = True
      Required = True
    end
  end
  object sdsTKm: TSQLDataSet
    CommandText = 
      'select dtRoma, TB_ROMA.NUM -extract(YEAR from dtRoma)* 1000000 a' +
      's Romaneio, num, numnf, obs, Status_tkt'#13#10'from Tb_notaf, tb_roma'#13 +
      #10'where TB_ROMA.num=TB_NOTAF.nRoma'#13#10'and dtRoma = '#39'2012-07-20'#39' and' +
      ' Ligcli=1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 264
  end
  object dspTKm: TDataSetProvider
    DataSet = sdsTKm
    Left = 654
    Top = 264
  end
  object cdsTKm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTKm'
    Left = 710
    Top = 264
    object cdsTKmDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/MM/yyyy, ddd'
    end
    object cdsTKmROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsTKmNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsTKmNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsTKmOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 55
    end
    object cdsTKmSTATUS_TKT: TSmallintField
      FieldName = 'STATUS_TKT'
      ReadOnly = True
    end
  end
  object sdsTKd: TSQLDataSet
    CommandText = 
      'select dtTKT, TB_ROMA.NUM -extract(YEAR from dtRoma)* 1000000 as' +
      ' Romaneio, num, numnf, obs, Status_tkt'#13#10'from Tb_notaf, tb_roma'#13#10 +
      'where TB_ROMA.num=TB_NOTAF.nRoma'#13#10'and dtRoma = '#39'2012-07-20'#39' and ' +
      'Ligcli=1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 320
  end
  object dspTKd: TDataSetProvider
    DataSet = sdsTKd
    Left = 654
    Top = 320
  end
  object cdsTKd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTKd'
    Left = 710
    Top = 320
    object cdsTKdDTTKT: TDateField
      FieldName = 'DTTKT'
    end
    object cdsTKdROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsTKdNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsTKdNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
    end
    object cdsTKdOBS: TStringField
      FieldName = 'OBS'
      ReadOnly = True
      Size = 55
    end
    object cdsTKdSTATUS_TKT: TSmallintField
      FieldName = 'STATUS_TKT'
      ReadOnly = True
    end
  end
  object sdsCteP: TSQLDataSet
    CommandText = 'select * from TB_Transp'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 376
  end
  object dspCTeP: TDataSetProvider
    DataSet = sdsCteP
    Left = 654
    Top = 376
  end
  object cdsCteP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCTeP'
    Left = 710
    Top = 376
    object cdsCtePID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCtePRAZAOS: TStringField
      FieldName = 'RAZAOS'
      Size = 50
    end
    object cdsCtePCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsCtePRNTRC: TStringField
      FieldName = 'RNTRC'
      Size = 10
    end
    object cdsCtePIE: TStringField
      FieldName = 'IE'
      Size = 12
    end
    object cdsCtePTELS: TStringField
      FieldName = 'TELS'
      Size = 24
    end
    object cdsCtePFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object cdsCtePPASTAXML: TStringField
      FieldName = 'PASTAXML'
      Size = 50
    end
    object cdsCtePPASTAPDF: TStringField
      FieldName = 'PASTAPDF'
      Size = 50
    end
    object cdsCtePPREDOM: TStringField
      FieldName = 'PREDOM'
      Size = 25
    end
    object cdsCtePMEDIDAUNID: TStringField
      FieldName = 'MEDIDAUNID'
      Size = 15
    end
    object cdsCtePMEDIDATIPO: TStringField
      FieldName = 'MEDIDATIPO'
      Size = 15
    end
    object cdsCtePAMBIENTE: TSmallintField
      FieldName = 'AMBIENTE'
    end
    object cdsCtePIMPOSTO: TSmallintField
      FieldName = 'IMPOSTO'
    end
    object cdsCtePSERIE: TSmallintField
      FieldName = 'SERIE'
    end
    object cdsCtePSALARIO_AJUD: TFMTBCDField
      FieldName = 'SALARIO_AJUD'
      Precision = 9
      Size = 2
    end
    object cdsCtePPMOTNOME: TStringField
      FieldName = 'PMOTNOME'
    end
    object cdsCtePPMOTPLACA: TStringField
      FieldName = 'PMOTPLACA'
      Size = 9
    end
    object cdsCtePPMOTVEICULO: TStringField
      FieldName = 'PMOTVEICULO'
    end
  end
  object sdsCtePe: TSQLDataSet
    CommandText = 'select * from TB_TranspEnder'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 432
  end
  object dspCtePe: TDataSetProvider
    DataSet = sdsCtePe
    Left = 654
    Top = 432
  end
  object cdsCtePe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtePe'
    Left = 710
    Top = 432
    object cdsCtePeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCtePeENDER: TStringField
      FieldName = 'ENDER'
      Size = 50
    end
    object cdsCtePeNUMERO: TSmallintField
      FieldName = 'NUMERO'
    end
    object cdsCtePeCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 10
    end
    object cdsCtePeBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object cdsCtePeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsCtePeESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsCtePeCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsCtePeLIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsCtePeCODMUN: TStringField
      FieldName = 'CODMUN'
      Size = 10
    end
  end
  object sdsCteG: TSQLDataSet
    CommandText = 
      'select a.id, datac, numc, base, numNota, LigNota, a.LigCli, Stat' +
      'usEnvio, StatusImp, Arquivo, a.LigTransp, b.dtEnt, a.Status '#13#10'fr' +
      'om TB_CONHEC a, TB_NOTAF b'#13#10'WHERE (a.LigNota = b.id)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 480
  end
  object dspCteG: TDataSetProvider
    DataSet = sdsCteG
    Left = 654
    Top = 480
  end
  object cdsCteG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCteG'
    Left = 710
    Top = 488
    object cdsCteGID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCteGDATAC: TDateField
      FieldName = 'DATAC'
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsCteGNUMC: TIntegerField
      FieldName = 'NUMC'
      DisplayFormat = '#,##0'
    end
    object cdsCteGBASE: TFMTBCDField
      FieldName = 'BASE'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsCteGNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
      DisplayFormat = '#,##0'
    end
    object cdsCteGLIGNOTA: TIntegerField
      FieldName = 'LIGNOTA'
    end
    object cdsCteGLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCteGSTATUSENVIO: TSmallintField
      FieldName = 'STATUSENVIO'
    end
    object cdsCteGSTATUSIMP: TSmallintField
      FieldName = 'STATUSIMP'
    end
    object cdsCteGARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 50
    end
    object cdsCteGLIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsCteGDTENT: TDateField
      FieldName = 'DTENT'
      DisplayFormat = 'dd/MM/yy ddd'
    end
    object cdsCteGSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
  end
  object sdsSCob: TSQLDataSet
    CommandText = 
      'select dtRoma, numnf, nocorr, TB_ocorre.DESCR '#13#10'from TB_NOTAF, T' +
      'B_ROMA, TB_OCORRE'#13#10'where TB_NOTAF.nRoma = TB_ROMA.Num  and TB_OC' +
      'ORRE.num = nocorr and nocorr > 0 and uso <3'#13#10'order by dtRoma des' +
      'c'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 544
  end
  object dspSCob: TDataSetProvider
    DataSet = sdsSCob
    Left = 654
    Top = 544
  end
  object cdsSCob: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSCob'
    Left = 710
    Top = 544
    object cdsSCobDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsSCobNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsSCobNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsSCobDESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
  end
  object sdsNFalt: TSQLDataSet
    CommandText = 'Select * from TB_NOTAF_ALT'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 38
    Top = 600
  end
  object dspNFalt: TDataSetProvider
    DataSet = sdsNFalt
    Left = 94
    Top = 600
  end
  object cdsNFalt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFalt'
    Left = 158
    Top = 600
    object cdsNFaltID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNFaltLIGNOTA: TIntegerField
      FieldName = 'LIGNOTA'
    end
    object cdsNFaltAFRETEPESO: TFMTBCDField
      FieldName = 'AFRETEPESO'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAADIC: TFMTBCDField
      FieldName = 'AADIC'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAADVALOR: TFMTBCDField
      FieldName = 'AADVALOR'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAGRIS: TFMTBCDField
      FieldName = 'AGRIS'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAPEDAGIO: TFMTBCDField
      FieldName = 'APEDAGIO'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAEMISSAO: TFMTBCDField
      FieldName = 'AEMISSAO'
      Precision = 9
      Size = 2
    end
    object cdsNFaltATDE: TFMTBCDField
      FieldName = 'ATDE'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAQTPONTOS: TSmallintField
      FieldName = 'AQTPONTOS'
    end
    object cdsNFaltAVPONTOS: TFMTBCDField
      FieldName = 'AVPONTOS'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAREENT: TFMTBCDField
      FieldName = 'AREENT'
      Precision = 9
      Size = 2
    end
    object cdsNFaltADEVOL: TFMTBCDField
      FieldName = 'ADEVOL'
      Precision = 9
      Size = 2
    end
    object cdsNFaltAOUTROS: TFMTBCDField
      FieldName = 'AOUTROS'
      Precision = 9
      Size = 2
    end
    object cdsNFaltATXICMS: TIntegerField
      FieldName = 'ATXICMS'
    end
  end
  object sdsTr: TSQLDataSet
    CommandText = 
      'select TB_NOTAF.id, numnf, valor, fantasia, ligtransp, TB_NOTAF.' +
      'cep, CteGrupo '#13#10'from TB_NOTAF LEFT JOIN TB_Transp'#13#10'ON ligtransp ' +
      '= TB_TRANSP.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 600
  end
  object dspTr: TDataSetProvider
    DataSet = sdsTr
    Left = 296
    Top = 600
  end
  object cdsTr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTr'
    Left = 352
    Top = 600
    object cdsTrID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTrNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '0,000'
    end
    object cdsTrVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsTrFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object cdsTrLIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsTrCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsTrCTEGRUPO: TIntegerField
      FieldName = 'CTEGRUPO'
    end
  end
  object sdsMot: TSQLDataSet
    CommandText = 
      'Select nome,cpf, rg, segvalidade, chvalidade, id, ativo '#13#10'from t' +
      'b_funcs '#13#10'where tipo = 1'#13#10'order by segvalidade'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 422
    Top = 600
  end
  object dspMot: TDataSetProvider
    DataSet = sdsMot
    Left = 478
    Top = 600
  end
  object cdsMot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMot'
    Left = 534
    Top = 600
    object cdsMotNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsMotCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsMotRG: TStringField
      FieldName = 'RG'
      Size = 14
    end
    object cdsMotSEGVALIDADE: TDateField
      FieldName = 'SEGVALIDADE'
    end
    object cdsMotCHVALIDADE: TSQLTimeStampField
      FieldName = 'CHVALIDADE'
    end
    object cdsMotID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMotATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object sdsPagG: TSQLDataSet
    CommandText = 'select * from TB_PAGGRUPO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 80
  end
  object dspPagG: TDataSetProvider
    DataSet = sdsPagG
    Left = 830
    Top = 80
  end
  object cdsPagG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagG'
    Left = 886
    Top = 80
    object cdsPagGID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPagGANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsPagGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object cdsPagGVCALC: TFMTBCDField
      FieldName = 'VCALC'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagGVPAG: TFMTBCDField
      FieldName = 'VPAG'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagGDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object cdsPagGDTFIM: TDateField
      FieldName = 'DTFIM'
    end
  end
  object sdsPagI: TSQLDataSet
    CommandText = 
      'Select TB_PAGDETALHES.*, TB_FUNCS.Nome, TB_FUNCS.ID as idF from ' +
      'TB_PAGDETALHES, TB_FUNCS'#13#10'WHERE TB_Funcs.id = TB_PAGDETALHES.LIG' +
      'PAG'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 136
  end
  object dspPagI: TDataSetProvider
    DataSet = sdsPagI
    Left = 830
    Top = 136
  end
  object cdsPagI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagI'
    Left = 886
    Top = 136
    object cdsPagIID: TIntegerField
      FieldName = 'ID'
    end
    object cdsPagILIGPAG: TIntegerField
      FieldName = 'LIGPAG'
    end
    object cdsPagIVSERVICO: TFMTBCDField
      FieldName = 'VSERVICO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagIVCREDITOS: TFMTBCDField
      FieldName = 'VCREDITOS'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagIVVALES: TFMTBCDField
      FieldName = 'VVALES'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagIVCALCF: TFMTBCDField
      FieldName = 'VCALCF'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagIVCALCM: TFMTBCDField
      FieldName = 'VCALCM'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagIVPAGO: TFMTBCDField
      FieldName = 'VPAGO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsPagIMODO: TStringField
      FieldName = 'MODO'
      Size = 10
    end
    object cdsPagIBANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object cdsPagICONTA: TStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object cdsPagILIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPagIDTPAGM: TSQLTimeStampField
      FieldName = 'DTPAGM'
    end
    object cdsPagINOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsPagIIDF: TIntegerField
      FieldName = 'IDF'
      Required = True
    end
  end
  object sdsPagI2: TSQLDataSet
    CommandText = 'Select * from TB_PAGDETALHES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 200
  end
  object dspPagI2: TDataSetProvider
    DataSet = sdsPagI2
    Left = 830
    Top = 200
  end
  object cdsPagI2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagI2'
    Left = 886
    Top = 200
    object cdsPagI2ID: TIntegerField
      FieldName = 'ID'
    end
    object cdsPagI2LIGPAG: TIntegerField
      FieldName = 'LIGPAG'
    end
    object cdsPagI2VSERVICO: TFMTBCDField
      FieldName = 'VSERVICO'
      Precision = 9
      Size = 2
    end
    object cdsPagI2VCREDITOS: TFMTBCDField
      FieldName = 'VCREDITOS'
      Precision = 9
      Size = 2
    end
    object cdsPagI2VVALES: TFMTBCDField
      FieldName = 'VVALES'
      Precision = 9
      Size = 2
    end
    object cdsPagI2VCALCF: TFMTBCDField
      FieldName = 'VCALCF'
      Precision = 9
      Size = 2
    end
    object cdsPagI2VCALCM: TFMTBCDField
      FieldName = 'VCALCM'
      Precision = 9
      Size = 2
    end
    object cdsPagI2VPAGO: TFMTBCDField
      FieldName = 'VPAGO'
      Precision = 9
      Size = 2
    end
    object cdsPagI2MODO: TStringField
      FieldName = 'MODO'
      Size = 10
    end
    object cdsPagI2BANCO: TStringField
      FieldName = 'BANCO'
      Size = 10
    end
    object cdsPagI2CONTA: TStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object cdsPagI2LIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsPagI2DTPAGM: TSQLTimeStampField
      FieldName = 'DTPAGM'
    end
  end
  object sdsGR: TSQLDataSet
    CommandText = 'Select id, NomeG From TB_CLIGRUPO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 264
  end
  object dspGR: TDataSetProvider
    DataSet = sdsGR
    Left = 830
    Top = 264
  end
  object cdsGR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGR'
    Left = 886
    Top = 264
    object cdsGRID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGRNOMEG: TStringField
      FieldName = 'NOMEG'
      Size = 25
    end
  end
  object sdsGRcli: TSQLDataSet
    CommandText = 'Select id, Nome, LigGrupo, CNPJ from TB_CLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 320
  end
  object dspGRcli: TDataSetProvider
    DataSet = sdsGRcli
    Left = 830
    Top = 320
  end
  object cdsGRcli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGRcli'
    Left = 886
    Top = 320
    object cdsGRcliID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGRcliNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsGRcliLIGGRUPO: TIntegerField
      FieldName = 'LIGGRUPO'
    end
    object cdsGRcliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
  end
  object sdsCot: TSQLDataSet
    CommandText = 'Select * from TB_COTACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 376
  end
  object dspCot: TDataSetProvider
    DataSet = sdsCot
    Left = 830
    Top = 376
  end
  object cdsCot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCot'
    Left = 886
    Top = 376
    object cdsCotID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCotLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCotDTCOT: TDateField
      FieldName = 'DTCOT'
    end
    object cdsCotNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsCotVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCotVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsCotPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsCotCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsCotMED1: TFMTBCDField
      FieldName = 'MED1'
      Precision = 9
      Size = 1
    end
    object cdsCotMED2: TFMTBCDField
      FieldName = 'MED2'
      Precision = 9
      Size = 1
    end
    object cdsCotMED3: TFMTBCDField
      FieldName = 'MED3'
      Precision = 9
      Size = 1
    end
    object cdsCotVLRCOT: TFMTBCDField
      FieldName = 'VLRCOT'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsCotSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsCotNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsCotEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object cdsCotOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object cdsCotDESTNOME: TStringField
      FieldName = 'DESTNOME'
    end
    object cdsCotDESTCNPJ: TStringField
      FieldName = 'DESTCNPJ'
    end
    object cdsCotLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsCotDTSERV: TDateField
      FieldName = 'DTSERV'
      DisplayFormat = 'dd/MMM ddd'
    end
  end
  object sdsStokC: TSQLDataSet
    CommandText = 
      'Select c.ID as idC, c.NOME '#13#10'from TB_CLIENTE c'#13#10'Where c.ARMAZENA' +
      'GEM = 1'#13#10'order by c.NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 432
  end
  object dspStokC: TDataSetProvider
    DataSet = sdsStokC
    Left = 830
    Top = 432
  end
  object cdsStokC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStokC'
    Left = 886
    Top = 432
    object cdsStokCIDC: TIntegerField
      FieldName = 'IDC'
      Required = True
    end
    object cdsStokCNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object sdsNum1: TSQLDataSet
    CommandText = 
      'select cli.NOME, count(nf.id) as Notas, sum(vfrete) as Frete, cl' +
      'i.id  '#13#10'from TB_NOTAF nf, TB_ROMA ro, TB_CLIENTE cli '#13#10'where (nf' +
      '.nRoma=ro.num)'#13#10'and (cli.id = nf.LIGCLI)'#13#10'and dtRoma = '#39'2012-11-' +
      '04'#39' '#13#10'and cob_ok = 1'#13#10'group by cli.nome, cli.id'#13#10'order by cli.No' +
      'me'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 488
  end
  object dspNum1: TDataSetProvider
    DataSet = sdsNum1
    Left = 830
    Top = 488
  end
  object cdsNum1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNum1'
    Left = 886
    Top = 488
    object cdsNum1NOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsNum1NOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
      DisplayFormat = '#,##0'
    end
    object cdsNum1FRETE: TFMTBCDField
      FieldName = 'FRETE'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNum1ID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
  end
  object sdsPesq: TSQLDataSet
    CommandText = 
      'select ro.dtRoma, ro.num -extract(YEAR from ro.dtRoma)* 1000000 ' +
      'as Romaneio , '#13#10'case TB_NOTAF.STATUS_ENT when 1 then '#39'Ok'#39' when 2' +
      ' then TB_NOTAF.Obs else '#39'-'#39' END as Entregue,'#13#10'numnf, valor, volu' +
      'me, peso, vFrete,'#13#10'case origem when 2 then '#39'Coleta'#39'  ELSE '#39'Nota ' +
      'Fiscal'#39' end as DOC,'#13#10' nf.id as idNF, dtEnt, nomeDest, CEP, Local' +
      'i, TipoLocal'#13#10'from TB_NOTAF nf , TB_ROMA ro '#13#10'where nf.NROMA = r' +
      'o.NUM '#13#10'and ro.DTROMA between '#39'2012-10-02'#39' and '#39'2012-10-20'#39#13#10'and' +
      ' nf.LIGCLI = 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 544
  end
  object dspPesq: TDataSetProvider
    DataSet = sdsPesq
    Left = 830
    Top = 544
  end
  object cdsPesq: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspPesq'
    AfterScroll = cdsPesqAfterScroll
    Left = 886
    Top = 544
    object cdsPesqDTROMA: TDateField
      FieldName = 'DTROMA'
      DisplayFormat = 'dd/mmm, ddd'
    end
    object cdsPesqROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsPesqENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      ReadOnly = True
      Size = 55
    end
    object cdsPesqNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsPesqVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPesqVOLUME: TIntegerField
      FieldName = 'VOLUME'
      ReadOnly = True
    end
    object cdsPesqPESO: TFMTBCDField
      FieldName = 'PESO'
      ReadOnly = True
      DisplayFormat = '#,##0.0'
      Precision = 9
      Size = 2
    end
    object cdsPesqVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPesqDOC: TStringField
      FieldName = 'DOC'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object cdsPesqIDNF: TIntegerField
      FieldName = 'IDNF'
      ReadOnly = True
      Required = True
    end
    object cdsPesqDTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsPesqNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsPesqCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPesqLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsPesqTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
  end
  object sdsStokD: TSQLDataSet
    CommandText = 'select * from TB_STOK_CONTRATO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 600
  end
  object dspStokD: TDataSetProvider
    DataSet = sdsStokD
    Left = 654
    Top = 600
  end
  object cdsStokD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStokD'
    Left = 710
    Top = 600
    object cdsStokDID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStokDLIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsStokDDTCAD: TSQLTimeStampField
      FieldName = 'DTCAD'
    end
    object cdsStokDDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object cdsStokDDTFIM: TDateField
      FieldName = 'DTFIM'
    end
    object cdsStokDLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsStokDARM_FATURAPORC: TFMTBCDField
      FieldName = 'ARM_FATURAPORC'
      Precision = 9
      Size = 2
    end
    object cdsStokDARM_FATURAMIN: TFMTBCDField
      FieldName = 'ARM_FATURAMIN'
      Precision = 9
      Size = 2
    end
    object cdsStokDARM_AREAVALOR: TFMTBCDField
      FieldName = 'ARM_AREAVALOR'
      Precision = 9
      Size = 2
    end
    object cdsStokDARM_AREAEXCEDE: TFMTBCDField
      FieldName = 'ARM_AREAEXCEDE'
      Precision = 9
      Size = 2
    end
    object cdsStokDARM_AREALIMITE: TFMTBCDField
      FieldName = 'ARM_AREALIMITE'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_FATURAPORC: TFMTBCDField
      FieldName = 'MOV_FATURAPORC'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_FATURAMIN_ENT: TFMTBCDField
      FieldName = 'MOV_FATURAMIN_ENT'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_FATURAMIN_SAI: TFMTBCDField
      FieldName = 'MOV_FATURAMIN_SAI'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_DIVERSO_ENTNORMAIL_VLR: TFMTBCDField
      FieldName = 'MOV_DIVERSO_ENTNORMAIL_VLR'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_DIVERSO_ENTDEVOL_VLR: TFMTBCDField
      FieldName = 'MOV_DIVERSO_ENTDEVOL_VLR'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_DIVERSO_ENTNORMAIL_FLG: TSmallintField
      FieldName = 'MOV_DIVERSO_ENTNORMAIL_FLG'
    end
    object cdsStokDMOV_DIVERSO_ENTDEVOL_FLG: TSmallintField
      FieldName = 'MOV_DIVERSO_ENTDEVOL_FLG'
    end
    object cdsStokDSEG_TAXA: TFMTBCDField
      FieldName = 'SEG_TAXA'
      Precision = 9
      Size = 3
    end
    object cdsStokDSEG_MINIMO: TFMTBCDField
      FieldName = 'SEG_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsStokDSEG_DIA: TDateField
      FieldName = 'SEG_DIA'
    end
    object cdsStokDESPECIAL_MINIMO: TFMTBCDField
      FieldName = 'ESPECIAL_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsStokDARM_FLG: TSmallintField
      FieldName = 'ARM_FLG'
    end
    object cdsStokDMOV_FLG: TSmallintField
      FieldName = 'MOV_FLG'
    end
    object cdsStokDCONTRATO_STATUS: TSmallintField
      FieldName = 'CONTRATO_STATUS'
    end
    object cdsStokDMOV_DIVERSO_SAIDA_VLR: TFMTBCDField
      FieldName = 'MOV_DIVERSO_SAIDA_VLR'
      Precision = 9
      Size = 2
    end
    object cdsStokDMOV_DIVERSO_SAIDA_FLAG: TSmallintField
      FieldName = 'MOV_DIVERSO_SAIDA_FLAG'
    end
  end
  object sdsG1: TSQLDataSet
    CommandText = 
      'Select extract(YEAR from dtRoma) AS ANO,extract(MONTH from dtRom' +
      'a) AS MES,  count(id) as Romaneios, Sum(vpag) as Pago, Sum(vpag)' +
      '/count(id) as media'#13#10'from TB_ROMA'#13#10'group by extract(YEAR from dt' +
      'Roma),extract(MONTH from dtRoma)'#13#10'Order by  extract(YEAR from dt' +
      'Roma) desc, extract(MONTH from dtRoma)  desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 648
  end
  object dspG1: TDataSetProvider
    DataSet = sdsG1
    Left = 104
    Top = 648
  end
  object cdsG1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspG1'
    Left = 160
    Top = 648
    object cdsG1ANO: TSmallintField
      FieldName = 'ANO'
      ReadOnly = True
    end
    object cdsG1MES: TSmallintField
      FieldName = 'MES'
      ReadOnly = True
    end
    object cdsG1ROMANEIOS: TIntegerField
      FieldName = 'ROMANEIOS'
      ReadOnly = True
      Required = True
    end
    object cdsG1PAGO: TFMTBCDField
      FieldName = 'PAGO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsG1MEDIA: TFMTBCDField
      FieldName = 'MEDIA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object sdsG2: TSQLDataSet
    CommandText = 
      'Select extract(MONTH from dtRoma) AS MES,  count(id) as Romaneio' +
      's, Sum(vpag) as Pago, Sum(vpag)/count(id) as media from TB_ROMA'#13 +
      #10'Where extract(YEAR from dtRoma) = 2012'#13#10'group by extract(MONTH ' +
      'from dtRoma)'#13#10'Order by  extract(MONTH from dtRoma)  ASC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 696
  end
  object dspG2: TDataSetProvider
    DataSet = sdsG2
    Left = 104
    Top = 696
  end
  object cdsG2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspG2'
    Left = 160
    Top = 696
    object cdsG2MES: TSmallintField
      FieldName = 'MES'
      ReadOnly = True
    end
    object cdsG2ROMANEIOS: TIntegerField
      FieldName = 'ROMANEIOS'
      ReadOnly = True
      Required = True
    end
    object cdsG2PAGO: TFMTBCDField
      FieldName = 'PAGO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsG2MEDIA: TFMTBCDField
      FieldName = 'MEDIA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object sdsG3: TSQLDataSet
    CommandText = 
      'Select extract(MONTH from dtRoma) AS MES,  count(TB_NOTAF.id) as' +
      ' Notas, Sum(vpag) as Pago, Sum(vfrete) As Recebido, Sum(vfrete)/' +
      'count(TB_NOTAF.id) as Media from TB_ROMA, TB_NOTAF'#13#10'Where (TB_RO' +
      'MA.NUM = TB_NOTAF.nRoma) and (extract(YEAR from dtRoma) = 2012)'#13 +
      #10'group by extract(MONTH from dtRoma)'#13#10'Order by  extract(MONTH fr' +
      'om dtRoma)  ASC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 648
  end
  object dspG3: TDataSetProvider
    DataSet = sdsG3
    Left = 296
    Top = 648
  end
  object cdsG3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspG3'
    Left = 352
    Top = 648
    object cdsG3MES: TSmallintField
      FieldName = 'MES'
      ReadOnly = True
    end
    object cdsG3NOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
    object cdsG3PAGO: TFMTBCDField
      FieldName = 'PAGO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsG3RECEBIDO: TFMTBCDField
      FieldName = 'RECEBIDO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsG3MEDIA: TFMTBCDField
      FieldName = 'MEDIA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object sdsG4: TSQLDataSet
    CommandText = 
      'Select First 10 dtRoma, TB_OCORRE.USO, Count(*)    '#13#10'from TB_ROM' +
      'A, TB_NOTAF, TB_OCORRE'#13#10'WHERE (TB_ROMA.NUM = TB_NOTAF.nRoma) and' +
      ' (TB_OCORRE.NUM = TB_NOTAF.NOCORR)'#13#10'group by dtRoma, TB_OCORRE.U' +
      'SO '#13#10'Order by  dtRoma  DESC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 696
  end
  object dspG4: TDataSetProvider
    DataSet = sdsG4
    Left = 296
    Top = 696
  end
  object cdsG4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspG4'
    Left = 352
    Top = 696
    object cdsG4DTROMA: TDateField
      FieldName = 'DTROMA'
      ReadOnly = True
    end
    object cdsG4USO: TIntegerField
      FieldName = 'USO'
      ReadOnly = True
    end
    object cdsG4COUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsNFp: TSQLDataSet
    CommandText = 
      'select nf.id, nf.numnf,   nf.DTNOTA,  nf.locali, nf.CEP, nf.OBS,' +
      ' c.nome, nf.nroma, nf.ligcli, nf.nomedest, flag_imp, fonedest, n' +
      'f.peso, nf.dtcria'#13#10' from tb_notaf nf, TB_CLIENTE c '#13#10'where nf.LI' +
      'GCLI = c.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 600
  end
  object dspNFp: TDataSetProvider
    DataSet = sdsNFp
    Left = 830
    Top = 600
  end
  object cdsNFp: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspNFp'
    AfterScroll = cdsNFpAfterScroll
    Left = 886
    Top = 600
    object cdsNFpID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFpNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNFpDTNOTA: TDateField
      FieldName = 'DTNOTA'
      DisplayFormat = 'dd/MMM ddd'
    end
    object cdsNFpLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsNFpCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsNFpOBS: TStringField
      FieldName = 'OBS'
      Size = 55
    end
    object cdsNFpNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsNFpNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsNFpLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFpNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsNFpFLAG_IMP: TSmallintField
      FieldName = 'FLAG_IMP'
    end
    object cdsNFpFONEDEST: TStringField
      FieldName = 'FONEDEST'
      Size = 16
    end
    object cdsNFpPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsNFpDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
      DisplayFormat = 'dd/MM/yyyy ddd, HH:mm'
    end
  end
  object sdsOrig: TSQLDataSet
    CommandText = 
      'select cli.NOME, count(nf.id) as Notas, '#13#10'case origem when 1 the' +
      'n '#39'Manual'#39' when 2 then '#39'Coleta'#39' when 3 then '#39'EDI'#39' when 4 then '#39'R' +
      'eentrega'#39' when 5 then '#39'XML'#39' else '#39'N'#227'o Marcada'#39' end as Orig    '#13#10 +
      'from TB_NOTAF nf, TB_CLIENTE cli '#13#10'where (cli.id = nf.LIGCLI)'#13#10'a' +
      'nd nf.DTNOTA = '#39'2012-04-04'#39' '#13#10'group by cli.nome, origem'#13#10'order b' +
      'y cli.Nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 656
  end
  object dspOrig: TDataSetProvider
    DataSet = sdsOrig
    Left = 830
    Top = 656
  end
  object cdsOrig: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspOrig'
    Left = 886
    Top = 656
    object cdsOrigNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 40
    end
    object cdsOrigNOTAS: TIntegerField
      FieldName = 'NOTAS'
      ReadOnly = True
      Required = True
    end
    object cdsOrigORIG: TStringField
      FieldName = 'ORIG'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
  end
  object sdsEC: TSQLDataSet
    CommandText = 
      'select n.ligcli,  count(*) as quant from TB_Notaf n'#13#10'where nroma' +
      ' > 0 and ligcli > 0 '#13#10'and nocorr = 1'#13#10'and  dtnota = '#39'2012-02-02'#39 +
      #13#10'group by n.LigCli'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 422
    Top = 648
  end
  object dspEC: TDataSetProvider
    DataSet = sdsEC
    Left = 478
    Top = 648
  end
  object cdsEC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEC'
    Left = 534
    Top = 648
    object cdsECLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
      ReadOnly = True
    end
    object cdsECQUANT: TIntegerField
      FieldName = 'QUANT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsEM: TSQLDataSet
    CommandText = 
      'select r.ligmot as mot, count(*) as quant from  TB_Roma r'#13#10'where' +
      '  r.DTROMA = '#39'2012-02-02'#39' '#13#10'group by r.ligmot'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 422
    Top = 696
  end
  object dspEM: TDataSetProvider
    DataSet = sdsEM
    Left = 478
    Top = 696
  end
  object cdsEM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEM'
    Left = 534
    Top = 696
    object cdsEMMOT: TIntegerField
      FieldName = 'MOT'
      ReadOnly = True
    end
    object cdsEMQUANT: TIntegerField
      FieldName = 'QUANT'
      ReadOnly = True
      Required = True
    end
  end
  object sdsNFo: TSQLDataSet
    CommandText = 
      'select nf.id, nf.NUMNF, nf.ENTREGUE, nf.STATUS_ENT, nf.NOCORR, n' +
      'f.DTENT, nf.HRENT, ho.DESCR, nf.DTCRIA, nf.nRoma, nf.dtOcoren, n' +
      'f.cep, nf.Recebedor '#13#10'from tb_NOTAF nf, TB_OCORRE ho '#13#10'Where nf.' +
      'NOCORR = ho.NUM and  nf.status_ent > 0'#13#10'and nf.ligcli = 1'#13#10'ORDER' +
      ' BY nf.NUMNF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 648
  end
  object dspNFo: TDataSetProvider
    DataSet = sdsNFo
    Left = 654
    Top = 648
  end
  object cdsNFo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFo'
    Left = 710
    Top = 648
    object cdsNFoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFoNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFoENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 3
    end
    object cdsNFoSTATUS_ENT: TSmallintField
      FieldName = 'STATUS_ENT'
    end
    object cdsNFoNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsNFoDTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsNFoHRENT: TTimeField
      FieldName = 'HRENT'
    end
    object cdsNFoDESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
    object cdsNFoDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsNFoNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsNFoDTOCOREN: TSQLTimeStampField
      FieldName = 'DTOCOREN'
    end
    object cdsNFoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsNFoRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
    end
  end
  object sdsED: TSQLDataSet
    CommandText = 
      'select numnf, ligcli as Cliente, MIN(dtcria) as Cria, MAX(dtent)' +
      ' as Entrega, MAX(dtent)-MIN(CAST(dtcria as DATE)) as Dias,  EXTR' +
      'ACT(WEEKDAY FROM dtcria) as dia1, EXTRACT(WEEKDAY FROM dtent) as' +
      ' dia2   from TB_Notaf'#13#10'where dtcria >= '#39'2016-05-01'#39#13#10'group by nu' +
      'mnf, ligcli, dtcria, dtent'#13#10'order by numnf'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 598
    Top = 696
  end
  object dspED: TDataSetProvider
    DataSet = sdsED
    Left = 654
    Top = 696
  end
  object cdsED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspED'
    Left = 710
    Top = 696
    object cdsEDNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
    end
    object cdsEDCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object cdsEDCRIA: TSQLTimeStampField
      FieldName = 'CRIA'
      ReadOnly = True
    end
    object cdsEDENTREGA: TDateField
      FieldName = 'ENTREGA'
      ReadOnly = True
    end
    object cdsEDDIAS: TIntegerField
      FieldName = 'DIAS'
      ReadOnly = True
    end
    object cdsEDDIA1: TSmallintField
      FieldName = 'DIA1'
      ReadOnly = True
    end
    object cdsEDDIA2: TSmallintField
      FieldName = 'DIA2'
      ReadOnly = True
    end
  end
  object sdsNFa: TSQLDataSet
    CommandText = 'select LigCli, NumNOta, NumEvento FROM TB_NFStatus'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 774
    Top = 696
  end
  object dspNFa: TDataSetProvider
    DataSet = sdsNFa
    Left = 830
    Top = 696
  end
  object cdsNFa: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspNFa'
    Left = 886
    Top = 696
    object cdsNFaLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsNFaNUMEVENTO: TSmallintField
      FieldName = 'NUMEVENTO'
    end
  end
  object sdsSMS: TSQLDataSet
    CommandText = 
      'select x.id, y.NOME, x.numnf, x.valor, x.fonedest, x.NUMPED,'#13#10'CA' +
      'SE when x.ENVIASMS =1  then '#39'Enviado'#39' Else '#39'N'#227'o Enviado'#39' end as ' +
      'Status, EnviaSMS'#13#10'FROM TB_Notaf x , TB_CLIENTE y, TB_ROMA z'#13#10'whe' +
      're (x.LIGCLI = y.id) and (z.num = x.NROMA)'#13#10'and not(x.fonedest i' +
      's null)  '#13#10'and z.DTROMA = '#39'2017-06-22'#39#13#10'and y.USA_SMS = 1'#13#10'and x' +
      '.ENVIASMS = 0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 752
  end
  object dspSMS: TDataSetProvider
    DataSet = sdsSMS
    Left = 104
    Top = 752
  end
  object cdsSMS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSMS'
    Left = 160
    Top = 752
    object cdsSMSID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSMSNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsSMSNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsSMSVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsSMSFONEDEST: TStringField
      FieldName = 'FONEDEST'
      Size = 16
    end
    object cdsSMSSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object cdsSMSENVIASMS: TSmallintField
      FieldName = 'ENVIASMS'
      ReadOnly = True
    end
    object cdsSMSNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
  end
  object sdsPrazo: TSQLDataSet
    CommandText = 
      'select a.numnf, COUNT(*) as qt, MIN(CAST(a.dtcria as DATE)) as D' +
      'Timporta, '#13#10'MIN(a.dtnota) as DTnota, MAX(a.dtent) as DTentrega,M' +
      'AX(a.dtent)-MIN(CAST(a.dtcria as DATE)) as diasT, '#13#10'MAX(a.dtent)' +
      '-MIN(a.dtNota) as diasC, MAX(a.id) as idNF, min(a.nocorr) as nOc' +
      'or, MAX (a.DIASENT) as DIASG'#13#10'from tb_notaf a, TB_OCORRE b'#13#10'wher' +
      'e  a.ligcli=106 '#13#10'and a.dtcria > '#39'2017-07-31'#39#13#10'group by a.numnf'#13 +
      #10'having MIN(a.nocorr) > 0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 726
    Top = 33
  end
  object dspPrazo: TDataSetProvider
    DataSet = sdsPrazo
    Left = 782
    Top = 33
  end
  object cdsPrazo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrazo'
    Left = 840
    Top = 32
    object cdsPrazoNUMNF: TIntegerField
      FieldName = 'NUMNF'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsPrazoQT: TIntegerField
      FieldName = 'QT'
      ReadOnly = True
      Required = True
    end
    object cdsPrazoDTIMPORTA: TDateField
      FieldName = 'DTIMPORTA'
      ReadOnly = True
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsPrazoDTNOTA: TDateField
      FieldName = 'DTNOTA'
      ReadOnly = True
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsPrazoDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
      ReadOnly = True
      DisplayFormat = 'dd/MM/yyyy ddd'
    end
    object cdsPrazoDIAST: TIntegerField
      FieldName = 'DIAST'
      ReadOnly = True
    end
    object cdsPrazoDIASC: TIntegerField
      FieldName = 'DIASC'
      ReadOnly = True
    end
    object cdsPrazoIDNF: TIntegerField
      FieldName = 'IDNF'
      ReadOnly = True
    end
    object cdsPrazoNOCOR: TSmallintField
      FieldName = 'NOCOR'
      ReadOnly = True
    end
    object cdsPrazoDIASG: TSmallintField
      FieldName = 'DIASG'
      ReadOnly = True
    end
  end
  object sdsGrupo: TSQLDataSet
    CommandText = 
      'Select id, ligcli,  numnf, valor, peso, volume FROM Tb_Notaf WHE' +
      'RE ctegrupo = 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 232
    Top = 760
  end
  object dspGrupo: TDataSetProvider
    DataSet = sdsGrupo
    Left = 296
    Top = 760
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 352
    Top = 760
    object cdsGrupoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsGrupoLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsGrupoNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsGrupoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsGrupoPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsGrupoVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
  end
  object sdsConh2: TSQLDataSet
    CommandText = 
      'select a.*, b.DTENT from TB_Conhec a, TB_Notaf b where a.LIGNOTA' +
      '=b.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 424
    Top = 760
  end
  object dspConh2: TDataSetProvider
    DataSet = sdsConh2
    Left = 480
    Top = 760
  end
  object cdsConh2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConh2'
    Left = 536
    Top = 760
    object cdsConh2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConh2DATAC: TDateField
      FieldName = 'DATAC'
    end
    object cdsConh2NUMC: TIntegerField
      FieldName = 'NUMC'
    end
    object cdsConh2FRETEPESO: TFMTBCDField
      FieldName = 'FRETEPESO'
      Precision = 9
      Size = 2
    end
    object cdsConh2FRETEVALOR: TFMTBCDField
      FieldName = 'FRETEVALOR'
      Precision = 9
      Size = 2
    end
    object cdsConh2SECCAT: TFMTBCDField
      FieldName = 'SECCAT'
      Precision = 9
      Size = 2
    end
    object cdsConh2DESPACHO: TFMTBCDField
      FieldName = 'DESPACHO'
      Precision = 9
      Size = 2
    end
    object cdsConh2PEDAGIO: TFMTBCDField
      FieldName = 'PEDAGIO'
      Precision = 9
      Size = 2
    end
    object cdsConh2OUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Precision = 9
      Size = 2
    end
    object cdsConh2TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsConh2BASE: TFMTBCDField
      FieldName = 'BASE'
      Precision = 9
      Size = 2
    end
    object cdsConh2ALIQ: TFMTBCDField
      FieldName = 'ALIQ'
      Precision = 9
      Size = 2
    end
    object cdsConh2ICMS: TFMTBCDField
      FieldName = 'ICMS'
      Precision = 9
      Size = 2
    end
    object cdsConh2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsConh2STATUS_EDI: TSmallintField
      FieldName = 'STATUS_EDI'
    end
    object cdsConh2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsConh2NUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsConh2LIGNOTA: TIntegerField
      FieldName = 'LIGNOTA'
    end
    object cdsConh2MOTNOME: TStringField
      FieldName = 'MOTNOME'
    end
    object cdsConh2MOTPLACA: TStringField
      FieldName = 'MOTPLACA'
      Size = 9
    end
    object cdsConh2MOTVEICULO: TStringField
      FieldName = 'MOTVEICULO'
    end
    object cdsConh2LIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsConh2SERIE: TSmallintField
      FieldName = 'SERIE'
    end
    object cdsConh2STATUSENVIO: TSmallintField
      FieldName = 'STATUSENVIO'
    end
    object cdsConh2STATUSIMP: TSmallintField
      FieldName = 'STATUSIMP'
    end
    object cdsConh2ARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 50
    end
    object cdsConh2ADICPESO: TFMTBCDField
      FieldName = 'ADICPESO'
      Precision = 9
      Size = 2
    end
    object cdsConh2GRIS: TFMTBCDField
      FieldName = 'GRIS'
      Precision = 9
      Size = 2
    end
    object cdsConh2TXCTE: TFMTBCDField
      FieldName = 'TXCTE'
      Precision = 9
      Size = 2
    end
    object cdsConh2TDE: TFMTBCDField
      FieldName = 'TDE'
      Precision = 9
      Size = 2
    end
    object cdsConh2PONTO: TFMTBCDField
      FieldName = 'PONTO'
      Precision = 9
      Size = 2
    end
    object cdsConh2DEVOLUCAO: TFMTBCDField
      FieldName = 'DEVOLUCAO'
      Precision = 9
      Size = 2
    end
    object cdsConh2SEFAZAMB: TSmallintField
      FieldName = 'SEFAZAMB'
    end
    object cdsConh2GRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object cdsConh2LIGDCOB: TIntegerField
      FieldName = 'LIGDCOB'
    end
    object cdsConh2DTENT: TDateField
      FieldName = 'DTENT'
    end
  end
  object sdsCTng: TSQLDataSet
    CommandText = 
      'select a.ligcli, b.NOME, COUNT(*) as qt from TB_NOTAF a, TB_CLIE' +
      'NTE b where (a.LIGCLI = b.id)  and a.NCONH = 0 '#13#10' and  (dtcria >' +
      ' CURRENT_DATE - 120)'#13#10' and ligcli in (select id from TB_Cliente ' +
      'where CTEEMITE=1)'#13#10' and (not (nocorr in (select num from tb_ocor' +
      're where uso=3)))'#13#10' group by a.ligCli, b.Nome'#13#10' order by b.Nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 592
    Top = 760
  end
  object dspCTng: TDataSetProvider
    DataSet = sdsCTng
    Left = 648
    Top = 760
  end
  object cdsCTng: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCTng'
    Left = 704
    Top = 760
    object cdsCTngLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCTngNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCTngQT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
  end
  object sdsCTne: TSQLDataSet
    CommandText = 
      'select a.ligcli, b.NOME, COUNT(*) as QT from TB_CONHEC a, TB_CLI' +
      'ENTE b, TB_NOTAF c  where (a.LIGCLI = b.id) and (a.LIGNOTA = c.i' +
      'd)  and (statusenvio < 4)'#13#10' and  (c.DTENT > CURRENT_DATE - 120)'#13 +
      #10' group by a.ligcli, b.NOME'#13#10' order by b.Nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 760
    Top = 760
  end
  object dspCTne: TDataSetProvider
    DataSet = sdsCTne
    Left = 816
    Top = 760
  end
  object cdsCTne: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCTne'
    Left = 872
    Top = 760
    object cdsCTneLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCTneNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCTneQT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
  end
end
