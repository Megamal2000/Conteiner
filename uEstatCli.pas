unit uEstatCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, DB, JvMemoryDataset, JvDataSource,
  JvComponentBase, JvThreadTimer, JvExComCtrls, JvProgressBar, JvStatusBar;

type
  TEstatCli = class(TForm)
    Pan: TPanel;
    Label1: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Panel1: TPanel;
    bt1: TSpeedButton;
    bt2: TSpeedButton;
    bt3: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bt4: TSpeedButton;
    bt5: TSpeedButton;
    bt6: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    bt7: TSpeedButton;
    bt8: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    btPesq: TBitBtn;
    Panel3: TPanel;
    Label10: TLabel;
    lbConceito: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    TabCliente: TStringField;
    TabTotalNF: TFloatField;
    TabEntregues: TFloatField;
    TabNEntregues: TFloatField;
    TabNota: TFloatField;
    Tabid: TIntegerField;
    JvThreadTimer1: TJvThreadTimer;
    JvStatusBar1: TJvStatusBar;
    pb: TJvProgressBar;
    procedure btPesqClick(Sender: TObject);
    procedure JvThreadTimer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstatCli: TEstatCli;

implementation

{$R *.dfm}

uses uEstatistica, uBanco, uDM4, uDM1;

procedure Limpar();
begin
  with EstatCli do
  begin
    Label11.Caption := '0';
    Label12.Caption := '0';
    Label13.Caption := '0';
    Label14.Caption := '0';
    Label15.Caption := '0';
    Label16.Caption := '0';
    Label17.Caption := '0';
    Label18.Caption := '0';
    lbConceito.Caption := '-';
  end;

end;

function Converte_IDNome(idC : Integer) : String;

var S : String;
    achei : boolean;
    Bco : TBco;

begin
  S := '-';
  achei := false;
  {
  DM1.cdsCli.First;
  while not DM1.cdsCli.Eof do
  begin
    if (idC = DM1.cdsCliID.Value) then
    begin
      achei := true;
      S := DM1.cdsCliNOME.Value;
    end;
    DM1.cdsCli.Next;
  end;
  }

  Bco := TBco.Create;
  Bco.Cliente_MostraId(idC);
  Bco.Destroy;
  if (DM1.cdsCli.RecordCount > 0) then S := DM1.cdsCliNOME.Value;
  Converte_IDNome := S;
end;


procedure Preencher(n1, n2, n3, n4, n5, n6, n7, n8: Integer; conceito1, conceito2: Double);
begin
  with EstatCli do
  begin

    Label11.Caption := IntToStr(n1);
    Label12.Caption := IntToStr(n2);
    Label13.Caption := IntToStr(n3);
    Label14.Caption := IntToStr(n4); // reentregas
    Label15.Caption := IntToStr(n5); // Cliente
    Label16.Caption := IntToStr(n6); // Transp
    Label17.Caption := IntToStr(n7);
    Label18.Caption := IntToStr(n8);

    lbConceito.Caption := FormatFloat('#,##0.0',conceito1) + ' % // ' +FormatFloat('#,##0.0',conceito2) + ' % ';
    JvStatusBar1.Panels[0].Text := 'Total de Notas: '+IntToStr(n1 + n7);
    JvStatusBar1.Panels[1].Text := 'Total com Erro: '+IntToStr(n7 + n8);

  end;

end;

procedure Grid_Cli();

var Bco : TBco;
    ent, Nent, idCli : Integer;
    conc : Double;
    achei : boolean;
    NomeCli : String;

begin
  Bco := TBco.Create;
  Bco.EstatC_NotasCli(0, EstatCli.dt1.DateTime, EstatCli.dt2.DateTime);
  //Bco.Cliente_Mostra;
  Bco.Destroy;

  with EstatCli do
  begin
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;

    // Parte 1 - Preenche TotalNF
    JvStatusBar1.Panels[1].Text := 'Parte 1 - Inserindo Total de Notas';
    pb.Min := 0;
    pb.Max := DM4.cdsEC.RecordCount;
    pb.Position := 0;
    if (DM4.cdsEC.RecordCount > 0) then
    begin
      DM4.cdsEC.First;
      while not DM4.cdsEC.Eof do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
        idCli := DM4.cdsECLigCli.Value;
        NomeCli := '-';
        NomeCli := Converte_IDNome(idCli);

        Tab.Insert;
        Tabid.Value         := idCli;
        TabCliente.Value    := NomeCli;
        TabTotalNF.Value    := DM4.cdsECQUANT.Value;
        TabEntregues.Value  := 0;
        TabNEntregues.Value := 0;
        TabNota.Value       := 0;
        Tab.Post;

        DM4.cdsEC.Next;
      end;
    end;

    Bco := TBco.Create;
    Bco.EstatC_NotasCli(1, EstatCli.dt1.DateTime, EstatCli.dt2.DateTime);
    Bco.Destroy;

     // Parte 2 - Preenche Entregas
    JvStatusBar1.Panels[1].Text := 'Parte 2 - Inserindo Clientes Notas';
    pb.Min := 0;
    pb.Max := Tab.RecordCount;
    pb.Position := 0;
    if (DM4.cdsEC.RecordCount > 0) then
    begin
      Tab.First;
      while not Tab.Eof do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
        achei := false;
        DM4.cdsEC.First;
        while not DM4.cdsEC.Eof and not achei do
        begin
          if (Tabid.Value = DM4.cdsECligCli.Value) then
          begin
            achei := true;
            ent  := DM4.cdsECQUANT.Value;
            Nent := TabTotalNF.AsInteger - ent;
            conc := ent*100/TabTotalNF.Value;

            Tab.Edit;
            TabEntregues.Value := DM4.cdsECQUANT.Value;
            TabNEntregues.Value:= Nent;
            TabNota.Value      := conc;
            Tab.Post;

          end;

           DM4.cdsEC.Next;
        end;
        Tab.Next;

      end;
    end;
  end;
end;


procedure Pesquisar();

var Est : TEstat;
    nota1, nota2: Double;
    sConceito : String;

begin
  Est := TEstat.Create;
  Est.set_dt1(EstatCli.dt1.DateTime);
  Est.set_dt2(EstatCli.dt2.DateTime);

  Est.Inicio;
  Est.Notas_Certas;
  Est.Notas_Erradas;

  // Calcula
  nota1 := Est.get_nfEntregues * 100 / (Est.get_nfCOM);
  nota2 := (Est.get_nfCOM - Est.get_nfDevT) * 100 / (Est.get_nfCOM);
  // finalizar
  limpar;
  Preencher(Est.get_nfCOM,Est.get_nfEntregues,Est.get_nfNEntregues,Est.get_nfReentregas,Est.get_nfDevC,Est.get_nfDevT,Est.get_err1,Est.get_err2,nota1,nota2);
  Est.Destroy;

  EstatCli.JvThreadTimer1.Enabled := true;

end;



procedure TEstatCli.btPesqClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TEstatCli.JvThreadTimer1Timer(Sender: TObject);
begin
     Grid_Cli;
     JvThreadTimer1.Enabled := false;
end;

end.
