unit uContCob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid;

type
  TContCob = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    cbCli: TComboBox;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbMes: TLabel;
    lbkma: TLabel;
    lbKmb: TLabel;
    lbKmc: TLabel;
    lbHrc: TLabel;
    lbHrb: TLabel;
    lbHra: TLabel;
    lbSegb: TLabel;
    lbSegc: TLabel;
    lbTot: TLabel;
    btCalc: TBitBtn;
    btSalvar: TBitBtn;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    lbDesc: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dat1Change(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContCob: TContCob;

implementation

{$R *.dfm}

uses uDM2, uDM3, uBanco, uNegocio, uContSalv;

procedure TContCob.FormActivate(Sender: TObject);
begin
  if (FormatDateTime('dd/MM/yyyy', dat1.DateTime)  = '01/01/2010') then
  begin
    dat1.DateTime := Now;
    dat2.DateTime := dat1.DateTime + 30;
  end;
  if (cbCli.Items.Count= 0) then
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
end;

procedure TContCob.SpeedButton1Click(Sender: TObject);

var idCli : Integer;
    dt1, dt2 : TDateTime;
    Bco : TBco;

begin
  // Entradas
  idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');
  dt1   := dat1.Date;
  dt2   := dat2.Date;

  Bco := TBco.Create;
  Bco.Credito2_Existe(idCli, dt1, dt2);
  Bco.FreteContratoDia_MostraB(idCli, dt1, dt2);
  Bco.Destroy;

  if (DM3.cdsCred2.RecordCount > 0) then
  begin
    // Saída .................................
    lbMes.Caption := FormatFloat('#,##0.00', DM3.cdsCred2VMENSAL.AsFloat );

    lbkma.Caption := FormatFloat('#,##0', DM3.cdsCred2KM.AsFloat);
    lbkmb.Caption := FormatFloat('#,##0.00', DM3.cdsCred2KMC.AsFloat);
    lbkmc.Caption := FormatFloat('#,##0.00', DM3.cdsCred2VKM.AsFloat);

    lbhra.Caption := FormatFloat('#,##0.00', DM3.cdsCred2HORA.AsFloat );
    lbhrb.Caption := FormatFloat('#,##0.00', DM3.cdsCred2HORAC.AsFloat );
    lbhrc.Caption := FormatFloat('#,##0.00', DM3.cdsCred2VHORA.AsFloat );

    lbSegb.Caption:= FormatFloat('#,##0.00', DM3.cdsCred2SEGNOTAS.AsFloat );
    lbSegc.Caption:= FormatFloat('#,##0.00', DM3.cdsCred2VSEG.AsFloat );

    lbDesc.Caption:= FormatFloat('#,##0.00', DM3.cdsCred2VDESPESAS.AsFloat );
    lbTot.Caption := FormatFloat('#,##0.00', DM3.cdsCred2VCALC.AsFloat );
  end;
end;

procedure TContCob.dat1Change(Sender: TObject);
begin
  dat2.Date := dat1.Date + 30;
end;

procedure TContCob.btCalcClick(Sender: TObject);

var akm, ahora, bkm, bhora, aSeg, bSeg,
    ckm, chora, cSeg, cMes, cDesp, Total : Double;
    Bco : TBco;
    Neg : TNeg;
    idCli, tc : Integer;

begin
  // Inicia os Totais
  Total := 0;
  cMes  := 0;
  ckm   := 0;
  chora := 0;
  cSeg  := 0;
  cDesp := 0;


  // Parte 1 - recupera Valores do Cliente -------------------
  idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');
  Bco := TBco.Create;
  Bco.FreteContrato_Mostra(idCli);
  Bco.Destroy;

  bkm   := DM3.cdsFT5VAVULSO_KM.AsFloat;
  bhora := DM3.cdsFT5VAVULSO_HORA.AsFloat;

  cMes:= DM3.cdsFT5VMENSAL.AsFloat;
  tc  := DM3.cdsFT5TIPOCOB.Value;

  if (tc = 1) then
    cMes := DM3.cdsFT5b.RecordCount * DM3.cdsFT5VMENSAL.AsFloat;

  // Parte 2 - Soma os valores da Tabela ---------------------
  akm   := 0;    ckm   := 0;
  ahora := 0;    chora := 0;
  cDesp := 0;

  DM3.cdsFT5b.First;
  while not DM3.cdsFT5b.Eof do
  begin
    akm   := akm   + DM3.cdsFT5bKMEXTRA.AsFloat;
    ahora := ahora + DM3.cdsFT5bHREXTRA.AsFloat;

    ckm   := ckm   + DM3.cdsFT5bVKM.AsFloat;
    chora := chora + DM3.cdsFT5bVHR.AsFloat;

    cDesp := cDesp + DM3.cdsFT5bDESCONTO.AsFloat;

    DM3.cdsFT5b.Next;
  end;
  DM3.cdsFT5b.First;

  // Parte 3 - Cálculo do Seguro -------------------------------
  aSeg := 0;
  bSeg := 2;

  Bco := TBco.Create;
  Neg := TNeg.Create;

  DM3.cdsFT5b.First;
  while not DM3.cdsFT5b.Eof do
  begin
    // Notas no Romaneio
    if (DM3.cdsFT5bNROMA.Value> 0 ) then
    begin
      Bco.FreteContrato_Notas(DM3.cdsFT5bNROMA.Value);

      DM3.cdsFT5n.First;
      while not DM3.cdsFT5n.Eof do
      begin
        Neg.Adicional_Simulador(idCli, DM3.cdsFT5nTIPOLOCAL.Value, DM3.cdsFT5nPONTO.Value, 5, DM3.cdsFT5nVALOR.AsFloat, 0  );
        Bco.FreteContrato_Grava(DM3.cdsFT5nID.Value, 5, Neg.get_freteTot);

        aSeg := aSeg + DM3.cdsFT5nVALOR.AsFloat;
        cSeg := cSeg + Neg.get_freteTot;

        DM3.cdsFT5n.Next;
      end;
    end;
    DM3.cdsFT5b.Next;
  end;
  Neg.Destroy;
  Bco.Destroy;

  DM3.cdsFT5b.First;

  // Parte 4 - Totaliza ----------------------------------------
  Total := cMes + ckm + cHora + cSeg + cDesp;

  // Saída .................................
  lbMes.Caption := FormatFloat('#,##0.00', cMes);

  lbkma.Caption := FormatFloat('#,##0', akm);
  lbkmb.Caption := FormatFloat('#,##0.00', bkm);
  lbkmc.Caption := FormatFloat('#,##0.00', ckm);

  lbhra.Caption := FormatFloat('#,##0.00', ahora);
  lbhrb.Caption := FormatFloat('#,##0.00', bhora);
  lbhrc.Caption := FormatFloat('#,##0.00', chora);

  lbSegb.Caption:= FormatFloat('#,##0.00', aSeg);
  lbSegc.Caption:= FormatFloat('#,##0.00', cSeg);

  lbDesc.Caption := FormatFloat('#,##0.00', cDesp);
  lbTot.Caption := FormatFloat('#,##0.00', Total);

end;

procedure TContCob.btSalvarClick(Sender: TObject);

var idCli : integer;

begin
  idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');

  ContSalv.lbCli.Caption := cbCli.Items[cbCli.Itemindex];
  ContSalv.set_idCli(idCli);
  ContSalv.Show;

end;

end.
