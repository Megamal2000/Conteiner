object eDM: TeDM
  OldCreateOrder = False
  Height = 523
  Width = 707
  object ConSTOK: TSQLConnection
    ConnectionName = 'FBESTOQUE'
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
      'Database=localhost:F:\03Bancos\Flaydel\Padrao\DBESTOQUE.fdb'
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
  object cdsCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCli'
    Left = 144
    Top = 120
    object cdsCliID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCliNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCliATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsCliNOTACNPJ: TStringField
      FieldName = 'NOTACNPJ'
    end
  end
  object dspCli: TDataSetProvider
    DataSet = sdsCli
    Left = 80
    Top = 120
  end
  object sdsCli: TSQLDataSet
    CommandText = 'select * from TBE_CLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 120
  end
  object sdsTMPe: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 72
  end
  object dspTMPe: TDataSetProvider
    DataSet = sdsTMPe
    Left = 80
    Top = 72
  end
  object cdsTMPe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMPe'
    Left = 144
    Top = 72
  end
  object cdsCli2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCli'
    Left = 200
    Top = 120
    object cdsCli2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCli2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCli2ATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsCli2NOTACNPJ: TStringField
      FieldName = 'NOTACNPJ'
    end
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    Left = 144
    Top = 184
    object cdsProdID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdNOMELONGO: TStringField
      FieldName = 'NOMELONGO'
      Size = 40
    end
    object cdsProdNOMECURTO: TStringField
      FieldName = 'NOMECURTO'
      Size = 15
    end
    object cdsProdATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsProdBVALIDADE: TSmallintField
      FieldName = 'BVALIDADE'
    end
    object cdsProdBFIFO: TSmallintField
      FieldName = 'BFIFO'
    end
    object cdsProdQUANTMIN: TIntegerField
      FieldName = 'QUANTMIN'
    end
    object cdsProdQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsProdDINVENTARIO: TDateField
      FieldName = 'DINVENTARIO'
    end
    object cdsProdLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsProdCLASSIF1LOCAL: TStringField
      FieldName = 'CLASSIF1LOCAL'
    end
    object cdsProdCLASSIF2: TStringField
      FieldName = 'CLASSIF2'
    end
    object cdsProdCLASSIF3: TStringField
      FieldName = 'CLASSIF3'
    end
    object cdsProdCLASSIF4: TStringField
      FieldName = 'CLASSIF4'
    end
    object cdsProdQTPALETE: TIntegerField
      FieldName = 'QTPALETE'
    end
    object cdsProdDTCRIA: TDateField
      FieldName = 'DTCRIA'
    end
  end
  object dspProd: TDataSetProvider
    DataSet = sdsProd
    Left = 80
    Top = 184
  end
  object sdsProd: TSQLDataSet
    CommandText = 'select * from TBE_Produto'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 184
  end
  object sdsProdS: TSQLDataSet
    CommandText = 'select * from TBE_ProdSub'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 248
  end
  object dspProdS: TDataSetProvider
    DataSet = sdsProdS
    Left = 80
    Top = 248
  end
  object cdsProdS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdS'
    Left = 144
    Top = 248
    object cdsProdSID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdSNOMESUB: TStringField
      FieldName = 'NOMESUB'
      Size = 25
    end
    object cdsProdSATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsProdSLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsProdSLIGPROD: TIntegerField
      FieldName = 'LIGPROD'
    end
    object cdsProdSLIGKIT: TIntegerField
      FieldName = 'LIGKIT'
    end
    object cdsProdSCODCLI: TStringField
      FieldName = 'CODCLI'
    end
    object cdsProdSCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
    end
    object cdsProdSCODTRANSP: TStringField
      FieldName = 'CODTRANSP'
    end
    object cdsProdSQUANTSUBMIN: TIntegerField
      FieldName = 'QUANTSUBMIN'
    end
    object cdsProdSQUANTSUB: TIntegerField
      FieldName = 'QUANTSUB'
    end
    object cdsProdSQUANTUM: TIntegerField
      FieldName = 'QUANTUM'
    end
    object cdsProdSQUANTCALC: TIntegerField
      FieldName = 'QUANTCALC'
    end
    object cdsProdSBPADRAO: TSmallintField
      FieldName = 'BPADRAO'
    end
    object cdsProdSUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 5
    end
  end
  object sdsPPesq: TSQLDataSet
    CommandText = 
      'select a.CODBARRAS, a.CODCLI, a.CODTRANSP, a.id, '#13#10'a.LIGPROD, a.' +
      'LIGKIT, a.NOMESUB, a.ATIVO, a.QUANTSUB, '#13#10'a.QUANTSUBMIN, b.CLASS' +
      'IF1LOCAL, b.CLASSIF2, BVALIDADE '#13#10'from TBE_ProdSub a, TBE_Produt' +
      'o b '#13#10'where a.LIGPROD = b.id and a.LIGCLI = 25'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 304
  end
  object dspPPesq: TDataSetProvider
    DataSet = sdsPPesq
    Left = 80
    Top = 304
  end
  object cdsPPesq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPPesq'
    Left = 144
    Top = 304
    object cdsPPesqCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
    end
    object cdsPPesqCODCLI: TStringField
      FieldName = 'CODCLI'
    end
    object cdsPPesqCODTRANSP: TStringField
      FieldName = 'CODTRANSP'
    end
    object cdsPPesqID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPPesqLIGPROD: TIntegerField
      FieldName = 'LIGPROD'
    end
    object cdsPPesqLIGKIT: TIntegerField
      FieldName = 'LIGKIT'
    end
    object cdsPPesqNOMESUB: TStringField
      FieldName = 'NOMESUB'
      Size = 25
    end
    object cdsPPesqATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsPPesqQUANTSUB: TIntegerField
      FieldName = 'QUANTSUB'
    end
    object cdsPPesqQUANTSUBMIN: TIntegerField
      FieldName = 'QUANTSUBMIN'
    end
    object cdsPPesqCLASSIF1LOCAL: TStringField
      FieldName = 'CLASSIF1LOCAL'
    end
    object cdsPPesqCLASSIF2: TStringField
      FieldName = 'CLASSIF2'
    end
    object cdsPPesqBVALIDADE: TSmallintField
      FieldName = 'BVALIDADE'
    end
  end
  object sdsNF: TSQLDataSet
    CommandText = 'select * from TBE_NF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 360
  end
  object dspNF: TDataSetProvider
    DataSet = sdsNF
    Left = 80
    Top = 360
  end
  object cdsNF: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspNF'
    Left = 144
    Top = 360
    object cdsNFID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFDTCRIADO: TDateField
      FieldName = 'DTCRIADO'
    end
    object cdsNFDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsNFTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsNFVTOTAL: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
    object cdsNFVPRODS: TFMTBCDField
      FieldName = 'VPRODS'
      Precision = 9
      Size = 2
    end
    object cdsNFNUMITENS: TSmallintField
      FieldName = 'NUMITENS'
    end
    object cdsNFVOLUME: TSmallintField
      FieldName = 'VOLUME'
    end
    object cdsNFSTORIGEM: TSmallintField
      FieldName = 'STORIGEM'
    end
    object cdsNFSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsNFDOCREF: TStringField
      FieldName = 'DOCREF'
    end
    object cdsNFSTATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsNFSTATUSNFE: TSmallintField
      FieldName = 'STATUSNFE'
    end
    object cdsNFUSAARM: TSmallintField
      FieldName = 'USAARM'
    end
    object cdsNFUSAMOV: TSmallintField
      FieldName = 'USAMOV'
    end
    object cdsNFUSASEG: TSmallintField
      FieldName = 'USASEG'
    end
    object cdsNFUSAPACK: TSmallintField
      FieldName = 'USAPACK'
    end
    object cdsNFUSAEXP: TSmallintField
      FieldName = 'USAEXP'
    end
  end
  object cdsNFpesq: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspNF'
    Left = 200
    Top = 360
    object cdsNFpesqID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFpesqLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFpesqNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFpesqDTCRIADO: TDateField
      FieldName = 'DTCRIADO'
    end
    object cdsNFpesqDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsNFpesqTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsNFpesqVTOTAL: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
    object cdsNFpesqVPRODS: TFMTBCDField
      FieldName = 'VPRODS'
      Precision = 9
      Size = 2
    end
    object cdsNFpesqNUMITENS: TSmallintField
      FieldName = 'NUMITENS'
    end
    object cdsNFpesqVOLUME: TSmallintField
      FieldName = 'VOLUME'
    end
    object cdsNFpesqSTORIGEM: TSmallintField
      FieldName = 'STORIGEM'
    end
    object cdsNFpesqSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsNFpesqDOCREF: TStringField
      FieldName = 'DOCREF'
    end
    object cdsNFpesqSTATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsNFpesqSTATUSNFE: TSmallintField
      FieldName = 'STATUSNFE'
    end
    object cdsNFpesqUSAARM: TSmallintField
      FieldName = 'USAARM'
    end
    object cdsNFpesqUSAMOV: TSmallintField
      FieldName = 'USAMOV'
    end
    object cdsNFpesqUSASEG: TSmallintField
      FieldName = 'USASEG'
    end
    object cdsNFpesqUSAPACK: TSmallintField
      FieldName = 'USAPACK'
    end
    object cdsNFpesqUSAEXP: TSmallintField
      FieldName = 'USAEXP'
    end
  end
  object sdsNFi: TSQLDataSet
    CommandText = 
      'Select it.*, sub.NOMESUB, sub.codcli from TBE_NFITENS it, TBE_PR' +
      'ODSUB sub WHERE (sub.id = it.LIGSUB) and ligNF = 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 416
  end
  object dspNFi: TDataSetProvider
    DataSet = sdsNFi
    Left = 80
    Top = 416
  end
  object cdsNFi: TClientDataSet
    Aggregates = <>
    PacketRecords = 500
    Params = <>
    ProviderName = 'dspNFi'
    Left = 144
    Top = 416
    object cdsNFiID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFiLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFiNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFiDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsNFiTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsNFiVUNIT: TFMTBCDField
      FieldName = 'VUNIT'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsNFiVSUBT: TFMTBCDField
      FieldName = 'VSUBT'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsNFiQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object cdsNFiSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsNFiLIGPROD: TIntegerField
      FieldName = 'LIGPROD'
    end
    object cdsNFiLIGSUB: TIntegerField
      FieldName = 'LIGSUB'
    end
    object cdsNFiLIGNF: TIntegerField
      FieldName = 'LIGNF'
    end
    object cdsNFiSTATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsNFiQUANTLIDA: TIntegerField
      FieldName = 'QUANTLIDA'
    end
    object cdsNFiNOMESUB: TStringField
      FieldName = 'NOMESUB'
      Size = 40
    end
    object cdsNFiCODCLI: TStringField
      FieldName = 'CODCLI'
    end
  end
  object sdsCob: TSQLDataSet
    CommandText = 'select * from TBE_Cobra'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 264
    Top = 72
  end
  object dspCob: TDataSetProvider
    DataSet = sdsCob
    Left = 328
    Top = 72
  end
  object cdsCob: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCob'
    Left = 392
    Top = 72
    object cdsCobID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCobLIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCobBVALIDO: TSmallintField
      FieldName = 'BVALIDO'
    end
    object cdsCobDTCRADO: TDateField
      FieldName = 'DTCRADO'
    end
    object cdsCobDTVALIDO: TDateField
      FieldName = 'DTVALIDO'
    end
    object cdsCobARM_TIPO: TStringField
      FieldName = 'ARM_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsCobARM_PORC: TFMTBCDField
      FieldName = 'ARM_PORC'
      Precision = 9
      Size = 2
    end
    object cdsCobARM_AFIXO: TFMTBCDField
      FieldName = 'ARM_AFIXO'
      Precision = 9
      Size = 2
    end
    object cdsCobARM_ALIMITE: TFMTBCDField
      FieldName = 'ARM_ALIMITE'
      Precision = 9
      Size = 2
    end
    object cdsCobARM_AEXCEDE: TFMTBCDField
      FieldName = 'ARM_AEXCEDE'
      Precision = 9
      Size = 2
    end
    object cdsCobARM_MINIMO: TFMTBCDField
      FieldName = 'ARM_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsCobSEG_TAXA: TFMTBCDField
      FieldName = 'SEG_TAXA'
      Precision = 9
      Size = 2
    end
    object cdsCobSEG_DIA: TSmallintField
      FieldName = 'SEG_DIA'
    end
    object cdsCobSEG_MINIMO: TFMTBCDField
      FieldName = 'SEG_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsCobMOV_TIPO: TStringField
      FieldName = 'MOV_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsCobMOV_PORC: TFMTBCDField
      FieldName = 'MOV_PORC'
      Precision = 9
      Size = 2
    end
    object cdsCobMOV_DTIPO: TStringField
      FieldName = 'MOV_DTIPO'
      FixedChar = True
      Size = 1
    end
    object cdsCobMOV_DE_VALOR: TFMTBCDField
      FieldName = 'MOV_DE_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsCobMOV_DE_CONTAR: TSmallintField
      FieldName = 'MOV_DE_CONTAR'
    end
    object cdsCobMOV_DD_VALOR: TFMTBCDField
      FieldName = 'MOV_DD_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsCobMOV_DD_CONTAR: TSmallintField
      FieldName = 'MOV_DD_CONTAR'
    end
    object cdsCobMOV_DS_VALOR: TFMTBCDField
      FieldName = 'MOV_DS_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsCobMOV_DS_CONTAR: TSmallintField
      FieldName = 'MOV_DS_CONTAR'
    end
    object cdsCobMOV_MINIMO: TFMTBCDField
      FieldName = 'MOV_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsCobPACK_PORC: TFMTBCDField
      FieldName = 'PACK_PORC'
      Precision = 9
      Size = 2
    end
    object cdsCobPACK_VALOR: TFMTBCDField
      FieldName = 'PACK_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsCobPACK_CONTAR: TSmallintField
      FieldName = 'PACK_CONTAR'
    end
    object cdsCobPACK_MINIMO: TFMTBCDField
      FieldName = 'PACK_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsCobEXPED_PORC: TFMTBCDField
      FieldName = 'EXPED_PORC'
      Precision = 9
      Size = 2
    end
    object cdsCobEXPED_VALOR: TFMTBCDField
      FieldName = 'EXPED_VALOR'
      Precision = 9
      Size = 2
    end
    object cdsCobEXPED_CONTAR: TSmallintField
      FieldName = 'EXPED_CONTAR'
    end
    object cdsCobEXPED_MINIMO: TFMTBCDField
      FieldName = 'EXPED_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsCobPACK_TIPO: TSmallintField
      FieldName = 'PACK_TIPO'
    end
    object cdsCobEXPED_TIPO: TSmallintField
      FieldName = 'EXPED_TIPO'
    end
  end
  object sdsCob2: TSQLDataSet
    CommandText = 
      'select cob.id, cli.nome, cob.DTCRADO, cob.DTVALIDO, cob.SEG_DIA,' +
      ' cob.LigCli, cli.Ativo  from TBE_COBRA cob, TBE_CLIENTE cli '#13#10'wh' +
      'ere cli.id = cob.LIGCLI'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 264
    Top = 128
  end
  object dspCob2: TDataSetProvider
    DataSet = sdsCob2
    Left = 328
    Top = 128
  end
  object cdsCob2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCob2'
    Left = 392
    Top = 128
    object cdsCob2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCob2NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCob2DTCRADO: TDateField
      FieldName = 'DTCRADO'
    end
    object cdsCob2DTVALIDO: TDateField
      FieldName = 'DTVALIDO'
    end
    object cdsCob2SEG_DIA: TSmallintField
      FieldName = 'SEG_DIA'
    end
    object cdsCob2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsCob2ATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object cdsNFi2: TClientDataSet
    Aggregates = <>
    PacketRecords = 500
    Params = <>
    ProviderName = 'dspNFi'
    Left = 200
    Top = 416
    object cdsNFi2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFi2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsNFi2NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFi2DTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsNFi2TIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsNFi2VUNIT: TFMTBCDField
      FieldName = 'VUNIT'
      Precision = 9
      Size = 2
    end
    object cdsNFi2VSUBT: TFMTBCDField
      FieldName = 'VSUBT'
      Precision = 9
      Size = 2
    end
    object cdsNFi2QUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object cdsNFi2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsNFi2LIGPROD: TIntegerField
      FieldName = 'LIGPROD'
    end
    object cdsNFi2LIGSUB: TIntegerField
      FieldName = 'LIGSUB'
    end
    object cdsNFi2LIGNF: TIntegerField
      FieldName = 'LIGNF'
    end
    object cdsNFi2STATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsNFi2QUANTLIDA: TIntegerField
      FieldName = 'QUANTLIDA'
    end
    object cdsNFi2NOMESUB: TStringField
      FieldName = 'NOMESUB'
      Size = 40
    end
  end
  object cdsLi0: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspLi'
    Left = 384
    Top = 472
    object cdsLi0ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLi0LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsLi0NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsLi0DTCRIADO: TDateField
      FieldName = 'DTCRIADO'
    end
    object cdsLi0DTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsLi0TIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsLi0VTOTAL: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
    object cdsLi0VPRODS: TFMTBCDField
      FieldName = 'VPRODS'
      Precision = 9
      Size = 2
    end
    object cdsLi0NUMITENS: TSmallintField
      FieldName = 'NUMITENS'
    end
    object cdsLi0VOLUME: TSmallintField
      FieldName = 'VOLUME'
    end
    object cdsLi0STORIGEM: TSmallintField
      FieldName = 'STORIGEM'
    end
    object cdsLi0STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsLi0DOCREF: TStringField
      FieldName = 'DOCREF'
    end
    object cdsLi0STATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsLi0STATUSNFE: TSmallintField
      FieldName = 'STATUSNFE'
    end
    object cdsLi0USAARM: TSmallintField
      FieldName = 'USAARM'
    end
    object cdsLi0USAMOV: TSmallintField
      FieldName = 'USAMOV'
    end
    object cdsLi0USASEG: TSmallintField
      FieldName = 'USASEG'
    end
    object cdsLi0USAPACK: TSmallintField
      FieldName = 'USAPACK'
    end
    object cdsLi0USAEXP: TSmallintField
      FieldName = 'USAEXP'
    end
    object cdsLi0LIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsLi0NUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object cdsLi0BPED: TSmallintField
      FieldName = 'BPED'
    end
    object cdsLi0PESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsLi0DIMENSAO: TStringField
      FieldName = 'DIMENSAO'
      Size = 10
    end
    object cdsLi0STATUSDESC: TStringField
      FieldName = 'STATUSDESC'
      FixedChar = True
      Size = 9
    end
  end
  object cdsLi1: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspLi'
    Left = 440
    Top = 472
    object cdsLi1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLi1LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsLi1NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsLi1DTCRIADO: TDateField
      FieldName = 'DTCRIADO'
    end
    object cdsLi1DTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsLi1TIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsLi1VTOTAL: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
    object cdsLi1VPRODS: TFMTBCDField
      FieldName = 'VPRODS'
      Precision = 9
      Size = 2
    end
    object cdsLi1NUMITENS: TSmallintField
      FieldName = 'NUMITENS'
    end
    object cdsLi1VOLUME: TSmallintField
      FieldName = 'VOLUME'
    end
    object cdsLi1STORIGEM: TSmallintField
      FieldName = 'STORIGEM'
    end
    object cdsLi1STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsLi1DOCREF: TStringField
      FieldName = 'DOCREF'
    end
    object cdsLi1STATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsLi1STATUSNFE: TSmallintField
      FieldName = 'STATUSNFE'
    end
    object cdsLi1USAARM: TSmallintField
      FieldName = 'USAARM'
    end
    object cdsLi1USAMOV: TSmallintField
      FieldName = 'USAMOV'
    end
    object cdsLi1USASEG: TSmallintField
      FieldName = 'USASEG'
    end
    object cdsLi1USAPACK: TSmallintField
      FieldName = 'USAPACK'
    end
    object cdsLi1USAEXP: TSmallintField
      FieldName = 'USAEXP'
    end
    object cdsLi1LIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsLi1NUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object cdsLi1BPED: TSmallintField
      FieldName = 'BPED'
    end
    object cdsLi1PESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsLi1DIMENSAO: TStringField
      FieldName = 'DIMENSAO'
      Size = 10
    end
    object cdsLi1STATUSDESC: TStringField
      FieldName = 'STATUSDESC'
      FixedChar = True
      Size = 9
    end
  end
  object cdsLi2: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspLi'
    Left = 496
    Top = 472
    object cdsLi2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLi2LIGCLI: TIntegerField
      FieldName = 'LIGCLI'
    end
    object cdsLi2NUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsLi2DTCRIADO: TDateField
      FieldName = 'DTCRIADO'
    end
    object cdsLi2DTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object cdsLi2TIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsLi2VTOTAL: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
    object cdsLi2VPRODS: TFMTBCDField
      FieldName = 'VPRODS'
      Precision = 9
      Size = 2
    end
    object cdsLi2NUMITENS: TSmallintField
      FieldName = 'NUMITENS'
    end
    object cdsLi2VOLUME: TSmallintField
      FieldName = 'VOLUME'
    end
    object cdsLi2STORIGEM: TSmallintField
      FieldName = 'STORIGEM'
    end
    object cdsLi2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cdsLi2DOCREF: TStringField
      FieldName = 'DOCREF'
    end
    object cdsLi2STATUSCONFERE: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object cdsLi2STATUSNFE: TSmallintField
      FieldName = 'STATUSNFE'
    end
    object cdsLi2USAARM: TSmallintField
      FieldName = 'USAARM'
    end
    object cdsLi2USAMOV: TSmallintField
      FieldName = 'USAMOV'
    end
    object cdsLi2USASEG: TSmallintField
      FieldName = 'USASEG'
    end
    object cdsLi2USAPACK: TSmallintField
      FieldName = 'USAPACK'
    end
    object cdsLi2USAEXP: TSmallintField
      FieldName = 'USAEXP'
    end
    object cdsLi2LIGUSER: TIntegerField
      FieldName = 'LIGUSER'
    end
    object cdsLi2NUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object cdsLi2BPED: TSmallintField
      FieldName = 'BPED'
    end
    object cdsLi2PESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object cdsLi2DIMENSAO: TStringField
      FieldName = 'DIMENSAO'
      Size = 10
    end
    object cdsLi2STATUSDESC: TStringField
      FieldName = 'STATUSDESC'
      FixedChar = True
      Size = 9
    end
  end
  object sdsCf0: TSQLDataSet
    CommandText = 
      'Select LigSub, SUM(Quant) as Qt from TBE_NFitens '#13#10'WHERE LIGCLI ' +
      '= 25 '#13#10'and tipo = '#39'E'#39#13#10'and statusConfere <8 '#13#10'group by LigSUB'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 264
    Top = 192
  end
  object dspCf0: TDataSetProvider
    DataSet = sdsCf0
    Left = 328
    Top = 192
  end
  object cdsCf0: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCf0'
    Left = 392
    Top = 192
    object cdsCf0LIGSUB: TIntegerField
      FieldName = 'LIGSUB'
    end
    object cdsCf0QT: TLargeintField
      FieldName = 'QT'
    end
  end
  object sdsNFim: TSQLDataSet
    CommandText = 'select * from TBE_NFitens'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 16
    Top = 472
  end
  object dspNFim: TDataSetProvider
    DataSet = sdsNFim
    Left = 80
    Top = 472
  end
  object cdsNFim: TClientDataSet
    Aggregates = <>
    PacketRecords = 500
    Params = <>
    ProviderName = 'dspNFi'
    Left = 144
    Top = 472
    object IntegerField10: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField11: TIntegerField
      FieldName = 'LIGCLI'
    end
    object IntegerField12: TIntegerField
      FieldName = 'NUMNF'
    end
    object DateField7: TDateField
      FieldName = 'DTNOTA'
    end
    object StringField7: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'VUNIT'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'VSUBT'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object IntegerField13: TIntegerField
      FieldName = 'QUANT'
    end
    object SmallintField34: TSmallintField
      FieldName = 'STATUS'
    end
    object IntegerField14: TIntegerField
      FieldName = 'LIGPROD'
    end
    object IntegerField15: TIntegerField
      FieldName = 'LIGSUB'
    end
    object IntegerField16: TIntegerField
      FieldName = 'LIGNF'
    end
    object SmallintField35: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object IntegerField17: TIntegerField
      FieldName = 'QUANTLIDA'
    end
  end
  object sdsCf1: TSQLDataSet
    CommandText = 
      'Select distinct lignf from TBE_NFitens '#13#10'WHERE LIGCLI = 25 '#13#10'and' +
      ' tipo = '#39'E'#39#13#10'and statusConfere <8 and status < 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 264
    Top = 248
  end
  object dspCf1: TDataSetProvider
    DataSet = sdsCf1
    Left = 328
    Top = 248
  end
  object cdsCf1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCf1'
    Left = 392
    Top = 248
    object cdsCf1LIGNF: TIntegerField
      FieldName = 'LIGNF'
    end
  end
  object sdsNFdt: TSQLDataSet
    CommandText = 'Select id, NumNF, NumPed  from TBE_NF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 256
    Top = 416
  end
  object dspNFdt: TDataSetProvider
    DataSet = sdsNFdt
    Left = 320
    Top = 416
  end
  object cdsNFdt: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspNFdt'
    Left = 384
    Top = 416
    object cdsNFdtID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFdtNUMNF: TIntegerField
      FieldName = 'NUMNF'
    end
    object cdsNFdtNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
  end
  object sdsLi: TSQLDataSet
    CommandText = 
      'Select TBE_NF.*, CASE status WHEN 0 THEN '#39'Iniciada'#39' WHEN 1 THEN ' +
      #39'Pronta'#39' WHEN 2 THEN '#39'Conferida'#39' WHEN 3 THEN '#39'Estoque'#39' WHEN 4 TH' +
      'EN '#39'Cancelada'#39' END StatusDesc   from TBE_NF where id = 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 256
    Top = 472
  end
  object dspLi: TDataSetProvider
    DataSet = sdsLi
    Left = 320
    Top = 472
  end
  object sdsStok: TSQLDataSet
    CommandText = 
      'Select a.id, a.NOMELONGO, a.QUANTIDADE, a.DTMOV,'#13#10' a.DINVENTARIO' +
      ', a.QUANTMIN, a.CLASSIF1LOCAL, b.CODCLI '#13#10'from TBE_PRODUTO a, TB' +
      'E_PRODSUB b'#13#10'WHERE a.id=b.ligprod and  a.LIGCLI=25 and a.QUANTID' +
      'ADE > 0 '#13#10'order by a.nomelongo'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 456
    Top = 16
  end
  object dspStok: TDataSetProvider
    DataSet = sdsStok
    Left = 520
    Top = 16
  end
  object cdsStok: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStok'
    Left = 584
    Top = 16
    object cdsStokID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsStokNOMELONGO: TStringField
      FieldName = 'NOMELONGO'
      Size = 60
    end
    object cdsStokQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsStokDTMOV: TDateField
      FieldName = 'DTMOV'
    end
    object cdsStokDINVENTARIO: TDateField
      FieldName = 'DINVENTARIO'
    end
    object cdsStokQUANTMIN: TIntegerField
      FieldName = 'QUANTMIN'
    end
    object cdsStokCLASSIF1LOCAL: TStringField
      FieldName = 'CLASSIF1LOCAL'
    end
    object cdsStokCODCLI: TStringField
      FieldName = 'CODCLI'
    end
  end
  object sdsStoks: TSQLDataSet
    CommandText = 
      'Select id, nomesub, quantsub, quantum, quantcalc, '#13#10'codtransp, c' +
      'odcli '#13#10'from TBE_PRODSUB where ligprod = 2 order by nomesub'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 456
    Top = 72
  end
  object dspStoks: TDataSetProvider
    DataSet = sdsStoks
    Left = 520
    Top = 72
  end
  object cdsStoks: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStoks'
    Left = 584
    Top = 72
    object cdsStoksID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsStoksNOMESUB: TStringField
      FieldName = 'NOMESUB'
      Size = 40
    end
    object cdsStoksQUANTSUB: TIntegerField
      FieldName = 'QUANTSUB'
    end
    object cdsStoksQUANTUM: TIntegerField
      FieldName = 'QUANTUM'
    end
    object cdsStoksQUANTCALC: TIntegerField
      FieldName = 'QUANTCALC'
    end
    object cdsStoksCODTRANSP: TStringField
      FieldName = 'CODTRANSP'
    end
    object cdsStoksCODCLI: TStringField
      FieldName = 'CODCLI'
    end
  end
  object sdsStokh: TSQLDataSet
    CommandText = 
      'Select first 15 dtcriado, tipo, nomeuser, quant, ligsub,'#13#10'case t' +
      'ipo when '#39'E'#39' then '#39'Entrada'#39' when '#39'S'#39' then '#39'Sa'#237'da'#39' when '#39'D'#39' then ' +
      #39'Devolu'#231#227'o'#39' when '#39'M'#39' then '#39'Mov Interna'#39' when '#39'A'#39' then '#39'Ajustes'#39' ' +
      'end as tipoDesc,'#13#10'modomodifica, numdoc'#13#10'from TBE_PRODMOVE'#13#10'where' +
      ' ligsub = 1'#13#10'order by dtcriado desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConSTOK
    Left = 456
    Top = 128
  end
  object dspStokh: TDataSetProvider
    DataSet = sdsStokh
    Left = 520
    Top = 128
  end
  object cdsStokh: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStokh'
    Left = 584
    Top = 128
    object cdsStokhDTCRIADO: TDateField
      FieldName = 'DTCRIADO'
    end
    object cdsStokhTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsStokhNOMEUSER: TStringField
      FieldName = 'NOMEUSER'
      Size = 12
    end
    object cdsStokhQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object cdsStokhLIGSUB: TIntegerField
      FieldName = 'LIGSUB'
    end
    object cdsStokhTIPODESC: TStringField
      FieldName = 'TIPODESC'
      FixedChar = True
      Size = 11
    end
    object cdsStokhMODOMODIFICA: TStringField
      FieldName = 'MODOMODIFICA'
      FixedChar = True
      Size = 1
    end
    object cdsStokhNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
  end
  object cdsLi4: TClientDataSet
    Aggregates = <>
    PacketRecords = 200
    Params = <>
    ProviderName = 'dspLi'
    Left = 552
    Top = 472
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'LIGCLI'
    end
    object IntegerField3: TIntegerField
      FieldName = 'NUMNF'
    end
    object DateField1: TDateField
      FieldName = 'DTCRIADO'
    end
    object DateField2: TDateField
      FieldName = 'DTNOTA'
    end
    object StringField1: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VTOTAL'
      Precision = 9
      Size = 2
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'VPRODS'
      Precision = 9
      Size = 2
    end
    object SmallintField1: TSmallintField
      FieldName = 'NUMITENS'
    end
    object SmallintField2: TSmallintField
      FieldName = 'VOLUME'
    end
    object SmallintField3: TSmallintField
      FieldName = 'STORIGEM'
    end
    object SmallintField4: TSmallintField
      FieldName = 'STATUS'
    end
    object StringField2: TStringField
      FieldName = 'DOCREF'
    end
    object SmallintField5: TSmallintField
      FieldName = 'STATUSCONFERE'
    end
    object SmallintField6: TSmallintField
      FieldName = 'STATUSNFE'
    end
    object SmallintField7: TSmallintField
      FieldName = 'USAARM'
    end
    object SmallintField8: TSmallintField
      FieldName = 'USAMOV'
    end
    object SmallintField9: TSmallintField
      FieldName = 'USASEG'
    end
    object SmallintField10: TSmallintField
      FieldName = 'USAPACK'
    end
    object SmallintField11: TSmallintField
      FieldName = 'USAEXP'
    end
    object IntegerField4: TIntegerField
      FieldName = 'LIGUSER'
    end
    object IntegerField5: TIntegerField
      FieldName = 'NUMPED'
    end
    object SmallintField12: TSmallintField
      FieldName = 'BPED'
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'PESO'
      Precision = 9
      Size = 2
    end
    object StringField3: TStringField
      FieldName = 'DIMENSAO'
      Size = 10
    end
    object StringField4: TStringField
      FieldName = 'STATUSDESC'
      FixedChar = True
      Size = 9
    end
  end
end
