unit uImpXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, ExtCtrls, ComCtrls,
  Buttons, FileCtrl, ACBrNFe, ACBrBase, ACBrDFe, ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass, ACBrDFeReport, ACBrDFeDANFeReport;

type
  TimpXML = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbCli: TComboBox;
    e_dir: TJvDirectoryEdit;
    e_arqs: TFileListBox;
    Label3: TLabel;
    lbQT: TLabel;
    btIMP: TBitBtn;
    Bevel1: TBevel;
    pb: TProgressBar;
    Label4: TLabel;
    ckColeta: TCheckBox;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    procedure e_dirChange(Sender: TObject);
    procedure btIMPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  impXML: TimpXML;
  idCli, nArqs : Integer;
  dirAp : String;
  okServ:boolean;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM4, uBanco, pcnNFe, ACBrNFeNotasFiscais, pcnProcNFe, uLib, uRastreio;

{ TimpXML }

procedure TimpXML.Entrar;
begin
  // inicia Cliente
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', '');
  idCli := 0;
  cbCli.ItemIndex := 0;
  // Diretorio
  e_dir.Directory := 'C:\';
  // Inicia Barra
  pb.Min := 0;
  pb.Max := 10;
  pb.Position := 0;
  // Inicia lbQT
  lbQT.Caption := '0';
end;

procedure TimpXML.e_dirChange(Sender: TObject);
begin
  e_arqs.Directory := e_dir.Directory;
  nArqs := 0;
  if (e_arqs.Items.Count > 0) then nArqs := e_arqs.Items.Count;
  lbQT.Caption := IntToStr(nArqs);
  pb.Position := 0;

end;

procedure Copiar_Arquivo2(arq, dir_o, dir_d : String);

Var
  S, T: TFileStream;
  Origem, Destino : String;

Begin
  Origem  := dir_o+'\'+arq;
  Destino := dir_d+'\'+arq;

  S := TFileStream.Create( Origem, fmOpenRead );
  try
    T := TFileStream.Create( Destino, fmOpenWrite or fmCreate );
    try
      T.CopyFrom(S, S.Size ) ;
    finally
      T.Free;
    end;
  finally
    S.Free;
  end;
end;

function Muda_Numero(n : String): Integer;

var resp, i : integer;
    s, s1 : String;
    fim : Boolean;

begin
  s := '0';
  fim := false;
  i := 1;
  s1 := trim(n);

  while (i <= Length(s1)) and not fim do
  begin
    if (s1[i] in ['0'..'9']) then s := s + s1[i];
    if (s<>'0') and  (not (s1[i] in ['0'..'9'])) then fim := true;
    i := i + 1;
  end;

  resp := StrToInt(s);

  Muda_Numero := resp;
end;


function Ler(arqNF : String):boolean;

var Bco : TBco;
    Rast : TRastreio;
    // Nota Fiscal
    cli, num, serie, vol, tlc, tipolocal, ncep : integer;
    vlr, peso : Double;
    cep, loc, nome, foneD : String;
    dtnf : tDateTime;
    ok : boolean;

    trpn, trpc,
    ender, cp, ba, cid, cmn,est, cnpj, ie, chave : String;
    ncasa : integer;

begin
  with ImpXML do
  begin
    ok := false;
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(arqNF);
    // ListBox1.Items.Append(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome);
    { TODO : Continuar fazendo a Lista das Importações }


    // :::::: Importa NOTA FISCAL
    cli  := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');

    num  := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
    serie:= ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.Serie;

    vol :=0;
    peso:= 0;
    if (ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Count > 0) then
    begin
       vol  := ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Items[0].qVol;
       peso := ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Items[0].pesoB;
    end;

    vlr  := ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
    if  Not(ckColeta.Checked) then
    begin
      // verifica endereço de entrega
      if Length(ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xLgr)  > 2 then
      begin
        cep  := IntToStr( ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.CEP );
        loc  := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xMun;
        dtnf := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;
        nome := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xNome;
      end
      else
      begin
        cep  := IntToStr( ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.CEP );
        loc  := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.xMun;
        dtnf := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;
        nome := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.xNome;
      end;
    end
   else
    begin
      cep  := IntToStr( ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.CEP );
      loc  := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun;
      dtnf := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;
      nome := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome;
    end;

    cep := copy('00000'+cep, Length(cep)-2, 8);

    if (vol = 0) then vol := 5;
    if (peso = 0) then peso := 0.5*vol;

    // --- Tipo Local
              // SP - Capital
          tlc  := 1;
          ncep := StrToint(copy(cep,1,5));
          // Interior
          if (ncep >= 10000) and (ncep < 20000) then
          begin
            tlc  := 3; // interior
            //conta_int := conta_int + 1;
          end;

          // GSP
          if (ncep >= 06000) and (ncep < 10000) then
          begin
            tlc := 2; // GSP
          end;

          // OUTROS
          if (ncep >= 20000) then
          begin
            tlc := 4; // Outros Estados
            //conta_out := conta_out + 1;
          end;

    // :::::: Importa ESPELHO
    trpn := ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta.xNome;
    trpc := ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta.CNPJCPF;

    if  Not(ckColeta.Checked) then
    begin
      // verifica endereço de entrega
      if Length(ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xLgr)  > 2 then
      begin
        ender:= ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xLgr;
        cp   := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xCpl;
        ba   := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xBairro;
        cid  := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.xMun;
        cmn  := IntToStr( ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.cMun );
        est  := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.UF;
        ncasa:= Muda_Numero( ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.nro );
        cnpj := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.CNPJCPF;
        ie   := ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.IE;
        foneD:= ACBrNFe1.NotasFiscais.Items[0].NFe.Entrega.fone;
      end
      else
      begin
        ender:= ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.xLgr;
        cp   := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.xCpl;
        ba   := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.xBairro;
        cid  := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.xMun;
        cmn  := IntToStr( ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.cMun );
        est  := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.UF;
        ncasa:= Muda_Numero( ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.nro );
        cnpj := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
        ie   := ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.IE;
        foneD:= ACBrNFe1.NotasFiscais.Items[0].NFe.Dest.EnderDest.fone;
      end;
    end
    else
    begin
      ender:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr;
      cp   := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xCpl;
      ba   := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xBairro;
      cid  := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun;
      cmn  := IntToStr( ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cMun );
      est  := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF;
      ncasa:= Muda_Numero( ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.nro );
      cnpj := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
      ie   := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IE;
      foneD:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.fone;
    end;

    chave:= ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.chNFe;

    Bco := TBco.Create;

    if Not(Bco.Notas_Existe(cli, num, vol, vlr)) then
    begin
      // Grava NF
      Bco.Notas_XML_Importa(cli, num, vol, vlr, peso, cep, loc, dtnf, tlc, nome, foneD, cnpj, serie);
      // EVENTO NF - Rastreio
      Rast := TRastreio.Create;
      Rast.set_ocor(num, cli,serie, evrImportado);
      Rast.Destroy;

      // Grava Espelho
      Bco.Espelho_XML_Importa(cli, num, vol, vlr, peso, cep, loc,trpn, trpc, nome, ender, cp, ba, cid, cmn, est, ncasa, 0, cnpj, ie, chave);
      ok := true;
    end
    else
    begin
      // Grava Espelho
      Bco.Notas_XML_Importa_Alt(cli, num,serie, vol, vlr, peso, cep, loc,  nome, foneD, cnpj);
      Bco.Espelho_XML_Altera(cli, num, vol, vlr, peso, cep, loc,trpn, trpc, nome, ender, cp, ba, cid, cmn, est, ncasa, 0, cnpj, ie, chave);
    end;

    Bco.Destroy;

  end;
  Ler := ok;
end;


procedure TimpXML.btIMPClick(Sender: TObject);

var j, conta : integer;
    dirO, dirD, dirAplic : String;

begin
  if (nArqs > 0) and (okServ) then
  begin

    dirO := e_dir.Directory;
    dirD := dirAp+'\NFeLidas';
    if not DirectoryExists(dirD) then CreateDir(dirD);

    conta := 0;
    j := 0;
    pb.Max := nArqs - 1;
    pb.Position := 0;
    while (j < nArqs) do
    begin
      //ShowMessage('Itens: '+IntToStr(e_arqs.Items.count)+ ' - '+dirO+'\'+e_arqs.Items[j]);
      if (Ler(dirO+'\'+ e_arqs.Items[j])) then conta := conta + 1;
      Copiar_Arquivo2(e_arqs.Items[j], dirO, dirD);
      deleteFile(dirO+'\'+ e_arqs.Items[j]);

      pb.Position := j + 1;
      j := j + 1;
    end;
    ShowMessage('Notas Importadas: '+IntToStr(conta)+' de '+IntToStr(nArqs));
  end
  else ShowMessage('Esta pasta não possui arquivos XML!');

end;
procedure TimpXML.FormCreate(Sender: TObject);

var usa : TMarco;

begin
  getDir(0,dirAp);
  usa := TMarco.Create;
  usa.Le_INI;
  okServ := usa.TestaCon(DM4.ConectaCONH, usa.get_EspelhoServ);
  usa.Destroy;
end;

end.
