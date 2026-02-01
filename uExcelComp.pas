unit uExcelComp;
{
    **********************************************
    Exporta para Excel - Completa: 20/01/2021
    - COMObj = usar excel
    - Graphisc = ciores do delphi : clGray

}
interface

uses uBanco, COMObj, Graphics, ShlObj, SysUtils, uDM1, uDM5;

  // Classe
type

TModo = (modUmaPlanilha = 1, modVariasPlanilhas=2, modVariosArquivos=3);


TXlS = class(TObject)
  private
    NomeArquivo, sCliente : String;
    Excel : Variant;
    tipo:TModo;
    qt:Integer;
    linha, nPlanilha : integer;
  protected

  public
    procedure Inicio;
    procedure Cabecalho();
    procedure Finais();
    procedure Fechar;
    procedure EnviaLinha(nLinha, idNF:Integer);
    procedure DadosCliente(idCli, numlinha : Integer);
    procedure DadosVarias;
    procedure DadosArqs;
    procedure Exporta;

    procedure set_Tipo(t:Tmodo);
    procedure set_Varios(n:Integer);
    procedure set_DescricaoArquivo(s : String);
    procedure set_NomeCliente(s : String);
    procedure set_Planilha(i : Integer);

    function  get_linha():Integer;

end;

implementation

function GetMyDocuments: string;
var
  r: Boolean;
  path: array [0 .. 100] of Char;
begin
  r := ShGetSpecialFolderPath(0, path, CSIDL_Personal, False);
  if not r then path := 'erro';
  Result := path;
end;

function Monta_NomeArquivo(Descr, Cliente: String):String;

var  resp, MeusDocumentos : String;

begin
  if Length(Descr)=0 then Descr := 'Teste00';

  MeusDocumentos := GetMyDocuments + '\';
  //MeusDocumentos := 'C:\pa\';
  resp := MeusDocumentos + 'Flaydel_COB_' +Descr + '_' + Cliente + '.xlsx';
  resp := resp.Replace(' ','_');
  Result := resp;
end;

{ TXlS }

procedure TXlS.Cabecalho();
begin
// Titulos    - nPlanilha inicia no 1
 Excel.WorkBooks[1].Sheets[nPlanilha].Name := sCliente;
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,1] := 'NÚMERO DA FATURA';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,2] := 'NOME TRANSPORTADOR';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,3] := 'CNPJ';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,4] := 'TIPO DE FRETE';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,5] := 'CTE';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,6] := 'DATA EMISSÃO CTE';

 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,7] := 'DESTINATÁRIO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,8] := 'CPF/CNPJ';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,9] := 'CIDADE DO DESTINATÁRIO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,10] := 'REGIÂO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,11] := 'CEP DESTINO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,12] := 'UF DESTINO';

 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,13] := 'NÚMERO DO PEDIDO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,14] := 'NÚMERO NF';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,15] := 'SÉRIE NF';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,16] := 'DATA EMISSÃO NF';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,17] := 'VALOR DA NF';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,18] := 'PESO REAL';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,19] := 'PESO CUBADO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,20] := 'PESO CONSIDERADO';

 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,21] := 'FRETE PESO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,22] := 'PESO EXC';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,23] := 'GRIS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,24] := 'ADV';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,25] := 'PEDAGIO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,26] := 'TDE';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,27] := 'TEMIS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,28] := 'OUTROS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,29] := 'VLR AGENDADA';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,30] := 'ICMS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,31] := 'Alíquota de ICMS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,32] := 'FRETE TOTAL S/ICMS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,33] := 'FRETE TOTAL C/ICMS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,34] := 'QTDE DE ITENS';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,35] := 'CHAVE DE ACESSO';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,36] := 'CLI';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,37] := 'num OCOR';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,38] := 'OCORRÊNCIA';
 Excel.WorkBooks[1].Sheets[nPlanilha].cells[1,39] := 'DATA DE ENTREGA';

end;

procedure TXlS.DadosArqs;
  var i : Integer;

begin
  Inicio;
  Cabecalho();
  for i := 1 to 10 do
  begin
    linha := i + 1;
    //EnviaLinha(1, linha);
  end;
  Finais();
  Fechar;
end;

procedure TXlS.DadosCliente(idCli, numlinha:Integer);
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.FreteCOB_fMostraNFcli(idCli);
  Bco.Destroy;

  DM5.cdsFrtNotas.First;
  while not DM5.cdsFrtNotas.Eof do
  begin
    EnviaLinha( numlinha, DM5.cdsFrtNotasLIGNF.Value );
    numlinha := numlinha + 1;
    DM5.cdsFrtNotas.Next;
  end;
  linha := numlinha;
end;

procedure TXlS.DadosVarias;
begin
  Inicio;
end;

procedure TXlS.EnviaLinha( nLinha, idNF: Integer);
  var valorCampo : String;
      Bco : TBco;
      dt : TDatetime;
      vlrFloat : double;
      pesqOcor : Smallint;
begin
   // Tabela Notas  PESQUISA USANDO BANCO
   // -----------------------
   {
   Bco := TBco.Create;
   Bco.Notas_MostraId(idNF);
   Bco.FreteCOB_CTe(idNF);
   Bco.Destroy;
   }
   // Tabela Notas  PESQUISA USANDO FILTRO
   // -----------------------

   Bco := TBco.Create;
   Bco.FreteCOB_fMostraNota(idNF);
   Bco.Notas_fID(idNF);
   Bco.Destroy;


 // Linhas
   if DM1.cdsNotas.RecordCount>0 then
   begin
     // Marca como Cobrado no Rel = 2
     Bco := TBco.Create;
     Bco.Marca_Cobrado(DM1.cdsNotasID.Value,2);
     Bco.Destroy;

 // **************************************
 // ** DADOS INICIAIS 1 a 12
 // **************************************
    // -- Numero da Fatura FIXO
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,1] :=  0;

    // -- Nome do Transportador FIXO
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,2] :=  'FLAYDEL LOG';

    // -- CNPJ FIXO
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,3] :=  '191839920001-68';

    // -- TIPO DE FRETE FIXO -- Serviço 2
    valorcampo := 'Peso';

    if DM1.cdsNotasTIPO_COB.Value = 2 then valorcampo := 'Taxa';
    if DM1.cdsNotasTIPO_COB.Value = 3 then valorcampo := 'Entrega';
    if DM1.cdsNotasTIPO_COB.Value = 4 then valorcampo := 'Saída';
    if DM1.cdsNotasTIPO_COB.Value = 5 then valorcampo := 'Contrato';

    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,4] :=  valorcampo;

   /// *************************************

    if (DM1.cdsCTe.RecordCount>0) then
    begin
        // -- Cte
        valorcampo := DM1.cdsCTeNUMC.AsString;
        Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,5] :=  valorcampo;

        // -- Data da Emissão do CTE
        dt := DM1.cdsCTeDATAC.AsDateTime;
        Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,6] :=  dt;

        // CHAVE DE ACESSO
        valorcampo := DM1.cdsCTeARQUIVO.AsString;
        Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,35] :=  valorcampo;
    end;
   // **************************************
   // ** DADOS DESTINATARIO
   // **************************************
    // -- Destinat
    valorcampo := DM1.cdsNotasNOMEDEST.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,7] :=  valorCampo;

    // -- CPF
    valorcampo := DM1.cdsNotasDOCDEST.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,8] :=  valorCampo;

    // -- Cidade
    valorcampo := DM1.cdsNotasLOCALI.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,9] :=  valorCampo;

    // -- REGIAO
    if DM1.cdsNotasTIPOLOCAL.Value = 0  then valorcampo := 'SP';
    if DM1.cdsNotasTIPOLOCAL.Value = 1  then valorcampo := 'GSP';
    if DM1.cdsNotasTIPOLOCAL.Value = 2  then valorcampo := 'INT';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,10] :=  valorCampo;

    // -- CEP
    valorcampo := DM1.cdsNotasCEP.Value;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,11] :=  valorCampo;

    // -- UF 11
    valorcampo := 'SP';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,12] :=  valorCampo;

   // **************************************
   // ** DADOS NF
   // **************************************
    // -- Pedido
    valorcampo := DM1.cdsNotasNUMPED.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,13] :=  valorCampo;

    // -- Nota Fiscal
    valorcampo := DM1.cdsNotasNUMNF.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,14] :=  valorCampo;

    // -- Serie
    valorcampo := DM1.cdsNotasSERIENF.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,15] :=  valorCampo;

    // -- DT EMISSÃO
    dt := DM1.cdsNotasDTNOTA.AsDateTime;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,16] :=  dt;

    // -- valor NF
    valorcampo := DM1.cdsNotasVALOR.AsString;
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,17] :=  valorCampo;

    if (length(DM1.cdsNotasCUB_VOLUME.AsString)=0) or (DM1.cdsNotasCUB_VOLUME.AsString='0') then
    begin
      // -- Peso NF
      valorcampo := DM1.cdsNotasPESO.AsString;
      if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
      Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,18] :=  valorCampo;
      Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,20] :=  valorCampo;

      // -- Cubagem
      valorcampo := '0';
      if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
      Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,19] :=  valorCampo;
    end
    else
    begin
      // -- Peso NF
      valorcampo := '0';
      if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
      Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,18] :=  valorCampo;

      // -- Cubagem
      valorcampo := DM1.cdsNotasPESO.AsString;
      if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
      Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,19] :=  valorCampo;
      Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,20] :=  valorCampo;

    end;

     // ************************ Mostra Detalhes
    // -- Frete Peso
    valorcampo := FloatToStr(DM5.cdsFrtNotasVFRETESERV.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,21] :=  valorCampo;

    // -- Frete Peso Adic
    valorcampo := FloatToStr(DM5.cdsFrtNotasVADICPESO.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,22] :=  valorCampo;

    // -- Gris
    valorcampo := FloatToStr(DM5.cdsFrtNotasVGRIS.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,23] :=  valorCampo;

    // -- Seguro = AdValor???
    valorcampo := FloatToStr(DM5.cdsFrtNotasVADVALOR.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,24] :=  valorCampo;

    // -- Pedágio
    valorcampo := FloatToStr(DM5.cdsFrtNotasVPEDAGIO.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,25] :=  valorCampo;

    // -- TDE - Grau de Dific
    valorcampo := FloatToStr(DM5.cdsFrtNotasVTDE.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,26] :=  valorCampo;

    // -- Emissao (Taxa CTRC)  =TEMIS - taxa de EMissao
    valorcampo := FloatToStr(DM5.cdsFrtNotasVTAXA.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,27] :=  valorCampo;

    // -- Outros  Flutua
    valorcampo := FloatToStr(DM5.cdsFrtNotasVOUTROS.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,28] :=  valorCampo;

    // VLR AGENDADA
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,29] :=  0;

    // -- Impostos (ICMS)
    valorcampo := FloatToStr(DM5.cdsFrtNotasICVALOR.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,30] :=  valorCampo;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,31] :=  DM5.cdsFrtNotasICALIQ.AsFloat; // %ICMS

    // -- Frete Total - ICMS
    vlrFloat :=  DM5.cdsFrtNotasVFRETETOTAL.AsFloat  ;
    valorcampo := vlrFloat.ToString;
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,32] :=  valorCampo;

    // -- Frete Total
    valorcampo := FloatToStr(DM5.cdsFrtNotasVFRETETOTAL.AsFloat + DM5.cdsFrtNotasICVALOR.AsFloat);
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,33] :=  valorCampo;

    // QTDE DE ITENS - Volume
    valorcampo := DM1.cdsNotasVOLUME.AsString;
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,34] :=  valorCampo;



    // -- Cliente LIGCLI
    valorcampo := DM1.cdsNotasLIGCLI.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,36] :=  valorCampo;

    // -- num oCORRENCIA
    valorcampo := DM1.cdsNotasNOCORR.AsString;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,37] :=  valorCampo;

    // -- OCORRENCIA
    if (DM1.cdsNotasNOCORR.Value = 0) then valorcampo := 'sem Ocorrência';
    if (DM1.cdsNotasNOCORR.Value = 1) then valorcampo := 'ENTREGUE';
    if (DM1.cdsNotasNOCORR.Value > 1) then
    begin
      valorcampo := 'x';
      pesqOcor := pesqOcor + 1;
    end;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,38] :=  valorCampo;

    // -- Data da Entrega
    dt := DM1.cdsNotasDTENT.AsDateTime;
    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,39] :=  dt;

    Excel.WorkBooks[1].Sheets[nPlanilha].cells[nLinha,40] :=  DM5.cdsFrtCliNOME.AsString;

  end;
end;

procedure TXlS.Exporta;
begin

end;

procedure TXlS.Fechar;
begin
  //Salva como
  Excel.WorkBooks[1].SaveAs(Monta_NomeArquivo(NomeArquivo, sCliente));

  //termina
  Excel.quit;

end;

procedure TXlS.Finais();
  var ff : Smallint;
begin
             // Formata os cabeçalhos
    for ff:=1 to 38 do
    begin
      if ff<7 then
        Excel.WorkBooks[1].Sheets[nPlanilha].Columns[ff].Font.Color := clGray;
      if (ff>6) and (ff<13) then
        Excel.WorkBooks[1].Sheets[nPlanilha].Columns[ff].Font.Color := clNavy;
      if (ff>12) and (ff<36) then
        Excel.WorkBooks[1].Sheets[nPlanilha].Columns[ff].Font.Color := clBlack;
      if ff>35then
        Excel.WorkBooks[1].Sheets[nPlanilha].Columns[ff].Font.Color := clGreen;
      if ff=33then
        Excel.WorkBooks[1].Sheets[nPlanilha].Columns[ff].Font.Color := clRed;
    end;

    Excel.WorkBooks[1].Sheets[nPlanilha].columns.Autofit;

end;

function TXlS.get_linha: Integer;
begin
  Result := linha;
end;

procedure TXlS.Inicio;
  var i : Integer;
begin
  Excel:= CreateOleObject('Excel.Application');
  Excel.Workbooks.Add;
  Excel.Visible := false;
  if (ord(tipo)=2) and (qt > 3) then
    for I := 1 to qt - 3 do   Excel.WorkBooks[1].Sheets.Add;
end;

procedure TXlS.set_DescricaoArquivo(s: String);
begin
  NomeArquivo := s;
end;

procedure TXlS.set_NomeCliente(s: String);
begin
  sCliente := s;
end;

procedure TXlS.set_Planilha(i: Integer);
begin
  nPlanilha := i;
end;

procedure TXlS.set_Tipo(t: Tmodo);
begin
  tipo := t;
end;

procedure TXlS.set_Varios(n: Integer);
begin
  qt := n;
end;

end.
