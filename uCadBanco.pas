unit uCadBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCadBanco = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    edDesc: TEdit;
    Label2: TLabel;
    edBanco: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edAgNum: TJvValidateEdit;
    edAgDig: TJvValidateEdit;
    edContaNum: TJvValidateEdit;
    edContaDig: TJvValidateEdit;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    btSenha: TJvSpeedItem;
    lbAtivo: TLabel;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  CadBanco: TCadBanco;
  idCB:Integer;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM5;

procedure Limpa();
begin
  with CadBanco do
  begin
    edDesc.Text      := '';
    edBanco.Text     := '';
    edAgNum.Value    := 0;
    edAgDig.Value    := 0;
    edContaNum.Value := 0;
    edContaDig.Value := 0;
    idCB := 0;
  end;
end;

procedure Preenche();
begin
  with CadBanco do
  begin
    edDesc.Text      := DM5.cdsCCDESCREVE.Value;
    edBanco.Text     := DM5.cdsCCNOMEBANCO.Value;
    edAgNum.Value    := DM5.cdsCCNUMAGENCIA.Value;
    edAgDig.Value    := DM5.cdsCCDIGAGENCIA.Value;
    edContaNum.Value := DM5.cdsCCNUMCONTA.Value;
    edContaDig.Value := DM5.cdsCCDIGCONTA.Value;
    idCB := DM5.cdsCCID.Value;
  end;
end;

procedure Salva();
  var Bco : TBco;
      ap, nome : String;
      ag1, ag2, cta1, cta2 : Integer;
begin

  Bco := TBco.Create;
  with CadBanco do
  begin
    // Pega valores
    ap   := edDesc.Text;
    nome := edBanco.Text     ;
    ag1  := edAgNum.Value    ;
    ag2  := edAgDig.Value    ;
    cta1 := edContaNum.Value ;
    cta2 := edContaDig.Value ;
  end;
  // Salva
  if (idCB>0) then
    Bco.CC_Altera(idCB, ap, nome, ag1, ag2, cta1, cta2)
  else
    Bco.CC_Insere(ap, nome, ag1, ag2, cta1, cta2);
  // Finaliza
  Limpa;
  Bco.CC_Mostra;
  Bco.Destroy;
end;

procedure Apaga();
var Bco : TBco;
    st : Smallint;
begin
  st := 0;
  if DM5.cdsCCATIVO.Value = 0 then st := 1;

  Bco := TBco.Create;
  Bco.CC_AlteraStatus(DM5.cdsCCID.Value, st);
  Bco.CC_Mostra;
  Bco.Destroy;
end;


procedure TCadBanco.btApagarClick(Sender: TObject);
begin
  // APaga
  if idCB>0 then
  begin
    Apaga;
    Limpa;
  end;
end;

procedure TCadBanco.btNovoClick(Sender: TObject);
begin
  // Inserir Novo
  Limpa;
  edDesc.SetFocus;
end;

procedure TCadBanco.btSalvarClick(Sender: TObject);
begin
  //  Grava
  Salva;
  edDesc.SetFocus;
end;

procedure TCadBanco.Entrar;
var Bco:TBco;

begin
  Limpa;
  Bco := TBco.Create;
  Bco.CC_Mostra;
  Bco.Destroy;
end;

procedure TCadBanco.JvDBGrid1DblClick(Sender: TObject);
begin
  if DM5.cdsCC.RecordCount>0 then Preenche;
end;

procedure TCadBanco.JvDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if (DM5.cdsCCATIVO.Value = 0) then
  if not (gdSelected in State) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsStrikeOut];
    JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Field ,State);
  end;
end;

end.
