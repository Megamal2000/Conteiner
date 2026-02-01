unit uIBGE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TIBGE = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    edPesq: TEdit;
    btProcura: TBitBtn;
    DBGrid1: TDBGrid;
    procedure edPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btProcuraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_cid(s : string);
    procedure set_uf(s : string);
    procedure set_saida(i : Smallint);
    procedure PesquisaFORA;
    function  Procura3(cidade, estado : String):String;
    function PesquisaValor:String;
    procedure ConectaIBGE;
  end;

var
  IBGE: TIBGE;
  cid, uf : string;
  saida : Smallint;
  codMun : integer;

implementation

{$R *.dfm}

uses uLib, uDM1, uDM2, ucadCli, uCtePad, uConhLista, uCteDet, uTinyNF;

{ TIBGE }

procedure Sair(tipo :Smallint);

begin
  // Desliga o Banco
  DM1.cdsIBGE.Active := False;
  DM1.IBGE.Connected := False;

  // Cliente
  if (saida = 1) then
  begin
    cadCli.edCmun.Value := codMun;
    cadCli.Show;
  end;

  // CT-e Padrão (emitente)
  if (saida = 2) then
  begin
    CtePad.edCmun.Value := codMun;
    CtePad.Show;
  end;

    // Espelho
  if (saida = 3) then
  begin
    ConhLista.CodMunicipio := codMun;
  end;


  // CT-e detalhes
  if (saida = 4) then
  begin
    CteDet.edCmun.Value := codMun;
    CteDet.Show;
  end;


  if (tipo=1) then IBGE.Hide;
end;

function Conecta : boolean;

var S : String;
    ok : Boolean;
    usa : TMarco;

begin
  usa := TMarco.Create;
  ok := False;
  usa.Le_INI;

  S := usa.get_ibgeServ;
  ok := usa.TestaCon(DM1.IBGE,S);
  if not ok then
  begin
    ShowMessage('Não posso conectar no banco IBGE');
    IBGE.Hide;
  end;
  Conecta := ok;
end;

procedure Procura1;

var sq : String;
    erro : integer;

begin
  codMun := 0;
  erro := 0;
  if (cid='') or (uf='') then erro := 1
  else
  begin
    sq := 'SELECT * FROM Municipios WHERE UPPER(MUNIC) = '+QuotedStr(UpperCase(cid)) + ' and UPPER(UF) = '+QuotedStr(UpperCase(uf))+ ' ';
    DM2.Roda_SQL(DM1.sdsIBGE, DM1.cdsIBGE, sq);
    if (Dm1.cdsIBGE.RecordCount > 0) then codMun := DM1.cdsIBGECMUN.Value
      else erro := 2;
  end;

  if (erro > 0) then
  begin
    IBGE.Show;
    IBGE.edPesq.setfocus;
    IBGE.DBGrid1.Visible := False;
  end
    else sair(0);
end;

procedure Procura2;

var p, sq : String;

begin
  p := UpperCase(TRIM(IBGE.edPesq.Text));

  sq := 'SELECT * FROM Municipios WHERE UPPER(MUNIC) like '+ QuotedStr(p+'%') + ' order by Munic';
  DM2.Roda_SQL(DM1.sdsIBGE, DM1.cdsIBGE, sq);

  IBGE.DBGrid1.Visible := (DM1.cdsIBGE.RecordCount > 0);

end;

Function Procura4 : String;
  var sq, resp : String;

begin
  resp := '';
  sq := 'SELECT * FROM Municipios WHERE UPPER(MUNIC) = '+QuotedStr(UpperCase(cid)) + ' and UPPER(UF) = '+QuotedStr(UpperCase(uf))+ ' ';
  DM2.Roda_SQL(DM1.sdsIBGE, DM1.cdsIBGE, sq);

  resp := DM1.cdsIBGECMUN.AsString;
  result := resp;
end;



procedure TIBGE.PesquisaFORA;
begin
  if (Conecta) then Procura1;
end;

function TIBGE.PesquisaValor: String;

begin
  result := procura4;;
end;

procedure TIBGE.set_cid(s: string);
begin
  cid := s;
end;

procedure TIBGE.set_saida(i: Smallint);
begin
  saida := i;
end;

procedure TIBGE.set_uf(s: string);
begin
  uf := s;
end;

procedure TIBGE.edPesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then Procura2;
end;

procedure TIBGE.btProcuraClick(Sender: TObject);
begin
  Procura2;
end;

procedure TIBGE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saida := 0;
  sair(0);
end;

procedure TIBGE.ConectaIBGE;
begin
  if not Conecta then showmessage('Não consegui conectar no Banco IBGE');
end;

procedure TIBGE.DBGrid1DblClick(Sender: TObject);
begin
  codMun := DM1.cdsIBGECMUN.Value;
  sair(1);
end;

function TIBGE.Procura3(cidade, estado: String): String;

var sq, resp : String;
    erro : integer;

begin
  resp := '0';
  if (conecta) then
  begin

    codMun := 0;
    erro := 0;
    if (cidade='') or (estado='') then erro := 1
    else
    begin
      sq := 'SELECT * FROM Municipios WHERE Upper(MUNIC) = '+QuotedStr(UpperCase(cidade)) + ' and UF = '+QuotedStr(estado)+ ' ';
      DM2.Roda_SQL(DM1.sdsIBGE, DM1.cdsIBGE, sq);
      if (Dm1.cdsIBGE.RecordCount > 0) then codMun := DM1.cdsIBGECMUN.Value
        else erro := 2;
    end;

    if (erro > 0) then resp := 'erro'
      else resp := intToStr(codMun);
  end;
  Procura3 := resp;
end;

end.
