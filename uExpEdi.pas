unit uExpEdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TexpEdi = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    btExporta: TBitBtn;
    lbObs: TLabel;
    lbTarefa: TLabel;
    pb: TProgressBar;
    Memo1: TMemo;
    btExpCon: TBitBtn;
    btExpCob: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btExportaClick(Sender: TObject);
    procedure btExpConClick(Sender: TObject);
    procedure btExpCobClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
  end;

  Tocorrencia = set of  1..90;

const
  pastaEDI = 'edi\';

var
  expEdi: TexpEdi;
  idCli : Integer;

implementation

{$R *.dfm}

uses uDM1, uDM2, uBanco, uEDIoco, uEDIconh, uEDIdoc;

procedure TexpEdi.FormActivate(Sender: TObject);
begin
  lbObs.Caption  := '';
  Label2.Caption := '';
  Label3.Caption := '';
  lbTarefa.Caption := '';
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  DM2.DBCp_Pos(cbCli,'TB_CLIENTE', IntToStr(idCli), 'NOME');
end;

procedure TexpEdi.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure TexpEdi.btExportaClick(Sender: TObject);

var Bco : TBco;
    edi : TEDIo;
    valores : Tocorrencia;
    base : String;
    nts : integer;

begin
  valores := [01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,90,91,92,99];
  GetDir(0, base);

  Bco := TBco.Create;
  Bco.Edi_Notas(DM2.DBCp_leid(cbCli.Items[cbCli.itemindex],'TB_CLIENTE', 'NOME'));
  Bco.Destroy;

  lbObs.Caption := 'Notas '+IntToStr(DM1.cdsNotas.RecordCount);
  lbTarefa.Caption := 'Criando o arquivo';

  if (DM1.cdsNotas.RecordCount > 0) then
  begin
    pb.Min := 0;
    pb.Max := DM1.cdsNotas.RecordCount;

    edi := Tedio.Create;

    Memo1.Clear;
    Memo1.Lines.Append(edi.arquivo(cbCli.Items[cbCli.itemindex]) );
    Memo1.Lines.Append(edi.cabecalho(cbCli.Items[cbCli.itemindex]) );
    Memo1.Lines.Append(edi.transp('00300907000176', 'FLAYDEL LOG - LOGISTICA E DISTRIBUICAO'));

    nts := 0;
    DM1.cdsNotas.First;
    while not DM1.cdsNotas.Eof do
    begin
      pb.Position := pb.Position + 1;
      if (DM1.cdsNotasSTATUS_ENT.Value > 0) and (DM1.cdsNotasNOCORR.AsInteger in valores) and (DM1.cdsNotasNUMNF.Value > 180000) and (DM1.cdsNotasNUMNF.Value < 400000) then
      begin
        Memo1.Lines.Append(edi.ocorrencia(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasNOCORR.Value, DM1.cdsNotasDTENT.Value,DM1.cdsNotasHRENT.Value));
        Bco := TBco.Create;
        Bco.Edi_setStatus(DM1.cdsNotasID.Value , 0);
        Bco.Destroy;
        nts := nts + 1;
      end;

      DM1.cdsNotas.Next;
    end;
    lbObs.Caption := 'Notas Válidas (sem coleta): '+ IntToStr(nts);
    edi.Destroy;
    Memo1.Lines.SaveToFile(base + '\'+pastaEDI +'FlaydelEDI ocoren'+FormatDateTime('yyyyMMdd HHmm',Now)+ '.edi');
  end
  else lbObs.Caption := 'sem Notas para exportar';
end;

procedure TexpEdi.btExpConClick(Sender: TObject);

var Bco : TBco;
    edi : TEDIc;
    base: String;
    tot : double;
    qt  : Integer;

begin
  GetDir(0, base);

  Bco := TBco.Create;
  Bco.Edi_Notas(DM2.DBCp_leid(cbCli.Items[cbCli.itemindex],'TB_CLIENTE', 'NOME'));
  Bco.Destroy;

  label2.Caption := 'Notas '+IntToStr(DM1.cdsNotas.RecordCount);
  lbTarefa.Caption := 'Criando o arquivo';

  if (DM1.cdsNotas.RecordCount > 0) then
  begin
    pb.Min := 0;
    pb.Max := DM1.cdsNotas.RecordCount;

    edi := Tedic.Create;

    Memo1.Clear;
    Memo1.Lines.Append(edi.arquivo(cbCli.Items[cbCli.itemindex]) );
    Memo1.Lines.Append(edi.cabecalho(cbCli.Items[cbCli.itemindex]) );
    Memo1.Lines.Append(edi.transp('00300907000176', 'FLAYDEL LOG - LOGISTICA E DISTRIBUICAO'));

    DM1.cdsNotas.First;
    while not DM1.cdsNotas.Eof do
    begin
      pb.Position := pb.Position + 1;
      if (DM1.cdsNotasSTATUS_ENT.Value > 0) then
      begin
//        Memo1.Lines.Append(edi.conhecimento(1,Now, DM1.cdsNotasPESO.Value, 2,DM1.cdsNotasHRENT.Value));
        Bco := TBco.Create;
//      Bco.Edi_setStatus(DM1.cdsNotasID.Value , 0);
        Bco.Destroy;
        qt := qt + 1;
        tot:= tot + 1;
      end;

      DM1.cdsNotas.Next;
    end;

    edi.Total_Conhec(qt, tot);
    edi.Destroy;
    Memo1.Lines.SaveToFile(base + '\'+pastaEDI +'FlaydelEDI cobranca'+FormatDateTime('yyyyMMdd HHmm',Now)+ '.edi');
  end
  else lbObs.Caption := 'sem Notas para exportar';
end;

procedure TexpEdi.btExpCobClick(Sender: TObject);

var Bco : TBco;
    edi : TEDId;
    base: String;
    tot : double;
    qt  : Integer;

begin
  GetDir(0, base);

  Bco := TBco.Create;
  Bco.Edi_Notas(DM2.DBCp_leid(cbCli.Items[cbCli.itemindex],'TB_CLIENTE', 'NOME'));
  Bco.Destroy;

  label3.Caption := 'Notas '+IntToStr(DM1.cdsNotas.RecordCount);
  lbTarefa.Caption := 'Criando o arquivo';

  if (DM1.cdsNotas.RecordCount > 0) then
  begin
    pb.Min := 0;
    pb.Max := DM1.cdsNotas.RecordCount;

    edi := Tedid.Create;

    Memo1.Clear;
    Memo1.Lines.Append(edi.arquivo(cbCli.Items[cbCli.itemindex]) );
    Memo1.Lines.Append(edi.cabecalho(cbCli.Items[cbCli.itemindex]) );
    Memo1.Lines.Append(edi.transp('00300907000176', 'FLAYDEL LOG - LOGISTICA E DISTRIBUICAO'));

    DM1.cdsNotas.First;
    while not DM1.cdsNotas.Eof do
    begin
      pb.Position := pb.Position + 1;
      if (DM1.cdsNotasSTATUS_ENT.Value > 0) then
      begin
//      Memo1.Lines.Append(edi.cobranca(1,Now, DM1.cdsNotasPESO.Value, 2,DM1.cdsNotasHRENT.Value));
        Bco := TBco.Create;
//      Bco.Edi_setStatus(DM1.cdsNotasID.Value , 0);
        Bco.Destroy;
        qt := qt + 1;
        tot:= tot + 1;
      end;

      DM1.cdsNotas.Next;
    end;
    edi.Total_Cobranca(qt, tot);
    edi.Destroy;
    Memo1.Lines.SaveToFile(base + '\'+pastaEDI +'FlaydelEDI conhec'+FormatDateTime('yyyyMMdd HHmm',Now)+ '.edi');
  end
  else lbObs.Caption := 'sem Notas para exportar';

end;

end.
