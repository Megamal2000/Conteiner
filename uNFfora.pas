unit uNFfora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TNFfora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edNum: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edEVn: TEdit;
    edEVc: TEdit;
    Label4: TLabel;
    edEVd: TEdit;
    btInsere: TBitBtn;
    Label5: TLabel;
    cbCli: TComboBox;
    Lista: TListBox;
    Label6: TLabel;
    Label7: TLabel;
    lbNota: TLabel;
    lbResp: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure edEVnKeyPress(Sender: TObject; var Key: Char);
    procedure edEVcKeyPress(Sender: TObject; var Key: Char);
    procedure btInsereClick(Sender: TObject);
    procedure edNumExit(Sender: TObject);
    procedure edEVnExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idU(i : Integer);
  end;

var
  NFfora: TNFfora;
  idNota : Integer;
  idFora : Integer;
  idu    : integer;

implementation

{$R *.dfm}


uses uDM1, uDM2, uDM3, uBanco, Global, DB;

procedure Limpa();
begin
  with NFfora do
  begin
    edNum.Text := '';
    edEVn.Text := '';
    edEVc.Text := '';
    edEVd.Text := '';
    btInsere.Enabled := false;
  end;
end;


procedure TNFfora.FormActivate(Sender: TObject);

var arq : String;

begin
  if (Lista.Items.Count = 0) then
  begin
    getDir(0, arq);
    Lista.Items.LoadFromFile(arq+'\Listas\NFFora.MZI');
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE' , 'NOME', ' ativo = 1 ');
    DM2.DBCp_Pos(cbCli,'TB_CLIENTE', IntToStr(idCli), 'NOME');
  end;
  limpa;
  edNum.SetFocus;
end;

procedure ProcuraNota(snum : String);

var Bco : Tbco;
    idC : Integer;
    nNF : Integer;
begin
  // Entrada
  idC := DM2.DBCp_leid(NFfora.cbCli.Items[NFfora.cbCli.ItemIndex],'TB_CLIENTE', 'Nome');
  nNF := StrToint(NFfora.edNum.Text);

  Bco := TBco.Create;
  Bco.NotasFora_PesqNF(nNF, idC);
  Bco.Destroy;

  idFora := 0;
{
  ======================================================
    NENHUM Encontrado
  --------------------------
}

  if (DM3.cdsNFora.RecordCount = 0) then
  begin
    NFFora.lbNota.Font.Color  := clred;
    NFFora.lbNota.Caption := NFfora.edNum.Text;
    NFfora.lbResp.Caption := 'Nota Não encntrada  ou já está am algum romaneio ';
    idNota := 0;
    idFora := 0;
    NFfora.btInsere.Enabled := false;
  end;
{
  ======================================================
    Encontrei apenas um
  --------------------------
}

  if (DM3.cdsNFora.RecordCount = 1) then
  begin
    Bco := TBco.Create;
    Bco.NotasFora_PesqEV(nNF);
    Bco.Destroy;

    NFFora.lbNota.Font.Color  := clred;

    if (DM3.cdsFora.RecordCount > 0) then
    begin
      NFfora.lbNota.Caption := NFfora.edNum.Text;
      NFfora.lbResp.Caption := 'Nota já lançada';
      idNota := DM3.cdsForaLIGNF.Value;
      idFora := DM3.cdsForaID.Value;
      NFfora.btInsere.Enabled := True;
      // preenche
      NFfora.edEVn.Text := DM3.cdsForaEVNUM.AsString;
      NFfora.edEVc.Text := '';
      NFfora.edEVd.Text := DM3.cdsForaEVDESC.value;


    end
    else
    begin
      NFFora.lbNota.Font.Color  := clBlue;
      NFFora.lbNota.Caption := NFfora.edNum.Text;
      NFfora.lbResp.Caption := '(1) Nota encontrada = Peso: '+DM3.cdsNForaPESO.AsString+' e Valor: '+DM3.cdsNForaVALOR.AsString;
      idNota := DM3.cdsNForaID.Value;
      idFora := 0;
      NFfora.btInsere.Enabled := True;
    end;


  end;

  if (DM3.cdsNFora.RecordCount > 1) then
  begin
    DM3.cdsNFora.Last;
    NFFora.lbNota.Caption := NFfora.edNum.Text;
    NFfora.lbResp.Caption := 'Nota encontrada = Peso: '+DM3.cdsNForaPESO.AsString+' e Valor: '+DM3.cdsNForaVALOR.AsString;
    idNota := DM3.cdsNForaID.Value;
    idFora := 0;
    NFfora.btInsere.Enabled := True;
  end;
  if  (NFfora.btInsere.Enabled) then NFfora.edEVn.SetFocus
    else NFfora.edNum.Text := '';
end;

procedure ProcuraEvento();

var
    i, casas : Integer;
    s, txt : String;
    nu, ne: integer;


begin
  with NFfora do
  begin
    s := '';
    ne := StrToInt(edEVn.Text);
    for i:= 0 to Lista.Items.Count - 1 do
    begin
      txt := Lista.Items[i];

      if (txt[2] = '-') then casas := 1;
      if (txt[3] = '-') then casas := 2;

      nu := StrToInt(copy(Lista.Items[i],0,casas));
      if (nu = ne) then s := copy(Lista.Items[i], 4,Length(Lista.Items[i]));
      //ShowMessage('ne: '+IntToStr(ne)+ ' // '+ 'nu: '+IntToStr(nu));
    end;


    if (s <> '') then
    begin
      if (StrToInt(edEVn.Text)=1) then edEVc.SetFocus;
      if (StrToInt(edEVn.Text)>1) then btInsere.SetFocus;
      edEVd.Text := s;
    end
    else
    begin
      edEVd.SetFocus;
    end;

  end;
end;



procedure TNFfora.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if (edNum.Text <> '') then
      ProcuraNota(edNum.Text);
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;
end;

procedure TNFfora.edEVnKeyPress(Sender: TObject; var Key: Char);
begin

  if (Key = #13) then
    if (edEVn.Text <> '') then ProcuraEvento;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;

end;

procedure TNFfora.edEVcKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    edEVd.Text := edEVd.Text + edEVc.Text;
    btInsere.SetFocus;
  end;
end;

procedure TNFfora.btInsereClick(Sender: TObject);

var Bco : Tbco;
    obs : String;
begin
  obs := copy(edEVd.Text, 1, 50);
  Bco := TBco.Create;
  if (idFora>0) then
    Bco.NotasFora_Altera(idFora, idU, StrToInt(edEVn.text),obs  )
  else
    Bco.NotasFora_Insere(idNota, idU, StrToInt(edNum.text),StrToInt(edEVn.text),obs);
  Bco.Destroy;
  Limpa;
  edNum.SetFocus;
end;

procedure TNFfora.set_idU(i: Integer);
begin
  idU := i;
end;

procedure TNFfora.edNumExit(Sender: TObject);
begin
  if (edNum.Text <> '') then
      ProcuraNota(edNum.Text);

end;

procedure TNFfora.edEVnExit(Sender: TObject);
begin
    if (edEVn.Text <> '') then ProcuraEvento;
end;

end.
