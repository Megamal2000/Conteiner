object Graficos: TGraficos
  Left = 212
  Top = 136
  Caption = 'Graficos'
  ClientHeight = 457
  ClientWidth = 767
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 767
    Height = 113
    ActivePage = Graf3
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 0
    object Graf1: TTabSheet
      Caption = 'Graf1 - Romaneios ('#250'ltimos)'
      object Label1: TLabel
        Left = 32
        Top = 8
        Width = 266
        Height = 13
        Caption = 'Mostra a quantidade de romaneios dos '#250'ltimos 12 meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btGraf1: TButton
        Left = 32
        Top = 40
        Width = 201
        Height = 25
        Caption = 'ver Gr'#225'fico (1)'
        TabOrder = 0
        OnClick = btGraf1Click
      end
    end
    object Graf2: TTabSheet
      Caption = 'Graf2 - Romaneios (Ano)'
      ImageIndex = 1
      object Label2: TLabel
        Left = 32
        Top = 8
        Width = 285
        Height = 13
        Caption = 'Mostra a quantidade de Romaneios dos meses do Ano dado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 416
        Top = 8
        Width = 19
        Height = 13
        Caption = 'Ano'
      end
      object spAno: TJvSpinEdit
        Left = 448
        Top = 6
        Width = 57
        Height = 21
        MaxValue = 2099.000000000000000000
        MinValue = 2011.000000000000000000
        Value = 2015.000000000000000000
        TabOrder = 0
      end
      object btGraf2: TBitBtn
        Left = 40
        Top = 40
        Width = 201
        Height = 25
        Caption = 'ver Gr'#225'fico (2)'
        TabOrder = 1
        OnClick = btGraf2Click
      end
    end
    object Graf3: TTabSheet
      Caption = 'Graf3 - Romaneios (Frete)'
      ImageIndex = 2
      object Label4: TLabel
        Left = 32
        Top = 8
        Width = 310
        Height = 13
        Caption = 'Mostra o total de Frete recebido nos meses de um Ano por Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 416
        Top = 8
        Width = 19
        Height = 13
        Caption = 'Ano'
      end
      object Label6: TLabel
        Left = 402
        Top = 40
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object spAno2: TJvSpinEdit
        Left = 448
        Top = 6
        Width = 57
        Height = 21
        MaxValue = 2099.000000000000000000
        MinValue = 2011.000000000000000000
        Value = 2015.000000000000000000
        TabOrder = 0
      end
      object btGraf3: TBitBtn
        Left = 40
        Top = 40
        Width = 201
        Height = 25
        Caption = 'ver Gr'#225'fico (3)'
        TabOrder = 1
        OnClick = btGraf3Click
      end
      object cbCli: TComboBox
        Left = 448
        Top = 38
        Width = 273
        Height = 21
        TabOrder = 2
        Text = 'cbCli'
      end
      object BitBtn1: TBitBtn
        Left = 272
        Top = 40
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        TabOrder = 3
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 353
        Top = 40
        Width = 75
        Height = 25
        Caption = 'BitBtn2'
        TabOrder = 4
        OnClick = BitBtn2Click
      end
      object Edit1: TEdit
        Left = 448
        Top = 65
        Width = 252
        Height = 21
        TabOrder = 5
        Text = 'Edit1'
      end
    end
    object Graf4: TTabSheet
      Caption = 'Graf4 - Ocorr'#234'ncias ('#250'ltimos 10 dias)'
      ImageIndex = 3
    end
  end
  object telaChart1: TChart
    Left = 16
    Top = 136
    Width = 737
    Height = 305
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 128
    Width = 743
    Height = 313
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DM2.cdsDBCp
    Left = 216
    Top = 160
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'Conect'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
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
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=localhost:F:\XEtrab\Bancos\Flaydel\CEPS2.fdb'
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
      'ServerCharSet=win1252'
      'Trim Char=False')
    Left = 472
    Top = 168
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 568
    Top = 256
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 480
    Top = 256
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select * from CEP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 352
    Top = 256
  end
end
