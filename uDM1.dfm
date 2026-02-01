object DM1: TDM1
  Height = 644
  Width = 617
  object Conexao: TSQLConnection
    ConnectionName = 'FBFlaydel'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=23.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=localhost:F:\03Bancos\Flaydel\Real1\DBFLAY.fdb'
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
    Left = 16
    Top = 8
  end
  object sdsValores: TSQLDataSet
    CommandText = 'select * from TB_VALORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 344
  end
  object sdsGrupo: TSQLDataSet
    CommandText = 'select * from TB_GRUPO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 176
  end
  object sdsModelos: TSQLDataSet
    CommandText = 'select * from TB_MODELOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 400
  end
  object dspValores: TDataSetProvider
    DataSet = sdsValores
    Left = 280
    Top = 344
  end
  object dspGrupo: TDataSetProvider
    DataSet = sdsGrupo
    Left = 80
    Top = 176
  end
  object dspModelos: TDataSetProvider
    DataSet = sdsModelos
    Left = 280
    Top = 400
  end
  object cdsValores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValores'
    Left = 344
    Top = 344
    object cdsValoresID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValoresSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 40
    end
    object cdsValoresVALORP: TFMTBCDField
      FieldName = 'VALORP'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsValoresVALORG: TFMTBCDField
      FieldName = 'VALORG'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsValoresDTALTERADO: TSQLTimeStampField
      FieldName = 'DTALTERADO'
    end
    object cdsValoresUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsValoresNUM: TSmallintField
      FieldName = 'NUM'
    end
    object cdsValoresVALORM: TFMTBCDField
      FieldName = 'VALORM'
      Precision = 9
      Size = 2
    end
    object cdsValoresVALORE: TFMTBCDField
      FieldName = 'VALORE'
      Precision = 9
      Size = 2
    end
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 144
    Top = 176
    object cdsGrupoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGrupoLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsGrupoNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object cdsModelos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelos'
    Left = 344
    Top = 400
    object cdsModelosID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsModelosMODELO: TStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object cdsModelosTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
  end
  object sdsFuncs: TSQLDataSet
    CommandText = 'select * from TB_FUNCS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 288
  end
  object sdsCli: TSQLDataSet
    CommandText = 'select * from TB_CLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 64
  end
  object sdsEnder: TSQLDataSet
    CommandText = 'select * from TB_CLIENDER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 64
  end
  object sdsTel: TSQLDataSet
    CommandText = 'select * from TB_CLITEL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 120
  end
  object dspFuncs: TDataSetProvider
    DataSet = sdsFuncs
    Left = 80
    Top = 288
  end
  object dspCli: TDataSetProvider
    DataSet = sdsCli
    Left = 80
    Top = 64
  end
  object cdsFuncs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncs'
    Left = 144
    Top = 288
    object cdsFuncsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFuncsNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsFuncsUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsFuncsCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsFuncsRG: TStringField
      FieldName = 'RG'
      Size = 14
    end
    object cdsFuncsOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object cdsFuncsDTCAD: TSQLTimeStampField
      FieldName = 'DTCAD'
    end
    object cdsFuncsDTNASC: TSQLTimeStampField
      FieldName = 'DTNASC'
    end
    object cdsFuncsTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsFuncsCH: TStringField
      FieldName = 'CH'
      Size = 18
    end
    object cdsFuncsCHVALIDADE: TSQLTimeStampField
      FieldName = 'CHVALIDADE'
    end
    object cdsFuncsCHCATEGORIA: TStringField
      FieldName = 'CHCATEGORIA'
      Size = 4
    end
    object cdsFuncsATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsFuncsVKM: TFMTBCDField
      FieldName = 'VKM'
      Precision = 9
      Size = 2
    end
    object cdsFuncsSEG: TSmallintField
      FieldName = 'SEG'
    end
    object cdsFuncsSEGVALIDADE: TDateField
      FieldName = 'SEGVALIDADE'
    end
    object cdsFuncsDTFICHA: TSQLTimeStampField
      FieldName = 'DTFICHA'
    end
    object cdsFuncsVPONTO: TFMTBCDField
      FieldName = 'VPONTO'
      Precision = 9
      Size = 2
    end
    object cdsFuncsSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 9
      Size = 2
    end
    object cdsFuncsDTAJUSTE: TDateField
      FieldName = 'DTAJUSTE'
    end
    object cdsFuncsRNTRC: TStringField
      FieldName = 'RNTRC'
      Size = 12
    end
  end
  object cdsCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCli'
    Left = 144
    Top = 64
    object cdsCliID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCliNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCliUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsCliCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsCliRG: TStringField
      FieldName = 'RG'
      Size = 14
    end
    object cdsCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsCliPESSOA: TSmallintField
      FieldName = 'PESSOA'
    end
    object cdsCliOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object cdsCliATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsCliARMAZENAGEM: TSmallintField
      FieldName = 'ARMAZENAGEM'
    end
    object cdsCliDTCAD: TSQLTimeStampField
      FieldName = 'DTCAD'
    end
    object cdsCliPADRAO_SP: TSmallintField
      FieldName = 'PADRAO_SP'
    end
    object cdsCliPADRAO_GSP: TSmallintField
      FieldName = 'PADRAO_GSP'
    end
    object cdsCliPADRAO_INT: TSmallintField
      FieldName = 'PADRAO_INT'
    end
    object cdsCliIE: TStringField
      FieldName = 'IE'
    end
    object cdsCliSAIDANAO: TSmallintField
      FieldName = 'SAIDANAO'
    end
    object cdsCliCARROEXTRA: TFMTBCDField
      FieldName = 'CARROEXTRA'
      Precision = 9
      Size = 2
    end
    object cdsCliPAGOEXTRA: TFMTBCDField
      FieldName = 'PAGOEXTRA'
      Precision = 9
      Size = 2
    end
    object cdsCliIMPREC: TSmallintField
      FieldName = 'IMPREC'
    end
    object cdsCliLIGGRUPO: TIntegerField
      FieldName = 'LIGGRUPO'
    end
    object cdsCliNFSERIE: TSmallintField
      FieldName = 'NFSERIE'
    end
    object cdsCliUSA_SMS: TSmallintField
      FieldName = 'USA_SMS'
    end
    object cdsCliPRAZO: TSmallintField
      FieldName = 'PRAZO'
    end
    object cdsCliLIGPRAZO: TIntegerField
      FieldName = 'LIGPRAZO'
    end
    object cdsCliCTEEMITE: TSmallintField
      FieldName = 'CTEEMITE'
    end
    object cdsCliCTEIMPOSTO: TSmallintField
      FieldName = 'CTEIMPOSTO'
    end
    object cdsCliCTE_IE: TSmallintField
      FieldName = 'CTE_IE'
    end
    object cdsCliOCPROPIA: TSmallintField
      FieldName = 'OCPROPIA'
    end
  end
  object cdsEnder: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEnder'
    Left = 344
    Top = 64
    object cdsEnderID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEnderENDER: TStringField
      FieldName = 'ENDER'
      Size = 50
    end
    object cdsEnderNUMERO: TSmallintField
      FieldName = 'NUMERO'
    end
    object cdsEnderCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 10
    end
    object cdsEnderBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object cdsEnderCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsEnderESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsEnderCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsEnderFUNC_ID: TIntegerField
      FieldName = 'FUNC_ID'
    end
    object cdsEnderCODMUN: TStringField
      FieldName = 'CODMUN'
      Size = 10
    end
  end
  object cdsTel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTel'
    Left = 344
    Top = 120
    object cdsTelID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsTelNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 9
    end
    object cdsTelFUNC_ID: TIntegerField
      FieldName = 'FUNC_ID'
    end
    object cdsTelDETALHE: TStringField
      FieldName = 'DETALHE'
      Size = 40
    end
  end
  object dspEnder: TDataSetProvider
    DataSet = sdsEnder
    Left = 280
    Top = 64
  end
  object dspTel: TDataSetProvider
    DataSet = sdsTel
    Left = 280
    Top = 120
  end
  object CEPS: TSQLConnection
    ConnectionName = 'FBCEPS'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=23.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=localhost:F:\03Bancos\Flaydel\Padrao\CEPS2.fdb'
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
    Left = 80
    Top = 8
  end
  object sdsCEP: TSQLDataSet
    CommandText = 'select * from CEP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CEPS
    Left = 216
    Top = 176
  end
  object dspCEP: TDataSetProvider
    DataSet = sdsCEP
    Left = 280
    Top = 176
  end
  object cdsCEP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCEP'
    Left = 344
    Top = 176
    object cdsCEPCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsCEPTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
    object cdsCEPLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object cdsCEPLOGRADOURO_SEM_ACENTO: TStringField
      FieldName = 'LOGRADOURO_SEM_ACENTO'
      Size = 60
    end
    object cdsCEPBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object cdsCEPLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
      Size = 40
    end
    object cdsCEPUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object dspFuncs2: TDataSetProvider
    DataSet = sdsFuncs2
    Left = 280
    Top = 456
  end
  object dspCli2: TDataSetProvider
    DataSet = sdsCli2
    Left = 80
    Top = 120
  end
  object dspProd: TDataSetProvider
    DataSet = sdsProd
    Left = 80
    Top = 232
  end
  object cdsFuncs2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncs2'
    Left = 344
    Top = 456
    object cdsFuncs2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFuncs2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsFuncs2USERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsFuncs2CPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsFuncs2RG: TStringField
      FieldName = 'RG'
      Size = 14
    end
    object cdsFuncs2OBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object cdsFuncs2VKM: TFMTBCDField
      FieldName = 'VKM'
      Precision = 9
      Size = 2
    end
  end
  object cdsCli2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCli2'
    Left = 144
    Top = 120
    object cdsCli2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCli2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCli2USERID: TIntegerField
      FieldName = 'USERID'
    end
    object cdsCli2CPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsCli2RG: TStringField
      FieldName = 'RG'
      Size = 14
    end
    object cdsCli2CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsCli2PESSOA: TSmallintField
      FieldName = 'PESSOA'
    end
    object cdsCli2OBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object cdsCli2ATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsCli2ARMAZENAGEM: TSmallintField
      FieldName = 'ARMAZENAGEM'
    end
    object cdsCli2DTCAD: TSQLTimeStampField
      FieldName = 'DTCAD'
    end
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    Left = 144
    Top = 232
    object cdsProdID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdCOD: TStringField
      FieldName = 'COD'
    end
    object cdsProdCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 40
    end
    object cdsProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 15
    end
    object cdsProdMINIMO: TSmallintField
      FieldName = 'MINIMO'
    end
    object cdsProdPALETE: TFMTBCDField
      FieldName = 'PALETE'
      Precision = 9
      Size = 2
    end
    object cdsProdLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsProdATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsProdLIGGRUPO: TIntegerField
      FieldName = 'LIGGRUPO'
    end
    object cdsProdCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 40
    end
    object cdsProdQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object cdsProdCODCLI: TStringField
      FieldName = 'CODCLI'
    end
    object cdsProdPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 1
    end
    object cdsProdCUBAGEM: TIntegerField
      FieldName = 'CUBAGEM'
    end
    object cdsProdNFNCM: TStringField
      FieldName = 'NFNCM'
      Size = 10
    end
    object cdsProdNFCFOP: TSmallintField
      FieldName = 'NFCFOP'
    end
    object cdsProdFLG_MINTELA: TSmallintField
      FieldName = 'FLG_MINTELA'
    end
    object cdsProdFLG_MINMAIL: TSmallintField
      FieldName = 'FLG_MINMAIL'
    end
  end
  object sdsFuncs2: TSQLDataSet
    CommandText = 'select * from TB_FUNCS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 456
  end
  object sdsCli2: TSQLDataSet
    CommandText = 'select * from TB_CLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 120
  end
  object sdsProd: TSQLDataSet
    CommandText = 'select * from TB_PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 232
  end
  object sdsVeic2: TSQLDataSet
    CommandText = 'select * from TB_VEICULO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 232
  end
  object dspVeic2: TDataSetProvider
    DataSet = sdsVeic2
    Left = 280
    Top = 232
  end
  object cdsVeic2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVeic2'
    Left = 344
    Top = 232
    object cdsVeic2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVeic2CLI_ID: TIntegerField
      FieldName = 'CLI_ID'
    end
    object cdsVeic2PLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object cdsVeic2MODELO: TStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object cdsVeic2COR: TStringField
      FieldName = 'COR'
      Size = 12
    end
    object cdsVeic2TAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
  end
  object sdsViewPlaca: TSQLDataSet
    CommandText = 'Select * from View_Placa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 288
  end
  object dspViewPlaca: TDataSetProvider
    DataSet = sdsViewPlaca
    Left = 280
    Top = 288
  end
  object cdsViewPlaca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspViewPlaca'
    ReadOnly = True
    Left = 344
    Top = 288
    object cdsViewPlacaIDCLI: TIntegerField
      FieldName = 'IDCLI'
    end
    object cdsViewPlacaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsViewPlacaCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsViewPlacaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsViewPlacaIDVEIC: TIntegerField
      FieldName = 'IDVEIC'
    end
    object cdsViewPlacaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object cdsViewPlacaMODELO: TStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object cdsViewPlacaCOR: TStringField
      FieldName = 'COR'
      Size = 12
    end
    object cdsViewPlacaTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
  end
  object sdsWEB: TSQLDataSet
    CommandText = 'SELECT * FROM TB_CLIWEB'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 456
  end
  object dspWEB: TDataSetProvider
    DataSet = sdsWEB
    Left = 80
    Top = 456
  end
  object cdsWEB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWEB'
    Left = 144
    Top = 456
    object cdsWEBID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsWEBDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsWEBWEB: TStringField
      FieldName = 'WEB'
      Size = 50
    end
    object cdsWEBLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsFBco: TSQLDataSet
    CommandText = 'select * from TB_FUNCBANCO order by LIGFUNC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 344
  end
  object dspFBco: TDataSetProvider
    DataSet = sdsFBco
    Left = 80
    Top = 344
  end
  object cdsFBco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFBco'
    Left = 144
    Top = 344
    object cdsFBcoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFBcoBCONUM: TStringField
      FieldName = 'BCONUM'
      FixedChar = True
      Size = 3
    end
    object cdsFBcoBCONOME: TStringField
      FieldName = 'BCONOME'
    end
    object cdsFBcoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsFBcoCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsFBcoCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsFBcoFAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      Size = 40
    end
    object cdsFBcoLIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsFBcoTIPOCC: TSmallintField
      FieldName = 'TIPOCC'
    end
  end
  object sdsFCar: TSQLDataSet
    CommandText = 'select * from TB_FUNCCAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 400
  end
  object dspFCar: TDataSetProvider
    DataSet = sdsFCar
    Left = 80
    Top = 400
  end
  object cdsFCar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFCar'
    Left = 144
    Top = 400
    object cdsFCarID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFCarPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object cdsFCarVEICULO: TStringField
      FieldName = 'VEICULO'
      Size = 15
    end
    object cdsFCarANO: TSmallintField
      FieldName = 'ANO'
    end
    object cdsFCarLIGFUNC: TIntegerField
      FieldName = 'LIGFUNC'
    end
    object cdsFCarCODLIBERA: TStringField
      FieldName = 'CODLIBERA'
      Size = 12
    end
  end
  object sdsEstM: TSQLDataSet
    CommandText = 'select * from TB_ESTOQUE_MOV'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 64
  end
  object dspEstM: TDataSetProvider
    DataSet = sdsEstM
    Left = 464
    Top = 64
  end
  object cdsEstM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstM'
    Left = 520
    Top = 64
    object cdsEstMID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEstMDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsEstMHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsEstMLIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsEstMLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsEstMLIGPROD: TIntegerField
      FieldName = 'LIGPROD'
    end
    object cdsEstMTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsEstMDOCSOBS: TStringField
      FieldName = 'DOCSOBS'
      Size = 41
    end
    object cdsEstMQ_ANTERIOR: TIntegerField
      FieldName = 'Q_ANTERIOR'
    end
    object cdsEstMQ_MOV: TIntegerField
      FieldName = 'Q_MOV'
    end
    object cdsEstMQ_ATUAL: TIntegerField
      FieldName = 'Q_ATUAL'
    end
    object cdsEstMV_ENTRADA: TFMTBCDField
      FieldName = 'V_ENTRADA'
      Precision = 9
      Size = 2
    end
    object cdsEstMMODO: TStringField
      FieldName = 'MODO'
      FixedChar = True
      Size = 1
    end
    object cdsEstMN_LOCAL: TIntegerField
      FieldName = 'N_LOCAL'
    end
  end
  object dspNotas: TDataSetProvider
    DataSet = sdsNotas
    Left = 464
    Top = 120
  end
  object cdsNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNotas'
    Left = 520
    Top = 120
    object cdsNotasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNotasNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsNotasVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsNotasPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsNotasCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsNotasLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsNotasOBS: TStringField
      FieldName = 'OBS'
      Size = 40
    end
    object cdsNotasNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsNotasNCONH: TIntegerField
      FieldName = 'NCONH'
      DisplayFormat = '#,##0'
    end
    object cdsNotasLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNotasENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 3
    end
    object cdsNotasDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsNotasDTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsNotasHRENT: TTimeField
      FieldName = 'HRENT'
    end
    object cdsNotasNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsNotasPROXROMA: TIntegerField
      FieldName = 'PROXROMA'
    end
    object cdsNotasVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      Precision = 18
      Size = 2
    end
    object cdsNotasTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
    end
    object cdsNotasRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
    end
    object cdsNotasSTATUS_ENT: TSmallintField
      FieldName = 'STATUS_ENT'
    end
    object cdsNotasSTATUS_WEB: TSmallintField
      FieldName = 'STATUS_WEB'
    end
    object cdsNotasSTATUS_TKT: TSmallintField
      FieldName = 'STATUS_TKT'
    end
    object cdsNotasLIGREL: TIntegerField
      FieldName = 'LIGREL'
    end
    object cdsNotasPONTO: TSmallintField
      FieldName = 'PONTO'
    end
    object cdsNotasSTATUS_EDI: TSmallintField
      FieldName = 'STATUS_EDI'
    end
    object cdsNotasCUB_VOLUME: TFMTBCDField
      FieldName = 'CUB_VOLUME'
      Precision = 9
      Size = 2
    end
    object cdsNotasCARRO: TSmallintField
      FieldName = 'CARRO'
    end
    object cdsNotasTIPO_COB: TSmallintField
      FieldName = 'TIPO_COB'
    end
    object cdsNotasTIPO_PAG: TSmallintField
      FieldName = 'TIPO_PAG'
    end
    object cdsNotasORIGEM: TSmallintField
      FieldName = 'ORIGEM'
    end
    object cdsNotasEXTRANUM: TIntegerField
      FieldName = 'EXTRANUM'
    end
    object cdsNotasSTATUS_DEV: TSmallintField
      FieldName = 'STATUS_DEV'
    end
    object cdsNotasNUMDEV: TIntegerField
      FieldName = 'NUMDEV'
    end
    object cdsNotasNUMCOL: TIntegerField
      FieldName = 'NUMCOL'
    end
    object cdsNotasIMGREC: TStringField
      FieldName = 'IMGREC'
    end
    object cdsNotasDTTKT: TDateField
      FieldName = 'DTTKT'
    end
    object cdsNotasCOB_OK: TSmallintField
      FieldName = 'COB_OK'
    end
    object cdsNotasPAG_OK: TSmallintField
      FieldName = 'PAG_OK'
    end
    object cdsNotasLIGTRANSP: TIntegerField
      FieldName = 'LIGTRANSP'
    end
    object cdsNotasCONTAREENT: TSmallintField
      FieldName = 'CONTAREENT'
    end
    object cdsNotasNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsNotasSERIENF: TSmallintField
      FieldName = 'SERIENF'
    end
    object cdsNotasBAIXA_ORIG: TSmallintField
      FieldName = 'BAIXA_ORIG'
    end
    object cdsNotasBAIXA_FUNC: TIntegerField
      FieldName = 'BAIXA_FUNC'
    end
    object cdsNotasNCHAM: TIntegerField
      FieldName = 'NCHAM'
    end
    object cdsNotasFONEDEST: TStringField
      FieldName = 'FONEDEST'
      Size = 14
    end
    object cdsNotasFLAG_IMP: TSmallintField
      FieldName = 'FLAG_IMP'
    end
    object cdsNotasDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
    end
    object cdsNotasDTALT: TSQLTimeStampField
      FieldName = 'DTALT'
    end
    object cdsNotasFLAG_NAOPAGA: TSmallintField
      FieldName = 'FLAG_NAOPAGA'
    end
    object cdsNotasDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
    object cdsNotasENVIASMS: TSmallintField
      FieldName = 'ENVIASMS'
    end
    object cdsNotasLIGROT: TIntegerField
      FieldName = 'LIGROT'
    end
    object cdsNotasDIASENT: TSmallintField
      FieldName = 'DIASENT'
    end
    object cdsNotasFLAG_GERAL: TSmallintField
      FieldName = 'FLAG_GERAL'
    end
    object cdsNotasLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object cdsNotasPENDE: TSmallintField
      FieldName = 'PENDE'
    end
    object cdsNotasROMCLI: TIntegerField
      FieldName = 'ROMCLI'
    end
    object cdsNotasNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
    object cdsNotasCTEGRUPO: TIntegerField
      FieldName = 'CTEGRUPO'
    end
    object cdsNotasLIGDCOB: TIntegerField
      FieldName = 'LIGDCOB'
    end
    object cdsNotasDTOCOREN: TSQLTimeStampField
      FieldName = 'DTOCOREN'
    end
    object cdsNotasVLRCOMBINADO: TFMTBCDField
      FieldName = 'VLRCOMBINADO'
      Precision = 9
      Size = 2
    end
    object cdsNotasPESONF: TFMTBCDField
      FieldName = 'PESONF'
      Precision = 9
      Size = 2
    end
    object cdsNotasPRIORIDADE: TSmallintField
      FieldName = 'PRIORIDADE'
    end
  end
  object sdsNotas: TSQLDataSet
    CommandText = 'select * from TB_NOTAF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 120
  end
  object sdsRoma: TSQLDataSet
    CommandText = 'select * from TB_ROMA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 176
  end
  object dspRoma: TDataSetProvider
    DataSet = sdsRoma
    Left = 464
    Top = 176
  end
  object cdsRoma: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRoma'
    Left = 520
    Top = 176
    object cdsRomaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRomaNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsRomaDTROMA: TDateField
      FieldName = 'DTROMA'
    end
    object cdsRomaLIGMOT: TIntegerField
      FieldName = 'LIGMOT'
    end
    object cdsRomaLIGAJUD: TIntegerField
      FieldName = 'LIGAJUD'
    end
    object cdsRomaLIGREG: TIntegerField
      FieldName = 'LIGREG'
    end
    object cdsRomaLIGVEIC: TIntegerField
      FieldName = 'LIGVEIC'
    end
    object cdsRomaSTATUS_DEV: TSmallintField
      FieldName = 'STATUS_DEV'
    end
    object cdsRomaMINUTA: TIntegerField
      FieldName = 'MINUTA'
    end
    object cdsRomaTIPO_CARRO: TSmallintField
      FieldName = 'TIPO_CARRO'
    end
    object cdsRomaTIPO_PAG: TSmallintField
      FieldName = 'TIPO_PAG'
    end
    object cdsRomaVPAG: TFMTBCDField
      FieldName = 'VPAG'
      Precision = 9
      Size = 2
    end
    object cdsRomaKM: TSmallintField
      FieldName = 'KM'
    end
    object cdsRomaEXTRANUM: TIntegerField
      FieldName = 'EXTRANUM'
    end
    object cdsRomaNOCORRE: TSmallintField
      FieldName = 'NOCORRE'
    end
    object cdsRomaLIGCRED: TIntegerField
      FieldName = 'LIGCRED'
    end
    object cdsRomaLIGCARF: TIntegerField
      FieldName = 'LIGCARF'
    end
    object cdsRomaVCOMBINA: TFMTBCDField
      FieldName = 'VCOMBINA'
      Precision = 9
      Size = 2
    end
    object cdsRomaFCOMBINA: TSmallintField
      FieldName = 'FCOMBINA'
    end
    object cdsRomaVFRETECOMB: TFMTBCDField
      FieldName = 'VFRETECOMB'
      Precision = 9
      Size = 2
    end
    object cdsRomaFFRETECOMB: TSmallintField
      FieldName = 'FFRETECOMB'
    end
  end
  object sdsRomaNF: TSQLDataSet
    CommandText = 
      'select TB_NOTAF.ID, NUMNF, VALOR, VOLUME, NCONH, CEP, LOCALI, NR' +
      'OMA, NOME, PESO, STATUS_ENT , nOcorr, Origem, nomedest, fonedest' +
      ', docdest, TB_CLIENTE.id  as idCli, status_web,'#13#10'case prioridade' +
      ' when 1 then '#39'PRIORID'#39' when 2 then '#39'H O J E'#39' else '#39'  -    '#39' END ' +
      'as Priorid, contareent, prioridade'#13#10'from TB_NOTAF, TB_CLIENTE'#13#10'w' +
      'here TB_NOTAF.LigCli = TB_CLIENTE.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 232
  end
  object dspRomaNF: TDataSetProvider
    DataSet = sdsRomaNF
    Left = 464
    Top = 232
  end
  object cdsRomaNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRomaNF'
    Left = 520
    Top = 232
    object cdsRomaNFID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRomaNFNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsRomaNFVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRomaNFVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsRomaNFNCONH: TIntegerField
      FieldName = 'NCONH'
    end
    object cdsRomaNFCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsRomaNFLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsRomaNFNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsRomaNFNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsRomaNFPESO: TFMTBCDField
      FieldName = 'PESO'
      DisplayFormat = '#,##0.0'
      Precision = 9
      Size = 2
    end
    object cdsRomaNFSTATUS_ENT: TSmallintField
      FieldName = 'STATUS_ENT'
    end
    object cdsRomaNFNOCORR: TSmallintField
      FieldName = 'NOCORR'
    end
    object cdsRomaNFORIGEM: TSmallintField
      FieldName = 'ORIGEM'
    end
    object cdsRomaNFNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsRomaNFFONEDEST: TStringField
      FieldName = 'FONEDEST'
      Size = 16
    end
    object cdsRomaNFIDCLI: TIntegerField
      FieldName = 'IDCLI'
      Required = True
    end
    object cdsRomaNFSTATUS_WEB: TSmallintField
      FieldName = 'STATUS_WEB'
    end
    object cdsRomaNFPRIORID: TStringField
      FieldName = 'PRIORID'
      FixedChar = True
      Size = 7
    end
    object cdsRomaNFCONTAREENT: TSmallintField
      FieldName = 'CONTAREENT'
    end
    object cdsRomaNFPRIORIDADE: TSmallintField
      FieldName = 'PRIORIDADE'
    end
    object cdsRomaNFDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
  end
  object sdsReg: TSQLDataSet
    CommandText = 
      'select id, Descr, class, CASE class WHEN 1 THEN '#39'Capital'#39' WHEN 2' +
      ' THEN '#39'Interior'#39' WHEN 3 THEN '#39'GSP'#39' END as Local from TB_REGIAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 288
  end
  object sdsOc: TSQLDataSet
    CommandText = 
      'select TB_OCORRE.*, '#13#10'case autopende when 1 then '#39'Pend'#234'ncia'#39' els' +
      'e '#39'-'#39' end as ap, '#13#10'case autosms when 1 then '#39'SMS'#39' else '#39'-'#39' end a' +
      's asms, '#13#10'case autosac when 1 then '#39'SMS'#39' else '#39'-'#39' end as asac, '#13 +
      #10'case geracte when 1 then '#39'sim'#39' else '#39'N'#195'O PODE'#39' end gcte '#13#10'from ' +
      ' TB_OCORRE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 344
  end
  object dspReg: TDataSetProvider
    DataSet = sdsReg
    Left = 464
    Top = 288
  end
  object dspOc: TDataSetProvider
    DataSet = sdsOc
    Left = 464
    Top = 344
  end
  object cdsReg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReg'
    Left = 520
    Top = 288
    object cdsRegID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRegDESCR: TStringField
      FieldName = 'DESCR'
    end
    object cdsRegCLASS: TSmallintField
      FieldName = 'CLASS'
    end
    object cdsRegLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
  end
  object cdsOc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOc'
    Left = 520
    Top = 344
    object cdsOcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsOcNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsOcDESCR: TStringField
      FieldName = 'DESCR'
      Size = 55
    end
    object cdsOcUSO: TIntegerField
      FieldName = 'USO'
    end
    object cdsOcAUTOPENDE: TSmallintField
      FieldName = 'AUTOPENDE'
    end
    object cdsOcAUTOSMS: TSmallintField
      FieldName = 'AUTOSMS'
    end
    object cdsOcAUTOSAC: TSmallintField
      FieldName = 'AUTOSAC'
    end
    object cdsOcGERACTE: TSmallintField
      FieldName = 'GERACTE'
    end
    object cdsOcAP: TStringField
      FieldName = 'AP'
      FixedChar = True
      Size = 9
    end
    object cdsOcASMS: TStringField
      FieldName = 'ASMS'
      FixedChar = True
      Size = 3
    end
    object cdsOcASAC: TStringField
      FieldName = 'ASAC'
      FixedChar = True
      Size = 3
    end
    object cdsOcGCTE: TStringField
      FieldName = 'GCTE'
      FixedChar = True
      Size = 8
    end
  end
  object sdsSEM: TSQLDataSet
    CommandText = 
      'select Tb_NotaF.ID, NUMNF, Nome, Valor, Locali, dtNota, CEP, TB_' +
      'NOTAF.LIGCLI from  TB_CLIENTE, '#13#10'TB_Notaf left join TB_NOTAF_OBS' +
      ' on TB_NOTAF_OBS.LIGNF =TB_NOTAF.id'#13#10'WHERE TB_CLIENTE.id = TB_NO' +
      'TAF.LIGCLI and nRoma = 0  and TB_NOTAF_OBS.LIGNF is null'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 400
  end
  object dspSEM: TDataSetProvider
    DataSet = sdsSEM
    Left = 464
    Top = 400
  end
  object cdsSEM: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMNF'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'LOCALI'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DTNOTA'
        DataType = ftDate
      end
      item
        Name = 'CEP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 9
      end
      item
        Name = 'LIGCLI'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'NUMNF'
    Params = <>
    ProviderName = 'dspSEM'
    StoreDefs = True
    Left = 520
    Top = 400
    object cdsSEMID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSEMNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsSEMNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsSEMVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cdsSEMLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
    object cdsSEMDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsSEMCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsSEMLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
  end
  object sdsRomaR: TSQLDataSet
    CommandText = 
      'select TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romane' +
      'io , dtEnt, case TB_NOTAF.STATUS_ENT when 1 then '#39'Ok'#39' when 2 the' +
      'n TB_NOTAF.Obs else '#39'-'#39' END as Entregue,case TB_NOTAF.STATUS_ENT' +
      ' when 1 then hrENT ELse '#39#39' END as Hora,  numnf, valor, volume, p' +
      'eso, Nome, tb_notaf.NCONH , Minuta,vFrete, tipolocal,'#13#10'case tipo' +
      'local when 0 then '#39'SP'#39' when 1 then '#39'GSP'#39' when 2 then '#39'INT'#39' ELSE ' +
      #39'-'#39' end as Local, nRoma, Tipo_Cob, TB_NOTAF.ligCli, '#13#10'Cub_Volume' +
      ', Ponto, Servico,'#13#10'case tipo_cob when 1 then '#39'Peso'#39' when 2 then ' +
      #39'Taxa'#39' when 3 then '#39'Entrega'#39' when 4 then '#39'Sa'#237'da'#39' when 3 then '#39'Co' +
      'ntrato'#39' ELSE '#39'sem Serv'#39' end as Servico2, Recebedor, CEP,'#13#10'case o' +
      'rigem when 2 then '#39'Coleta'#39'  ELSE '#39'Nota Fiscal'#39' end as DOC,'#13#10'case' +
      ' TB_OCORRE.NUM when 1 then '#39'Normal'#39' when 2 then '#39'Reentrega'#39' when' +
      ' 3 then '#39'Devolu'#231#227'o'#39'  ELSE '#39'n'#227'o feita'#39' end as Ocorrencia, NCHAM, ' +
      'TB_NOTAF.id as idNF, dtCria, NomeDest, DOCDest, SerieNF, NUMPED,' +
      ' dtNota, LOCALI'#13#10#13#10' from TB_NOTAF, TB_ROMA, TB_FUNCS, TB_CLICOB,' +
      ' TB_OCORRE '#13#10'where TB_NOTAF.NROMA = TB_ROMA.NUM and TB_ROMA.LIGM' +
      'OT = TB_FUNCS.id and TB_NOTAF.EXTRANUM = TB_CLICOB.id and TB_OCO' +
      'RRE.NUM = TB_NOTAF.NOCORR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 456
  end
  object dspRomaR: TDataSetProvider
    DataSet = sdsRomaR
    Left = 464
    Top = 456
  end
  object cdsRomaR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRomaR'
    Left = 520
    Top = 456
    object cdsRomaRROMANEIO: TLargeintField
      FieldName = 'ROMANEIO'
      ReadOnly = True
    end
    object cdsRomaRNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsRomaRDTENT: TDateField
      FieldName = 'DTENT'
    end
    object cdsRomaRHORA: TStringField
      FieldName = 'HORA'
      ReadOnly = True
      Size = 13
    end
    object cdsRomaRNCONH: TIntegerField
      FieldName = 'NCONH'
      ReadOnly = True
    end
    object cdsRomaRVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRomaRNUMNF: TIntegerField
      FieldName = 'NUMNF'
      DisplayFormat = '#,##0'
    end
    object cdsRomaRVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdsRomaRPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsRomaRENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsRomaRMINUTA: TIntegerField
      FieldName = 'MINUTA'
      ReadOnly = True
    end
    object cdsRomaRVFRETE: TFMTBCDField
      FieldName = 'VFRETE'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRomaRLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsRomaRNROMA: TIntegerField
      FieldName = 'NROMA'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object cdsRomaRTIPO_COB: TSmallintField
      FieldName = 'TIPO_COB'
      ReadOnly = True
    end
    object cdsRomaRSERVICO: TStringField
      FieldName = 'SERVICO'
      ReadOnly = True
      Size = 12
    end
    object cdsRomaRSERVICO2: TStringField
      FieldName = 'SERVICO2'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object cdsRomaRLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
      ReadOnly = True
    end
    object cdsRomaRCUB_VOLUME: TFMTBCDField
      FieldName = 'CUB_VOLUME'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object cdsRomaRPONTO: TSmallintField
      FieldName = 'PONTO'
      ReadOnly = True
    end
    object cdsRomaRRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      ReadOnly = True
    end
    object cdsRomaRCEP: TStringField
      FieldName = 'CEP'
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object cdsRomaRDOC: TStringField
      FieldName = 'DOC'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object cdsRomaROCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object cdsRomaRTIPOLOCAL: TSmallintField
      FieldName = 'TIPOLOCAL'
      ReadOnly = True
    end
    object cdsRomaRNCHAM: TIntegerField
      FieldName = 'NCHAM'
      ReadOnly = True
    end
    object cdsRomaRIDNF: TIntegerField
      FieldName = 'IDNF'
      ReadOnly = True
      Required = True
    end
    object cdsRomaRDTCRIA: TSQLTimeStampField
      FieldName = 'DTCRIA'
      ReadOnly = True
    end
    object cdsRomaRNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      ReadOnly = True
      Size = 50
    end
    object cdsRomaRDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
    object cdsRomaRSERIENF: TSmallintField
      FieldName = 'SERIENF'
    end
    object cdsRomaRNUMPED: TStringField
      FieldName = 'NUMPED'
      Size = 15
    end
    object cdsRomaRDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsRomaRLOCALI: TStringField
      FieldName = 'LOCALI'
      Size = 25
    end
  end
  object sdsFAd: TSQLDataSet
    CommandText = 'select * from TB_FRETE0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 512
  end
  object dspFAd: TDataSetProvider
    DataSet = sdsFAd
    Left = 464
    Top = 512
  end
  object cdsFAd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFAd'
    Left = 520
    Top = 512
    object cdsFAdID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFAdLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsFAdTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsFAdLOCAL: TSmallintField
      FieldName = 'LOCAL'
    end
    object cdsFAdADVAL: TFMTBCDField
      FieldName = 'ADVAL'
      Precision = 9
      Size = 3
    end
    object cdsFAdADVAL_MIN: TFMTBCDField
      FieldName = 'ADVAL_MIN'
      Precision = 9
      Size = 2
    end
    object cdsFAdGRIS: TFMTBCDField
      FieldName = 'GRIS'
      Precision = 9
      Size = 3
    end
    object cdsFAdGRIS_MIN: TFMTBCDField
      FieldName = 'GRIS_MIN'
      Precision = 9
      Size = 2
    end
    object cdsFAdGRIS_SUP: TFMTBCDField
      FieldName = 'GRIS_SUP'
      Precision = 9
      Size = 2
    end
    object cdsFAdDIF_TAXA: TFMTBCDField
      FieldName = 'DIF_TAXA'
      Precision = 9
      Size = 3
    end
    object cdsFAdDIF_MIN: TFMTBCDField
      FieldName = 'DIF_MIN'
      Precision = 9
      Size = 2
    end
    object cdsFAdDIF_MAX: TFMTBCDField
      FieldName = 'DIF_MAX'
      Precision = 9
      Size = 2
    end
    object cdsFAdICMS_MAIOR: TFMTBCDField
      FieldName = 'ICMS_MAIOR'
      Precision = 9
      Size = 3
    end
    object cdsFAdICMS_MENOR: TFMTBCDField
      FieldName = 'ICMS_MENOR'
      Precision = 9
      Size = 3
    end
    object cdsFAdICMS_LIMITE: TFMTBCDField
      FieldName = 'ICMS_LIMITE'
      Precision = 9
      Size = 2
    end
    object cdsFAdPONTO: TFMTBCDField
      FieldName = 'PONTO'
      Precision = 9
      Size = 2
    end
    object cdsFAdPEDAGIO: TFMTBCDField
      FieldName = 'PEDAGIO'
      Precision = 9
      Size = 2
    end
    object cdsFAdFRETE_MIN: TFMTBCDField
      FieldName = 'FRETE_MIN'
      Precision = 9
      Size = 2
    end
    object cdsFAdEMISSAO: TFMTBCDField
      FieldName = 'EMISSAO'
      Precision = 9
      Size = 2
    end
    object cdsFAdDEVOLUCAO: TFMTBCDField
      FieldName = 'DEVOLUCAO'
      Precision = 9
      Size = 3
    end
    object cdsFAdREENTREGA: TFMTBCDField
      FieldName = 'REENTREGA'
      Precision = 9
      Size = 3
    end
    object cdsFAdVRISCO: TFMTBCDField
      FieldName = 'VRISCO'
      Precision = 9
      Size = 2
    end
    object cdsFAdVRISCOAD: TFMTBCDField
      FieldName = 'VRISCOAD'
      Precision = 9
      Size = 2
    end
  end
  object IBGE: TSQLConnection
    ConnectionName = 'FBIBGE'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=23.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=localhost:F:\03Bancos\Flaydel\Padrao\IBGE_mun.fdb'
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
    Left = 144
    Top = 8
  end
  object sdsIBGE: TSQLDataSet
    CommandText = 'select * from MUNICIPIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = IBGE
    Left = 16
    Top = 512
  end
  object dspIBGE: TDataSetProvider
    DataSet = sdsIBGE
    Left = 80
    Top = 512
  end
  object cdsIBGE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIBGE'
    Left = 144
    Top = 512
    object cdsIBGEID: TIntegerField
      FieldName = 'ID'
    end
    object cdsIBGECMUN: TIntegerField
      FieldName = 'CMUN'
    end
    object cdsIBGEMUNIC: TStringField
      FieldName = 'MUNIC'
      Size = 50
    end
    object cdsIBGEUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object sdsRecb: TSQLDataSet
    CommandText = 
      'select TB_NOTAF.ID, NUMNF, NROMA, NOME, nomedest, ligcli, fonede' +
      'st, Peso'#13#10'from TB_NOTAF, TB_CLIENTE'#13#10'where TB_NOTAF.LigCli = TB_' +
      'CLIENTE.id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 512
  end
  object dspRecb: TDataSetProvider
    DataSet = sdsRecb
    Left = 280
    Top = 512
  end
  object cdsRecb: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecb'
    Left = 344
    Top = 512
    object cdsRecbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRecbNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsRecbNROMA: TIntegerField
      FieldName = 'NROMA'
    end
    object cdsRecbNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsRecbNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 50
    end
    object cdsRecbLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsRecbFONEDEST: TStringField
      FieldName = 'FONEDEST'
      Size = 16
    end
    object cdsRecbPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
  end
  object dspCTe: TDataSetProvider
    DataSet = sdsCTe
    Left = 80
    Top = 568
  end
  object cdsCTe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCTe'
    Left = 136
    Top = 568
    object cdsCTeDATAC: TDateField
      FieldName = 'DATAC'
    end
    object cdsCTeNUMC: TIntegerField
      FieldName = 'NUMC'
    end
    object cdsCTeARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 50
    end
    object cdsCTeSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
  end
  object sdsCTe: TSQLDataSet
    CommandText = 
      'select DATAC, NUMC, ARQUIVO, STATUS from TB_CONHEC WHERE LIGNOTA' +
      ' = 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 24
    Top = 568
  end
  object sdsRomaDoc: TSQLDataSet
    CommandText = 
      'select docDest, count(*) as qt from Tb_Notaf where nRoma = 20230' +
      '00617 and ligcli=227 Group by docDest'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 408
    Top = 576
  end
  object dspRomaDoc: TDataSetProvider
    DataSet = sdsRomaDoc
    Left = 464
    Top = 576
  end
  object cdsRomaDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRomaDoc'
    Left = 520
    Top = 576
    object cdsRomaDocDOCDEST: TStringField
      FieldName = 'DOCDEST'
      Size = 18
    end
    object cdsRomaDocQT: TIntegerField
      FieldName = 'QT'
      Required = True
    end
  end
end
