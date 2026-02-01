unit uRespXL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, ComCtrls, Buttons,
  ExtCtrls, ComObj, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvMemoryDataset, JvDataSource;

type Tgrupo = record
     idCli : Integer;
     menor : Integer;
     maior : Integer;
end;     

type
  TRespXL = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btPesq: TBitBtn;
    btCancela: TBitBtn;
    pb: TProgressBar;
    Arquivo: TJvFilenameEdit;
    cbCol1: TComboBox;
    cbCol2: TComboBox;
    lbProc: TStaticText;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    JvDBUltimGrid1: TJvDBUltimGrid;
    TabNumNF: TIntegerField;
    TabLinha: TIntegerField;
    TabRetorno: TStringField;
    TabDataEnt: TDateField;
    TabvFrete: TFloatField;
    lbCod: TLabel;
    cbCodCli: TComboBox;
    ckPedido: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure cbCliChange(Sender: TObject);
    procedure ckPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RespXL: TRespXL;

implementation

{$R *.dfm}

uses uDM2, uDM1, uDM3,uDM4, uBanco, uLib;

procedure TRespXL.FormActivate(Sender: TObject);
begin
  if cbCli.Items.Count = 0 then
  begin
    cbCli.Items.Clear;
    cbCli.Items.Append('** <TODOS>');
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
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


procedure Le_Planilha(arq : String);

var importa  :  Variant;
    lin, col, linha : Integer;
    S, Baixa      : String;
    temp : Variant;
    nNF : Integer;
    Bco : TBco;

begin
  col := respXL.cbCol1.ItemIndex + 1;

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
  respXL.pb.Max := lin;

  // --- Lè Notas ----------------------------------
  with respXL do
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
    bco.Notas_Baixa(nNF, DM2.DBCp_leid(cbCli.Items[cbCli.itemIndex], 'TB_Cliente', 'NOME'));
    Bco.Destroy;

    // --- Grava Notas -----------------------------
    Tab.Insert;
    TabNumNF.Value   := nNF ;
    TabLinha.Value   := linha;
    if (DM2.cdsTMP.Fields[1].Value <> null) then TabRetorno.Value := DM2.cdsTMP.Fields[1].Value else TabRetorno.Value := '-';
    if (DM2.cdsTMP.Fields[2].Value <> null) then TabDataEnt.Value := DM2.cdsTMP.Fields[2].Value else TabDataEnt.Value := StrToDate('01/01/2007');
    if (DM2.cdsTMP.Fields[3].Value <> null) then TabvFrete.Value  := DM2.cdsTMP.Fields[3].Value else TabvFrete.Value  := 0;
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
  col := respXL.cbCol2.ItemIndex + 1;

  //Abre o arquivo Excel para importar
  Exporta := CreateOleObject('Excel.Application');
  Exporta.Visible := False;
  Exporta.WorkBooks.Open(arq);

  with respXL do
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

      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col] := TabRetorno.Value;
      if (FormatDateTime('dd/MM/yyyy',TabDataEnt.Value) = '01/01/2007') then
        Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+1] := '-'
      else
        Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+1] := TabDataEnt.Value;
      Exporta.Workbooks[1].Sheets[1].Cells[TabLinha.Value , col+2]   := TabvFrete.Value;
      Tab.Prior;

    end;
  end;
  //termina
  Exporta.WorkBooks[1].Close(true); // faz copia
  Exporta.quit;
end;


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
    tmpNF, tmpocor, Nfatual, nOutras : Integer;
    tmpDTent, tmpDTcria, tmpDTocoren : TDateTime;
    tmpHora, tmpDescr, tmpCEP, tmpRecebe : String;
    achei : boolean;

begin
  colnf := respXL.cbCol1.ItemIndex + 1;
  colSaida := respXL.cbCol2.ItemIndex + 1;
  idC := DM2.DBCp_leid(RespXL.cbCli.Items[respXL.cbCli.itemIndex], 'TB_Cliente', 'NOME');
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
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+1] := 'CEP';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+2] := 'Ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+3] := 'Data da Entrega';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+4] := 'Hora da Entrega';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+5] := 'Recebedor';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+6] := 'Código da ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+7] := 'Data Importação';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+8] := 'Data Envio Ocoren';


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
    respXL.pb.Max := lin;

    // --- Lè Notas ----------------------------------
    Bco := TBco.Create;
    bco.Notas_BaixaGrupo(idC, menor, maior);
    Bco.Destroy;

    // --- Le e Escreve no Arquivo -----------------------------
    with respXL do
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
        tmpDTocoren:= DM4.cdsNFoDTOCOREN.AsDateTime;
        tmpCEP := DM4.cdsNFoCEP.AsString;
        tmpRecebe := DM4.cdsNFoRECEBEDOR.Value;

        // repete NumNF
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida]   := tmpNF;
        // CEP
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+1] := tmpCEP;
        // Ocorrencia
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+2] := tmpDescr;
        // Dtentrega
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+3] := tmpDTent;
        // HRentrega
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+4] := tmpHora;
        // Cód ocore
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := tmpRecebe;
        // Cód ocore
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+6] := tmpOcor;
        // Data Criação 1a
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+7] := tmpDTcria;
        // Data Ocoren 1a
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+8] := tmpDTocoren;

        nOutras := 0;
        DM4.cdsNFo.Next;
        while not DM4.cdsNFo.Eof do
        begin
          if (DM4.cdsNFoNUMNF.Value=tmpNF) then
          begin
            tmpDTcria:= DM4.cdsNFoDTCRIA.AsDateTime;
            tmpDescr := DM4.cdsNFoDESCR.AsString;
            // Ocorrencia
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+9+3*nOutras] := tmpDescr;
            // Dtentrega
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+10+3*nOutras] := DM4.cdsNFoDTENT.AsDateTime;
            // HRentrega
            usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+11+3*nOutras] := DM4.cdsNFoHRENT.AsString;
            nOutras := nOutras + 1;
          end;
          DM4.cdsNFo.Next;
        end;
       //usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := tmpDTcria;
       conta := conta + 1;

      end;

    end;
    // Mudas as Cores
    corE := clDkGray;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+0].Font.Color := clRed;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+1].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+2].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+3].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+4].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+5].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+6].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+7].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+8].Font.Color := clPurple;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+9].Font.Color := clPurple;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+10].Font.Color := clPurple;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+11].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+12].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+13].Font.Color := corE;
  end
  else ShowMessage('Coluna sem Número de NF ');
  //termina
  usaExcel.WorkBooks[1].Sheets[1].columns.Autofit;
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
    tmpDTcria, tmpDTocoren : TDateTime;
    tmpNF, NFatual, nOutras : Integer;
    tmpDescr : STring;
begin
  colnf    := respXL.cbCol1.ItemIndex + 1;
  colSaida := respXL.cbCol2.ItemIndex + 1;
  colCli   := respXL.cbCodCli.ItemIndex + 1;

  if RespXL.ckPedido.Checked then
  begin
    colnf    := colSaida;
    colCli   := colSaida + 1;
    colSaida := colSaida + 2;
  end;


  //idC := DM2.DBCp_leid(RespXL.cbCli.Items[respXL.cbCli.itemIndex], 'TB_Cliente', 'NOME');

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
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+4] := 'Recebedor';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+5] := 'Código da ocorrência';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+6] := 'Data da Importação';
    usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+7] := 'Data Envio Ocoren';



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
    respXL.pb.Max := lin;
    {
    S := '';
    for i:= 0 to 20 do S := S + IntToSTr(i) + '-'+IntToStr(Cliente[i].idCli)+'/';
    ShowMessage(S);
    }
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

      with respXL do
      for linha:=2 to Lin-1 do
      begin
        pb.Position := linha;
        pb.Refresh;

        lbProc.Caption := 'Cliente ['+IntToStr(idC)+']Lendo linha '+ IntToStr(linha);
        lbProc.Refresh;

        temp := usaExcel.Workbooks[1].Sheets[1].Cells[linha, colnf];
        S := temp;
        if (S = '-3') then
        begin
          usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+1] := 'Pedido não encontrado ';
          S := '';
        end
        else
        begin
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
              tmpDTocoren:= DM4.cdsNFoDTOCOREN.AsDateTime;

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
              // Recebedor
              usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+4] := DM4.cdsNFoRECEBEDOR.Value;
// Cód ocore
              usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+5] := DM4.cdsNFoNOCORR.AsInteger;
              // Data Criação 1a
              usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+6] := tmpDTcria;
              // Data ocoren
              usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+7] := tmpDTocoren;


              nOutras := 0;
              DM4.cdsNFo.Next;
              while not DM4.cdsNFo.Eof do
              begin
                if (DM4.cdsNFoNUMNF.Value=tmpNF) then
                begin
                  tmpDTcria:= DM4.cdsNFoDTCRIA.AsDateTime;
                  tmpDescr := DM4.cdsNFoDESCR.AsString;
                  // Ocorrencia
                  usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+8+3*nOutras] := tmpDescr;
                  // Dtentrega
                  usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+9+3*nOutras] := DM4.cdsNFoDTENT.AsDateTime;
                  // HRentrega
                  usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+10+3*nOutras] := DM4.cdsNFoHRENT.AsString;
                  nOutras := nOutras + 1;
                end;
                DM4.cdsNFo.Next;
              end;
             //usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+6] := tmpDTcria;

             conta := conta + 1;


            end;
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
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+6].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+7].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+8].Font.Color := clPurple;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+9].Font.Color := clPurple;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+10].Font.Color := clPurple;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+11].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+12].Font.Color := corE;
    usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+13].Font.Color := corE;
    usaExcel.Columns.Autofit;
  end
  else ShowMessage('Coluna sem Número de NF ');
  //termina
  usaExcel.WorkBooks[1].Sheets[1].columns.Autofit;
  usaExcel.WorkBooks[1].Close(true); // faz copia
  usaExcel.quit;

  Exporta_dados2 := conta;
end;

function Exporta_dadosPED(arq : String):Integer;

var usaExcel :  Variant;
    lin, colnf, colSaida, colCli, linha, menor, maior, v, idC, corE : Integer;
    S,S1, Baixa      : String;
    temp : Variant;
    nNF, conta, indCli, i : Integer;
    Bco : TBco;
    usa : TMarco;
    ehNum : Boolean;
    Cliente : Array[0..20] of Tgrupo;
    tmpDTcria, tmpDTocoren : TDateTime;
    tmpNF, tmpCli, nOutras : Integer;
    tmpDescr, sPed : STring;
begin
  colnf    := respXL.cbCol1.ItemIndex + 1;
  colSaida := respXL.cbCol2.ItemIndex + 1;
  colCli   := respXL.cbCodCli.ItemIndex + 1;

  conta := 0;

  //Abre o arquivo Excel para importar
  usaExcel := CreateOleObject('Excel.Application');
  usaExcel.Visible := false;
  usaExcel.WorkBooks.Open(arq);


  // Faz Titulos
  usaExcel.Workbooks[1].Sheets[1].Cells[1 , colSaida+0] := 'Num NF';

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
  end;
  respXL.pb.Max := lin;
  {
  S := '';
  for i:= 0 to 20 do S := S + IntToSTr(i) + '-'+IntToStr(Cliente[i].idCli)+'/';
  ShowMessage(S);
  }
  S := '';
  i := 0;
  // --- Lè Notas ----------------------------------
  Bco := TBco.Create;
  bco.Notas_BaixaGrupo2();
  Bco.Destroy;

  // --- Le e Escreve no Arquivo -----------------------------
  // parei AQUI - fazer while para Todas as linhas e mudar CLI

  with respXL do
  for linha:=2 to Lin-1 do
  begin
    pb.Position := linha;
    pb.Refresh;

    lbProc.Caption := 'Lendo linha '+ IntToStr(linha);
    lbProc.Refresh;

    temp := usaExcel.Workbooks[1].Sheets[1].Cells[linha, colnf];

    begin
      sPed := temp;

      // --- Encontra Baixa -----------------------------
      tmpNF := -3;  tmpCli :=1;
      if (DM3.cdsPED.FindKey([sPed])) then
      begin
        tmpNF := DM3.cdsPEDNUMNF.Value;
        tmpCli:= DM3.cdsPedLIGCLI.Value;
      end;

        lbProc.Caption := 'Procurando Pedido '+ sPed;
        lbProc.Refresh;
        // repete NumNF
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida] := tmpNF;
        usaExcel.Workbooks[1].Sheets[1].Cells[linha , colSaida+1] := tmpCli;
        conta := conta + 1;



    end;
  end;
  i := i + 1;
  // Mudas as Cores
  corE := clDkGray;
  usaExcel.WorkBooks[1].Sheets[1].Columns[colSaida+0].Font.Color := corE;
  usaExcel.Columns.Autofit;

  //termina
  usaExcel.WorkBooks[1].Sheets[1].columns.Autofit;
  usaExcel.WorkBooks[1].Close(true); // faz copia
  usaExcel.quit;

  Exporta_dadosPED := conta;
end;

procedure TRespXL.btCancelaClick(Sender: TObject);
begin
  RespXL.Hide;
end;

procedure TRespXL.btPesqClick(Sender: TObject);

var qt : integer;

begin
  btPesq.Enabled := False;
  btCancela.Enabled := False;

  //Le_Planilha(arquivo.FileName);
  //Escreve_Planilha(arquivo.FileName);
  if (cbCli.ItemIndex = 0) then
  begin
    if not ckPedido.Checked then qt := Exporta_dados2(arquivo.FileName)
      else
      begin
        qt := Exporta_dadosPED(arquivo.FileName);
        qt := Exporta_dados2(arquivo.FileName);
      end
  end
    else qt := Exporta_dados(arquivo.FileName);

  btPesq.Enabled := true;
  btCancela.Enabled := true;
  lbProc.Caption := 'Finalizado. Linhas alteradas: '+IntToStr(qt);

end;

procedure TRespXL.cbCliChange(Sender: TObject);
begin
  lbCod.Visible := true;
  cbCodCli.Visible := true;
  ckPedido.Visible := true;

  if (cbCli.ItemIndex >0) then
  begin
    lbCod.Visible := false;
    cbCodCli.Visible := false;
    ckPedido.Visible := false;
  end;
end;

procedure TRespXL.ckPedidoClick(Sender: TObject);
begin
  lbCod.Visible := true;
  cbCodCli.Visible := true;

  if (ckPedido.Checked) then
  begin
    lbCod.Visible := false;
    cbCodCli.Visible := false;
  end;
end;

end.
