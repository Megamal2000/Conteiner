unit uEstatMOT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvProgressBar, JvStatusBar,
  JvComponentBase, JvThreadTimer, DB, JvMemoryDataset, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, Buttons, StdCtrls, ExtCtrls;

type
  TEstatMOT = class(TForm)
    Pan: TPanel;
    Label1: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btPesq: TBitBtn;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Panel2: TPanel;
    bt7: TSpeedButton;
    bt8: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel3: TPanel;
    Label10: TLabel;
    lbConceito: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    TabTotalNF: TFloatField;
    TabEntregues: TFloatField;
    TabNEntregues: TFloatField;
    TabNota: TFloatField;
    Tabid: TIntegerField;
    JvThreadTimer1: TJvThreadTimer;
    JvStatusBar1: TJvStatusBar;
    pb: TJvProgressBar;
    TabFaltaTempo: TIntegerField;
    TabTotalR: TIntegerField;
    TabMotorista: TStringField;
    procedure btPesqClick(Sender: TObject);
    procedure JvThreadTimer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstatMOT: TEstatMOT;

implementation

{$R *.dfm}

uses uEstatistica, uBanco, uDM4, uDM1;

procedure Limpar();
begin
  with Estatmot do
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

procedure Preencher(n1, n2, n3, n4, n5, n6, n7, n8: Integer; conceito1, conceito2: Double);
begin
  with EstatMot do
  begin

    Label11.Caption := IntToStr(n1);
    Label12.Caption := IntToStr(n2);
    Label13.Caption := IntToStr(n3);
    Label14.Caption := IntToStr(n4); // reentregas
    Label15.Caption := IntToStr(n5); // Motente
    Label16.Caption := IntToStr(n6); // Transp
    Label17.Caption := IntToStr(n7);
    Label18.Caption := IntToStr(n8);

    lbConceito.Caption := FormatFloat('#,##0.0',conceito1) + ' % // ' +FormatFloat('#,##0.0',conceito2) + ' % ';
    JvStatusBar1.Panels[1].Text := 'Total com Erro: '+IntToStr(n7 + n8);

  end;

end;

procedure Pesquisar();

var Est : TEstat;
    nota1, nota2: Double;
    sConceito : String;

begin
  Est := TEstat.Create;
  Est.set_dt1(EstatMot.dt1.DateTime);
  Est.set_dt2(EstatMot.dt2.DateTime);

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

  EstatMot.JvThreadTimer1.Enabled := true;

end;

function Converte_IDNome(idM : Integer) : String;

var S : String;
    Bco : TBco;

begin
  S := '-';

  Bco := TBco.Create;
  Bco.Funcs_MostraId(idM);
  Bco.Destroy;
  if (DM1.cdsFuncs.RecordCount > 0) then S := DM1.cdsFuncsNOME.Value;
  Converte_IDNome := S;
end;

procedure Grid_Mot();

var Bco : TBco;
    ent, Nent, idMot : Integer;
    conc : Double;
    achei : boolean;
    NomeMot : String;

begin
  Bco := TBco.Create;
  Bco.EstatC_NotasMot_Roma(EstatMot.dt1.DateTime, EstatMot.dt2.DateTime);
  Bco.Destroy;

  with EstatMot do
  begin
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;

    // Parte 1 - Preenche Total Romaneios OK
    // ==================================================
    JvStatusBar1.Panels[1].Text := 'Parte 1 - Inserindo Total de Romaneios';
    pb.Min := 0;
    pb.Max := DM4.cdsEM.RecordCount;
    pb.Position := 0;
    if (DM4.cdsEM.RecordCount > 0) then
    begin
      DM4.cdsEM.First;
      while not DM4.cdsEM.Eof do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
        idMot := DM4.cdsEMMOT.Value;
        NomeMot := '-';
        NomeMot := Converte_IDNome(idMot);

        Tab.Insert;
        Tabid.Value         := idMot;
        TabMotorista.Value  := NomeMot;
        TabTotalNF.Value    := 0;
        TabEntregues.Value  := 0;
        TabNEntregues.Value := 0;
        TabNota.Value       := 0;
        TabFaltaTempo.Value := 0;
        TabTotalR.Value     := DM4.cdsEMQUANT.Value;

        Tab.Post;

        DM4.cdsEM.Next;
      end;
    end;
    JvStatusBar1.Panels[0].Text := 'Total de Motoristas: '+IntToStr(Tab.RecordCount);
    Application.ProcessMessages;


    // Parte 2 - Preenche Total Notas OK
    // ==================================================
    Bco := TBco.Create;
    Bco.EstatC_NotasMot_Notas(0, EstatMot.dt1.DateTime, EstatMot.dt2.DateTime);
    Bco.Destroy;

    JvStatusBar1.Panels[1].Text := 'Parte 2 - Inserindo Total de Notas';
    pb.Min := 0;
    pb.Max := Tab.RecordCount;
    pb.Position := 0;
    Application.ProcessMessages;
    if (DM4.cdsEM.RecordCount > 0) then
    begin
      Tab.First;
      while not Tab.Eof do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;

          DM4.cdsEM.IndexFieldNames := 'MOT';

          if (DM4.cdsEM.FindKey([Tabid.Value])) then
          begin
            Tab.Edit;
            TabTotalNF.Value := DM4.cdsEMQUANT.Value;
            Tab.Post;
          end;
        Tab.Next;

      end;
    end;

    Application.ProcessMessages;

    // Parte 3 - Preenche Notas Entregues e Não Entregues OK
    // ==================================================
    Bco := TBco.Create;
    Bco.EstatC_NotasMot_Notas(1, EstatMot.dt1.DateTime, EstatMot.dt2.DateTime);
    Bco.Destroy;

    JvStatusBar1.Panels[1].Text := 'Parte 3 - Notas Entregues e Não';
    pb.Min := 0;
    pb.Max := Tab.RecordCount;
    pb.Position := 0;
    if (DM4.cdsEM.RecordCount > 0) then
    begin
      Tab.First;
      while not Tab.Eof do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;

          if (DM4.cdsEM.FindKey([Tabid.Value])) then
          begin
            achei := true;
            ent  := DM4.cdsEMQUANT.Value;
            Nent := TabTotalNF.AsInteger - ent;
            conc := ent*100/TabTotalNF.Value;

            Tab.Edit;
            TabEntregues.Value := DM4.cdsEMQUANT.Value;
            TabNEntregues.Value:= Nent;
            TabNota.Value      := conc;
            Tab.Post;

          end;

        Tab.Next;

      end;
    end;

    Application.ProcessMessages;

    // Parte 4 - Preenche Notas não entregues por falta de tempo OK
    // ==================================================
    Bco := TBco.Create;
    Bco.EstatC_NotasMot_Notas(20, EstatMot.dt1.DateTime, EstatMot.dt2.DateTime);
    Bco.Destroy;

    JvStatusBar1.Panels[1].Text := 'Parte 4 - Inserindo Notas (Falta de Tempo)';
    pb.Min := 0;
    pb.Max := Tab.RecordCount;
    pb.Position := 0;
    if (DM4.cdsEM.RecordCount > 0) then
    begin
      Tab.First;
      while not Tab.Eof do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;


          if (DM4.cdsEM.FindKey([Tabid.Value])) then
          begin
            achei := true;

            Tab.Edit;
            TabFaltaTempo.Value := DM4.cdsEMQUANT.Value;
            Tab.Post;

          end;


        Tab.Next;

      end;
    end;
    // ==================================================
    // Ordenando
    Tab.SortOnFields('Motorista',false, false);
    Tab.Refresh;

  end;
end;



procedure TEstatMOT.btPesqClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TEstatMOT.JvThreadTimer1Timer(Sender: TObject);
begin
  Grid_Mot;
  JvThreadTimer1.Enabled := false;
end;

end.
