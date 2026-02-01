object Temp: TTemp
  Left = 0
  Top = 0
  Caption = 'Temp'
  ClientHeight = 471
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 850
    Height = 471
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 161
        Height = 13
        Caption = 'L'#234' arquivos XML e preenche Tab1'
      end
      object Label2: TLabel
        Left = 288
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Label2'
      end
      object Label3: TLabel
        Left = 16
        Top = 200
        Width = 156
        Height = 13
        Caption = 'L'#234' on'#250'meros no Banco de Dados'
      end
      object ts1BTler: TBitBtn
        Left = 192
        Top = 11
        Width = 75
        Height = 25
        Caption = 'Ler'
        TabOrder = 0
        OnClick = ts1BTlerClick
      end
      object ts1DBGrid1: TJvDBUltimGrid
        Left = 16
        Top = 42
        Width = 642
        Height = 145
        DataSource = JvDataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
            FieldName = 'NumNota'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ChaveArq'
            Width = 289
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIF'
            Width = 19
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ChaveBD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CSTAT'
            Visible = True
          end>
      end
      object ts1ARQS: TFileListBox
        Left = 664
        Top = 42
        Width = 145
        Height = 145
        ItemHeight = 13
        Mask = '*.XML'
        TabOrder = 2
      end
      object ts1DIR: TJvDirectoryEdit
        Left = 664
        Top = 15
        Width = 144
        Height = 21
        DialogKind = dkWin32
        InitialDir = 'C:\MZp'
        TabOrder = 3
        Text = ''
        OnChange = ts1DIRChange
      end
      object ts1BTLe2: TBitBtn
        Left = 192
        Top = 193
        Width = 75
        Height = 25
        Caption = 'Ler BD'
        TabOrder = 4
        OnClick = ts1BTLe2Click
      end
      object pb: TProgressBar
        Left = 496
        Top = 193
        Width = 312
        Height = 17
        TabOrder = 5
      end
      object ts1BTxl: TBitBtn
        Left = 288
        Top = 193
        Width = 75
        Height = 25
        Caption = 'Exporta XL'
        TabOrder = 6
        OnClick = ts1BTxlClick
      end
      object ts1Grava: TBitBtn
        Left = 384
        Top = 193
        Width = 75
        Height = 25
        Caption = 'Grava'
        TabOrder = 7
        OnClick = ts1GravaClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
  object Tab1: TJvMemoryData
    FieldDefs = <
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'ChaveArq'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CSTAT'
        DataType = ftInteger
      end
      item
        Name = 'ChaveBD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DIF'
        DataType = ftSmallint
      end>
    Left = 300
    Top = 32
    object Tab1NumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object Tab1ChaveArq: TStringField
      FieldName = 'ChaveArq'
      Size = 50
    end
    object Tab1CSTAT: TIntegerField
      FieldName = 'CSTAT'
    end
    object Tab1ChaveBD: TStringField
      FieldName = 'ChaveBD'
      Size = 50
    end
    object Tab1DIF: TSmallintField
      FieldName = 'DIF'
    end
  end
  object ACBrCTe1: TACBrCTe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 316
    Top = 112
  end
  object JvDataSource1: TJvDataSource
    DataSet = Tab1
    Left = 548
    Top = 48
  end
end
