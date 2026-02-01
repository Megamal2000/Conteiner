unit uRespCte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvMemoryDataset, JvDataSource,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ComObj;

type
  TRespCte = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbCod: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    btPesq: TBitBtn;
    btCancela: TBitBtn;
    pb: TProgressBar;
    Arquivo: TJvFilenameEdit;
    cbCol1: TComboBox;
    cbCol2: TComboBox;
    lbProc: TStaticText;
    cbCodCli: TComboBox;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    TabNumNF: TIntegerField;
    TabLinha: TIntegerField;
    TabRetorno: TStringField;
    TabnCte: TIntegerField;
    TabvFrete: TFloatField;
    TabvValor: TFloatField;
    TabvPeso: TFloatField;
    procedure btPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  RespCte: TRespCte;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM4, uBanco, ulib;


{ TRespCte }


procedure Le_Planilha(arq : String);

var importa  :  Variant;
    lin, col, linha, idC : Integer;
    S, Baixa      : String;
    temp : Variant;
    nNF : Integer;
    Bco : TBco;

begin
  col := respCte.cbCol1.ItemIndex + 1;

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
  respCte.pb.Max := lin;

  // idCli
  idC :=  DM2.DBCp_leid(RespCte.cbCli.Items[RespCte.cbCli.itemIndex], 'TB_Cliente', 'NOME');

  // --- Lè Notas ----------------------------------
  with respCte do
  for linha:=2 to Lin-1 do
  begin
    pb.Position := linha;
    pb.Refresh;

    lbProc.Caption := 'Lendo linha '+ IntToStr(linha);
    lbProc.Refresh;

    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, col];
    nNF  := temp;

    // --- Encontra Baixa -----------------------------
    Bco := TBco.Create;
    bco.Notas_Baixa(nNF, idC);
    Bco.Destroy;

    // --- Grava Notas -----------------------------
    Tab.Insert;
    TabNumNF.Value   := nNF ;
    TabLinha.Value   := linha;

    if (DM2.cdsTMP.Fields[1].Value <> null) then TabRetorno.Value := DM2.cdsTMP.Fields[1].Value else TabRetorno.Value := '-';
    if (DM2.cdsTMP.Fields[3].Value <> null) then TabvFrete.Value  := DM2.cdsTMP.Fields[3].AsFloat else TabvFrete.Value  := 0;
    if (DM2.cdsTMP.Fields[4].Value <> null) then TabnCte.Value  := DM2.cdsTMP.Fields[4].Value else TabnCte.Value  := 0;
    if (DM2.cdsTMP.Fields[5].Value <> null) then TabvValor.Value  := DM2.cdsTMP.Fields[5].AsFloat else TabvValor.Value  := 0;
    if (DM2.cdsTMP.Fields[6].Value <> null) then TabvPeso.Value  := DM2.cdsTMP.Fields[6].AsFloat else TabvPeso.Value  := 0;
    if TabnCte.Value = 0 then TabRetorno.value := 'CT-e não localizado'
    else
      begin
        TabRetorno.value := 'Ok';

        Bco := TBco.Create;
        Bco.Cte_MarcarEDI(TabnCte.Value, idC, 0);
        Bco.Destroy;
      end;

    Tab.Post;
  end;

  //termina
  Importa.quit;
end;

procedure Escreve_Planilha(arq : String);

var exporta  :  Variant;
    lin, col, linha : Integer;
    S        : String;
    temp : Variant;
    nNF : Integer;

begin
  col := respCte.cbCol2.ItemIndex + 1;

  //Abre o arquivo Excel para importar
  Exporta := CreateOleObject('Excel.Application');
  Exporta.Visible := False;
  Exporta.WorkBooks.Open(arq);



  with respCte do
  begin
    pb.Max := Tab.RecordCount;
    pb.Position := 1;
    linha := 0;

    Tab.last;
    while not Tab.Bof do
    begin
      linha := linha + 1;
      pb.Position := linha;
      pb.Refresh;

      lbProc.Caption := 'Escrevendo Nota '+ TabNumNF.AsString;
      lbProc.Refresh;

      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col] := TabnCte.Value;
      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+1] := TabvFrete.Value;
      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+2] := TabNumNF.Value;
      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+3] := TabvValor.Value;
      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+4] := TabvPeso.Value;


      Tab.Prior;

    end;
  end;

      Exporta.Workbooks[1].Sheets[1].Cells[1 , col] := 'CT-e';
      Exporta.Workbooks[1].Sheets[1].Cells[1 , col+1] := 'Frete';
      Exporta.Workbooks[1].Sheets[1].Cells[1 , col+2] := 'Nota F';
      Exporta.Workbooks[1].Sheets[1].Cells[1 , col+3] := 'Valor NF';
      Exporta.Workbooks[1].Sheets[1].Cells[1 , col+4] := 'Peso';

  //termina
  Exporta.Columns.Autofit;
  Exporta.WorkBooks[1].Close(true); // faz copia
  Exporta.quit;
end;

{
function Exporta_dados(arq : String):Integer;

var usaExcel :  Variant;
    lin, colnf, colSaida, linha, menor, maior, v, idC, corE : Integer;
    S, Baixa      : String;
    temp : Variant;
    nNF, conta : Integer;
    Bco : TBco;
    usa : TMarco;
    ehNum : Boolean;
    // Temp
    tmpNF, tmpocor : Integer;
    tmpDTent, tmpDTcria : TDateTime;
    tmpHora, tmpDescr : String;
    achei : boolean;

begin
  colnf := respCte.cbCol1.ItemIndex + 1;
  colSaida := respCte.cbCol2.ItemIndex + 1;
  idC := DM2.DBCp_leid(respCte.cbCli.Items[respCte.cbCli.itemIndex], 'TB_Cliente', 'NOME');
  conta := 0;

  //Abre o arquivo Excel para importar
  usaExcel := CreateOleObject('Excel.Application');
  usaExcel.Visible := false;
  usaExcel.WorkBooks.Open(arq);

  usa := TMarco.Create;
  ehNum := usa.IsNumeric(usaExcel.Workbooks[1].Sheets[1].Cells[2, colnf]);
  usa.Destroy;

  if (ehNum) then
  begin
    // Faz Titulos
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+0] := 'Num NF';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+1] := 'Ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+2] := 'Data da Entrega';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+3] := 'Hora da Entrega';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+4] := 'Código da ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+4] := 'Data Importação';


    // --- Número de Linhas ----------------------------------
    S := 'A';
    //Linhas
    lin := 1;
    while (S<>'') do
    begin
      lin := lin + 1;

      S := usaExcel.Workbooks[1].Sheets[1].Cells[lin, colnf];

      usa := TMarco.Create;
      ehNum := usa.IsNumeric(S);
      usa.Destroy;

      if (ehNum) then
      begin
        v := StrToInt(S);
        if (v < menor) then menor := v;
        if (v > maior) then maior := v;
      end;

    end;
    respCte.pb.Max := lin;

    // --- Lè Notas ----------------------------------
    Bco := TBco.Create;
    bco.Notas_BaixaGrupo(idC, menor, maior);
    Bco.Destroy;

    // --- Le e Escreve no Arquivo -----------------------------
    with respCte do
    for linha:=2 to Lin-1 do
    begin
      pb.Position := linha;
      pb.Refresh;

      lbProc.Caption := 'Lendo linha '+ IntToStr(linha);
      lbProc.Refresh;

      temp := usaExcel.Workbooks[1].Sheets[1].Cells[linha, colnf];

      usa := TMarco.Create;
      ehNum := usa.IsNumeric(temp);
      usa.Destroy;

      if (ehNum) then nNF  := temp;

      // --- Encontra Baixa -----------------------------
      if (DM4.cdsNFo.FindKey([nNF])) then
      begin
        lbProc.Caption := 'Escrevendo Nota '+ IntToStr(nNf);

        if (DM4.cdsNFoNOCORR.Value > 0) then
        begin
          Bco := TBco.Create;
          bco.Nota_Reenvia(DM4.cdsNFoID.Value, idC);
          Bco.Destroy;
        end;

        lbProc.Refresh;

        tmpNF    := DM4.cdsNFoNUMNF.AsInteger;
        if (DM4.cdsNFoSTATUS_ENT.Value>0) then
            tmpDescr := DM4.cdsNFoDESCR.AsString
        else
        begin
          tmpDescr := 'Na Transportadora';
          if (DM4.cdsNFoNROMA.Value > 0 ) then tmpDescr := 'Em Rota. Romaneio: '+ copy(DM4.cdsNFoNROMA.AsString, 5,6);
        end;
        tmpDTent := DM4.cdsNFoDTENT.AsDateTime;
        tmpHora  := DM4.cdsNFoHRENT.AsString;
        tmpOcor  := DM4.cdsNFoNOCORR.AsInteger;
        tmpDTcria:= DM4.cdsNFoDTCRIA.AsDateTime;

        // repete NumNF
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida]   := tmpNF;
        // Ocorrencia
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+1] := tmpDescr;
        // Dtentrega
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+2] := tmpDTent;
        // HRentrega
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+3] := tmpHora;
        // Cód ocore
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+4] := tmpOcor;
        // Data Criação 1a
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := tmpDTcria;

        DM4.cdsNFo.Next;
        while not DM4.cdsNFo.Eof do
        begin
          if (DM4.cdsNFoNUMNF.Value=tmpNF) then
            tmpDTcria:= DM4.cdsNFoDTCRIA.AsDateTime;
          DM4.cdsNFo.Next;
        end;
       usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := tmpDTcria;



        conta := conta + 1;
      end;

    end;
    // Mudas as Cores
    corE := clDkGray;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+0].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+1].Font.Color := clRed;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+2].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+3].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+4].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+5].Font.Color := corE;
  end
  else ShowMessage('Coluna sem Número de NF ');
  //termina
  usaExcel.WorkBooks[1].Close(true); // faz copia
  usaExcel.quit;

  Exporta_dados := conta;
end;

function Exporta_dados2(arq : String):Integer;

var usaExcel :  Variant;
    lin, colnf, colSaida, colCli, linha, menor, maior, v, idC, corE : Integer;
    S,S1, Baixa      : String;
    temp : Variant;
    nNF, conta, indCli, i : Integer;
    Bco : TBco;
    usa : TMarco;
    ehNum : Boolean;
    Cliente : Array[0..20] of Tgrupo;
    tmpDTcria : TDateTime;
    tmpNF : Integer;
    tmpDescr : STring;
begin
  colnf    := respCte.cbCol1.ItemIndex + 1;
  colSaida := respCte.cbCol2.ItemIndex + 1;
  colCli   := respCte.cbCodCli.ItemIndex + 1;

  //idC := DM2.DBCp_leid(respCte.cbCli.Items[respCte.cbCli.itemIndex], 'TB_Cliente', 'NOME');

  for conta := 0 to 20 do
  begin
    Cliente[conta].idCli := 0;
    Cliente[conta].menor := 50000000;
    Cliente[conta].maior := 0;
  end;

  conta := 0;

  //Abre o arquivo Excel para importar
  usaExcel := CreateOleObject('Excel.Application');
  usaExcel.Visible := false;
  usaExcel.WorkBooks.Open(arq);

  usa := TMarco.Create;
  ehNum := usa.IsNumeric(usaExcel.Workbooks[1].Sheets[1].Cells[2, colnf]);
  usa.Destroy;

  if (ehNum) then
  begin
    // Faz Titulos
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+0] := 'Num NF';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+1] := 'Ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+2] := 'Data da Entrega';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+3] := 'Hora da Entrega';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+4] := 'Código da ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+5] := 'Data da Importação';



    // --- Número de Linhas ----------------------------------
    S := 'A';
    //Linhas
    lin := 1;
    idC := 0;
    indCli := -1;
    while (S<>'') do
    begin
      lin := lin + 1;

      S  := usaExcel.Workbooks[1].Sheets[1].Cells[lin, colnf];
      if (S <> '') then
      begin
        S1 := usaExcel.Workbooks[1].Sheets[1].Cells[lin, colCli];
        if (length(S1)=0) then S1 := '0';


          idC := StrToInt(S1);
          if (indCli > -1) then
          begin
            if (idC <> Cliente[indCli].idCli) then
            begin
              indcli := indCli + 1;
              Cliente[indCli].idCli := idC;
            end;
          end
          else
          begin
            indcli := indCli + 1;
            Cliente[indCli].idCli := idC;
          end;

          usa := TMarco.Create;
          ehNum := usa.IsNumeric(S);
          usa.Destroy;

          if (ehNum) then
          begin
            v := StrToInt(S);
            if (v < Cliente[indCli].menor) then Cliente[indCli].menor := v;
            if (v > Cliente[indCli].maior) then Cliente[indCli].maior := v;
          end;



      end;
    end;
    respCte.pb.Max := lin;
    {
    S := '';
    for i:= 0 to 20 do S := S + IntToSTr(i) + '-'+IntToStr(Cliente[i].idCli)+'/';
    ShowMessage(S);
    }
 {
    S := '';
    i := 0;
    while (i<20) and (Cliente[i].idCli >0) do
    begin
      idC := Cliente[i].idCli;
      // --- Lè Notas ----------------------------------
      Bco := TBco.Create;
      bco.Notas_BaixaGrupo(idC, Cliente[i].menor, Cliente[i].maior);
      Bco.Destroy;

      // --- Le e Escreve no Arquivo -----------------------------
      // parei AQUI - fazer while para Todas as linhas e mudar CLI

      with respCte do
      for linha:=2 to Lin-1 do
      begin
        pb.Position := linha;
        pb.Refresh;

        lbProc.Caption := 'Cliente ['+IntToStr(idC)+']Lendo linha '+ IntToStr(linha);
        lbProc.Refresh;

        temp := usaExcel.Workbooks[1].Sheets[1].Cells[linha, colnf];
        S1   := usaExcel.Workbooks[1].Sheets[1].Cells[linha, colCli];

        if (StrToInt(S1) = idC) then
        begin
          usa := TMarco.Create;
          ehNum := usa.IsNumeric(temp);
          usa.Destroy;

          if (ehNum) then nNF  := temp;

          // --- Encontra Baixa -----------------------------
          if (DM4.cdsNFo.FindKey([nNF])) then
          begin
            lbProc.Caption := 'Escrevendo Nota '+ IntToStr(nNf);

            if (DM4.cdsNFoNOCORR.Value > 0) then
            begin
              Bco := TBco.Create;
              bco.Nota_Reenvia(DM4.cdsNFoID.Value, idC);
              Bco.Destroy;
            end;

            lbProc.Refresh;
            tmpNF := DM4.cdsNFoNUMNF.Value;
            tmpDTcria := DM4.cdsNFoDTCRIA.AsDateTime;
            if (DM4.cdsNFoSTATUS_ENT.Value>0) then
              tmpDescr := DM4.cdsNFoDESCR.AsString
            else
            begin
              tmpDescr := 'Na Transportadora';
              if (DM4.cdsNFoNROMA.Value > 0 ) then tmpDescr := 'Em Rota. Romaneio: '+ copy(DM4.cdsNFoNROMA.AsString, 5,6);
            end;
            // repete NumNF
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida] := DM4.cdsNFoNUMNF.AsInteger;
            // Ocorrencia
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+1] := tmpDescr;
            // Dtentrega
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+2] := DM4.cdsNFoDTENT.AsDateTime;
            // HRentrega
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+3] := DM4.cdsNFoHRENT.AsString;
            // Cód ocore
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+4] := DM4.cdsNFoNOCORR.AsInteger;
            // Data Criação 1a
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := tmpDTcria;

            DM4.cdsNFo.Next;
            while not DM4.cdsNFo.Eof do
            begin
              if (DM4.cdsNFoNUMNF.Value=tmpNF) then
                tmpDTcria:= DM4.cdsNFoDTCRIA.AsDateTime;
              DM4.cdsNFo.Next;
            end;
           usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := tmpDTcria;

            conta := conta + 1;
          end;
        end;
      end;
      i := i + 1;
    end; //while
    // Mudas as Cores
    corE := clDkGray;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+0].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+1].Font.Color := clRed;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+2].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+3].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+4].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+5].Font.Color := corE;
    usaExcel.Columns.Autofit;
  end
  else ShowMessage('Coluna sem Número de NF ');
  //termina

  usaExcel.WorkBooks[1].Close(true); // faz copia
  usaExcel.quit;

  Exporta_dados2 := conta;
end;
}

procedure TRespCte.btPesqClick(Sender: TObject);
var qt : integer;

begin
  btPesq.Enabled := False;
  btCancela.Enabled := False;

  Le_Planilha(arquivo.FileName);
  Escreve_Planilha(arquivo.FileName);
 // if (cbCli.ItemIndex = 0) then qt := Exporta_dados2(arquivo.FileName)
 //   else qt := Exporta_dados(arquivo.FileName);

  btPesq.Enabled := true;
  btCancela.Enabled := true;
  lbProc.Caption := 'Finalizado. Linhas alteradas: '+IntToStr(qt);

end;

procedure TRespCte.Entrar;
begin
  with RespCte do
  begin
    if cbCli.Items.Count = 0 then
    begin
      cbCli.Items.Clear;
      cbCli.Items.Append('** <TODOS>');
      DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 and cteemite=1 ');
      cbCli.ItemIndex := 0;
      cbCol1.ItemIndex := 0;
      cbCol2.ItemIndex := 1;
      cbCodCli.ItemIndex := 2;
    end;
    lbCod.Visible := true;
    cbCodCli.Visible := true;
    lbProc.Caption := '';
    pb.Min := 1;
    pb.Position := 1;
    Tab.Open;
    btPesq.Enabled := true;
    btCancela.Enabled := true;
  end;
end;

end.
