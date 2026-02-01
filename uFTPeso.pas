unit uFTPeso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit, DB,
  Grids, DBGrids, ExtCtrls;

type
  TFTPeso = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbCli: TLabel;
    Inicio: TJvValidateEdit;
    vCAP: TJvValidateEdit;
    vGSP: TJvValidateEdit;
    vINT: TJvValidateEdit;
    Fim: TJvValidateEdit;
    eCAP: TJvValidateEdit;
    eGSP: TJvValidateEdit;
    eint: TJvValidateEdit;
    btSalvar: TBitBtn;
    btApagar: TBitBtn;
    btSalvaExc: TBitBtn;
    BitBtn1: TBitBtn;
    vINT2: TJvValidateEdit;
    vOEST: TJvValidateEdit;
    vOUT: TJvValidateEdit;
    Bevel1: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    eINT2: TJvValidateEdit;
    eOEST: TJvValidateEdit;
    eOUT: TJvValidateEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btImport: TBitBtn;
    cbCli: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btSalvaExcClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
  end;

var
  FTPeso: TFTPeso;
  idCli, idCliEXTERNO, idFt1, idFt1a : integer;

implementation

{$R *.dfm}


uses uDM2, uDM3, uBanco;

{ TFTPeso }

procedure TFTPeso.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure Limpar();
begin
  with FTPeso do
  begin
    inicio.Value := 0;
    fim.Value    := 0;

    vcap.Value   := 0;
    vgsp.Value   := 0;
    vint.Value   := 0;

    ecap.Value   := 0;
    egsp.Value   := 0;
    eint.Value   := 0;

    idFT1 := 0;
    idFT1a:= 0;

  end;

end;


procedure Preenche1();

var Bco : TBco;

begin
  Bco := TBco.Create;

  with FTPeso do
  if (DM3.cdsFT1.RecordCount > 0) then
  begin
    idFT1 := DM3.cdsFT1ID.Value;

    inicio.Value := DM3.cdsFT1inicio.AsFloat;
    fim.Value    := DM3.cdsFT1fim.AsFloat;

    vcap.Value  := DM3.cdsFT1vCAP.AsFloat;
    vgsp.Value  := DM3.cdsFT1vGSP.AsFloat;
    vint.Value  := DM3.cdsFT1vINT.AsFloat;

    vINT2.Value := DM3.cdsFT1VINT2.AsFloat;
    vOEST.Value := DM3.cdsFT1VOEST.AsFloat;
    vOUT.Value  := DM3.cdsFT1VOUT.AsFloat;
  end;


  Bco.Destroy;

end;

procedure Preenche1a();

var Bco : TBco;

begin
  Bco := TBco.Create;
  with FTPeso do
  if (idCli > 0) then
  begin

    Bco.FretePesoExc_Mostra(idCli);


    if (DM3.cdsFT1a.RecordCount > 0) then
    begin
      DM3.cdsFT1a.First;
      idFT1a := DM3.cdsFT1aID.Value;
      ecap.Value := DM3.cdsFT1aECAP.AsFloat;
      egsp.Value := DM3.cdsFT1aEGSP.AsFloat;
      eint.Value := DM3.cdsFT1aEINT.AsFloat;
      eint2.Value := DM3.cdsFT1aEint2.AsFloat;
      eOEST.Value := DM3.cdsFT1aEOEST.AsFloat;
      eout.Value := DM3.cdsFT1aEout.AsFloat;

    end;
  end;
  Bco.Destroy;

end;


procedure TFTPeso.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', '');
  Bco := TBco.Create;
  Bco.FretePeso_Mostra(idcli);
  Limpar;
  Preenche1a;
  Preenche1;

  Bco.FretePeso_Mostra(idcli);
  Bco.Destroy;
end;

procedure TFTPeso.btSalvarClick(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  if (idFT1 > 0) then
    Bco.FretePeso_Altera(idFT1, inicio.Value, fim.Value, vCAP.Value,vgsp.Value, vint.Value, vint2.Value, voest.Value, vout.Value)
  else
    Bco.FretePeso_Insere(idCli, inicio.Value, fim.Value, vCAP.Value,vgsp.Value, vint.Value, vint2.Value, voest.Value, vout.Value);

  Limpar;
  idFT1 := 0;
  Bco.FretePeso_Mostra(idcli);
  Bco.Destroy;
end;

procedure TFTPeso.DBGrid1DblClick(Sender: TObject);
begin
  Preenche1;
end;

procedure TFTPeso.btSalvaExcClick(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  if (idFT1a > 0) then
    Bco.FretePesoExc_Altera(idFT1a, ecap.Value, egsp.Value, eint.Value, eint2.Value, eoest.Value, eout.Value)
  else
    Bco.FretePesoExc_Insere(idCli, ecap.Value, egsp.Value, eint.Value, eint2.Value, eoest.Value, eout.Value);

  Bco.Destroy;

end;

procedure TFTPeso.btApagarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  if (idFT1 > 0) then
     if MessageDlg('Tem certeza que deseja apagar',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Bco.FretePeso_Apaga(idFT1);

  Bco.FretePeso_Mostra(idcli);
  Bco.Destroy;

end;

procedure TFTPeso.btImportClick(Sender: TObject);

var Bco : tBco;

begin
  if MessageDlg('Tem certeza que deseja substituir os valores atuais?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    idCliEXTERNO := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');


    Bco := TBco.Create;

    if (DM3.cdsFT1a.RecordCount = 0) then
      Bco.FretePesoExc_Insere(idCli, 0,0,0,0,0,0);

    // 1. Apaga as faixas existentes
    Bco.FretePeso_Mostra(idCliEXTERNO);
    if (DM3.cdsFT1.RecordCount>0) then Bco.FretePeso_ApagaCLI(idCli);
    // 2. Lê as tabelaa do Cliente
    Bco.FretePesoExc_Mostra(idCliEXTERNO);
    // 2. Marca o Excedente EXC
    Bco.FretePesoExc_Altera(idCli, DM3.cdsFT1aECAP.AsFloat , DM3.cdsFT1aEGSP.AsFloat, DM3.cdsFT1aEINT.AsFloat, DM3.cdsFT1aeint2.AsFloat, DM3.cdsFT1aeoest.AsFloat, DM3.cdsFT1aeout.AsFloat);
    // 4. Copia as novas faixas
    DM3.cdsFT1.First;
    while not DM3.cdsFT1.Eof do
    begin
      Bco.FretePeso_Insere(idCli, DM3.cdsFT1INICIO.AsFloat, DM3.cdsFT1FIM.AsFloat, DM3.cdsFT1VCAP.AsFloat, DM3.cdsFT1VGSP.AsFloat, DM3.cdsFT1VINT.AsFloat, DM3.cdsFT1vInt2.AsFloat, DM3.cdsFT1VOEST.AsFloat, DM3.cdsFT1VOUT.AsFloat);
      DM3.cdsFT1.Next;
    end;

    Bco.FretePeso_Mostra(idCli);
    Bco.FretePesoExc_Mostra(idCli);
    Bco.Destroy;


    Preenche1;
    Preenche1a;

    //ShowMessage(' idCli = '+idCli.ToString + ' idCLIEXTERNO = '+ idCliEXTERNO.ToString);
  end;
end;

procedure TFTPeso.BitBtn1Click(Sender: TObject);
begin
  Limpar;
  Preenche1a;
end;

end.
