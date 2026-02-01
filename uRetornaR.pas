unit uRetornaR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ComObj;

type
  TRetornaR = class(TForm)
    Edit1: TEdit;
    Label3: TLabel;
    btImportar: TBitBtn;
    PBnotas: TProgressBar;
    OpenDialog1: TOpenDialog;
    procedure btImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RetornaR: TRetornaR;
  Notas : TStringList;

implementation

{$R *.dfm}

uses uDM5, uBanco;

function Le_Notas:Integer;

var Importa : Variant;
    Arq_escolhido, S : String;
    lin : Integer;

begin

  if (RetornaR.OpenDialog1.Execute) then
    Arq_escolhido := RetornaR.OpenDialog1.FileName
  else Exit;
  //Abre o arquivo Excel para importar
  Importa := CreateOleObject('Excel.Application');
  Importa.Visible := False;
  Importa.WorkBooks.Open(Arq_escolhido);

  S := 'A';
  //Linhas
  lin := 0;
  while (S<>'') do
  begin
    lin := lin + 1;
    S := Importa.Workbooks[1].Sheets[1].Cells[lin, 1];
    Notas.Add(S);
  end;

  result := lin;

end;

function Agrupa(nG, qt:Integer; lista:TStringList): string;
  var resp : String;
  I, inic, fim: Integer;

begin
  resp := '';
  // Calcula inicio e fim
  inic := (nG - 1)*qt;
  fim  := (nG)*qt - 1;
  if (fim >= Lista.Count) then fim := Lista.Count - 1;
  // agrupa
  resp := lista[inic];
  for I := inic + 1  to fim do resp := resp + ',' + lista[i];

  result := resp;
end;


procedure Escreve_Notas(cont:Integer);

var planilha : Variant;
    lin, i,j,k, PARTE, nFracao : Integer;
    Bco : Tbco;
    grupo : String;
    qtPartes, fim : Integer;


begin
   PARTE := 40;
  //Abre o arquivo Excel para importar
   planilha:= CreateoleObject('Excel.Application');
   planilha.WorkBooks.add(1);
   planilha.caption := 'Performance Flaydel';
   planilha.visible := true;

   qtPartes := Notas.Count DIV PARTE;

   RetornaR.PBnotas.Min := 0;
   RetornaR.PBnotas.Max := qtPartes;

   Bco := TBco.Create;
   lin := 0;
   for i := 1 to qtPartes do
   begin
     grupo := Agrupa(i, PARTE, Notas);
     Bco.Notas_Retorno_Baixas(grupo);
     Bco.Notas_Retorno_Rastreio(grupo);
     RetornaR.PBnotas.Position := i;
     fim := i*PARTE - 1;
     if (fim > Notas.Count)  then fim := Notas.Count -1;

     for j := (i-1)*PARTE to fim do
     begin
       lin := lin + 1;
       planilha.WorkBooks[1].Sheets[1].cells[lin,1] := Notas[j];
       // Mostra Baixas
       Bco.Notas_Retorno_fBaixas(StrToInt(Notas[j]));
       planilha.WorkBooks[1].Sheets[1].cells[lin,2] := 'Cliente';
       planilha.WorkBooks[1].Sheets[1].cells[lin,3] := Bco.Cliente_Nome( DM5.cdsRetR1LIGCLI.Value);
       DM5.cdsRetR1.First;
       for k := 1 to DM5.cdsRetR1.RecordCount do
       begin
         lin := lin + 1;
         planilha.WorkBooks[1].Sheets[1].cells[lin,2] := 'Entrega';
         planilha.WorkBooks[1].Sheets[1].cells[lin,3] := 'dia '+FormatDateTime('dd/MM', DM5.cdsRetR1DTENT.AsDateTime) + ' - '+FormatDateTime('HH:mm', DM5.cdsRetR1HrENT.AsDateTime);
         planilha.WorkBooks[1].Sheets[1].cells[lin,4] := 'Núm. ocorrência: ' +  DM5.cdsRetR1NOCORR.AsString;
         DM5.cdsRetR1.Next;
       end;
       lin := lin + 1;
       Bco.Notas_Retorno_fRastreio(StrToInt(Notas[j]));
       DM5.cdsRetR2.First;
       for k := 1 to DM5.cdsRetR2.RecordCount do
       begin
         lin := lin + 1;
         planilha.WorkBooks[1].Sheets[1].cells[lin,2] := 'Rastreio';
         planilha.WorkBooks[1].Sheets[1].cells[lin,3] := 'data ' + FormatDateTime('dd/MM/yy HH:mm', DM5.cdsRetR2DTEV.AsDateTime);
         planilha.WorkBooks[1].Sheets[1].cells[lin,4] := DM5.cdsRetR2Descr.Value ;
         planilha.WorkBooks[1].Sheets[1].cells[lin,5] := DM5.cdsRetR2Login.Value ;
         planilha.WorkBooks[1].Sheets[1].cells[lin,6] := DM5.cdsRetR2NUMROMA.AsString ;
         DM5.cdsRetR2.Next;
       end;
       lin := lin + 1;
     end;

   end;
   Bco.Destroy;
   planilha.columns.Autofit;

end;


procedure TRetornaR.btImportarClick(Sender: TObject);

   var Conta : Integer;



begin
  Notas := TStringList.Create;
  Conta := Le_Notas;
  Escreve_Notas(Conta);

  Notas.Destroy;
end;

end.
