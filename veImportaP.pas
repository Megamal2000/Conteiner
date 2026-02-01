unit veImportaP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, ComObj,Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, Vcl.ExtCtrls;

type
  TeImportaPr = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    arq: TJvFilenameEdit;
    Label3: TLabel;
    Label4: TLabel;
    pb: TProgressBar;
    Processando: TLabel;
    lbTot1: TLabel;
    lbErro: TLabel;
    lbTot2: TLabel;
    lbProc: TStaticText;
    btImportar: TBitBtn;
    btModelo: TBitBtn;
    procedure btImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  eImportaPr: TeImportaPr;

implementation

{$R *.dfm}

uses Global, veBanco, veDM;

procedure Le_Planilha(arq : String);

var importa  :  Variant;
    lin, col, linha : Integer;
    S, Baixa      : String;
    temp : Variant;
    Bce : TBce;

    sNomeP1, sNomeP2, sNomeSub, sC1, sC2, sC3, sC4, sCodC, sCodB, sCodF, sFIFO, sVal, sUnid : String;
    QtUM, QtMin, QtPalete, iFifo, iVal : Integer;
    NomeAnt : String;
    idProd : Integer;
begin
  col := 1;

  //Abre o arquivo Excel para importar
  Importa := CreateOleObject('Excel.Application');
  Importa.Visible := False;
  Importa.WorkBooks.Open(arq);

  // --- Número de Linhas ----------------------------------
  S := 'A';
  //Linhas
  lin := 0;
  while (S<>'') do
  begin
    lin := lin + 1;
    S := Importa.Workbooks[1].Sheets[1].Cells[lin, 1];
  end;
  eImportaPr.pb.Max := lin;

  // --- Lè Notas ----------------------------------
  with eImportaPr do
  for linha:=2 to Lin-1 do
  begin
    lbTot1.Caption := lin.ToString;
    lbTot2.Caption := lin.ToString;

    pb.Position := linha;
    pb.Refresh;

    lbProc.Caption := IntToStr(linha)+ '/';
    lbProc.Refresh;


    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 1];
    sCodC  := temp;
    sCodC := sCodC.Substring(0,20);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 2];
    sNomeP1  := temp;
    sNomeP1 := sNomeP1.Substring(0,40);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 3];
    sNomeP2  := temp;
    sNomeP2 := sNomeP2.Substring(0,14);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 4];
    sNomeSub  := temp;
    sNomeSub := sNomeSub.Substring(0,10);

    // -----
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 5];
    QtUM  := temp;

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 6];
    sCodB  := temp;
    sCodB := sCodB.Substring(0,20);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 7];
    sCodF  := temp;
    sCodF := sCodF.Substring(0,20);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 8];
    QtMin  := temp;

    // ----
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 9];
    QtPalete  := temp;

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 10];
    sC1  := temp;
    sC1 := sC1.Substring(0,20);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 11];
    sC2  := temp;
    sC2 := sC2.Substring(0,20);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 12];
    sC3  := temp;
    sC3 := sC3.Substring(0,20);

    //-------
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 13];
    sC4  := temp;
    sC4 := sC4.Substring(0,20);

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 14];
    sFifo  := temp;
    iFifo := 0;
    if sFifo = 'SIM' then iFifo := 1;


    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 15];
    sVal  := temp;
    iVal := 0;
    if sVal = 'SIM' then iVal := 1;

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, 16];
    sUnid  := temp;

    // --- Gravar Produto -----------------------------
    Bce := TBce.Create;
    if (NomeAnt <> sNomeP1) then Bce.Prod_Inserir(sNomeP1, sNomeP2, sC1, sC2, sC3, sC4, 1,iVal,iFifo,QtMin, QtPalete, eCli);
    idProd := Bce.Prod_fID(sNomeP1);
    if idProd > 0 then Bce.Prod_SubInserir(eCli, idProd, sNomeP2+'|'+sNomeSUB,sCodB, sCodC, sCodF,sUnid, 1, QtMin, QtUM );
    Bce.Destroy;
    NomeAnt := sNomeP1;

  end;

  //termina
  Importa.quit;
  ShowMessage('Importação terminada!');
end;


procedure TeImportaPr.btImportarClick(Sender: TObject);
begin
  Panel3.Visible := true;
  Le_Planilha(arq.FileName);
end;

procedure TeImportaPr.Entrar;
  var Bce : TBce;
begin
  Bce := TBce.Create;
  lbCli.Caption := Bce.Cli_Padrao;
  Bce.Destroy;
  Panel3.Visible := False;

end;


end.
