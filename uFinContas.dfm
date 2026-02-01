object FinContas: TFinContas
  Left = 0
  Top = 0
  Caption = 'Gerenciar Contas do Financeiro (Plano deContas)'
  ClientHeight = 503
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 57
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 233
    Height = 446
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 78
      Height = 13
      Caption = 'Plano de Contas'
    end
    object TreeView1: TTreeView
      Left = 10
      Top = 27
      Width = 217
      Height = 398
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Indent = 19
      ParentFont = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      OnCustomDrawItem = TreeView1CustomDrawItem
      OnDblClick = TreeView1DblClick
      Items.NodeData = {
        03040000002E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0003000000010852006500630065006900740061007300320000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010A5400720061006E
        00730070006F00720074006500340000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000000000000010B410072006D0061007A0065006E00610067
        0065006D00380000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010D560065006E00640061002000640065002000420065006E0073
        002A0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010643007500730074006F0073002E0000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000108440065007300700065007300610073
        002A0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        0001064F007500740072006F007300}
    end
  end
  object Panel3: TPanel
    Left = 233
    Top = 57
    Width = 347
    Height = 446
    Align = alClient
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 57
      Height = 23
      Caption = 'Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbMens: TLabel
      Left = 96
      Top = 24
      Width = 33
      Height = 13
      Caption = 'lbMens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 167
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
      Visible = False
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 16
      Width = 75
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 1
      Visible = False
      OnClick = BitBtn2Click
    end
    object Panel4: TPanel
      Left = 6
      Top = 56
      Width = 331
      Height = 129
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 23
        Height = 13
        Caption = 'N'#237'vel'
      end
      object lbNiv: TLabel
        Left = 44
        Top = 24
        Width = 27
        Height = 13
        Caption = 'lbNiv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 80
        Top = 24
        Width = 29
        Height = 13
        Caption = 'Conta'
      end
      object lbConta: TLabel
        Left = 113
        Top = 24
        Width = 209
        Height = 13
        AutoSize = False
        Caption = 'lbConta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 16
        Top = 79
        Width = 281
        Height = 4
      end
      object lbAtivo: TLabel
        Left = 16
        Top = 53
        Width = 33
        Height = 13
        Caption = 'lbAtivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ckAtivo: TCheckBox
        Left = 80
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btAlt: TBitBtn
        Left = 128
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 1
        OnClick = btAltClick
      end
      object btSubN: TBitBtn
        Left = 216
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Inserir SubN'
        TabOrder = 2
        OnClick = btSubNClick
      end
      object edConta: TEdit
        Left = 113
        Top = 20
        Width = 207
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 3
        Text = 'edConta'
      end
      object btCancel: TBitBtn
        Left = 128
        Top = 89
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btCancelClick
      end
      object btSalvar: TBitBtn
        Left = 216
        Top = 89
        Width = 75
        Height = 25
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btSalvarClick
      end
      object btApagar: TBitBtn
        Left = 16
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Apagar'
        TabOrder = 6
        OnClick = btApagarClick
      end
    end
    object PanelSub: TPanel
      Left = 8
      Top = 200
      Width = 329
      Height = 113
      TabOrder = 3
      object Label5: TLabel
        Left = 16
        Top = 24
        Width = 23
        Height = 13
        Caption = 'N'#237'vel'
      end
      object lbSub: TLabel
        Left = 44
        Top = 24
        Width = 27
        Height = 13
        Caption = 'lbNiv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 80
        Top = 24
        Width = 29
        Height = 13
        Caption = 'Conta'
      end
      object Bevel2: TBevel
        Left = 16
        Top = 63
        Width = 297
        Height = 4
      end
      object edSub: TEdit
        Left = 113
        Top = 20
        Width = 207
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 0
        Text = 'edConta'
      end
      object btCancelSub: TBitBtn
        Left = 129
        Top = 73
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btCancelSubClick
      end
      object btSalvarSub: TBitBtn
        Left = 214
        Top = 73
        Width = 75
        Height = 25
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btSalvarSubClick
      end
    end
  end
end
