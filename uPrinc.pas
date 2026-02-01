unit uPrinc;
{
  ------------------------
  mar - 2010 : início
  abr - 2010 : cadastro de clientes
  mai - 2010 : pesquisa clientes
  jun - 2010 : cadastro de grupos e produtos
  jul - 2010 : pesquisa produtos
  fev - 2011 : cadastro de funcionarios
  abr - 2011 : cadastro de motoristas e ajudantes
  jun - 2011 : cadastro de ocorrecias
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, JvExControls, JvGradientHeaderPanel,
  JvSpeedbar, ExtCtrls, JvExExtCtrls, JvExtComponent, StdCtrls, ImgList,
  AppEvnts, Buttons, System.ImageList;

type


  TPrinc = class(TForm)
    MainMenu1: TMainMenu;
    Rodape: TStatusBar;
    Sistema1: TMenuItem;
    Usurios1: TMenuItem;
    Config1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Apoio1: TMenuItem;
    Preos1: TMenuItem;
    Cores1: TMenuItem;
    Modelos1: TMenuItem;
    Servios1: TMenuItem;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    N3: TMenuItem;
    Sadasemticket1: TMenuItem;
    Relatrios1: TMenuItem;
    Entregas1: TMenuItem;
    Clientes2: TMenuItem;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btFcli: TJvSpeedItem;
    btFd: TJvSpeedItem;
    NomeUser: TJvGradientHeaderPanel;
    LbUserID: TLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    Motoristas1: TMenuItem;
    Motoristas2: TMenuItem;
    N6: TMenuItem;
    Funcionrios2: TMenuItem;
    Pastas1: TMenuItem;
    ImageList1: TImageList;
    Entrada2: TMenuItem;
    Sada2: TMenuItem;
    Ajuste1: TMenuItem;
    Perda1: TMenuItem;
    Insere1: TMenuItem;
    Inventrio1: TMenuItem;
    N2: TMenuItem;
    Ocorrncias1: TMenuItem;
    Notas1: TMenuItem;
    Gerencia1: TMenuItem;
    Importa1: TMenuItem;
    EDI1: TMenuItem;
    Excel1: TMenuItem;
    Localiza1: TMenuItem;
    Romaneio1: TMenuItem;
    Novo1: TMenuItem;
    Web1: TMenuItem;
    EnviaNotas1: TMenuItem;
    AtualizaSistema1: TMenuItem;
    btNotas: TJvSpeedItem;
    btRoma: TJvSpeedItem;
    Regio1: TMenuItem;
    Notassem1: TMenuItem;
    Result: TMenuItem;
    Controle: TMenuItem;
    Romaneios1: TMenuItem;
    icket1: TMenuItem;
    Restantes1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    JvSpeedBarSection3: TJvSpeedBarSection;
    btUser: TJvSpeedItem;
    btData: TJvSpeedItem;
    Cobrana1: TMenuItem;
    GerarRelatrio1: TMenuItem;
    Mostrarrelatrios1: TMenuItem;
    Excel2a: TMenuItem;
    Exporta1: TMenuItem;
    EDI2: TMenuItem;
    Pagamento1: TMenuItem;
    InserirDias1: TMenuItem;
    Contrato1: TMenuItem;
    Notas2a: TMenuItem;
    N7: TMenuItem;
    Diversos1: TMenuItem;
    ListadePagamentos1: TMenuItem;
    N8: TMenuItem;
    PesquisaOcorrncia1: TMenuItem;
    MostrarRelatrios21: TMenuItem;
    Contrato3: TMenuItem;
    EntradaDias1: TMenuItem;
    Cobrana2: TMenuItem;
    Pagamento2: TMenuItem;
    Motoristas3: TMenuItem;
    N9: TMenuItem;
    SimuladordeFrete1: TMenuItem;
    Excel21: TMenuItem;
    CobranaImprime1: TMenuItem;
    RespondeExcel1: TMenuItem;
    Dia1: TMenuItem;
    N10: TMenuItem;
    Averbao1: TMenuItem;
    SemTicket1: TMenuItem;
    ListaFuncionrios1: TMenuItem;
    Conhecimentos1: TMenuItem;
    ListaDia1: TMenuItem;
    Conhecimentos2: TMenuItem;
    NotasFora1: TMenuItem;
    btContaNF: TJvSpeedItem;
    JvSpeedItem2: TJvSpeedItem;
    Retornos1: TMenuItem;
    ListadeReentregas1: TMenuItem;
    RecolocaodeEntregas2: TMenuItem;
    Devolues1: TMenuItem;
    Coletas1: TMenuItem;
    PesqVeculo1: TMenuItem;
    N11: TMenuItem;
    icketDatas1: TMenuItem;
    ImprimeDevolues1: TMenuItem;
    ImprimeColetas1: TMenuItem;
    JvSpeedItem3: TJvSpeedItem;
    Gerencial1: TMenuItem;
    AnliseMotorista1: TMenuItem;
    ListaExtras1: TMenuItem;
    CarrosFlaydel1: TMenuItem;
    CarrosFlaydel2: TMenuItem;
    Carro1: TMenuItem;
    Motorista1: TMenuItem;
    Avisos1: TMenuItem;
    N13: TMenuItem;
    WEBcompleta2: TMenuItem;
    Label1: TLabel;
    N12: TMenuItem;
    AdmReentrega1: TMenuItem;
    btReent: TSpeedButton;
    icketExcel1: TMenuItem;
    icket2Excel1: TMenuItem;
    GerenciarCTe1: TMenuItem;
    N14: TMenuItem;
    Configuraes1: TMenuItem;
    JvSpeedBarSection4: TJvSpeedBarSection;
    btVales: TJvSpeedItem;
    semCobrana1: TMenuItem;
    ClassificarTransp1: TMenuItem;
    XML1: TMenuItem;
    ListaMotoristas1: TMenuItem;
    GrupoClientes1: TMenuItem;
    N16: TMenuItem;
    Cotao1: TMenuItem;
    Estoque1: TMenuItem;
    Central1: TMenuItem;
    Confere1: TMenuItem;
    Importa2: TMenuItem;
    Pesquisa1: TMenuItem;
    Produtos1: TMenuItem;
    PesquisaporCliente1: TMenuItem;
    Imprimir1: TMenuItem;
    Grficos1: TMenuItem;
    ImprimirRecibos1: TMenuItem;
    EntradasdoDia1: TMenuItem;
    Estatsticas1: TMenuItem;
    EstatsticasMotoristas1: TMenuItem;
    N15: TMenuItem;
    Entradas1: TMenuItem;
    NveldeEntregas1: TMenuItem;
    N17: TMenuItem;
    EnviaSMS1: TMenuItem;
    EstatsticasPrazo1: TMenuItem;
    VerRotas1: TMenuItem;
    VerRotas2: TMenuItem;
    CadastrarRotas1: TMenuItem;
    ConfereCEPs1: TMenuItem;
    N18: TMenuItem;
    semCliente1: TMenuItem;
    DirioCliente1: TMenuItem;
    RelatrioRpido1: TMenuItem;
    N19: TMenuItem;
    BaixaporRomaneio1: TMenuItem;
    ConfereRomaneio1: TMenuItem;
    NoEntregues1: TMenuItem;
    RastreiodaNota1: TMenuItem;
    Financeiro1: TMenuItem;
    Lanamento1: TMenuItem;
    N20: TMenuItem;
    RelayrioContbel1: TMenuItem;
    MostraPrevises1: TMenuItem;
    N21: TMenuItem;
    Estrutura1: TMenuItem;
    Bancos1: TMenuItem;
    EntradadePrevises1: TMenuItem;
    Pendncias1: TMenuItem;
    PrazosdeEntrega1: TMenuItem;
    PrazoRelatrio1: TMenuItem;
    RetiradasdoRomaneio1: TMenuItem;
    ConfereEntrada1: TMenuItem;
    EntradaManual1: TMenuItem;
    N22: TMenuItem;
    Bancos2: TMenuItem;
    N23: TMenuItem;
    DocumCobrana1: TMenuItem;
    RespondeCTe1: TMenuItem;
    Detalhesdasocorrncias1: TMenuItem;
    PesquisaCTe1: TMenuItem;
    Label2: TLabel;
    edNF: TEdit;
    ultNF: TLabel;
    OCORENs1: TMenuItem;
    Label3: TLabel;
    edRoma: TEdit;
    WEBbaixa1: TMenuItem;
    Integraes1: TMenuItem;
    ERPTiny1: TMenuItem;
    NotasFiscais1: TMenuItem;
    Pedidos1: TMenuItem;
    N24: TMenuItem;
    CubagemGeral1: TMenuItem;
    NotasSAC1: TMenuItem;
    JvSpeedItem1: TJvSpeedItem;
    XMLmensal1: TMenuItem;
    ClculosFrete1: TMenuItem;
    RetornaRastreio1: TMenuItem;
    Acompanha1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Config1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Preos1Click(Sender: TObject);
    procedure Cores1Click(Sender: TObject);
    procedure Modelos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure PesquisaCliente1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure btFcliClick(Sender: TObject);
    procedure Funcionrios2Click(Sender: TObject);
    procedure Motoristas1Click(Sender: TObject);
    procedure Motoristas2Click(Sender: TObject);
    procedure Pastas1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Gerencia1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure EnviaNotas1Click(Sender: TObject);
    procedure btNotasClick(Sender: TObject);
    procedure btRomaClick(Sender: TObject);
    procedure Regio1Click(Sender: TObject);
    procedure Notassem1Click(Sender: TObject);
    procedure AtualizaSistema1Click(Sender: TObject);
    procedure ResultClick(Sender: TObject);
    procedure Romaneios1Click(Sender: TObject);
    procedure icket1Click(Sender: TObject);
    procedure Restantes1Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure ListaReent1Click(Sender: TObject);
    procedure btDataClick(Sender: TObject);
    procedure btUserClick(Sender: TObject);
    procedure GerarRelatrio1Click(Sender: TObject);
    procedure Mostrarrelatrios1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Excel2aClick(Sender: TObject);
    procedure EDI2Click(Sender: TObject);
    procedure InserirDias1Click(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure Notas2aClick(Sender: TObject);
    procedure Diversos1Click(Sender: TObject);
    procedure ListadePagamentos1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure PesquisaOcorrncia1Click(Sender: TObject);
    procedure MostrarRelatrios21Click(Sender: TObject);
    procedure EntradaDias1Click(Sender: TObject);
    procedure Motoristas3Click(Sender: TObject);
    procedure SimuladordeFrete1Click(Sender: TObject);
    procedure Excel21Click(Sender: TObject);
    procedure Cobrana2Click(Sender: TObject);
    procedure CobranaImprime1Click(Sender: TObject);
    procedure Pagamento2Click(Sender: TObject);
    procedure RespondeExcel1Click(Sender: TObject);
    procedure Dia1Click(Sender: TObject);
    procedure Averbao1Click(Sender: TObject);
    procedure RecolocaodeEntregas1Click(Sender: TObject);
    procedure SemTicket1Click(Sender: TObject);
    procedure ListaFuncionrios1Click(Sender: TObject);
    procedure ListaDia1Click(Sender: TObject);
    procedure Conhecimentos2Click(Sender: TObject);
    procedure Ocorrncias1Click(Sender: TObject);
    procedure NotasFora1Click(Sender: TObject);
    procedure btContaNFClick(Sender: TObject);
    procedure JvSpeedItem2Click(Sender: TObject);
    procedure ListadeReentregas1Click(Sender: TObject);
    procedure Devolues1Click(Sender: TObject);
    procedure RecolocaodeEntregas2Click(Sender: TObject);
    procedure Coletas1Click(Sender: TObject);
    procedure PesqVeculo1Click(Sender: TObject);
    procedure icketDatas1Click(Sender: TObject);
    procedure ImprimeDevolues1Click(Sender: TObject);
    procedure ImprimeColetas1Click(Sender: TObject);
    procedure JvSpeedItem3Click(Sender: TObject);
    procedure AnliseMotorista1Click(Sender: TObject);
    procedure ListaExtras1Click(Sender: TObject);
    procedure CarrosFlaydel1Click(Sender: TObject);
    procedure Carro1Click(Sender: TObject);
    procedure Motorista1Click(Sender: TObject);
    procedure Avisos1Click(Sender: TObject);
    procedure WEBcompleta2Click(Sender: TObject);
    procedure JvSpeedBar1Resize(Sender: TObject);
    procedure AdmReentrega1Click(Sender: TObject);
    procedure icketExcel1Click(Sender: TObject);
    procedure icket2Excel1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure GerenciarCTe1Click(Sender: TObject);
    procedure btReentClick(Sender: TObject);
    procedure btValesClick(Sender: TObject);
    procedure semCobrana1Click(Sender: TObject);
    procedure ClassificarTransp1Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure ListaMotoristas1Click(Sender: TObject);
    procedure GrupoClientes1Click(Sender: TObject);
    procedure Cotao1Click(Sender: TObject);
    procedure Central1Click(Sender: TObject);
    procedure PesquisaporCliente1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Grficos1Click(Sender: TObject);
    procedure ImprimirRecibos1Click(Sender: TObject);
    procedure EntradasdoDia1Click(Sender: TObject);
    procedure Estatsticas1Click(Sender: TObject);
    procedure EstatsticasMotoristas1Click(Sender: TObject);
    procedure Entradas1Click(Sender: TObject);
    procedure NveldeEntregas1Click(Sender: TObject);
    procedure EnviaSMS1Click(Sender: TObject);
    procedure EstatsticasPrazo1Click(Sender: TObject);
    procedure CadastrarRotas1Click(Sender: TObject);
    procedure VerRotas2Click(Sender: TObject);
    procedure ConfereCEPs1Click(Sender: TObject);
    procedure semCliente1Click(Sender: TObject);
    procedure DirioCliente1Click(Sender: TObject);
    procedure RelatrioRpido1Click(Sender: TObject);
    procedure BaixaporRomaneio1Click(Sender: TObject);
    procedure ConfereRomaneio1Click(Sender: TObject);
    procedure NoEntregues1Click(Sender: TObject);
    procedure RastreiodaNota1Click(Sender: TObject);
    procedure Estrutura1Click(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);
    procedure EntradadePrevises1Click(Sender: TObject);
    procedure RelayrioContbel1Click(Sender: TObject);
    procedure MostraPrevises1Click(Sender: TObject);
    procedure Pendncias1Click(Sender: TObject);
    procedure PrazosdeEntrega1Click(Sender: TObject);
    procedure PrazoRelatrio1Click(Sender: TObject);
    procedure RetiradasdoRomaneio1Click(Sender: TObject);
    procedure ConfereEntrada1Click(Sender: TObject);
    procedure EntradaManual1Click(Sender: TObject);
    procedure Bancos2Click(Sender: TObject);
    procedure DocumCobrana1Click(Sender: TObject);
    procedure RespondeCTe1Click(Sender: TObject);
    procedure Detalhesdasocorrncias1Click(Sender: TObject);
    procedure PesquisaCTe1Click(Sender: TObject);
    procedure edNFKeyPress(Sender: TObject; var Key: Char);
    procedure OCORENs1Click(Sender: TObject);
    procedure edRomaKeyPress(Sender: TObject; var Key: Char);
    procedure WEBbaixa1Click(Sender: TObject);
    procedure NotasFiscais1Click(Sender: TObject);
    procedure CubagemGeral1Click(Sender: TObject);
    procedure NotasSAC1Click(Sender: TObject);
    procedure JvSpeedItem1Click(Sender: TObject);
    procedure XMLmensal1Click(Sender: TObject);
    procedure ClculosFrete1Click(Sender: TObject);
    procedure RetornaRastreio1Click(Sender: TObject);
    procedure Acompanha1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Princ: TPrinc;

implementation

{$R *.dfm}

uses uDM1, uDM2, uLib, utmpConexao, utmpTela, ucadUser1, utmpEntra,
  usmpPreco, usmpModelo, ucadCli, ucadFuncs, upsqCli, usrvEnt,
  ucliEscolhe, usmpGrupo, Global, ucadProd, uConfig, uVisualEst, uNotas,
  uRoman, uWebEnv, uRegiao, uRomaSem, uWebRec, uRomaRes, uControlR,
  uControlT, uResto, uControlL, uDataS, uRel1, uRel2, uRel3, uRel4,
  uExpEdi, uContDias, uPagCont, uPagNota, uPagDiv, uPagR1, uImpXLS,
  uOcorreNF, uCob2, uSimula, uExcel2, uContCob, uContImp, uContPag,
  uRespXL, uRomaPQ, uAverb, uListaRe, uSemTK, uListaFunc, uDM4, uConhLista,
  uConhImp, uOcorre, uNFfora, uNFconta, uTikDev, uTikDev2, upsqCar, utikDT,
  uTikCol, uTikCol2, uExped, uGanhoM, uListaServ, uCarro, upqCarC, upqCarM,
  uAvisoCfg, uWebAtual, uAvisoVe, uAvisos, uNFreent, uTktxls, uTktxls2,
  uCtePad, uCteGer, uPagVale, uSemCob, uCteClass, uImpXML, uMotList,
  uPagVe, uCliGP, uCota1, uStokCentral, uNFcli,  uGraficos,
  uNotas2, uNfPQ, uEntDia, uEstatCli, uEstatMOT , uImprimeXML, uNivel,
  uSMSenv, uPrazo, uRotas, uRotasAdm, uBipCEP, uSemCli, uDiarioCli, uCobr2,
  uBaixaRap, uBipRoma, uDiasCria, uNFsegue, uFinContas, uFinPrev, uFinRelP,
  uFinContab, uFinRelC, uPendeVisual, uPrazos, uPrazo2, uNFsegue2, uBIPnota,
  uNFManual, uBIP2, uCadBanco, uDocCob, uRespCte, uPagDeta, uCtePQ, uNFenvio,
  uWebBaixa, uTinyNF, uCubagem, uWEBsinc, uSACnotas, veBarra, uCTeXML, uFrete,
  uRetornaR, uNFdia, uRoma;

{
  =====================================================
  versão 1.0 - 25.01.2010 - software pronto

}

procedure Entrar();

var usa   : TMarco;
    ok    : boolean;
    serv  : String;
    versao: STring;
    dt    : Tdatetime;
    Av    : TAviso;

begin
  DM1.Tag := 1;
  versao := '2.51.5 15/set/2025';
  Princ.Caption := 'Conteiner  [ '+versao+' ]';

  with Princ do
  begin

    // DT SISTEMA =========================================
    dataS.set_dtSis(Now);
    if (dataS.ShowModal = mrOk) then
      dt := dataS.dtSis.DateTime
    else
      dt := Now;

    Rodape.Panels[4].Text := 'Data do Sistema '+FormatDateTime('dd/MM/yyyy', dt);

    usa := TMarco.Create;
    usa.set_dtSis(dt);
    usa.Grava_INI(5);
    usa.Destroy;
    // ** ================================================


    if (Rodape.Panels[2].Text <> 'Conectado') then
    begin
       usa := TMarco.Create;

       usa.Le_INI;
       Princ.Caption := Princ.Caption + '  '+usa.get_versao;
       Princ.NomeUser.LabelCaption := 'Cliente: '+usa.get_cliNome;
       idCli        := usa.get_cliNumero;

       serv := usa.get_bdserver;
       ok := usa.TestaCon(DM1.Conexao, serv);
       if (ok) then
       begin
         DM1.Conexao.Connected := true;
         Rodape.Panels[2].Text := 'Conectado';
         Princ.Enabled := False;
         tmpEntra.Show;
         // Tela de Apresentação
         tmpTela := TtmpTela.Create(Application) ;
         tmpTela.Show;
         tmpTela.Update;
         ok := usa.TestaCon(DM1.CEPS     , usa.get_cepServ   );
         ok := usa.TestaCon(DM4.Conecta2 , usa.get_AverbServ );
       end
       else
       begin
         //smpprecos.Show;
         Rodape.Panels[2].Text := 'Não Conectado';
         tmpConexao.set_tipo(1);
         tmpConexao.Show;
       end;
    end; // rodape
  end // with
end;

procedure TPrinc.Sair1Click(Sender: TObject);

var resp : integer;

begin
  resp := MessageDlg('Tem certeza que deseja sair?',mtConfirmation,[mbYes,mbNo], 0);
  if (resp = mrYes) then Close;
end;

procedure TPrinc.Config1Click(Sender: TObject);

begin
  tmpConexao.set_tipo(1);
  tmpConexao.Show;
end;

procedure TPrinc.Usurios1Click(Sender: TObject);

begin
  cadUser1.Show;
end;

procedure TPrinc.PrazoRelatrio1Click(Sender: TObject);
begin
  Prazo2.Entrar;
  Prazo2.Show;
end;

procedure TPrinc.PrazosdeEntrega1Click(Sender: TObject);
begin
  Prazos.Entrar;
  Prazos.Show;
end;

procedure TPrinc.Preos1Click(Sender: TObject);

begin
  cadprod.Entrar;
  cadProd.Show;
end;

procedure TPrinc.Cores1Click(Sender: TObject);

var usa : TMarco;

begin
  smpGrupo.set_idCli(1);
  smpGrupo.Show;
end;

procedure TPrinc.Modelos1Click(Sender: TObject);
begin
  cadCli.set_idUser(StrToInt(LbUserID.Caption));
  cadCli.set_idCli(0);
  cadCli.Show;
end;

procedure TPrinc.Clientes1Click(Sender: TObject);
begin
  cadCli.set_idUser(StrToInt(LbUserID.Caption));
  cadCli.Show;
end;

procedure TPrinc.Funcionrios1Click(Sender: TObject);
begin
  cadFuncs.set_idUser(StrToInt(LbUserID.Caption));
  cadFuncs.Show;
end;

procedure TPrinc.Pendncias1Click(Sender: TObject);
begin
  PendVisual.Entrar;
  PendVisual.Show;
end;

procedure TPrinc.PesquisaCliente1Click(Sender: TObject);
begin
  psqCli.Show;
end;

procedure TPrinc.PesquisaCTe1Click(Sender: TObject);
begin
  CtePQ.Entrar;
  CtePQ.Show;
end;

procedure TPrinc.Entrada1Click(Sender: TObject);
begin
  VisualEst.Show;
end;

procedure TPrinc.EntradadePrevises1Click(Sender: TObject);
begin
  FinPrev.Show;
end;

procedure TPrinc.btFcliClick(Sender: TObject);
begin
  cliEscolhe.Show;
end;

procedure TPrinc.Funcionrios2Click(Sender: TObject);
begin
  cadFuncs.set_tipo(0);
  cadFuncs.Show;
end;

procedure TPrinc.Motoristas1Click(Sender: TObject);
begin
  cadFuncs.set_tipo(1);
  cadFuncs.Show;
end;

procedure TPrinc.Motoristas2Click(Sender: TObject);
begin
  cadFuncs.set_tipo(2);
  cadFuncs.Show;
end;

procedure TPrinc.Pastas1Click(Sender: TObject);
begin
  Config.Show;
end;

procedure TPrinc.FormCreate(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Height := 200;
  Width  := GetSystemMetrics(SM_CXScreen);
end;

procedure TPrinc.Gerencia1Click(Sender: TObject);
begin
{
  NotasP.set_idNota(0);
  NotasP.Entrar;
  NotasP.Show;
  }
  Notas2.Entrar;
  Notas2.Show;
end;



procedure TPrinc.FormActivate(Sender: TObject);

begin
  //DecimalSeparator := ',';
  //ThousandSeparator:= '.';


  if (Rodape.Panels[1].Text = '*') then Entrar

  else
  if (Rodape.Panels[2].Text <> 'Não Conectado') then
  if not WEBsinc.Showing then
  begin
    WEBsinc.Entrar;
    if WEBsinc.N_sem > 0 then
    begin
      WEBsinc.Top := 210;
      WEBsinc.Left:= 2;
      WEBsinc.Show;
    end
    else
      WEBsinc.Hide;
  end;

end;

procedure TPrinc.Novo1Click(Sender: TObject);
begin
  Roman.set_MostraNum(true);
  Roman.Entrar;
  Roman.Show;
end;

procedure TPrinc.EnviaNotas1Click(Sender: TObject);
begin
  WebEnv.Show;
end;

procedure TPrinc.btNotasClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(0);

  NotasP.Show;
end;

procedure TPrinc.btRomaClick(Sender: TObject);
begin
  Roman.set_idRoma(0);
  Roman.Entrar;
  Roman.Show;
end;

procedure TPrinc.Regio1Click(Sender: TObject);
begin
  Regiao.Entrar;
  Regiao.Show;
end;

procedure TPrinc.Notassem1Click(Sender: TObject);
begin
  RomaSEM.Entrar;
  RomaSEM.Show;
end;

procedure TPrinc.AtualizaSistema1Click(Sender: TObject);
begin
  WebRec.Show;
end;

procedure TPrinc.ResultClick(Sender: TObject);
begin
  RomaRes.Entrar;
  RomaRes.Show;
end;

procedure TPrinc.RetiradasdoRomaneio1Click(Sender: TObject);
begin
  NFSegue2.dtF.DateTime := Now;
  NFsegue2.Show;
end;

procedure TPrinc.RetornaRastreio1Click(Sender: TObject);
begin
  RetornaR.Show;
end;

procedure TPrinc.Romaneios1Click(Sender: TObject);
begin
  ControlR.dtRoma.DateTime := Now -1;
  ControlR.Show;
end;

procedure TPrinc.icket1Click(Sender: TObject);
begin
  ControlT.Show;
end;

procedure TPrinc.Restantes1Click(Sender: TObject);
begin
  resto.Show;
end;

procedure TPrinc.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);

   var msg : String;

begin
   if (e is E_endereco) then
   	msg := 'Digite no máximo 50 letras no endereço'

   else if (e is E_complemento) then
   	msg := 'Digite no máximo 10 letras no complemento'

   else if (e is E_bairro) then
   	msg := 'Digite no máximo 20 letras no bairro'

   else if (e is E_cidade) then
   	msg := 'Digite no máximo 30 letras no campo cidade'

   else if (e is E_Remetente) then
   	msg := 'Verifique o endereço do REMETENTE'

   else if (e is E_Destinatario) then
   	msg := 'Verifique o endereço do DESTINATÁRIO'

   else if pos('overflow',e.Message) <> 0 then
   	msg := 'Valor excedeu o limite.'+#13+'Número muito grande ou Texto com muitas letras.'

   else if pos('no permission',e.Message) <> 0 then
   	msg := 'Sem permissão para acessar o Banco de Dados'

   else if pos('closed dataset',e.Message) <> 0 then
   	msg := 'Não é possível acessar um Banco de Dados FECHADO'

   else if pos('Record not found',e.Message) <> 0 then
   	msg := 'Nenhum registro encontrado'

   else if (e is EStackOverFlow) then
   	msg := 'Estouro de Pilha'

   else if pos('is not a valid integer',e.Message) <> 0 then
   	msg := 'Insira um valor inteiro válido'

   else if pos('is not a valid time',e.Message) <> 0 then
   	msg := 'Insira um valor correto para HORA'

   else if pos('is not a valid floating point',e.Message) <> 0 then
   	msg := 'Insira um valor REAL correto'

   else if pos('division by zero',e.Message) <> 0 then
   	msg := 'Não é possível dividir por zero!'

   else
   	msg := 'Ocorreu o seguinte erro não esperado: ';

   ShowMessage('Erro'+#13+msg+#13+#13+'[ '+e.Message+' ]');

end;

procedure TPrinc.ListaReent1Click(Sender: TObject);
begin
  ControlL.dtRoma.DateTime := Now - 1;
  ControlL.Show;
end;

procedure TPrinc.btDataClick(Sender: TObject);

var dt : TDateTime;
    usa : TMarco;


begin
    usa := TMarco.Create;

    usa.Le_INI;

    dt := usa.get_dtSis();
    dataS.dtSis.DateTime := dt;
    if (dataS.ShowModal = mrOk) then
      dt := dataS.dtSis.DateTime
    else
      dt := Now;

    usa.set_dtSis(dt);
    usa.Grava_INI(5);
    Rodape.Panels[4].Text := 'Data do Sistema '+FormatDateTime('dd/MM/yyyy', dt);
    usa.Destroy;
end;

procedure TPrinc.btUserClick(Sender: TObject);
begin
  tmpEntra.set_tenta(0);
  tmpEntra.Show;
end;

procedure TPrinc.GerarRelatrio1Click(Sender: TObject);
begin
  RelGer.dt1.DateTime := now - 1;
  RelGer.dt2.DateTime := now;
  RelGer.set_idCob(0);
  relGer.lbPag.Caption := 'sem Número Cobrança';
  relGer.Show;
end;

procedure TPrinc.MostraPrevises1Click(Sender: TObject);
begin
  FinRelP.Show;
end;

procedure TPrinc.Mostrarrelatrios1Click(Sender: TObject);
begin
  rel2.Show;
end;

procedure TPrinc.Clientes2Click(Sender: TObject);
begin
  rel3.show;
end;

procedure TPrinc.Excel2aClick(Sender: TObject);
begin
  rel4.dtRel.DateTime := now - 1;
  rel4.Show;
end;

procedure TPrinc.EDI2Click(Sender: TObject);
begin
  ExpEdi.set_idCli(idCli);
  ExpEdi.Show;
end;

procedure TPrinc.edNFKeyPress(Sender: TObject; var Key: Char);
begin
  // Pesquisa rápida de nota fiscal
  if (Key=#13) then
    if (length(EdNF.Text)> 1) then
    begin
      NotasP.Entrar;
      NotasP.Show;
      NotasP.PesqExterna(edNF.Text);
      ultNf.Caption := edNF.Text;
      edNf.Text := '';
    end;
  if not(Key in ['0'..'9',Chr(8), 't', 'T']) then Key := #0;


end;

procedure TPrinc.edRomaKeyPress(Sender: TObject; var Key: Char);
  var nRomaP : Integer;
      Rm : TRoma;
begin
  // Pesquisa rápida de Romaneio
  if (Key=#13) then
    if (length(EdRoma.Text)> 0) then
    begin
      Rm := Troma.Create;
      nRomaP := Rm.Pesquisa_Romaneio(edRoma.Text);
      Rm.Destroy;
      Roman.set_idRoma(nRomaP);
      Roman.set_MostraNum(true);
      Roman.Entrar;
      Roman.Show;
      edRoma.Text := '';
    end;
  if not(Key in ['0'..'9',Chr(8), '/']) then Key := #0;
end;

procedure TPrinc.InserirDias1Click(Sender: TObject);
begin
  ContDias.Entrar;
  ContDias.Show;
end;

procedure TPrinc.Contrato1Click(Sender: TObject);
begin
  PagCont.Show;
end;

procedure TPrinc.Notas2aClick(Sender: TObject);
begin
  PagNota.Show;
end;

procedure TPrinc.Diversos1Click(Sender: TObject);
begin
  PagDiv.dat1.DateTime := dtPag1;
  PagDiv.dat2.DateTime := dtPag2;
  PagDiv.Show;
end;

procedure TPrinc.DocumCobrana1Click(Sender: TObject);
begin
  DocCob.set_idUser(StrToInt(LbUserID.Caption));
  DocCob.Entrar;
  DocCob.Show;
end;

procedure TPrinc.Lanamento1Click(Sender: TObject);
begin
  FinContab.Show;
end;

procedure TPrinc.ListadePagamentos1Click(Sender: TObject);
begin
  PagVe.Entrar;
  PagVe.Show;

  {
  PagR1.dat1.DateTime := dtPag1;
  PagR1.dat2.DateTime := dtPag2;
  PagR1.Show;
  }
end;

procedure TPrinc.Excel1Click(Sender: TObject);
begin
  ImpXLS.set_idCli(idCli);
  ImpXLS.Show;
end;

procedure TPrinc.PesquisaOcorrncia1Click(Sender: TObject);
begin
  OcorreNF.Show;
end;

procedure TPrinc.MostrarRelatrios21Click(Sender: TObject);
begin
  Cob2.Show;
end;

procedure TPrinc.EntradaDias1Click(Sender: TObject);
begin
  ContDias.Entrar;
  ContDias.Show;
end;

procedure TPrinc.EntradaManual1Click(Sender: TObject);
begin

  NFmanual.Show;
  NFmanual.Entrar;
end;

procedure TPrinc.Motoristas3Click(Sender: TObject);
begin
  PagCont.Show;
end;

procedure TPrinc.SimuladordeFrete1Click(Sender: TObject);
begin
  Simula.Show;
end;

procedure TPrinc.Excel21Click(Sender: TObject);
begin
  Excel2.Show;
end;

procedure TPrinc.Cobrana2Click(Sender: TObject);
begin
  ContCob.Show;
end;

procedure TPrinc.CobranaImprime1Click(Sender: TObject);
begin
  ContImp.Show;
end;

procedure TPrinc.Pagamento2Click(Sender: TObject);
begin
  ContPag.Show;
end;

procedure TPrinc.RespondeCTe1Click(Sender: TObject);
begin
  RespCte.Entrar;
  RespCte.Show;
end;

procedure TPrinc.RespondeExcel1Click(Sender: TObject);
begin
  RespXL.Show;
end;

procedure TPrinc.Dia1Click(Sender: TObject);
begin
  RomaPq.Entrar;
  RomaPQ.Show;
end;

procedure TPrinc.Averbao1Click(Sender: TObject);
begin
  Averb.Entrar;
  Averb.Show;
end;

procedure TPrinc.RecolocaodeEntregas1Click(Sender: TObject);
begin
  ListaRe.Show;
end;

procedure TPrinc.SemTicket1Click(Sender: TObject);
begin

  SemTK.Show;
end;

procedure TPrinc.ListaFuncionrios1Click(Sender: TObject);
begin
  ListaFunc.Show;
end;

procedure TPrinc.ListaDia1Click(Sender: TObject);
begin
  ConhLista.Show;
end;

procedure TPrinc.Conhecimentos2Click(Sender: TObject);
begin
  ConhImp.Entrar;
  ConhImp.Show;
end;

procedure TPrinc.OCORENs1Click(Sender: TObject);
begin
  NFenvio.Entrar;
  NFenvio.Show;
end;

procedure TPrinc.Ocorrncias1Click(Sender: TObject);
begin
  Ocorre.Show;
end;

procedure TPrinc.NotasFiscais1Click(Sender: TObject);
begin
  //  Importa notas
  TinyNF.Entrar;
  TinyNF.Show;
end;

procedure TPrinc.NotasFora1Click(Sender: TObject);
begin
  NFfora.set_idU(idUser);
  NFfora.show;
end;

procedure TPrinc.NotasSAC1Click(Sender: TObject);
begin
 SACnotas.Entrar;
 SACnotas.Show;
end;

procedure TPrinc.btContaNFClick(Sender: TObject);
begin
  NFconta.Show;
end;

procedure TPrinc.JvSpeedItem1Click(Sender: TObject);
begin

  eBarra.StatusBar1.Panels[0].Text := 'Não Conectado';
  eBarra.BarraBotoes.Enabled := false;
  eBarra.Entrar;
  eBarra.Show;
end;

procedure TPrinc.JvSpeedItem2Click(Sender: TObject);
begin
  RomaPQ.Entrar;
  RomaPQ.Show;
end;

procedure TPrinc.ListadeReentregas1Click(Sender: TObject);
begin
  ControlL.dtRoma.DateTime := Now - 1;
  ControlL.Show;
end;

procedure TPrinc.Detalhesdasocorrncias1Click(Sender: TObject);
begin
  PagDeta.Entrar;
  PagDeta.Show;
end;

procedure TPrinc.Devolues1Click(Sender: TObject);
begin
  TikDev.Entra;
  TikDev.Show;
end;

procedure TPrinc.RecolocaodeEntregas2Click(Sender: TObject);
begin
  ListaRe.Show;
end;

procedure TPrinc.Coletas1Click(Sender: TObject);
begin
  TikCol.Entra;
  TikCol.Show;
end;

procedure TPrinc.PesqVeculo1Click(Sender: TObject);
begin
  psqCar.Show;
end;

procedure TPrinc.icketDatas1Click(Sender: TObject);
begin
  TikDT.Show;
end;

procedure TPrinc.ImprimeDevolues1Click(Sender: TObject);
begin
  TikDev2.Show;
end;

procedure TPrinc.ImprimeColetas1Click(Sender: TObject);
begin
  TikCol2.Show;
end;

procedure TPrinc.JvSpeedItem3Click(Sender: TObject);
begin
  Exped.Show;
end;

procedure TPrinc.AnliseMotorista1Click(Sender: TObject);
begin
  GanhoM.Show;
end;

procedure TPrinc.ListaExtras1Click(Sender: TObject);
begin
  ListaServ.Entrar;
  ListaServ.Show;
end;

procedure TPrinc.CarrosFlaydel1Click(Sender: TObject);
begin
  Carro.Entrar;
  Carro.Show;
end;

procedure TPrinc.Carro1Click(Sender: TObject);
begin
  pqCarC.Entrar;
  pqCarC.Show;
end;

procedure TPrinc.Motorista1Click(Sender: TObject);
begin
  pqCarM.Entrar;
  pqCarM.Show;
end;

procedure TPrinc.Avisos1Click(Sender: TObject);
begin
  avisoVe.Show;
  avisoVe.Entra;

  avisoCfg.Show;
  avisoCfg.Entrar;  
end;

procedure TPrinc.WEBbaixa1Click(Sender: TObject);
begin
  Webbaixa.Entrar;
  WebBaixa.Show;
end;

procedure TPrinc.WEBcompleta2Click(Sender: TObject);
begin
  webAtual.dat.DateTime := Now;
  WebAtual.Show;
end;

procedure TPrinc.JvSpeedBar1Resize(Sender: TObject);
begin
  Label1.Left := GetSystemMetrics(SM_CXScreen) - Label1.Width - 20;
end;

procedure TPrinc.Acompanha1Click(Sender: TObject);
begin
  NFdia.Entrar;
  NFdia.Show;
end;

procedure TPrinc.AdmReentrega1Click(Sender: TObject);
begin
  NFreent.Entrar;
  NFreent.Show;
end;

procedure TPrinc.icketExcel1Click(Sender: TObject);
begin
  tktxls.Entrar;
  tktxls.Show;
end;

procedure TPrinc.icket2Excel1Click(Sender: TObject);
begin
  Tktxls2.Entrar;
  Tktxls2.Show;
end;

procedure TPrinc.Configuraes1Click(Sender: TObject);
begin
  CTePad.Entrar;
  CTePad.Show;
end;

procedure TPrinc.GerenciarCTe1Click(Sender: TObject);
begin
  CteGer.Entrar;
  CteGer.Show;
  CteGer.edNum.SetFocus; 
end;

procedure TPrinc.btReentClick(Sender: TObject);
begin
  NFreent.Entrar;
  NFreent.Show;
end;

procedure TPrinc.btValesClick(Sender: TObject);


begin
  PagVale.Show;
end;

procedure TPrinc.semCobrana1Click(Sender: TObject);
begin
  semCob.Entrar;
  semCob.Show;
end;

procedure TPrinc.ClassificarTransp1Click(Sender: TObject);
begin
  CTeClass.Entrar;
  CTeClass.Show;
end;

procedure TPrinc.ClculosFrete1Click(Sender: TObject);
begin
  Frete.Entrar;
  Frete.Show;
end;

procedure TPrinc.XML1Click(Sender: TObject);
begin
  impXML.Entrar;
  impXML.SHow;
end;

procedure TPrinc.XMLmensal1Click(Sender: TObject);
begin
  CTeXML.Entrar;
  CTeXML.Show;
end;

procedure TPrinc.ListaMotoristas1Click(Sender: TObject);
begin
  MotList.Entrar;
  MotList.Show;
end;

procedure TPrinc.GrupoClientes1Click(Sender: TObject);
begin
  cliGP.Entrar;
  cliGP.Show;
end;

procedure TPrinc.Cotao1Click(Sender: TObject);
begin
  Cota1.Padroes(0,0);
  Cota1.Entrar;
  Cota1.Show;
end;

procedure TPrinc.CubagemGeral1Click(Sender: TObject);
begin
  Cubagem.Entrar;
  Cubagem.Show;
end;

procedure TPrinc.Central1Click(Sender: TObject);
begin
  StkCentral.Show;
end;

procedure TPrinc.PesquisaporCliente1Click(Sender: TObject);
begin
  NFCli.Entrar;
  NFcli.Show;
end;

procedure TPrinc.Imprimir1Click(Sender: TObject);
begin
  imprimeXML.Entrar;
  ImprimeXML.Show;
end;

procedure TPrinc.Grficos1Click(Sender: TObject);
begin
  Graficos.Show;
end;

procedure TPrinc.ImprimirRecibos1Click(Sender: TObject);
begin
  nfPQ.ENtrar;
  nfPQ.Show;
end;

procedure TPrinc.EntradasdoDia1Click(Sender: TObject);
begin
  EntDia.DiaE.DateTime := Now;
  EntDia.Show;
end;

procedure TPrinc.Estatsticas1Click(Sender: TObject);
begin
  EstatCli.dt1.DateTime := Now -2;
  EstatCli.dt2.DateTime := Now;

  EstatCli.Show;
end;

procedure TPrinc.EstatsticasMotoristas1Click(Sender: TObject);
begin

  EstatMot.Show;
end;

procedure TPrinc.Entradas1Click(Sender: TObject);
begin
  EntDia.DiaE.DateTime := Now;
  EntDia.Show;
end;

procedure TPrinc.NveldeEntregas1Click(Sender: TObject);
begin
  nivel.Entrar;
  Nivel.Show;
end;

procedure TPrinc.EnviaSMS1Click(Sender: TObject);
begin
  SMSenv.dt.DateTime := Now;
  SMSenv.Entrar;
  SMSenv.Show;
end;

procedure TPrinc.EstatsticasPrazo1Click(Sender: TObject);
begin
  Prazo.Entrar;
  Prazo.Show;
end;

procedure TPrinc.Estrutura1Click(Sender: TObject);
begin
  FinContas.Entrar;
  FinContas.Show;
end;

procedure TPrinc.CadastrarRotas1Click(Sender: TObject);
begin
  Rotas.Entrar;
  Rotas.Show;
end;

procedure TPrinc.VerRotas2Click(Sender: TObject);
begin
  RotasAdm.Entrar;
  RotasAdm.Show;
end;

procedure TPrinc.ConfereCEPs1Click(Sender: TObject);
begin
  BipCEP.Entrar;
  BipCEP.Show;
end;

procedure TPrinc.ConfereEntrada1Click(Sender: TObject);
begin
  BIP2.Show;
  BIP2.Entrar;

end;

procedure TPrinc.semCliente1Click(Sender: TObject);
begin
  SemCli.Entrar;
  SemCli.Show;
end;

procedure TPrinc.DirioCliente1Click(Sender: TObject);
begin
  DiarioCli.Entrar;
  DiarioCli.Show;
end;

procedure TPrinc.RelatrioRpido1Click(Sender: TObject);
begin
  Cobr2.Show;
end;

procedure TPrinc.RelayrioContbel1Click(Sender: TObject);
begin
  FinRelC.Show;
end;

procedure TPrinc.BaixaporRomaneio1Click(Sender: TObject);
begin
  Baixarap.Entrar;
  BaixaRap.Show;
end;

procedure TPrinc.Bancos2Click(Sender: TObject);
begin
  CadBanco.Entrar;
  CadBanco.Show;
end;

procedure TPrinc.ConfereRomaneio1Click(Sender: TObject);
begin
  BipRoma.Entrar;
  BipRoma.Show;
end;

procedure TPrinc.NoEntregues1Click(Sender: TObject);
begin
  DiasCria.Entrar;
  DiasCria.Show;
end;

procedure TPrinc.RastreiodaNota1Click(Sender: TObject);
begin
  NFsegue.Entrar;
  NFsegue.Show;
end;

end.
