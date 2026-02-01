unit uCteGer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ImgList, StdCtrls, ComCtrls, Mask, JvExMask, JvSpin,
  Buttons, Grids, DBGrids, ExtCtrls, ACBrBase, ACBrValidador, ACBrDFe,
  ACBrCTe, ACBrCTeDACTEClass, ACBrCTeDACTeRLClass, pcnConversao, pcteConversaoCte,
  System.ImageList, ACBrDFeReport, DateUtils, JvDataSource, JvExDBGrids,
  JvDBGrid, JvGIF, Vcl.Imaging.GIFImg, JvExControls, JvAnimatedImage, JvGIFCtrl ;


type
  TCTeGer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    lbMarca: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rb01: TRadioButton;
    rb02: TRadioButton;
    rb03: TRadioButton;
    rb04: TRadioButton;
    btAtual: TBitBtn;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    edNum: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    btCriar: TBitBtn;
    btValidar: TBitBtn;
    btAssinar: TBitBtn;
    ckMostra: TCheckBox;
    btImp1: TBitBtn;
    btEnviar: TBitBtn;
    btImprimir: TBitBtn;
    btCancelar: TBitBtn;
    btVeNota: TBitBtn;
    ImpCopias: TJvSpinEdit;
    Resp: TRichEdit;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    NovoNmeroNF1: TMenuItem;
    CancelarNmero1: TMenuItem;
    RcuperarArquivoAutorizado1: TMenuItem;
    N1: TMenuItem;
    GerarNotaComplementar1: TMenuItem;
    CartadeCorreo1: TMenuItem;
    ImageList2: TImageList;
    CodMunicpio1: TMenuItem;
    VerificaCNPJCPF1: TMenuItem;
    MemoEventos: TMemo;
    PanelEmissao: TPanel;
    Label4: TLabel;
    lbCte: TLabel;
    Label6: TLabel;
    lbNF: TLabel;
    Label8: TLabel;
    dtEmissao: TDateTimePicker;
    btAltDt: TBitBtn;
    btAltNao: TBitBtn;
    AlteradatadeEmisso1: TMenuItem;
    Label5: TLabel;
    lbQt: TLabel;
    ACBrCTe1: TACBrCTe;
    ACBrCTeDACTeRL1: TACBrCTeDACTeRL;
    ACBrValidador1: TACBrValidador;
    pb: TProgressBar;
    Memo1: TMemo;
    N3: TMenuItem;
    N2: TMenuItem;
    VisualizarXML1: TMenuItem;
    cbCli: TComboBox;
    Panel3: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btErros: TButton;
    btArq: TBitBtn;
    Panel4: TPanel;
    JvGIFAnimator1: TJvGIFAnimator;
    procedure btAtualClick(Sender: TObject);
    procedure btCriarClick(Sender: TObject);
    procedure btImp1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btValidarClick(Sender: TObject);
    procedure btAssinarClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure RcuperarArquivoAutorizado1Click(Sender: TObject);
    procedure CodMunicpio1Click(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelarClick(Sender: TObject);
    procedure btVeNotaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure VerificaCNPJCPF1Click(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure AlteradatadeEmisso1Click(Sender: TObject);
    procedure btAltNaoClick(Sender: TObject);
    procedure btAltDtClick(Sender: TObject);
    procedure VisualizarXML1Click(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure dt1Change(Sender: TObject);
    procedure btErrosClick(Sender: TObject);
    procedure btArqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  CTeGer: TCTeGer;
  msgSaida : String;
  pesqSIm : Boolean;
  Posicao : TBookmark;
  // Gravar pesquisa
  dat1, dat2 : TDateTime;
  tipoMostra : Smallint;
  tipoPesq   : Smallint;
  numPesq    : String;
  PastaFinal : String;
  PastaPDF   : String;


implementation

{$R *.dfm}

uses uDM1, uDM2, uDM4, uBanco, uLib, uIBGE,  uCteDet, uAguarde, uCteEdit, uCTeVer,
  uCTeErros, ExcelResponde;


procedure Inicia_Memo(processo:string);
 var selqt : Integer;
begin
  with CteGer do
  begin
    selqt :=  DBGrid1.SelectedRows.Count;
    Resp.Clear;
    if (selqt>0) then
    begin
      Resp.SelAttributes.Color := clGreen;
      Resp.Lines.Append('>> '+FormatDateTime('dd/MM/yyyy ddd HH:mm', Now) + ' '+ processo);
      Resp.SelAttributes.Color := clBlue;
      Resp.Lines.Append('  ** Selecionados '+selqt.ToString+ ' Conhecimentos ');
      Resp.Lines.Append('...');
    end
    else
    begin
      Resp.SelAttributes.Color := clRed;
      Resp.Lines.Append('  xx ERRO: Nenhum conhecimento selecionado ');
    end;

  end;
end;
procedure Pesquisa(sNum:String);

var Bco : Tbco;

begin
  Bco := TBco.Create;
  Bco.Cte_Ger_Pesq(sNum);
  Bco.Destroy;
end;

procedure Mostra_Lista();

var st : Smallint;
    Bco : TBco;
    Bco1: TBco;

    Posicao : TBookmark;
    nCli : Integer;
    nErros : Integer;
    tempo : TdateTime;
    quadro1Thread : TThread;
    quadro2Thread : TThread;


begin

  with CteGer do
    begin
      if not (pesqSIM) then
      begin
        nCli := DM2.DBCp_leid(cbCli.Items[cbCli.itemIndex], 'TB_Cliente', 'NOME');
        st := tipoMostra;
        Bco := TBco.Create;
        tempo := Now;
        Bco.Cte_Ger_Mostrar(dat1, dat2, st, nCli);
        tempo := Now - tempo;
        Label3.Caption := FormatDateTime('hh:nn ss zzz', tempo);
        Bco.Cte_Ger_MostrarNao(dat1, dat2);
        nErros := Bco.Cte_Erros_Conta(dat1, dat2);
        Bco.Destroy;

//        nCli := DM2.DBCp_leid(cbCli.Items[cbCli.itemIndex], 'TB_Cliente', 'NOME');
//        st := tipoMostra;
//
//        // Prepara Thread
//        quadro1Thread := TThread.CreateAnonymousThread(procedure
//        begin
//          // O que será feito em 2o plano
//          Bco1 := TBco.Create;
//          tempo := Now;
//          Bco1.Cte_Ger_Mostrar(dat1, dat2, st, nCli);
//          Bco1.Destroy;
//
//          // O que será feito quando terminar
//          quadro1Thread.Synchronize(nil, procedure
//          begin
//            tempo := Now - tempo;
//            Label3.Caption := FormatDateTime('hh:nn ss zzz', tempo);
//            Panel4.Visible := false;
//            lbQt.Caption := DM4.cdsCteG.RecordCount.ToString;
//            Resp.Lines.Append('    ['+FormatDateTime('dd/MM ddd HH:mm',Now)+'] '+lbQt.Caption + ' Conhecimentos Mostrados ' );
//            Resp.Lines.Append(' FIM do quadro 1 ' );
//
//
//          end);
//
//        end);
//
//        quadro1Thread.Start;
//
//          Bco := TBco.Create;
//          Bco.Cte_Ger_MostrarNao(dat1, dat2);
//          nErros := Bco.Cte_Erros_Conta(dat1, dat2);
//          Bco.Destroy;

//        quadro2Thread := TThread.CreateAnonymousThread(procedure
//        begin
//          // O que será feito em 2o plano
//          Bco1 := TBco.Create;
//          Bco1.Cte_Ger_MostrarNao(dat1, dat2);
//          nErros := Bco1.Cte_Erros_Conta(dat1, dat2);
//          Bco1.Destroy;
//           // O que será feito quando terminar
//          quadro2Thread.Synchronize(nil, procedure
//          begin
//            Resp.Lines.Append(' FIM do quadro 2 ' );
//          end);
//
//        end);
//
//        quadro2Thread.Start;

//        Bco := TBco.Create;
//        Bco.Cte_Ger_MostrarNao(dat1, dat2);
//        nErros := Bco.Cte_Erros_Conta(dat1, dat2);
//        Bco.Destroy;

      end
      else
        Pesquisa(numPesq);


      btErros.Visible := false;
      if nErros > 0 then
      begin
        btErros.Caption := nErros.ToString+ ' Erros';
        btErros.Visible := true;
      end;

    end;

end;


procedure TCTeGer.btAtualClick(Sender: TObject);


begin

//  Panel4.Visible := true;
//  JvGIFAnimator1.Animate := true;


  pesqSIM := false;
  if (rb01.Checked) then tipoMostra := 1;
  if (rb02.Checked) then tipoMostra := 3;
  if (rb03.Checked) then tipoMostra := 2;
  if (rb04.Checked) then tipoMostra := 4;
  dat1 := dt1.DateTime;
  dat2 := dt2.DateTime;

  Mostra_Lista;
end;

procedure pastaMeses(dt:TDateTime;Pasta:String);

var am : String;

begin
  am := FormatDateTime('yyyyMM',dt);
  PastaFinal := Pasta + '\'+ am;
  if not(DirectoryExists(PastaFinal)) then CreateDir(PastaFinal);
end;

procedure TCTeGer.Entrar;

var Bco : TBco;

begin

  pb.Visible := false;
  dt1.DateTime := Now - 8;
  dt2.DateTime := Now;

  // Configura Clientes
  cbCli.Clear;
  cbCli.Items.Append('<TODOS>');
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  cbCli.ItemIndex := 0;

  PanelEmissao.Visible := false;
  dt1.DateTime := Now - 2;
  dt2.DateTime := Now;
  rb01.Checked := True;
  edNum.Text   := '';
  Resp.Clear;
  //Mostra_Lista;

    Bco := TBco.Create;
    Bco.CTe_Padrao_Mostra(1);
    if Bco.Config_AMB_Mostra = 1 then
    begin
      // Produção
      CTeGer.Caption := 'Gerenciamento de CT-e (SEFAZ Oficial)';
      ACBrCTe1.Configuracoes.WebServices.Ambiente := taProducao;
    end
    else
    begin
      // Homologação (testes(
      CTeGer.Caption := 'Gerenciamento de CT-e (Ambiente de Testes)';
      ACBrCTe1.Configuracoes.WebServices.Ambiente := taProducao;
    end;

    Bco.Destroy;

  pastaMeses(Now,DM4.cdsCtePPASTAXML.Value);
  ACBrCTe1.Configuracoes.Arquivos.PathCTe := PastaFinal;


end;

procedure TCTeGer.JvDBGrid1CellClick(Column: TColumn);
  var Bco : TBco;
begin
  if (DM4.cdsCTneLIGCLI.Value > 0) then
  begin
    rb01.Checked := true;
    Bco := Tbco.Create;
    //Bco.Cte_Ger_MostrarNaoDet(dt1.DateTime, dt2.DateTime, DM4.cdsCTneLIGCLI.Value);
    Bco.Cte_Ger_MostrarNaoDetf(DM4.cdsCTneLIGCLI.Value);
    Bco.Destroy;
    lbQt.Caption := DM4.cdsCTneQT.AsString +  ' CTe´s não emitidos ';
  end;

end;

procedure Grava_Arquivo(id:Integer; Arquivo:String);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cte_AlterarArq(id, Arquivo);
  Bco.Destroy;
end;

function Converte_Arquivo(pasta, nomeArq:String; cstat:integer) : String;

var  resp,exte  : String;
     NomeA : String;

begin
  resp := 'nada';
  exte := '-temp.xml';
  if cstat = 100 then exte := '-CTe.xml';
  if cstat = 101 then exte := '-Cancelado.xml';
  if cstat = 102 then exte := '-Inutilizado.xml';
  if (cstat = 110) or (cstat=301) or (cstat=302) or (cstat=303) then exte := '-Denegado.xml';


  if not (DirectoryExists(pasta)) then CreateDir(pasta);

  if (nomeArq<>'-') then
  begin
    // Monta o nome do arquivo
    NomeA := nomeArq;
    NomeA := copy(NomeA,4,Length(NomeA)-3)+exte;

    resp := pasta+'\'+NomeA;
  end;

  Converte_Arquivo := resp;
end;


function Cpf(CPF_Text: string): boolean;

var n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
       d1,d2: integer;
       digitado, calculado: string;
begin
   n1:=StrToInt(CPF_Text[1]);
   n2:=StrToInt(CPF_Text[2]);
   n3:=StrToInt(CPF_Text[3]);
   n4:=StrToInt(CPF_Text[5]);
   n5:=StrToInt(CPF_Text[6]);
   n6:=StrToInt(CPF_Text[7]);
   n7:=StrToInt(CPF_Text[9]);
   n8:=StrToInt(CPF_Text[10]);
   n9:=StrToInt(CPF_Text[11]);
                     d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);
   if d1>=10 then d1:=0;
        d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
    d2:=11-(d2 mod 11);
    if d2>=10 then
       d2:=0;
    calculado:=inttostr(d1)+inttostr(d2);
   digitado:=CPF_Text[13]+CPF_Text[14];
   if calculado=digitado then
       Cpf:=true
   else
       Cpf:=false;
end;

function corrige_cpfcnpj(doc:String):String;

var p3, p11,p11ok, resp : String;

begin
  p3  := copy(doc, 1,  3);
  p11 := copy(doc, 4, 14);
  if length(p11) < 11 then p11ok := copy('00000000000', 1, 11-length(p11)) + p11
    else p11ok := p11;

  resp := doc;
  if (p3 = '000') then
    if cpf(p11ok) then
      resp := p11ok;
  corrige_cpfcnpj := resp;
end;
 { TODO : Erros no Gerenciar CTe }
procedure Marca_Erro(idCT, erro:Integer);

begin
  {
    Erros marcados no STATUS do CTe
    90 = Base = 0
    91 = Base > 1000
    maior que 100.. Rejeição
    = 424 ; Código do município
    = 204 : Duplicidade
    = 208 : CNPJ do destinatário inválido
    = 539 : Duplicidade com Chave diferente
    = 238 : Data atrasada
  }
  DM2.Altera_Status('TB_CONHEC', 'STATUS', idCT, erro);
end;

procedure CT_Criar(LigTransp, LigCli, NumCT:Integer);

var Bco : TBco;
    RNtrc, Arq, ArqAnterior : String;
    ts, cMunE, cMunI, cMunF, nErro : Integer;
    usa : TMarco;
    ok : Boolean;
    // Grupo de notas
    gPeso, gValor : Double;
    gVol : Integer;
    ChaveCT: String;

    dtEmite : TDateTime;
    icampo : Smallint;
    iToma      : Smallint;


begin
  // Limpa TUDO - cria novo

  CteGer.ACBRCte1.Conhecimentos.Clear;
{
  ============================================
  Lê os dados nos Bancos
  ============================================
}
  usa := TMarco.Create;
  usa.Le_INI;
  ok := usa.TestaCon(DM4.ConectaCONH, usa.get_EspelhoServ);
  usa.Destroy;

  if (ok) then
  begin
    Bco := TBco.Create;
    Bco.CTe_Padrao_Mostra(LigTransp);
    Bco.Cliente_MostraId(LigCli);
    Bco.Enderecos_MostraId('C', LigCli);
    Bco.Tels_MostraTodos('C',LigCli);
    Bco.Espelho_Mostra(LigCli, DM4.cdsCteGNUMNOTA.value);
    Bco.Conhec_MostraNF(DM4.cdsCteGLIGNOTA.Value);
    Bco.Notas_MostraId(DM4.cdsCteGLIGNOTA.Value);
    iToma := Bco.Conhec_TomadorLe(DM4.cdsCteGID.Value);
    Bco.Destroy;

    // ANTES de Iniciar
    cMunE := 0;
    cMunI := 0;
    cMunF := 0;
    if (Length(DM4.cdsCtePeCODMUN.Value) > 0) then
      cMunE := DM4.cdsCtePeCODMUN.AsInteger;
    if (Length(DM1.cdsEnderCODMUN.value) > 0) then
      cMunI := DM1.cdsEnderCODMUN.AsInteger;
    if (Length(trim(DM4.cdsEspelhoCODMUNICIPIO.Value))>0) then
      cMunF := DM4.cdsEspelhoCODMUNICIPIO.AsInteger;

    Arq := '';
    {
    if (Length(DM4.cdsCteGARQUIVO.Value)>5) then
      pastaMeses(DM4.cdsCteGDATAC.AsDateTime,DM4.cdsCtePPASTAXML.Value)
    else
    }
    // pastaMeses = mota PastaFinal
    dtEmite := Now;
    if not DM4.cdsCteGDATAC.IsNull  then
    if DM4.cdsCteGDATAC.Value <> dtEMite then
    begin
      if (dtEmite - DM4.cdsCteGDATAC.Value <=2) then dtEmite := DM4.cdsCteGDATAC.Value
      else
      begin
         if (MonthOf(dtEmite) <> MonthOf(DM4.cdsCteGDATAC.Value)) then
         begin
           pastaMeses(DM4.cdsCteGDATAC.Value,DM4.cdsCtePPASTAXML.Value);
           ArqAnterior := Converte_Arquivo(PastaFinal, DM4.cdsCteGARQUIVO.Value, 100);
           if FileExists(ArqAnterior) then DeleteFile(ArqANterior);
         end;
         Bco := TBco.Create;
         Bco.Conhec_AlteraEmissao(DM4.cdsCteGID.value, dtEmite);
         Bco.Destroy;

      end;
    end;

    pastaMeses(dtEmite,DM4.cdsCtePPASTAXML.Value);
    ArqAnterior := Converte_Arquivo(PastaFinal, DM4.cdsCteGARQUIVO.Value, 100);

    // Preenche o CT-e
    with CteGer.ACBRCte1.Conhecimentos.Add.CTe do
    begin
     // -----------------------------------
     // Dados de Identificação do CT-e
     // ***********************************
     CteGer.ACBRCte1.Configuracoes.Geral.ModeloDF := moCTe;
     CteGer.ACBRCte1.Configuracoes.Geral.VersaoDF := ve400;

     // ++++ Configurações Iniciais +++++++
     Ide.tpAmb := taHomologacao;
     case DM4.cdsCtePAMBIENTE.Value of
      0:  Ide.tpAmb:= taProducao;
      1:  Ide.tpAmb:= taHomologacao;
     end;

     ts := 0;
     {
     Mudar
     case ts of
        0 :  Ide.forPag:= pfp;
        1 :  Ide.forPag:= 1;
     end;
     }
     ts := 0;
     case ts of
      0: Ide.tpEmis:=teNormal;
      1: Ide.tpEmis:=teContingencia;
      2: Ide.tpEmis:=teSCAN;
      3: Ide.tpEmis:=teDPEC;
      4: Ide.tpEmis:=teFSDA;
     end;

     ts := 0;
     {
     Mudar
     case ts of
      0: Ide.tpCTe:=tc;
      1: Ide.tpCTe:=tcComplemento;
      2: Ide.tpCTe:=tcAnulacao;
      3: Ide.tpCTe:=tcSubstituto;
     end;
     }


     // ++++ Outros Dados +++++++++++++++++
     Ide.modelo  := 57;
     Ide.serie   := 1;
     Ide.nCT     := NumCT ;
     Ide.cCT     := NumCT ;  // para eviatr mudança no número da chave
     Ide.dhEmi   := Now;
     Ide.CFOP    := 5353;
     if (DM4.cdsEspelhoESTADO.Value<> 'SP') then Ide.CFOP    := 6353;

     // ++++ FIXAR Chave CTe +++++++++++++++++
     Ide.cCT   := 17000000 + 3*CteGer.DBGrid1.Datasource.Dataset.Fields[0].AsInteger;

     Ide.natOp   :='PRESTAÇÃO DE SERVIÇO DE TRANSPORTE';

     case iToma  of
       0: Ide.toma03.Toma := tmRemetente;
       1: Ide.toma03.Toma := tmExpedidor;
       2: Ide.toma03.Toma := tmRecebedor;
       3: Ide.toma03.Toma := tmDestinatario;
       4: Ide.toma03.Toma := tmOutros;
     end;



     // Inserir por causa de Versão 3.00
     Ide.indIEToma := inNaoContribuinte;
     if (DM1.cdsCliCTE_IE.Value=0) then Ide.indIEToma := inContribuinte; // 0
     if (DM1.cdsCliCTE_IE.Value=1) then Ide.indIEToma := inIsento; // 1
     if (DM1.cdsCliCTE_IE.Value=2) then Ide.indIEToma := inNaoContribuinte; // 2


     {
     Mudar
     Ide.tpServ  := tsNormal;
     Ide.retira  := rtNao;
     Ide.toma03.Toma := tmRemetente;

     }
     Ide.cUF     := 35;
     //Ide.cCT     := 1;  // Código Aleatório
     Ide.tpImp   := tiRetrato;

     Ide.procEmi := peAplicativoContribuinte;
     Ide.verProc := '4.00';

     // ++++ Dados do Modal Rodoviario  +++++++++++++++++
     Ide.modal   := mdRodoviario;

     //++++ Seguro -> Obrigatorio no Rodoviario ++++++++
     // Mudar infCTeNorm.seg.Add.respSeg  := rsEmitenteCTe;
     // retirados na versao 3.0 - 06/4
     {
     infCTeNorm.seg.Add.xSeg     := 'Alianz Seguro';
     infCTeNorm.seg.Add.nApol    := '035500015680000';
     infCTeNorm.seg.Add.vCarga   := DM1.cdsNotasVALOR.AsFloat;
     }

     // ++++ Dados Finais  +++++++++++++++++
     Ide.cMunEnv := cMunE;
     Ide.xMunEnv := 'Brasil/'+DM4.cdsCtePeCIDADE.Value;;
     Ide.UFEnv   := DM4.cdsCtePeESTADO.Value;

     Ide.cMunIni := cMunI;
     Ide.xMunIni := 'Brasil/'+DM1.cdsEnderCIDADE.Value;
     Ide.UFIni   := DM1.cdsEnderESTADO.Value;

     Ide.cMunFim := cMunF;
     Ide.xMunFim := 'Brasil/'+DM4.cdsEspelhoCIDADE.Value;
     Ide.UFFim   := DM4.cdsEspelhoESTADO.Value;

     // -----------------------------------
     // Dados do EMITENTE (Transportadora)
     // ***********************************
     try
       Emit.xNome  := DM4.cdsCtePRAZAOS.Value;
       Emit.xFant  := DM4.cdsCtePFANTASIA.Value;
       usa := TMarco.Create;
       Emit.CNPJ   := usa.Formata_DOC(DM4.cdsCtePCNPJ.Value);
       usa.Destroy;
       Emit.IE     := DM4.cdsCtePIE.Value;
       RNtrc       := DM4.cdsCtePRNTRC.Value;

       Emit.enderEmit.xLgr     := DM4.cdsCtePeENDER.Value;
       Emit.enderEmit.nro      := DM4.cdsCtePeNUMERO.AsString;
       Emit.enderEmit.xCpl     := DM4.cdsCtePeCOMPLEMENTO.Value;
       Emit.enderEmit.xBairro  := DM4.cdsCtePeBAIRRO.Value;
       Emit.enderEmit.xMun     := DM4.cdsCtePeCIDADE.Value;
       Emit.enderEmit.CEP      := DM4.cdsCtePeCEP.AsInteger;
       Emit.enderEmit.UF       := DM4.cdsCtePeESTADO.Value;
       Emit.enderEmit.cMun     := cMunE;
       Emit.enderEmit.fone     := DM4.cdsCtePTELS.Value;

       Emit.CRT := crtRegimeNormal;      // permitir alterar depois
//        1 - Simples Nacional;
//        2 - Simples Nacional, excesso sublimite de receita bruta;
//        3 - Regime Normal.

    except
       raise Exception.Create('ERRO nos dados do endereço do EMITENTE');
     end;

     // Caso especial de CDOP
     if ide.UFIni <> Emit.enderEmit.UF  then
     begin
       Ide.CFOP    := 5932;
       if (Emit.enderEmit.UF<> Dest.enderDest.UF) then Ide.CFOP    := 6932;
     end;

     // -----------------------------------
     // Dados do REMETENTE
     // ***********************************
     try




       Rem.xNome  := DM1.cdsCliNOME.Value;
       Rem.xFant  := DM1.cdsCliNOME.Value;
       Rem.CNPJCPF:= DM1.cdsCliCNPJ.Value;
       Rem.IE     := DM1.cdsCliIE.Value;
       if (DM1.cdsCliCTE_IE.Value=1) then  Rem.IE := 'ISENTO';
       Rem.fone   := DM1.cdsTelNUMERO.Value;

       Rem.enderReme.xLgr     := DM1.cdsEnderENDER.Value;
       Rem.enderReme.nro      := DM1.cdsEnderNUMERO.AsString;
       Rem.enderReme.xCpl     := DM1.cdsEnderCOMPLEMENTO.Value;
       Rem.enderReme.xBairro  := DM1.cdsEnderBAIRRO.Value;
       Rem.enderReme.xMun     := DM1.cdsEnderCIDADE.Value;
       Rem.enderReme.CEP      := DM1.cdsEnderCEP.AsInteger;
       Rem.enderReme.UF       := DM1.cdsEnderESTADO.Value;
       Rem.enderReme.cMun     := cMunI;
       Rem.enderReme.cPais    := 1058;
       Rem.enderReme.xPais    := 'BRASIL';

     except
       raise Exception.Create('ERRO nos dados do endereço do REMETENTE');
     end;
     // -----------------------------------
     // Notas AGRUPADAS
     // ***********************************
     if Dm4.cdsConhGRUPO.Value > 0 then
     begin
       Bco := TBco.Create;
       Bco.Conhec_MostraGrupo(Dm4.cdsConhGRUPO.Value);
       Bco.Destroy;

       // Zera
       gValor := 0;
       gPeso  := 0;
       gVol   := 0;

       if (DM4.cdsGrupo.RecordCount>0) then
       begin
         DM4.cdsGrupo.First;
         while not DM4.cdsGrupo.Eof do
         begin
           gValor := gValor + DM4.cdsGrupoValor.AsFloat;
           gPeso  := gPeso  + DM4.cdsGrupoPESO.AsFloat;
           gVol   := gVol   + DM4.cdsGrupoVOLUME.AsInteger;

           Bco := TBco.Create;
           Bco.Espelho_Mostra(DM4.cdsGrupoLIGCLI.Value, DM4.cdsGrupoNUMNF.Value);
           Bco.Destroy;

           if (DM4.cdsEspelhoCHAVENFE.Value<> null) then
             infCTeNorm.infDoc.infNFe.Add.chave := copy(DM4.cdsEspelhoCHAVENFE.Value, 1, 44);

           DM4.cdsGrupo.Next;
         end;
       end
       else
       CteGer.Resp.Lines.Append('ERRO no GRUPO: '+Dm4.cdsConhGRUPO.AsString+ ', sem Notas');

     end
     else
     begin
       if (DM4.cdsEspelhoCHAVENFE.Value<> null) then
         infCTeNorm.infDoc.infNFe.Add.chave := copy(DM4.cdsEspelhoCHAVENFE.Value, 1, 44);
       gValor := DM1.cdsNotasVALOR.AsFloat;
       gPeso  := DM1.cdsNotasPESO.AsFloat;
       gVol   := DM1.cdsNotasVOLUME.AsInteger;
     end;


     // -----------------------------------
     // Dados do DESTINATÁRIO
     // ***********************************
     try
       if (length(DM4.cdsEspelhoRAZAOS.Value)>5) then
         Dest.xNome  := DM4.cdsEspelhoRAZAOS.Value
       else
         Dest.xNome  := DM1.cdsNotasNOMEDEST.Value;

       Dest.CNPJCPF:= corrige_cpfcnpj( DM4.cdsEspelhoDCNPJ.Value );
       Dest.IE     := DM4.cdsEspelhoDIE.Value;
       Dest.fone   := '';
       Dest.ISUF   := '';
       Dest.email  := '';
       //Dest.locEnt := '';
       Dest.enderDest.xLgr     := DM4.cdsEspelhoENDERECO.Value;
       Dest.enderDest.nro      := DM4.cdsEspelhoNUMERO.AsString;
       Dest.enderDest.xCpl     := DM4.cdsEspelhoCOMPLEMENTO.Value;
       Dest.enderDest.xBairro  := DM4.cdsEspelhoBAIRRO.Value;
       Dest.enderDest.xMun     := DM4.cdsEspelhoCIDADE.Value;
       Dest.enderDest.CEP      := StrToInt(copy(DM4.cdsEspelhoCEP.value, 1, 5));
       Dest.enderDest.UF       := DM4.cdsEspelhoESTADO.Value;
       Dest.enderDest.cMun     := cMunF;
       Dest.enderDest.cPais    := 1058;
       Dest.enderDest.xPais    := 'BRASIL';

     except
       raise Exception.Create('ERRO nos dados do endereço do DESTINATÁRIO');
     end;

     // -----------------------------------
     // Modal
     // ***********************************
     //infCTeNorm.Rodo.dPrev := Now+1; retirado 3.0
     infCTeNorm.Rodo.RNTRC := DM4.cdsCtePRNTRC.Value;
     // Mudar infCTeNorm.Rodo.Lota  := ltNao;

     // -----------------------------------
     // carga
     // ***********************************
     infCTeNorm.infCarga.proPred := DM4.cdsCtePPREDOM.Value;
     infCTeNorm.infCarga.vCarga  := DM1.cdsNotasVALOR.AsFloat;
     infCTeNorm.infCarga.xOutCat := 'Venda';

     // UnidMed = (uM3,uKG, uTON, uUNIDADE, uLITROS);
     with infCTeNorm.infCarga.InfQ.Add do
      begin
       cUnid  := uKg;
       tpMed  := 'Kg';
       qCarga := DM1.cdsNotasPESO.AsFloat;
      end;

     // -----------------------------------
     // Valores
     // ***********************************
     if DM1.cdsNotasVLRCOMBINADO.Value = 0 then
     begin
       vPrest.comp.Add.xNome := 'Frete Peso';
       vPrest.comp.Add.xNome := 'Pedágios';
       vPrest.comp.Add.xNome := 'SEC/CAT';
       vPrest.comp.Add.xNome := 'Frete Valor';
       vPrest.comp.Add.xNome := 'Tx CT-e';
       vPrest.comp.Add.xNome := 'Devolução';
       vPrest.comp.Add.xNome := 'Adic. Peso';
       vPrest.comp.Add.xNome := 'TDE';
       vPrest.comp.Add.xNome := 'Outros';
       vPrest.comp.Add.xNome := 'Gris';
       vPrest.comp.Add.xNome := 'Ponto';
       vPrest.comp.Add.xNome := 'Imposto';

       vPrest.comp.Items[0].vComp := DM4.cdsConhFRETEPESO.AsFloat;
       vPrest.comp.Items[1].vComp := DM4.cdsConhPEDAGIO.AsFloat;
       vPrest.comp.Items[2].vComp := DM4.cdsConhSECCAT.AsFloat;
       vPrest.comp.Items[3].vComp := DM4.cdsConhFRETEVALOR.AsFloat;
       vPrest.comp.Items[4].vComp := DM4.cdsConhTXCTE.AsFloat;
       vPrest.comp.Items[5].vComp := DM4.cdsConhDEVOLUCAO.AsFloat;
       vPrest.comp.Items[6].vComp := DM4.cdsConhADICPESO.AsFloat;
       vPrest.comp.Items[7].vComp := DM4.cdsConhTDE.AsFloat;
       vPrest.comp.Items[8].vComp := DM4.cdsConhOUTROS.AsFloat;
       vPrest.comp.Items[9].vComp := DM4.cdsConhGRIS.AsFloat;
       vPrest.comp.Items[10].vComp:= DM4.cdsConhPONTO.AsFloat;

       vPrest.vTPrest := DM4.cdsConhBASE.AsFloat;
       vPrest.vRec    := DM4.cdsConhTOTAL.AsFloat;
     end
     else
     begin
       vPrest.comp.Add.xNome := 'Frete Combinado';
       vPrest.comp.Items[0].vComp:= DM1.cdsNotasVLRCOMBINADO.AsFloat;

       vPrest.vTPrest := DM1.cdsNotasVLRCOMBINADO.AsFloat;
       vPrest.vRec    := DM1.cdsNotasVLRCOMBINADO.AsFloat;
     end;

     nErro := 0;
     if vPrest.vTPrest>1000 then nErro := 91;
     if vPrest.vTPrest=0 then nErro := 90;
     Marca_Erro(DM4.cdsConhID.Value, nErro);


     // -----------------------------------
     // Impostos
     // ***********************************

     icampo := 0;
     case DM1.cdsCliCTEIMPOSTO.Value of

     0 : begin
          Imp.ICMS.SituTrib     := cst00;
          Imp.ICMS.ICMS00.CST   := cst00; // Tributação Normal ICMS
          Imp.ICMS.ICMS00.vBC   := DM4.cdsConhBASE.AsFloat;
          Imp.ICMS.ICMS00.pICMS := DM4.cdsConhALIQ.AsFloat;
          Imp.ICMS.ICMS00.vICMS := DM4.cdsConhICMS.AsFloat;
         end;

     1 : begin
          Imp.ICMS.SituTrib     := cst45;
          Imp.ICMS.ICMS45.CST   := cst40; // ISENTO
         end;

     2 : begin
          Imp.ICMS.SituTrib     := cst45;
          Imp.ICMS.ICMS45.CST   := cst41; // Não Tributado
         end;

     3 : begin
          // Alteração para empresas SN - Parte 1
          Imp.ICMS.SituTrib     := cstICMSSN;
          Imp.ICMS.ICMSSN.indSN := 1;
           // Alteração para empresas SN - Parte 2
            vPrest.comp.Add.xNome := 'ICMS SN';
            vPrest.comp.Items[11].vComp:= DM4.cdsConhICMS.AsFloat;
           vPrest.vTPrest := DM4.cdsConhBASE.AsFloat;
           vPrest.vRec    := DM4.cdsConhBASE.AsFloat;
           // Alteração para empresas SN - Parte 3
//           Compl.ObsCont.Add.xCampo := 'SN';
//           Compl.ObsCont.Items[0].xTexto := 'Conforme Lei Complementar 123/2006: Empresa optante pelo simples nacional';
//           icampo := icampo + 1;
         end;

     end;

     // -----------------------------------
     // Observações
     // ***********************************
     Compl.ObsCont.Add.xCampo := 'SN';
     Compl.ObsCont.Items[0].xTexto := 'Conforme Lei Complementar 123/2006: Empresa optante pelo simples nacional';

//     Compl.ObsCont.Add.xCampo := 'NF';
//     Compl.ObsCont.Items[1].xTexto := 'ref Nota Fiscal '+DM4.cdsConhNUMNOTA.AsString;

{
     // ANtes de abr2019
     if (DM4.cdsCtePIMPOSTO.Value = 99) then
     begin
       // Alteração para empresas SN - Parte 2
       vPrest.comp.Items[11].vComp:= DM4.cdsConhICMS.AsFloat;
       vPrest.vTPrest := DM4.cdsConhBASE.AsFloat;
       vPrest.vRec    := DM4.cdsConhBASE.AsFloat;
       // Alteração para empresas SN - Parte 3
       Compl.ObsCont.Add.xCampo := 'SN';
       Compl.ObsCont.Items[0].xTexto := 'Conforme Lei Complementar 123/2006: Empresa optante pelo simples nacional';

     end;;

     // Impostos
     // ***********************************

     case DM4.cdsCtePIMPOSTO.Value of

     00: begin
          Imp.ICMS.SituTrib     := cst00;
          Imp.ICMS.ICMS00.CST   := cst00; // Tributação Normal ICMS
          Imp.ICMS.ICMS00.vBC   := DM4.cdsConhBASE.AsFloat;
          Imp.ICMS.ICMS00.pICMS := DM4.cdsConhALIQ.AsFloat;
          Imp.ICMS.ICMS00.vICMS := DM4.cdsConhICMS.AsFloat;
         end;

     99: begin
          // Alteração para empresas SN - Parte 1
          Imp.ICMS.SituTrib     := cstICMSSN;
          Imp.ICMS.ICMSSN.indSN := 1;

         end;
    {
     20: begin
          Imp.ICMS.SituTrib      := cst20;
          Imp.ICMS.ICMS20.CST    := cst20; // Tributação com BC reduzida do ICMS
          Imp.ICMS.ICMS20.pRedBC := 4;
          Imp.ICMS.ICMS20.vBC    := DM4.cdsConhBASE.Value;
          Imp.ICMS.ICMS20.pICMS  := DM4.cdsConhALIQ.Value;
          Imp.ICMS.ICMS20.vICMS  := DM4.cdsConhALIQ.Value;
         end;
     40: begin
          Imp.ICMS.SituTrib   := cst40;
          Imp.ICMS.ICMS45.CST := cst40; // ICMS Isento
         end;
     41: begin
          Imp.ICMS.SituTrib   := cst41;
          Imp.ICMS.ICMS45.CST := cst41; // ICMS não Tributada
         end;
     51: begin
          Imp.ICMS.SituTrib   := cst51;
          Imp.ICMS.ICMS45.CST := cst51; // ICMS diferido
         end;
     80: begin
          Imp.ICMS.SituTrib     := cst80;
          Imp.ICMS.ICMS60.CST   := cst90; // Tributação atribuida ao tomador ou 3. por ST
          Imp.ICMS.ICMS60.vBCSTRet   := 4;
          Imp.ICMS.ICMS60.pICMS := 4;
          Imp.ICMS.ICMS60.vICMS := 4;
          Imp.ICMS.ICMS60.vCred := 4;
         end;
     81: begin
          Imp.ICMS.SituTrib      := cst81;
          Imp.ICMS.ICMS60.CST    := cst90; // Tributação devido a outra UF
          Imp.ICMS.ICMS60.pRedBC := 4;
          Imp.ICMS.ICMS60.vBC    := DM4.cdsConhALIQ.Value;
          Imp.ICMS.ICMS60.pICMS  := DM4.cdsConhALIQ.Value;
          Imp.ICMS.ICMS60.vICMS  := DM4.cdsConhALIQ.Value;
         end;
     90: begin
          Imp.ICMS.SituTrib      := cst90;
          Imp.ICMS.ICMS90.CST    := cst90; // ICMS Outros
          Imp.ICMS.ICMS90.pRedBC := 4;
          Imp.ICMS.ICMS90.vBC    := 4;
          Imp.ICMS.ICMS90.pICMS  := 4;
          Imp.ICMS.ICMS90.vICMS  := 4;
          Imp.ICMS.ICMS90.vCred  := 4;
         end;
     }


     //end;

    end;

    // -----------------------------------
    // Criar e Salvar o CT-e
    // ***********************************
    // Salvar preservando chave anterior
    if (DM4.cdsCteGARQUIVO.Value= '-') then
    begin
      CteGer.ACBrCTe1.Conhecimentos.GerarCTe;
      Arq := Converte_Arquivo(PastaFinal,CteGer.ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.ID, 100);
      CteGer.ACBrCTe1.Conhecimentos.GravarXML(Arq);
      Grava_Arquivo(DM4.cdsCteGID.Value,CteGer.ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.ID);
    end
    else
    begin
      ChaveCT := copy(DM4.cdsCteGARQUIVO.Value,4,Length(DM4.cdsCteGARQUIVO.Value)-3);
      Arq := Converte_Arquivo(PastaFinal,DM4.cdsCteGARQUIVO.Value, 100);

      CteGer.ACBRCte1.Conhecimentos.Items[0].CTe.procCTe.PathCTe := Arq;
      CteGer.ACBRCte1.Conhecimentos.Items[0].CTe.infCTe.ID := ChaveCT;
      CteGer.ACBRCte1.Conhecimentos.Items[0].CTe.procCTe.chCTe := ChaveCT;
      //CteGer.ACBRCte1.Conhecimentos.Items[0].CTe.infCTe.VersaoStr := '4.0.0';
      CteGer.ACBRCte1.Conhecimentos.Items[0].CTe.infCTe.versao := 4.0;

      pastaMeses(Now,DM4.cdsCtePPASTAXML.Value);
      // ==========================================================
      // Salva Anterior
      CteGer.ACBrCTe1.Conhecimentos.GravarXML(Arq);
    end;
    {
    //antes de 14/2/20 - criava sempre com nova chave
    CteGer.ACBrCTe1.Conhecimentos.GerarCTe;
    Arq := Converte_Arquivo(PastaFinal,CteGer.ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.ID, 100);
    CteGer.ACBrCTe1.Conhecimentos.GravarXML(Arq);
    Grava_Arquivo(DM4.cdsCteGID.Value,CteGer.ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.ID);
    if (FileExists(ArqAnterior)) then DeleteFile(ArqAnterior);
    }
  end
  else ShowMessage('Não foi possível conectar com Banco Espelho');
end;


procedure Carregar_XML(Arquivo : String; NumCT, idTransp:Integer);

var Bco : TBco;
    Arq : String;

begin
  Arq := '';

  Bco := TBco.Create;
  Bco.CTe_Padrao_Mostra(idTransp);
  Bco.Destroy;

  pastaMeses(DM4.cdsCteGDATAC.AsDateTime,DM4.cdsCtePPASTAXML.Value);
  Arq := Converte_Arquivo(PastaFinal, Arquivo, 100);
  CteGer.ACBrCTe1.Conhecimentos.Clear;
  //ShowMessage(Arq);
  if (length(Arquivo)> 7) and (FileExists(Arq)) then
  begin

    CteGer.ACBrCTe1.Conhecimentos.LoadFromFile(Arq);
  end
  else
    msgSaida := '[ERRO] CT-e: '+IntToStr(NumCT)+ '. Arquivo não encontrado';
end;

procedure Salvar_XML(Arquivo : String; NumCT, idTransp:Integer; forceSave: boolean);

var Bco : TBco;
    Arq : String;

begin
  Arq := '';

  Bco := TBco.Create;
  Bco.CTe_Padrao_Mostra(idTransp);
  Bco.Destroy;
  pastaMeses(Now,DM4.cdsCtePPASTAXML.Value);
  Arq := Converte_Arquivo(PastaFinal, Arquivo, 100);

  if (FileExists(Arq)) or (forceSave) then
    CteGer.ACBrCTe1.Conhecimentos.GravarXML(Arq);

end;

procedure Salvar_XML_Evento(Arquivo, XMLev : String; NumCT, idTransp, cstat:Integer);

var Bco : TBco;
    Arq : String;

begin
  Arq := '';

  Bco := TBco.Create;
  Bco.CTe_Padrao_Mostra(idTransp);
  Bco.Destroy;
  pastaMeses(Now,DM4.cdsCtePPASTAXML.Value);
  Arq := Converte_Arquivo(PastaFinal, Arquivo, cstat);

  CteGer.MemoEventos.Clear;
  CteGer.MemoEventos.Lines.Append(XMLev);
  CteGer.MemoEventos.Lines.SaveToFile(Arq);

end;

procedure Marcar_Envio(id, Status:Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cte_MarcarEnvio(id, Status);
  Bco.Destroy;
end;

{
  0 = Gerado (sem arquivo)
  1 = criado
  2 = validado
  3 = assinado
  4 = enviado (autorizado)
  5 = cancelado
  6 = Cancelado Interno
  7 = Inutilizado
  8 = denegado
}

procedure CT_Validar();

var sID : String;
    nID : Smallint;

begin
   with CteGer do
   begin
     try
       ACBrCTe1.Conhecimentos.Validar;
       Marcar_Envio(DM4.cdsCteGID.Value, 2);
       Resp.Lines.Append('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', validado com SUCESSO!');
     except
       on e:Exception do
       begin
         nID := pos('ID#',e.Message);
         sID := copy(e.Message, nID, nID + 6);
         if (pos('Chave de acesso',e.Message) <> 0) then
           Resp.Lines.Append('ERRO: CTe: '+DM4.cdsCteGNUMC.AsString+' ID#298 - Falta Chave da NFe')
         else
           Resp.Lines.Append('ERRO: CTe: '+DM4.cdsCteGNUMC.AsString+sID +#13+e.Message);
         Marcar_Envio(DM4.cdsCteGID.Value, 1);
       end;
     end; // try
   end;
end;

procedure CT_Assinar();

begin
   with CteGer do
   begin
     ACBrCTe1.Conhecimentos.Assinar;
   end;
end;


//procedure CT_Enviar();
//
//var Bco : TBco;
//    cstat : integer;
//    ArqErro, sChave : String;
//
//begin
//   with CteGer do
//   begin
//     //Resp.Lines.Clear;
//
//    try
//     // Lote, tipo de impressao, modo Sincrono = true
//     // false nao imprime quando enviar
//     ACBrCTe1.Enviar(7, false, true);
//
//     cstat := ACBrCTe1.WebServices.Retorno.cStat;
//     Bco := TBco.Create;
//     Bco.Conhec_Status(DM4.cdsCteGID.Value, DM4.cdsCteGNUMNOTA.Value, CSTAT);
//     Bco.Destroy;
//
//     if (cstat = 100) then
//        begin
//          // --- ENTREGUE
//          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, true);
//         // Resp.Lines.Add('===============================================================');
//          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', enviado com SUCESSO!');
//         // Resp.Lines.Add('Recibo: '+ ACBrCTe1.WebServices.Retorno.Recibo);
//         // Resp.Lines.Add('Protocolo: '+ ACBrCTe1.WebServices.Retorno.Protocolo);
//          Marcar_Envio(DM4.cdsCteGID.Value, 4);
//
//          Bco := TBco.Create;
//          Bco.Cte_Entregue(DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGNOTA.Value);
//          Bco.Marca_Cobrado(DM4.cdsCteGLIGNOTA.Value, 3);
//          Bco.Destroy;
//          // --- ENTREGUE
//          //Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
//        end
//        else
//        begin
//         // Resp.Lines.Append(' xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ');
//          Resp.Lines.Append(' CT-e Rejeitado');
//          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, false);
//         // Resp.Lines.Append(' Motivo '+ACBrCTe1.WebServices.Retorno.xMotivo);
//        end;
//
//     except
//        on e:Exception do
//        begin
//        //  Resp.Lines.Append(' xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ');
//          if pos('RichEdit',e.Message) <> 0 then
//          begin
//            Resp.Clear;
//          end
//          else if (Pos('Autorizado o uso', ACBrCTe1.WebServices.Retorno.xMotivo) > 0) then
//          begin
//            // --- ENTREGUE
//            Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, true);
//           // Resp.Lines.Add('===============================================================');
//            Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', enviado com SUCESSO!');
//           // Resp.Lines.Add('Recibo: '+ ACBrCTe1.WebServices.Retorno.Recibo);
//           // Resp.Lines.Add('Protocolo: '+ ACBrCTe1.WebServices.Retorno.Protocolo);
//            Marcar_Envio(DM4.cdsCteGID.Value, 4);
//
//            Bco := TBco.Create;
//            Bco.Cte_Entregue(DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGNOTA.Value);
//            Bco.Marca_Cobrado(DM4.cdsCteGLIGNOTA.Value, 3);
//            Bco.Destroy;
//            // --- ENTREGUE
//
//          end
//          else
//          begin
//            cstat := ACBrCTe1.WebServices.Retorno.cStat;
//            Bco := TBco.Create;
//            Bco.Conhec_Status(DM4.cdsCteGID.Value, DM4.cdsCteGNUMNOTA.Value, CSTAT);
//            Bco.Destroy;
//
//            if (cstat > 0) then
//            begin
//              ArqErro := '\\SERVIDORF\Todos\00Atualiza\ArqCTE\Erros\CTe_ERROS_'+FormatDateTime('yyyyMMdd',Now)+'.txt';
//              if FileExists(ArqErro) then Memo1.Lines.LoadFromFile(ArqErro);
//              Resp.Lines.Append(' CT-e Rejeitado: '+DM4.cdsCteGNUMC.AsString+ '.. Motivo '+ACBrCTe1.WebServices.Retorno.cStat.ToString+ ' '+ ACBrCTe1.WebServices.Retorno.xMotivo+' '+ ACBrCTe1.WebServices.Retorno.ChaveCTe );
//              Memo1.Lines.Append(' CT-e Rejeitado: '+DM4.cdsCteGNUMC.AsString+ '.. Motivo '+ACBrCTe1.WebServices.Retorno.cStat.ToString+ ' '+ ACBrCTe1.WebServices.Retorno.xMotivo+' '+ ACBrCTe1.WebServices.Retorno.ChaveCTe);
//              Memo1.Lines.SaveToFile(ArqErro);
//              Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
//              if (cstat = 110) or (cstat=301) or (cstat=302) or (cstat=303) then Marcar_Envio(DM4.cdsCteGID.Value, 8);
//              if cstat = 539 then
//              begin
//                sChave := copy(ACBrCTe1.WebServices.Retorno.xMotivo, 71, 44);
//                Grava_Arquivo(DM4.cdsCteGID.Value, 'CTe'+sChave);
//              end;
//              Marca_Erro(DM4.cdsCteGID.Value, cstat);
//
//            end
//            else
//              Resp.Lines.Append(' CT-e NÃO enviado. ERRO '+#13+e.Message+' ');
//          end;
//        //  Resp.Lines.Append(' Motivo '+ACBrCTe1.WebServices.Retorno.xMotivo);
//        end;
//     end;
//
//    end;
//end;

procedure CT4_Enviar();

var Bco : TBco;
    cstat : integer;
    ArqErro, sChave : String;

begin
   with CteGer do
   begin
     //Resp.Lines.Clear;

    try
     // Lote, tipo de impressao, modo Sincrono = true
     // false nao imprime quando enviar
     ACBrCTe1.Enviar(7, false, true);

     cstat := ACBrCTe1.WebServices.Enviar.cStat;
     Bco := TBco.Create;
     Bco.Conhec_Status(DM4.cdsCteGID.Value, DM4.cdsCteGNUMNOTA.Value, CSTAT);
     Bco.Destroy;

     // cstat = 100 / autorizado
     // cstat = 204 / Duplicidade
     if ((cstat = 100) or (cstat = 204)) then
        begin
          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, true);
         // Resp.Lines.Add('===============================================================');
          if (cstat = 100) then Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', enviado com SUCESSO!')
            else Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', já havia sido enviado e autorizado!');
         // Resp.Lines.Add('Recibo: '+ ACBrCTe1.WebServices.Retorno.Recibo);
         // Resp.Lines.Add('Protocolo: '+ ACBrCTe1.WebServices.Retorno.Protocolo);
          Marcar_Envio(DM4.cdsCteGID.Value, 4);

          Bco := TBco.Create;
          Bco.Cte_Entregue(DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGNOTA.Value);
          Bco.Marca_Cobrado(DM4.cdsCteGLIGNOTA.Value, 3);
          Bco.Destroy;
          // --- ENTREGUE
//          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
        end
        else
        begin
         // Resp.Lines.Append(' xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ');
          Resp.Lines.Append(' CT-e Rejeitado');
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, false);
         // Resp.Lines.Append(' Motivo '+ACBrCTe1.WebServices.Retorno.xMotivo);
        end;

     except
        on e:Exception do
        begin
        //  Resp.Lines.Append(' xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ');
          if pos('RichEdit',e.Message) <> 0 then
          begin
            Resp.Clear;
          end
          else if (Pos('Autorizado o uso', ACBrCTe1.WebServices.Retorno.xMotivo) > 0) then
          begin
            // --- ENTREGUE
            Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, true);
           // Resp.Lines.Add('===============================================================');
            Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', enviado com SUCESSO!');
           // Resp.Lines.Add('Recibo: '+ ACBrCTe1.WebServices.Retorno.Recibo);
           // Resp.Lines.Add('Protocolo: '+ ACBrCTe1.WebServices.Retorno.Protocolo);
            Marcar_Envio(DM4.cdsCteGID.Value, 4);

            Bco := TBco.Create;
            Bco.Cte_Entregue(DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGNOTA.Value);
            Bco.Marca_Cobrado(DM4.cdsCteGLIGNOTA.Value, 3);
            Bco.Destroy;
            // --- ENTREGUE

          end
          else
          begin
            cstat := ACBrCTe1.WebServices.Enviar.cStat;
            Bco := TBco.Create;
            Bco.Conhec_Status(DM4.cdsCteGID.Value, DM4.cdsCteGNUMNOTA.Value, CSTAT);
            Bco.Destroy;

            if (cstat > 0) then
            begin
              ArqErro := '\\SERVIDORF\Todos\00Atualiza\ArqCTE\Erros\CTe_ERROS_'+FormatDateTime('yyyyMMdd',Now)+'.txt';
              if FileExists(ArqErro) then Memo1.Lines.LoadFromFile(ArqErro);
              Resp.Lines.Append(' CT-e Rejeitado: '+DM4.cdsCteGNUMC.AsString+ '.. Motivo '+ACBrCTe1.WebServices.Enviar.cStat.ToString+ ' '+ ACBrCTe1.WebServices.Enviar.xMotivo+' '+ ACBrCTe1.WebServices.Retorno.ChaveCTe );
              Memo1.Lines.Append(' CT-e Rejeitado: '+DM4.cdsCteGNUMC.AsString+ '.. Motivo '+ACBrCTe1.WebServices.Enviar.cStat.ToString+ ' '+ ACBrCTe1.WebServices.Enviar.xMotivo+' '+ ACBrCTe1.WebServices.Retorno.ChaveCTe);
              Memo1.Lines.SaveToFile(ArqErro);
              Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, false);
              if (cstat = 110) or (cstat=301) or (cstat=302) or (cstat=303) then Marcar_Envio(DM4.cdsCteGID.Value, 8);
              if cstat = 539 then
              begin
                sChave := copy(ACBrCTe1.WebServices.Enviar.xMotivo, 71, 44);
                Grava_Arquivo(DM4.cdsCteGID.Value, 'CTe'+sChave);
              end;
              Marca_Erro(DM4.cdsCteGID.Value, cstat);

            end
            else
              Resp.Lines.Append(' CT-e NÃO enviado. ERRO '+#13+e.Message+' ');
          end;
        //  Resp.Lines.Append(' Motivo '+ACBrCTe1.WebServices.Retorno.xMotivo);
        end;
     end;

    end;
end;


procedure CT_Cancelar(Justif:String);

var iLote : Integer;

begin
   with CteGer do
   begin
     //Justif := InputBox('Justificativa', 'Digite o Motivo do Cancelamento', 'Erro nos dados no CT-e');
     //ACBrCTe1.Cancelamento(Justif);

   ACBrCTe1.EventoCTe.Evento.Clear;

   with ACBrCTe1.EventoCTe.Evento.Add do
    begin
     infEvento.nSeqEvento      := 1; // Para o Evento de Cancelamento: nSeqEvento sempre = 1
     infEvento.chCTe           := Copy(ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.Id, 4, 44);
     infEvento.CNPJ            := ACBrCTe1.Conhecimentos.Items[0].CTe.emit.CNPJ;
     infEvento.dhEvento        := now;
     infEvento.tpEvento        := teCancelamento;
     infEvento.detEvento.xJust := trim(Justif);
     infEvento.detEvento.nProt := ACBrCTe1.Conhecimentos.Items[0].CTe.procCTe.nProt;
    end;

   iLote := 1; // Numero do Lote do Evento
   ACBrCTe1.EnviarEvento(iLote);

   end;
end;

{
procedure CT_Consultar();
  var Bco : TBco;
      RetWS : String;

begin
   with CteGer do
   begin
     ACBrCTe1.Consultar;
     Resp.Lines.Text := UTF8Encode(ACBrCTe1.WebServices.Consulta.RetWS);
     if (ACBrCTe1.WebServices.Consulta.cStat = 100) then
        begin
          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
         // Resp.Lines.Add('===============================================================');
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', USO AUTORIZADO');
         // Resp.Lines.Add('Recibo: '+ ACBrCTe1.WebServices.Retorno.Recibo);
         // Resp.Lines.Add('Protocolo: '+ ACBrCTe1.WebServices.Retorno.Protocolo);
          Marcar_Envio(DM4.cdsCteGID.Value, 4);

          Bco := TBco.Create;
          Bco.Cte_Entregue(DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGNOTA.Value);
          Bco.Marca_Cobrado(DM4.cdsCteGLIGNOTA.Value, 3);
          Bco.Destroy;
          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
        end;

     if (ACBrCTe1.WebServices.Consulta.cStat = 101) then
        begin
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
          RetWS := ACBrCTe1.WebServices.EnvEvento.EventoRetorno.XML;
          /// Salva o Evento
          Salvar_XML_Evento(DM4.cdsCteGARQUIVO.Value, RetWS, DM4.cdsCteGNUMC.Value,DM4.cdsCteGLIGTRANSP.Value,101);


          Resp.Lines.Append('    .: Cancelado com Sucesso ');
          //Resp.Lines.Append('SEFAZ: '+ ACBrCTe1.WebServices.Cancelamento.xMotivo);
          Marcar_Envio(DM4.cdsCteGID.Value, 5);
          // Desmarca nota nos CTE
          Bco := TBco.Create;
          Bco.Cte_NaoEntregue(DM4.cdsCteGLIGNOTA.Value);
          Bco.Destroy;
        end;

   end;
end;

procedure CT_Consultar2();
  var Bco : TBco;
      RetWS, vChave : String;

begin
   with CteGer do
   begin
     vChave := copy(DM4.cdsCteGARQUIVO.Value,4,Length(DM4.cdsCteGARQUIVO.Value));
     ACBrCTe1.WebServices.Consulta.CTeChave := vChave;
     ACBrCTe1.WebServices.Consulta.Executar;
     Resp.Lines.Text := UTF8Encode(ACBrCTe1.WebServices.Consulta.RetWS);

     if (ACBrCTe1.WebServices.Consulta.cStat = 100) then
        begin
          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
         // Resp.Lines.Add('===============================================================');
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', USO AUTORIZADO');
         // Resp.Lines.Add('Recibo: '+ ACBrCTe1.WebServices.Retorno.Recibo);
         // Resp.Lines.Add('Protocolo: '+ ACBrCTe1.WebServices.Retorno.Protocolo);
          Marcar_Envio(DM4.cdsCteGID.Value, 4);

          Bco := TBco.Create;
          Bco.Cte_Entregue(DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGNOTA.Value);
          Bco.Marca_Cobrado(DM4.cdsCteGLIGNOTA.Value, 3);
          Bco.Destroy;
          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
        end;

     if (ACBrCTe1.WebServices.Consulta.cStat = 101) then
        begin
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
          RetWS := ACBrCTe1.WebServices.EnvEvento.EventoRetorno.XML;
          /// Salva o Evento
          Salvar_XML_Evento(DM4.cdsCteGARQUIVO.Value, RetWS, DM4.cdsCteGNUMC.Value,DM4.cdsCteGLIGTRANSP.Value,101);


          Resp.Lines.Append('    .: Cancelado com Sucesso ');
          //Resp.Lines.Append('SEFAZ: '+ ACBrCTe1.WebServices.Cancelamento.xMotivo);
          Marcar_Envio(DM4.cdsCteGID.Value, 5);
          // Desmarca nota nos CTE
          Bco := TBco.Create;
          Bco.Cte_NaoEntregue(DM4.cdsCteGLIGNOTA.Value);
          Bco.Destroy;
        end;

   end;
end;


procedure CT_Consultar3();
  var Bco : TBco;
      RetWS, vChave : String;
      cstat : Integer;

begin
   with CteGer do
   begin
     vChave := copy(DM4.cdsCteGARQUIVO.Value,4,Length(DM4.cdsCteGARQUIVO.Value));
     //ShowMessage(vChave);
     ACBrCTe1.WebServices.Consulta.CTeChave := vChave;
     ACBrCTe1.WebServices.Consulta.Executar;
     //Resp.Lines.Text := UTF8Encode(ACBrCTe1.WebServices.Consulta.RetWS);
     cstat := ACBrCTe1.WebServices.Consulta.cStat;
     if (cstat = 100) then
        begin
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', Autorizado pela SEFAZ!');
          Marcar_Envio(DM4.cdsCteGID.Value, 4);

          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
        end;
     if (cstat = 101) then
        begin
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', Cancelado na SEFAZ!');
          Marcar_Envio(DM4.cdsCteGID.Value, 6);

          // --- CANCELADO
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
        end;
     if (cstat = 102) then
        begin
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', número inutilizado na SEFAZ!');
          Marcar_Envio(DM4.cdsCteGID.Value, 6);

          // --- INUTILIZADO
        end;


   end;
end;
}
procedure CT_Consultar4();
  var Bco : TBco;
      RetWS, vChave : String;
      cstat : Integer;

begin
   with CteGer do
   begin
     ACBrCTe1.Consultar;

     cstat := ACBrCTe1.WebServices.Consulta.cStat;
     Resp.Lines.Add('>> stat: '+cstat.ToString);
     if (cstat = 100) then
        begin
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', Autorizado pela SEFAZ!');
          Marcar_Envio(DM4.cdsCteGID.Value, 4);

          // --- ENTREGUE
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, false);
        end;
     if (cstat = 101) then
        begin
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', Cancelado na SEFAZ!');
          Marcar_Envio(DM4.cdsCteGID.Value, 6);

          // --- CANCELADO
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, false);
        end;
     if (cstat = 102) then
        begin
          Resp.Lines.Add('>> CT-e: '+DM4.cdsCteGNUMC.AsString+', número inutilizado na SEFAZ!');
          Marcar_Envio(DM4.cdsCteGID.Value, 6);

          // --- INUTILIZADO
        end;


   end;
end;


procedure Marcar_Impressao(id, Status:Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cte_MarcarImpressao(id, Status);
  Bco.Destroy;
end;


procedure TCTeGer.btCriarClick(Sender: TObject);

var i : Integer;

begin

  pb.Visible := true;
  pb.Min := 0;
  pb.Max := DBGrid1.SelectedRows.Count+2;
  pb.Position := 1;

  Inicia_Memo('Criando XML');
  Posicao := DM4.cdsCteG.GetBookmark;
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
            // ======= ITEM SELECIONADO ====================
             pb.Position := i;

            if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
            begin
              CT_Criar(DM4.cdsCteGLIGTRANSP.Value,DM4.cdsCteGLIGCLI.Value, DM4.cdsCteGNUMC.Value);
              msgSaida :=  '>> CT-e: '+DM4.cdsCteGNUMC.AsString+', criado com SUCESSO!';
              Marcar_Envio(DM4.cdsCteGID.Value, 1);
            end
            else msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser criado)';
            Resp.Lines.Append(msgSaida);
            // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');

  //Mostra_Lista;
  DM4.cdsCteG.GotoBookmark(Posicao);
  DM4.cdsCteG.ApplyUpdates(0);
  DM4.cdsCteG.Refresh;
  DM4.cdsCTne.Refresh;
  pb.Visible := false;


end;

procedure CT_Imprimir;

var Arq, dirLogo : String;
    Bco : TBco;

begin
  getDir(0,dirLogo);

  with CteGer do
  if (DM4.cdsCteGARQUIVO.Value <> '-') then
  begin
    Carregar_XML(DM4.cdsCteGARQUIVO.Value, DM4.cdsCteGNUMC.Value , DM4.cdsCteGLIGTRANSP.Value );
    //ACBrCTeDACTeQR1.Logo := dirLogo + '\IMGS\flaydellogo.jpg';
    ACBrCTe1.Conhecimentos.Imprimir;
    ACBrCTe1.Conhecimentos.ImprimirPDF;
  end;
end;




procedure TCTeGer.btImp1Click(Sender: TObject);

begin
  CT_Imprimir;
end;

procedure TCTeGer.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

var
  bitmap : TBitmap;
  fixRect : TRect;
  bmpWidth : integer;

  imgIndex : integer;

  begin
  fixRect := Rect;
  // customizing the 'LastName' field
  if Column.Field = DM4.cdsCteGSTATUSENVIO then
  begin
    //adding some logic to grab the required image
    imgIndex := DM4.cdsCteGSTATUSENVIO.Value;

    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList
      //(using the "Salary" field's value)
      ImageList1.GetBitmap(imgIndex,bitmap);
      //Fix the bitmap dimensions
      //bmpWidth := (Rect.Bottom - Rect.Top);
      bmpWidth := 23;
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      DBGrid1.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle,
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;

  if Column.Field = DM4.cdsCteGSTATUSimp then
  begin
    //adding some logic to grab the required image
    imgIndex := DM4.cdsCteGSTATUSimp.Value;

    bitmap := TBitmap.Create;
    try
      //grab the image from the ImageList
      //(using the "Salary" field's value)
      ImageList2.GetBitmap(imgIndex,bitmap);
      //Fix the bitmap dimensions
      //bmpWidth := (Rect.Bottom - Rect.Top);
      bmpWidth := 21;
      fixRect.Right := Rect.Left + bmpWidth;
      //draw the bitmap
      DBGrid1.Canvas.StretchDraw(fixRect,bitmap);
    finally
      bitmap.Free;
    end;

    // reset the output rectangle,
    // add space for the graphics
    fixRect := Rect;
    fixRect.Left := fixRect.Left + bmpWidth;
  end;


  //draw default text (fixed position)
  DBGrid1.DefaultDrawColumnCell(
     fixRect,
     DataCol,
     Column,
     State);

end;

procedure TCTeGer.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 15;
end;

procedure TCTeGer.btValidarClick(Sender: TObject);

var i : Integer;

begin
  pb.Visible := true;
  pb.Min := 0;
  pb.Max := DBGrid1.SelectedRows.Count+4;
  pb.Position := 1;
  // Mudar ACBrCTe1.Conhecimentos.Certificados.SelecionarCertificado;
    ACBrCTe1.SSL.SelecionarCertificado;
  Posicao := DM4.cdsCteG.GetBookmark;
  Inicia_Memo('Valida CT-e');
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
        pb.Position := i+1;
        if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
        begin
          if (DM4.cdsCteGSTATUSENVIO.Value > 0) then
          begin
            Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
            CT_Validar();
            //msgSaida := '>> CT-e: '+DM4.cdsCteGNUMC.AsString+', validado com SUCESSO!';

          end
          else msgSaida := '[ERRO] CT-e: '+DM4.cdsCteGNUMC.AsString+', SEM arquivo XML (favor criar o CT-E antes).';
        end
        else msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser criado)';
        Resp.Lines.Append(msgSaida);
        // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');
  //Mostra_Lista;
  DM4.cdsCteG.GotoBookmark(Posicao);
  DM4.cdsCteG.Refresh;
  pb.Visible := false;

end;

procedure TCTeGer.AlteradatadeEmisso1Click(Sender: TObject);
begin
  // desuso - basta recriar o XML
  lbCte.Caption := DM4.cdsCteGNUMC.AsString;
  lbNf.Caption  := DM4.cdsCteGNUMNOTA.AsString;
  dtEmissao.DateTime := Now;
  PanelEmissao.Visible := true;
end;

procedure Altera_Emissao(idCte:Integer; dt:TDateTime);
  var Bco : TBco;
      ArqAnt : String;

begin
  if (MonthOf(dt) <> MonthOf(DM4.cdsCteGDATAC.Value)) then
  begin
    pastaMeses(DM4.cdsCteGDATAC.Value,DM4.cdsCtePPASTAXML.Value);
    ArqAnt := Converte_Arquivo(PastaFinal, DM4.cdsCteGARQUIVO.Value, 100);
    if FileExists(ArqAnt) then DeleteFile(ArqAnt);
  end;
  Bco := TBco.Create;
  Bco.Conhec_AlteraEmissao(idCte, dt);
  Bco.Destroy;
end;

procedure TCTeGer.btAltDtClick(Sender: TObject);

var i : Integer;

begin
  Posicao := DM4.cdsCteG.GetBookmark;
  Resp.Clear;
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
        if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
        begin
          Altera_Emissao(DM4.cdsCteGID.value, dtEmissao.DateTime);
          msgSaida :=  ' CT-e: '+DM4.cdsCteGNUMC.AsString+', data de Emissão alterada para ' +FormatDatetime('dd/MM/yy',dtEmissao.DateTime);
        end
        else msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser assinado)';
        Resp.Lines.Append(msgSaida);
        // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');
  Mostra_Lista;
  DM4.cdsCteG.GotoBookmark(Posicao);
  PanelEmissao.Visible := false;

end;


procedure TCTeGer.btAltNaoClick(Sender: TObject);
begin
  PanelEmissao.Visible := false;
end;

procedure TCTeGer.btArqClick(Sender: TObject);
  var i : Integer;
     Bco : tBco;
     sArq : String;

     xl : Txlr;
     c : integer;
begin
  Bco := TBco.Create;
  Bco.Cte_Ger_PesqFaixa(' (numC > 220388 and numC < 225854) ');
  Bco.Destroy;
  DM4.cdsCteG.First;
  {
  while not DM4.cdsCteG.Eof do
    begin

      sArq := 'Não encontrado';
      if (DM4.cdsCteGARQUIVO.Value <> '-') then
      begin
        Carregar_XML(DM4.cdsCteGARQUIVO.Value, DM4.cdsCteGNUMC.Value , DM4.cdsCteGLIGTRANSP.Value );
        if ACBrCTe1.Conhecimentos.Count > 0 then sArq := ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.ID;
      end;
      Resp.Lines.Append(DM4.cdsCteGNUMC.AsString + ' - '+ DM4.cdsCteGARQUIVO.AsString + ' = '+sArq);
      DM4.cdsCteG.Next;
    end;
  }
  xl := Txlr.Create;
  xl.mArq := 'C:\pa\FlaydelRetorno.xls';
  xl.mQuant := 0;
  xl.mColPesq :=  5;
  xl.mLinAtual := 2;
  xl.Inicia;
  c := xl.Conta;
  for i := 1 to c - 2 do
  begin
    xl.mLinAtual := i + 2;
    sArq := xl.LeLinha;
    if (length(sArq)> 4) then
      begin
        DM4.cdsCteG.Filtered := false;
        DM4.cdsCteG.Filter := ' numc = '+sArq ;
        DM4.cdsCteG.Filtered := true;

        Carregar_XML(DM4.cdsCteGARQUIVO.Value, DM4.cdsCteGNUMC.Value , DM4.cdsCteGLIGTRANSP.Value );
        if ACBrCTe1.Conhecimentos.Count > 0 then sArq := 'FLAYDEL'+ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.ID;
      end;
    xl.EscreveCel(xl.mLinAtual, 44, sArq);
    Resp.Lines.Append(i.toString + ' .. ' + sArq);

  end;
  xl.Fim;
  xl.Destroy;

  Resp.Lines.Append('Linhas no arquivo: '+c.ToString);

end;

procedure TCTeGer.btAssinarClick(Sender: TObject);

var i : Integer;

begin
  pb.Visible := true;
  pb.Min := 0;
  pb.Max := DBGrid1.SelectedRows.Count+4;
  pb.Position := 1;

  // Mudar

  ACBrCTe1.SSL.SelecionarCertificado;

  Posicao := DM4.cdsCteG.GetBookmark;
  Inicia_Memo('Assina CT-e');
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
        pb.Position := i+1;
        if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
        begin
          if (DM4.cdsCteGSTATUSENVIO.Value > 0) then
          begin
            Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
            CT_Assinar();
            msgSaida := '>> CT-e: '+DM4.cdsCteGNUMC.AsString+', assinado com SUCESSO!';
            Marcar_Envio(DM4.cdsCteGID.Value, 3);
          end
          else msgSaida := '[ERRO] CT-e: '+DM4.cdsCteGNUMC.AsString+', SEM arquivo XML (favor criar o CT-e antes).';
        end
        else msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser assinado)';
        Resp.Lines.Append(msgSaida);
        // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');
  //Mostra_Lista;
  DM4.cdsCteG.GotoBookmark(Posicao);
  DM4.cdsCteG.Refresh;
  pb.Visible := False;

end;

procedure TCTeGer.btEnviarClick(Sender: TObject);

var i : Integer;

begin
  pb.Visible := true;
  pb.Min := 0;
  pb.Max := DBGrid1.SelectedRows.Count+4;
  pb.Position := 1;

  ACBrCTe1.SSL.SelecionarCertificado;

  Inicia_Memo('E N V I A   CT-e');
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        Application.ProcessMessages;
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
        pb.Position := i+1;
        if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
        begin
          if (DM4.cdsCteGSTATUSENVIO.Value > 0) then
          begin
            if DM4.cdsCteGSTATUS.Value > 0  then
            begin
              msgSaida := '[ERRO '+DM4.cdsCteGStatus.AsString+'] CT-e: '+DM4.cdsCteGNUMC.AsString+'. CT-e com erro, não pode ser enviado.';
              Resp.Lines.Append(msgSaida);
            end
            else
            begin
              Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
              CT4_Enviar();
              //msgSaida := 'CT-e: '+DM4.cdsCteGNUMC.AsString+' enviado.';
              //Resp.Lines.Append(msgSaida);
            end;

            //resp.Lines.Append('.: CT-e: '+DM4.cdsCteGNUMC.AsString);
          end
          else
          begin
            msgSaida := '[ERRO] CT-e: '+DM4.cdsCteGNUMC.AsString+', SEM arquivo XML (favor criar o CT-E antes).';
            Resp.Lines.Append(msgSaida);
          end;
        end
        else
        begin
          msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser criado)';
          Resp.Lines.Append(msgSaida);
        end;
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');

    // termina
    //Mostra_Lista;
    DM4.cdsCteG.Refresh;
    pb.Visible := false;

end;

procedure TCTeGer.btErrosClick(Sender: TObject);
begin
  CteErros.Entrar(dt1.DateTime, dt2.DateTime);
  CteErros.Show;
end;

procedure TCTeGer.RcuperarArquivoAutorizado1Click(Sender: TObject);
  var RetWS, arqNome, Pasta : String;

begin
  ACBrCTe1.SSL.SelecionarCertificado;

  if (DM4.cdsCteGSTATUSENVIO.Value = 4) or (DM4.cdsCteGSTATUSENVIO.Value = 6)  or (DM4.cdsCteGSTATUS.Value = 204)  or (DM4.cdsCteGSTATUS.Value = 539) then
  begin

    ACBrCTe1.Conhecimentos.Clear;
    // Mudar ACBrCte1.Conhecimentos.Configuracoes.Certificados.SelecionarCertificado;


    Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);

    //ACBrNFe1.WebServices.Recibo.Recibo := aux;
    ACBrCte1.Consultar;
    Resp.Clear;
    Resp.Lines.Append(' ** Recuperar **');
    Resp.Lines.Append(' CT-e: '+DM4.cdsCteGNUMC.AsString);
    Resp.Lines.Append(' CTeChave: '+ACBrCTe1.WebServices.Consulta.CTeChave);
    Resp.Lines.Append(' Situação Atual: '+ACBrCTe1.WebServices.Consulta.xMotivo);
    RetWS := ACBrCTe1.WebServices.Consulta.RetornoWS;
    /// Salva o arquivo da Nota
    Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, true);
    /// Salva o Evento
    Salvar_XML_Evento(DM4.cdsCteGARQUIVO.Value, RetWS, DM4.cdsCteGNUMC.Value,DM4.cdsCteGLIGTRANSP.Value,ACBrCTe1.WebServices.Consulta.cStat);
    Marcar_Envio(DM4.cdsCteGID.Value, 4);
    CTeGer.Show;
  end;

    // se a nota não for ENVIADA ou CANCELADA
  if (DM4.cdsCteGSTATUSENVIO.Value < 4) and (DM4.cdsCteGSTATUS.Value <> 204)  or (DM4.cdsCteGSTATUS.Value <> 539) then
  begin
    Resp.Clear;
    Resp.Lines.Append(' ** Não Posso recuperar NOTA NÂO ENVIADA **');
    Resp.Lines.Append(' Nota: '+DM4.cdsCteGNUMC.AsString);
    //Resp.Lines.Append(' Consulta no sistema: '+st);
  end;

end;



function CodMuni(idCli, numNF: Integer):boolean;

var resp, ok : boolean;
    usa : TMarco;
    Bco : TBco;
    ret : String;
    CodMunicipio : Integer;

begin
  CodMunicipio := 0;
  resp := false;
  usa := TMarco.Create;
  usa.Le_INI;
  ok := usa.TestaCon(DM4.ConectaCONH, usa.get_EspelhoServ);
  usa.Destroy;

  if (ok) then
  begin
    Bco := TBco.Create;
    Bco.Espelho_Mostra(idCli, numNF);
    Bco.Destroy;

    ret := IBGE.Procura3(DM4.cdsEspelhoCIDADE.Value, DM4.cdsEspelhoESTADO.Value);
    if (ret <> 'erro') then
    begin
      CodMunicipio := StrToInt(ret);
      Bco := TBco.Create;
      Bco.Espelho_InsereCodMun(DM4.cdsEspelhoID.Value, CodMunicipio);
      Bco.Destroy;
      resp := true;
    end
    else
    begin
      ret := InputBox('Cód Município', 'Cidade: '+ DM4.cdsEspelhoCIDADE.Value + DM4.cdsEspelhoESTADO.Value, '3501152');
      CodMunicipio := StrToInt(ret);
      Bco := TBco.Create;
      Bco.Espelho_InsereCodMun(DM4.cdsEspelhoID.Value, CodMunicipio);
      Bco.Destroy;
    end;
  end;

  CodMuni := resp;
end;


procedure TCTeGer.CodMunicpio1Click(Sender: TObject);
var i : Integer;

begin
  pb.Visible := true;
  pb.Min := 0;
  pb.Max := DBGrid1.SelectedRows.Count+2;
  pb.Position := 1;

  Resp.Clear;
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
          pb.Position := i;

        if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
        begin
          CodMuni(DM4.cdsCteGLIGCLI.Value, DM4.cdsCteGNUMNOTA.Value);
        end
        else msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser criado)';
        Resp.Lines.Append(msgSaida);
        // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');
  Mostra_Lista;
  pb.Visible := false;

end;



procedure TCTeGer.btVeNotaClick(Sender: TObject);
begin
  Resp.Clear;
  if (DM4.cdsCteG.RecordCount > 0) then
  begin

    ACBrCTe1.SSL.SelecionarCertificado;

    Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
    // Mudar ACBrCte1.Conhecimentos.Configuracoes.Certificados.SelecionarCertificado;
    CT_Consultar4;
  end;
end;



procedure TCTeGer.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    numPesq := edNum.Text;
    pesqSIM := true;
    Mostra_Lista;
    edNum.Text := '';
  end;
    if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE), 'n', 'N']) then key := #0;

end;


procedure CT_Cancelar2(mensj:String);

var Bco : TBco;
    wsResp : Integer;
    RetWS : String;

begin
  with CteGer do
  begin
    if (DM4.cdsCteG.RecordCount > 0) then
    begin

      if (DM4.cdsCteGSTATUSENVIO.Value = 4) then
      begin
        Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);

        CT_Cancelar(mensj);
        wsResp := 0;
        wsresp := ACBrCTe1.WebServices.EnvEvento.cStat;
        Resp.Lines.Append('retorno: '+wsResp.ToString);
        //wsResp := ACBrCTe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
        //MemoResp.Lines.Text   := UTF8Encode(ACBrCTe1.WebServices.EnvEvento.cStat);


          //Resp.Lines.Clear;
          //Resp.Lines.Append('Cancelamento ');
          //Resp.Lines.Append('===========================');
          Resp.Lines.Append('Cancelando CT-e: '+ DM4.cdsCteGNUMC.AsString);

        if (wsResp =135) then
        begin
          Salvar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value, true);
          RetWS := ACBrCTe1.WebServices.EnvEvento.EventoRetorno.XML;
          /// Salva o Evento
          Salvar_XML_Evento(DM4.cdsCteGARQUIVO.Value, RetWS, DM4.cdsCteGNUMC.Value,DM4.cdsCteGLIGTRANSP.Value,101);


          Resp.Lines.Append('    .: Cancelado com Sucesso ');
          //Resp.Lines.Append('SEFAZ: '+ ACBrCTe1.WebServices.Cancelamento.xMotivo);
          Marcar_Envio(DM4.cdsCteGID.Value, 5);
          // Desmarca nota nos CTE
          Bco := TBco.Create;
          Bco.Cte_NaoEntregue(DM4.cdsCteGLIGNOTA.Value);
          Bco.Destroy;
        end
        else
        begin
          Resp.Lines.Append('    .: Cancelamento NÃO efetuado !');
          Resp.Lines.Append('       SEFAZ: '+ UTF8Encode(ACBrCTe1.WebServices.EnvEvento.RetWS) );
        end;

      end;
    end;
  end;
end;



procedure TCTeGer.btCancelarClick(Sender: TObject);

var i : Integer;
    ms: String;

begin
  // Mudar ACBrCTe1.Conhecimentos.Configuracoes.Certificados.SelecionarCertificado;
  ACBrCTe1.SSL.SelecionarCertificado;

  Inicia_Memo('Cancela CT-e');
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  ms := InputBox('Justificativa', 'Digite o Motivo do Cancelamento', 'Erro nos dados no CT-e');
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
          if (DM4.cdsCteGSTATUSENVIO.Value > 0) then
          begin
            Carregar_XML(DM4.cdsCteGARQUIVO.Value,DM4.cdsCteGNUMC.Value, DM4.cdsCteGLIGTRANSP.Value);
            CT_Cancelar2(ms);
            //resp.Lines.Append('.: CT-e: '+DM4.cdsCteGNUMC.AsString);
          end
          else
          begin
            msgSaida := '[ERRO] CT-e: '+DM4.cdsCteGNUMC.AsString+', SEM arquivo XML (favor criar o CT-E antes).';
            Resp.Lines.Append(msgSaida);
          end;
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');

  // termina
  Mostra_Lista;

end;


procedure TCTeGer.DBGrid1DblClick(Sender: TObject);
begin
   {
     CteEdit.Entrar;
     CteEdit.Show;
   }
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
    begin
      if (DM4.cdsCteG.RecordCount > 0 ) then
      begin
        CteDet.Entrar(DM4.cdsCteGNUMNOTA.Value, DM4.cdsCteGLIGCLI.Value, DM4.cdsCteGID.Value);
        CteDet.Show;
      end;
    end;

end;

function DOC_verifica(doc:String):String;

var rDOC, dd : String;


begin
  rDOC := doc;
  // ----------
  with CteGer do
  begin
    dd := doc;
    ACBrValidador1.TipoDocto := docCNPJ;
    if (length(dd) > 14) then dd := copy(doc, length(doc)-13,length(doc)-1);
    ACBrValidador1.Documento := dd;
    if (ACBrValidador1.Validar) then rDOC := dd;

    ACBrValidador1.TipoDocto := docCPF;
    if (length(dd) > 11) then dd := copy(dd, length(doc)-10,length(doc)-1);
    ACBrValidador1.Documento := dd;
    if (ACBrValidador1.Validar) then rDOC := dd;

  end;

  DOC_verifica := rDOC;

end;

procedure DOC_Corrige();

var gDOC : String;
    Bco : TBco;

begin
  // ----------
  Bco := TBco.Create;
  Bco.Espelho_Mostra(DM4.cdsCteGLIGCLI.Value, DM4.cdsCteGNUMNOTA.Value);

  gDOC := DOC_verifica( DM4.cdsEspelhoDCNPJ.Value );

  if (gDOC <> DM4.cdsEspelhoDCNPJ.Value) then Bco.Espelho_AlteraCNPJ(DM4.cdsEspelhoID.Value, gDOC);
  Bco.Destroy;

end;

procedure TCTeGer.VerificaCNPJCPF1Click(Sender: TObject);

var i : Integer;

begin
  Posicao := DM4.cdsCteG.GetBookmark;
  Resp.Clear;
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
        if (DM4.cdsCteGSTATUSENVIO.Value < 4) then
        begin
          if (DM4.cdsCteGSTATUSENVIO.Value > 0) then
          begin
            DOC_Corrige();
          end
          else msgSaida := '[ERRO] CT-e: '+DM4.cdsCteGNUMC.AsString+', SEM arquivo XML (favor criar o CT-E antes).';
        end
        else msgSaida :=  '[ATENÇÃO] CT-e: '+DM4.cdsCteGNUMC.AsString+', já Enviado ou cancelado (NÃO pode ser assinado)';
        Resp.Lines.Append(msgSaida);
        // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');
  Mostra_Lista;
  DM4.cdsCteG.GotoBookmark(Posicao);

end;

procedure TCTeGer.VisualizarXML1Click(Sender: TObject);
var sArq : String;
begin
  CTeVer.Label2.Caption := '';
  CTeVer.lbNumCTe.Caption :=  DM4.cdsCteGNUMC.AsString;
  if DM4.cdsCteGSTATUSENVIO.Value < 4 then
  begin
    CTeVer.lbStatus.Caption := 'Não enviado ';
    CTeVer.imOK.Visible := false;
    CTeVer.imCanc.Visible := true;
  end
  else
  begin
    CTeVer.lbStatus.Caption := 'ENVIADO ';
    CTeVer.imOK.Visible := true;
    CTeVer.imCanc.Visible := false;
  end;

  if DM4.cdsCteGSTATUSENVIO.Value > 0 then
  begin
    sArq := Converte_Arquivo(PastaFinal, DM4.cdsCteGARQUIVO.Value, 100);
    CTever.WebBrowser1.Navigate(sArq);
  end;

  CTeVer.Show;
end;

procedure TCTeGer.btImprimirClick(Sender: TObject);

var i : Integer;

begin
//  ACBrCTe1.Conhecimentos.Configuracoes.Certificados.SelecionarCertificado;
  Posicao := DM4.cdsCteG.GetBookmark;
  Resp.Clear;
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
  if (DM4.cdsCteG.RecordCount > 0) then
  begin
  if DBGrid1.SelectedRows.Count>0 then
    with DBGrid1.DataSource.DataSet do
      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
          if (DM4.cdsCteGSTATUSENVIO.Value > 0) then
          begin
            CT_Imprimir;
            msgSaida := '>> Imprimindo CT-e: '+DM4.cdsCteGNUMC.AsString+'. ';
          end
          else msgSaida := '[ERRO] CT-e: '+DM4.cdsCteGNUMC.AsString+', SEM arquivo XML (favor criar o CT-e antes).';
          Resp.Lines.Append(msgSaida);
        // ----- FIM ----------------------------------
      end;
  end
  else ShowMessage('Não existem Conhecimentos!');
  Mostra_Lista;
  DM4.cdsCteG.GotoBookmark(Posicao);

end;

end.
