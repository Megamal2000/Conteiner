object DM2: TDM2
  OldCreateOrder = False
  Height = 494
  Width = 318
  object sdsTMP: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 16
  end
  object sdsConta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 80
  end
  object sdsVazio: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 144
  end
  object sdsDBCp: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 200
  end
  object sdsUser: TSQLDataSet
    CommandText = 'select * from TB_USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 256
  end
  object dspTMP: TDataSetProvider
    DataSet = sdsTMP
    Left = 104
    Top = 16
  end
  object cdsTMP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMP'
    Left = 160
    Top = 16
  end
  object dspConta: TDataSetProvider
    DataSet = sdsConta
    Left = 104
    Top = 80
  end
  object cdsConta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConta'
    Left = 160
    Top = 80
  end
  object dspVazio: TDataSetProvider
    DataSet = sdsVazio
    Left = 104
    Top = 144
  end
  object cdsVazio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVazio'
    Left = 160
    Top = 144
  end
  object dspDBCp: TDataSetProvider
    DataSet = sdsDBCp
    Left = 104
    Top = 200
  end
  object cdsDBCp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDBCp'
    Left = 160
    Top = 200
  end
  object dspUser: TDataSetProvider
    DataSet = sdsUser
    Left = 104
    Top = 256
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUser'
    Left = 160
    Top = 256
    object cdsUserID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsUserLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 12
    end
    object cdsUserSENHA: TStringField
      FieldName = 'SENHA'
      Size = 12
    end
    object cdsUserULTACESSO: TSQLTimeStampField
      FieldName = 'ULTACESSO'
    end
    object cdsUserNIVEL: TSmallintField
      FieldName = 'NIVEL'
    end
    object cdsUserUSSTATUS: TSmallintField
      FieldName = 'USSTATUS'
    end
  end
  object sdsSP: TSQLDataSet
    CommandType = ctStoredProc
    DbxCommandType = 'Dbx.StoredProcedure'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 320
  end
  object dspSP: TDataSetProvider
    DataSet = sspSP
    Left = 104
    Top = 320
  end
  object cdsSP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMP'
    Left = 160
    Top = 320
  end
  object sspSP: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 376
  end
  object sdsTMP2: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 40
    Top = 432
  end
  object dspTMP2: TDataSetProvider
    DataSet = sdsTMP2
    Left = 104
    Top = 432
  end
  object cdsTMP2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMP2'
    Left = 160
    Top = 432
  end
  object sspExec: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM1.Conexao
    Left = 256
    Top = 24
  end
  object sspInicia: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'IDNF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'NUMROMA'
        ParamType = ptInput
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
      end>
    SQLConnection = DM1.Conexao
    StoredProcName = 'SP_FRETE_INICIO'
    Left = 256
    Top = 80
  end
end
