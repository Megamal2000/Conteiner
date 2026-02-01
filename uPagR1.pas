unit uPagR1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, ppCtrls, jpeg, ppPrnabl, ppClass, ppDB, ppBands,
  ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, JvMemoryDataset,
  Menus, ppDesignLayer, ppParameter;

type
  TPagR1 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    lbkm: TLabel;
    Bevel1: TBevel;
    btImp: TSpeedButton;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btAtualiza: TBitBtn;
    lbQuant: TLabel;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    RelPG: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    Tab: TJvMemoryData;
    TabidMot: TIntegerField;
    TabNomeMot: TStringField;
    TabServ: TCurrencyField;
    TabCreditos: TCurrencyField;
    TabVales: TCurrencyField;
    TabTotal: TCurrencyField;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    PopupMenu1: TPopupMenu;
    Atualizar1: TMenuItem;
    CriarLista1: TMenuItem;
    btSalvar: TSpeedButton;
    Panel2: TPanel;
    lbServ: TLabel;
    lbCred: TLabel;
    lbVale: TLabel;
    lbTot: TLabel;
    lbMots: TLabel;
    procedure dat1Change(Sender: TObject);
    procedure btAtualizaClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
    procedure dat2Change(Sender: TObject);
    procedure CriarLista1Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idLista(i:Integer);
  end;

var
  PagR1: TPagR1;
  idLista : Integer;

implementation

{$R *.dfm}


uses uDM2, uDM3, uDM4, uBanco, uPagDiv, Global, uPagLote1, uPagGrupo, uPagLista;


procedure TPagR1.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 15;
  dtPag1 := dat1.DateTime;
  dtPag2 := dat2.DateTime;

end;

procedure Preenche_Tab();
var Bco : TBco;
    achei : Boolean;
    tot : double;
    fim_Serv, fim_Cred, fim_Vale, fim_tot : Double;
    fim_conta : integer;

begin

  with PagR1 do
  begin
    Tab.Close;
    Tab.EmptyTable;
    Tab.Open;

    // Valor
    Bco := TBco.Create;
    Bco.Pagamento_Rel1(dat1.DateTime,dat2.DateTime);
    Bco.Destroy;

    DM3.cdsPagR1.First;
    while not DM3.cdsPagR1.Eof do
    begin
      Tab.Insert;
      TabidMot.Value := DM3.cdsPagR1LIGMOT.Value;
      TabNomeMot.Value := DM3.cdsPagR1NOME.Value;
      TabServ.Value := DM3.cdsPagR1VALOR.AsFloat;
      Tab.Post;
      DM3.cdsPagR1.Next;
    end;

    // Creditos
    Bco := TBco.Create;
    Bco.Pagamento_Rel1b(dat1.DateTime,dat2.DateTime);
    Bco.Destroy;

    DM3.cdsPagR1.First;
    while not DM3.cdsPagR1.Eof do
    begin
      Tab.First;
      achei := false;
      while not Tab.Eof and Not achei do
      begin
        if (TabidMot.Value = DM3.cdsPagR1LIGMOT.Value ) then
        begin
          Tab.Edit;
          TabCreditos.Value := DM3.cdsPagR1VALOR.AsFloat;
          Tab.Post;
          achei := true;
        end;
        Tab.Next;
      end;
      DM3.cdsPagR1.Next;
    end;

    // Valess
    Bco := TBco.Create;
    Bco.Pagamento_Rel1a(dat1.DateTime,dat2.DateTime);
    Bco.Destroy;

    DM3.cdsPagR1.First;
    while not DM3.cdsPagR1.Eof do
    begin
      Tab.First;
      achei := false;
      while not Tab.Eof and Not achei do
      begin
       { tot := TabServ.Value + TabCreditos.Value - DM3.cdsPagR1VALOR.AsFloat;
        Tab.Edit;
        TabTotal.Value := Tot;
        Tab.Post;
      }
        if (TabidMot.Value = DM3.cdsPagR1LIGMOT.Value ) then
        begin
          Tab.Edit;
          TabVales.Value := DM3.cdsPagR1VALOR.AsFloat;
          Tab.Post;
          achei := true;
        end;
        Tab.Next;
      end;
      DM3.cdsPagR1.Next;
    end;

    // ---- TOTAL ----
    fim_Serv := 0;
    fim_Cred := 0;
    fim_Vale := 0;
    fim_tot  := 0;
    fim_conta:= 0;

    Tab.First;
    while not Tab.Eof  do
    begin
      tot := 0;
      tot := TabServ.Value + TabCreditos.Value - TabVales.Value;

      Tab.Edit;
      TabTotal.Value := Tot;
      Tab.Post;

      fim_Serv := fim_Serv + TabServ.Value;
      fim_Cred := fim_Cred + TabCreditos.Value;
      fim_Vale := fim_Vale + TabVales.Value;
      fim_tot  := fim_tot + Tot;
      fim_conta:= fim_conta + 1; 

      Tab.Next;
    end;

    // Totaliza
    lbServ.Caption := FormatFloat('#,##0.00', fim_Serv);
    lbCred.Caption := FormatFloat('#,##0.00', fim_Cred);
    lbVale.Caption := FormatFloat('#,##0.00', fim_Vale);
    lbTot.Caption  := FormatFloat('#,##0.00', fim_Tot);
    lbMots.Caption := IntToStr(fim_conta) + ' motoristas';

     Tab.SortOnFields('NomeMot',false,false);
     Tab.First;
  end; {with}
end;


procedure TPagR1.btAtualizaClick(Sender: TObject);

begin
  Preenche_Tab();

  btImp.Enabled := (Tab.RecordCount > 0);
  lbQuant.Caption := IntToStr(Tab.RecordCount);
end;

procedure TPagR1.JvDBGrid1DblClick(Sender: TObject);
begin
  PagDiv.set_idM(TabidMot.value);
  PagDiv.lbMot.Caption := TabNomeMot.value;
  PagDiv.dat1.DateTime := dat1.DateTime;
  PagDiv.dat2.DateTime := dat2.DateTime;
  PagDiv.btAtualiza.Click;

  PagDiv.Show;
end;

procedure Imprimir_Lista();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with PagR1 do
   begin
     doc := 'Lista de Pagamentos';
     { carrega o arquivo }
     RelPG.Template.FileName := dirR+'\Rels\RelPag1.rtm';
     RelPG.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelPG.DeviceType := 'Screen';
     RelPG.ShowAutoSearchDialog  := False;
     RelPG.ShowCancelDialog := False;
     RelPG.ShowPrintDialog := False;
     RelPG.PrinterSetup.DocumentName := doc;

     ppLabel3.Caption:= FormatDateTime('dd/MM/yyyy', dat1.DateTime);
     ppLabel4.Caption:= FormatDateTime('dd/MM/yyyy', dat2.DateTime);

     { imprime a ordem de serviço }
     RelPG.PrintReport;

     {Fecha os arquivos}
   end;

end;


procedure TPagR1.btImpClick(Sender: TObject);
begin
  Imprimir_Lista;
end;

procedure TPagR1.dat2Change(Sender: TObject);
begin
  dtPag2 := dat2.DateTime;
end;

procedure TPagR1.CriarLista1Click(Sender: TObject);

var Bco : TBco;
    q:smallint;
    t:double;
begin
  q := 0;
  t := 0;
  Tab.First;
  while not Tab.Eof do
  begin
    q := q + 1;
    t := t + TabTotal.Value;
    Tab.Next;
  end;

  PagLote1.Entra(q,t,0, dat1.DateTime, dat2.DateTime);
  PagLote1.Show;
end;

procedure Salvar();

var Bco  : Tbco;
    idPg : Integer;

begin
    Bco := TBco.Create;
    with PagR1 do
    begin
      // ---- Insere os novos na lista abaixo
      Bco.PagGrupo_ItensLista(idLista);
      // ---- Atualiza os que existem na Tab Temp
      Tab.First;
      while not Tab.Eof do
      begin
        if (TabServ.Value > 0) and (TabTotal.Value<>0) then
          if (DM4.cdsPagI.Locate('LigFunc',TabidMot.Value, [])) then
            Bco.PagGrupo_ItensAltera(idLista, TabidMot.Value, TabServ.Value, TabCreditos.Value, TabVales.Value, TabTotal.Value)
          else
            Bco.PagGrupo_ItensInsere(idLista, TabidMot.Value, TabServ.Value, TabCreditos.Value, TabVales.Value, TabTotal.Value);

        Tab.Next;
      end;



    end;
    Bco.Destroy;

    PagLista.Entrar(idLista);
    PagLista.Show;
end;

procedure TPagR1.btSalvarClick(Sender: TObject);
begin
  if (idLista = 0) then
  begin
    pagGrupo.Entrar;
    pagGrupo.Show;
  end;

  if (idLista > 0) then
  begin
    Salvar;
  end;

end;

procedure TPagR1.set_idLista(i: Integer);
begin
  idLista := i;
end;

end.
