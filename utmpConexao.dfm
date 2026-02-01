object tmpConexao: TtmpConexao
  Left = 199
  Top = 114
  Caption = 'Configura a Conex'#227'o com o Banco de Dados'
  ClientHeight = 104
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCon: TLabel
    Left = 24
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Conex'#227'o'
  end
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 78
    Height = 13
    Caption = 'Digite o Servidor'
  end
  object lbConexao: TLabel
    Left = 88
    Top = 16
    Width = 60
    Height = 13
    Caption = 'lbConexao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 425
    Top = 4
    Width = 31
    Height = 13
    Caption = 'A0002'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edServ: TEdit
    Left = 112
    Top = 38
    Width = 345
    Height = 21
    TabOrder = 0
    Text = 'edServ'
    OnKeyDown = edServKeyDown
  end
  object btTestar: TBitBtn
    Left = 136
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Testar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btTestarClick
  end
  object btCancelar: TBitBtn
    Left = 368
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelarClick
  end
end
