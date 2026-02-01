unit uExcel2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, Mask, JvExMask,
  JvSpin, ComCtrls, Buttons, ExtCtrls, DB, ComObj;

type
  TExcel2 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    btCalc: TBitBtn;
    pb: TProgressBar;
    cbCli: TComboBox;
    vAno: TJvSpinEdit;
    JvDBGrid2: TJvDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    edRoma: TEdit;
    DataSource2: TDataSource;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    lbNotas: TLabel;
    btSel: TSpeedButton;
    btZero: TBitBtn;
    btExpCli: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure JvDBGrid1AfterPaint(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure btSelClick(Sender: TObject);
    procedure btExpCliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Excel2: TExcel2;

implementation

uses DateUtils,uDM3, uDM2, uDM1, uDM4, uBanco, uAguarde, uNegocio, uCobZero;

{$R *.dfm}



procedure TExcel2.FormActivate(Sender: TObject);
begin
  if (vAno.Value = 0) then vAno.Value := YearOf(Now);
  if (cbCli.Items.Count= 0) then
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');  
end;

procedure TExcel2.BitBtn1Click(Sender: TObject);
var Bco : TBco;
    idC : Integer;


begin
  if (cbCli.ItemIndex >= 0) then
  begin
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');
    Bco := TBco.Create;
    Bco.Credito_MostraAno(idC, vAno.AsInteger);
    BCo.Cliente_MostraId(idC);
    Bco.Destroy;

  end
  else ShowMessage('Selecione um Cliente');

end;

procedure TExcel2.JvDBGrid2CellClick(Column: TColumn);

var Bco : TBco;
    idCob : Integer;

begin
  if (DM3.cdsCred.RecordCount > 0) then
  begin
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
    begin
      idCob := DM3.cdsCredID.Value;
      Bco := TBco.Create;
      Bco.Romaneio_NotasRel2(idCob);
      Bco.Destroy;
      lbNotas.Caption := IntToStr(DM1.cdsRomaR.RecordCount)+' notas';

    end;
  end
end;

procedure TExcel2.JvDBGrid1AfterPaint(Sender: TObject);
begin
  Aguarde.Hide;
end;

procedure TExcel2.btCalcClick(Sender: TObject);

var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;
    i, loc, qtNF, ff  : Integer;
    Neg : TNeg;

    Bco : TBco;    

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Excel Cobrança - Normal';
 planilha.visible := true;
 linha := -1;
 pb.Min := 0;
 pb.Max := JvDBGrid1.SelectedRows.Count;

 // Titulos
 planilha.cells[1,1] := 'Romaneio';
 planilha.cells[1,2] := 'Motorista';
 planilha.cells[1,3] := 'Nota Fiscal';
 planilha.cells[1,4] := 'DT Entrega';
 planilha.cells[1,5] := 'HR Entrega';
 planilha.cells[1,6] := 'No Ct-e';
 planilha.cells[1,7] := 'DT emissão';
 planilha.cells[1,8] := 'Destinatário';
 planilha.cells[1,9] := 'CNPJ';
 planilha.cells[1,10] := 'Cidade';
 planilha.cells[1,11] := 'UF';
 planilha.cells[1,12] := 'CEP';

 planilha.cells[1,13] := 'Localidade';
 planilha.cells[1,14] := 'Peso NF';
 planilha.cells[1,15] := 'Cubagem';
 planilha.cells[1,16] := 'Valor NF';
 planilha.cells[1,17] := 'Volume';
 planilha.cells[1,18] := 'Frete Peso';
 planilha.cells[1,19] := 'Adic Peso';
 planilha.cells[1,20] := 'Ad Valor';
 planilha.cells[1,21] := 'GRIS';
 planilha.cells[1,22] := 'Pedágios';
 planilha.cells[1,23] := 'Impostos';
 planilha.cells[1,24] := 'Tx CT-e';
 planilha.cells[1,25] := 'TDE';
 planilha.cells[1,26] := 'R$ Pontos';
 planilha.cells[1,27] := 'Outros';
 planilha.cells[1,28] := 'Frete Total';

 planilha.cells[1,29] := 'Pontos';
 planilha.cells[1,30] := 'Entregue';
 planilha.cells[1,31] := 'Recebedor';
 planilha.cells[1,32] := 'Minuta';
 planilha.cells[1,33] := 'T Cobrança';
 planilha.cells[1,34] := 'Serviço';
 planilha.cells[1,35] := 'Serviço 2';
 planilha.cells[1,36] := 'Documento';
 planilha.cells[1,37] := 'Ocorrências';
 planilha.cells[1,38] := '-';

 // Dados
 DM1.cdsRomaR.First;
 if JvDBGrid1.SelectedRows.Count>0 then
  begin
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
         linha := linha + 1;
         pb.Position := linha;
         // Linhas
         begin
          {
           for coluna := 1 to DM1.cdsRomaR.FieldCount do
           begin
             if (coluna = 3) then
             begin
              if not (DM1.cdsRomaR.Fields[2].isNull) then
              begin
                //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
                dt := DM1.cdsRomaR.Fields[2].AsDateTime;
                planilha.cells[linha + 2,coluna] :=  dt;
              end;
             end
             else
             begin
               valorcampo := DM1.cdsRomaR.Fields[coluna - 1].AsString;
               if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
               planilha.cells[linha + 2,coluna] :=  valorCampo;
             end;
           end; // fim do FOR
           }
           // Marca como Cobrado no Rel = 2
           Bco := TBco.Create;
           Bco.Marca_Cobrado(DM1.cdsRomaRIDNF.Value,2);
           Bco.Destroy;


           // **************************************
           // ** DADOS INICIAIS 1 a 12
           // **************************************
           // -- Romaneio
            valorcampo := DM1.cdsRomaRROMANEIO.AsString;
            planilha.cells[linha + 2,1] :=  valorCampo;

           // -- Motorista
            valorcampo := DM1.cdsRomaRNOME.Value;
            planilha.cells[linha + 2,2] :=  valorCampo;

            // -- Nota Fiscal
            valorcampo := DM1.cdsRomaRNUMNF.AsString;
            planilha.cells[linha + 2,3] :=  valorCampo;

            // -- DT Entrega
            dt := DM1.cdsRomaRDTENT.AsDateTime;
            planilha.cells[linha + 2,4] :=  dt;

            // -- HR Entrega
            valorcampo := ' ' + copy(DM1.cdsRomaRHORA.AsString, 1, 5);
            planilha.cells[linha + 2,5] :=  valorCampo;

            // -- No CT-e 6

            // -- DT emissao 7

            // -- Destinatário 8

            // -- CNPJ 9

            // -- Cidade 10
            valorcampo := '';
            planilha.cells[linha + 2,10] :=  valorCampo;

            // -- UF 11
            valorcampo := 'SP';
            planilha.cells[linha + 2,11] :=  valorCampo;

            // -- CEP
            valorcampo := DM1.cdsRomaRCEP.Value;
            planilha.cells[linha + 2,12] :=  valorCampo;

            // -- Localidade 13
            valorcampo := DM1.cdsRomaRLOCAL.Value;
            planilha.cells[linha + 2,13] :=  valorCampo;

            // -- Peso NF
            valorcampo := DM1.cdsRomaRPESO.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,14] :=  valorCampo;

            // -- Cubagem
            valorcampo := DM1.cdsRomaRCUB_VOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,15] :=  valorCampo;

            // -- valor NF
            valorcampo := DM1.cdsRomaRVALOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,16] :=  valorCampo;

            // -- Volume
            valorcampo := DM1.cdsRomaRVOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,17] :=  valorCampo;

           // **************************************
           // ** DADOS DA NF 13 a 28
           // **************************************
           loc := DM1.cdsRomaRtipolocal.Value;
           qtNF:= 1;
           // acrescenta desmembramento
            Neg := TNeg.Create;
            Case DM1.cdsRomaRTIPO_COB.Value of
            1 : Neg.Calcula_Frete_Peso(DM1.cdsRomaRLIGCLI.Value, DM1.cdsRomaRPESO.AsFloat, loc, DM1.cdsRomaRCEP.Value );
            2 : Neg.Calcula_Frete_Taxa(DM1.cdsRomaRLIGCLI.Value,loc,DM1.cdsRomaRVALOR.AsFloat);
            3 : Neg.Calcula_Frete_Entrega(DM1.cdsRomaRLIGCLI.Value, loc);
            4 : Neg.Calcula_Frete_Saida(DM1.cdsRomaRLIGCLI.Value,1,loc,qtNF);
            6 : Neg.Calcula_Frete_Combinado(qtNF,Dm1.cdsRomaRVFRETE.AsFloat);
            end;

            Neg.Calcula_Frete_NF(DM1.cdsRomaRTIPO_COB.Value);
            Neg.Adicional_Simulador(DM1.cdsRomaRLIGCLI.Value, DM1.cdsRomaRTIPOLOCAL.Value,DM1.cdsRomaRPONTO.Value,DM1.cdsRomaRTIPO_COB.Value,DM1.cdsRomaRVALOR.AsFloat, DM1.cdsRomaRPESO.AsFloat);

            // ************************ Mostra Detalhes
            // -- Frete Peso
            valorcampo := FloatToStr(Neg.get_A_fretePeso);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,18] :=  valorCampo;

            // -- Frete Peso Adic
            valorcampo := FloatToStr(Neg.get_K_fretePesoAdic);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,19] :=  valorCampo;

            coluna := 20;
            valorcampo := FloatToStr(Neg.get_01AdValor);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna] :=  valorCampo;
            // -- Gris
            valorcampo := FloatToStr(Neg.get_03Gris);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+1] :=  valorCampo;
            // -- Pedágio
            valorcampo := FloatToStr(Neg.get_02Pedagio);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+2] :=  valorCampo;
            // -- Impostos (ICMS)
            valorcampo := FloatToStr(Neg.get_05ICMS);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+3] :=  valorCampo;
            // -- Emissao (Taxa CTRC)
            valorcampo := FloatToStr(Neg.get_07emissao);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+4] :=  valorCampo;
            // -- GrauD (TDE) Flutua
            valorcampo := FloatToStr(Neg.get_04GrauD);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+5] :=  valorCampo;

            // -- R$ Pontos
            valorcampo := FloatToStr(Neg.get_06Ponto);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+6] :=  valorCampo;

            // -- Outros  Flutua
            valorcampo := FloatToStr(Neg.get_F_outros);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+7] :=  valorCampo;

            // -- Frete Total
            valorcampo := DM1.cdsRomaRVFRETE.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,28] :=  valorCampo;

            // -- Ponto
            valorcampo := DM1.cdsRomaRPONTO.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,29] :=  valorCampo;

            // -- Entregue
            valorcampo := DM1.cdsRomaRENTREGUE.value;
            planilha.cells[linha + 2,30] :=  valorCampo;

            // -- recebedor
            valorcampo := DM1.cdsRomaRRECEBEDOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,31] :=  valorCampo;

            // -- Minuta
            valorcampo := DM1.cdsRomaRMINUTA.AsString;
            planilha.cells[linha + 2,32] :=  valorCampo;

            // -- Tipo Cob
            valorcampo := DM1.cdsRomaRTIPO_COB.AsString;
            planilha.cells[linha + 2,33] :=  valorCampo;

            // -- Serviço
            valorcampo := DM1.cdsRomaRSERVICO.Value;
            planilha.cells[linha + 2,34] :=  valorCampo;

            // -- Serviço 2
            valorcampo := DM1.cdsRomaRSERVICO2.Value;
            planilha.cells[linha + 2,35] :=  valorCampo;

            // -- Doc
            valorcampo := DM1.cdsRomaRDOC.Value;
            planilha.cells[linha + 2,36] :=  valorCampo;

            // -- Ocor
            valorcampo := DM1.cdsRomaROCORRENCIA.Value;
            planilha.cells[linha + 2,37] :=  valorCampo;


           DM1.cdsRomaR.Next;

         end;
         // Títulos
         {
         for coluna := 1 to DM1.cdsRomaR.FieldCount do
         begin
           valorcampo := DM1.cdsRomaR.Fields[coluna - 1].DisplayLabel;
           planilha.cells[1,coluna] := valorcampo;
         end;
         planilha.cells[1,coluna]   := 'Ad Valorem';
         planilha.cells[1,coluna+1] := 'Gris';
         planilha.cells[1,coluna+2] := 'Pedágio';
         planilha.cells[1,coluna+3] := 'Impostos';
         planilha.cells[1,coluna+4] := 'Tx CTRC';
         planilha.cells[1,coluna+5] := 'TDE';
         planilha.cells[1,coluna+6] := 'Pontos';
                   }
      end; // for
   end; // count > 0

             // Formata os cabeçalhos
    for ff:=1 to 12 do
    begin
      //Planilha.WorkBooks[1].Sheets[1].Cells[4,x].Font.Bold  := True;
      Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clNavy;
    end;
      Planilha.WorkBooks[1].Sheets[1].Columns[28].Font.Color := clred;

    for ff:=29 to 40 do
    begin
      //Planilha.WorkBooks[1].Sheets[1].Cells[4,x].Font.Bold  := True;
      Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clGreen;
    end;



 planilha.columns.Autofit;

end;

procedure Exporta_Cli1();
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;
    i, loc, qtNF, ff  : Integer;
    Neg : TNeg;

    Bco : TBco;

begin
with Excel2 do
begin
 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Excel Cobrança - Cliente';
 planilha.visible := true;
 linha := -1;
 pb.Min := 0;
 pb.Max := JvDBGrid1.SelectedRows.Count;

 // Titulos
 planilha.cells[1,1] := 'ID';
 planilha.cells[1,2] := 'CTE';
 planilha.cells[1,3] := 'SERIE CTE';
 planilha.cells[1,4] := 'CHAVE ACESSO CTE';
 planilha.cells[1,5] := 'TIPO CTE';
 planilha.cells[1,6] := 'STATUS CTE';

 planilha.cells[1,7] := 'NOME FANTASIA';
 planilha.cells[1,8] := 'TIPO OPERACAO';
 planilha.cells[1,9] := 'FATURA';
 planilha.cells[1,10] := 'FATURA';
 planilha.cells[1,11] := 'AWB';
 planilha.cells[1,12] := 'ID CLIENTE';

 planilha.cells[1,13] := 'NOTA FISCAL';
 planilha.cells[1,14] := 'SERIE NF';
 planilha.cells[1,15] := 'No PEDIDO';
 planilha.cells[1,16] := 'DESTINATARIO';
 planilha.cells[1,17] := 'CPF';
 planilha.cells[1,18] := 'CIDADE';
 planilha.cells[1,19] := 'CEP';
 planilha.cells[1,20] := 'UF';
 planilha.cells[1,21] := 'ROTA';
 planilha.cells[1,22] := 'PRAZO DE ENTREGA PREVISTO';
 planilha.cells[1,23] := 'DATA ENTREGA EFETIVA';
 planilha.cells[1,24] := 'DATA ENCOMENDA';
 planilha.cells[1,25] := 'DATA FATURAMENTO';
 planilha.cells[1,26] := 'PESO';
 planilha.cells[1,27] := 'PESO CUBADO';
 planilha.cells[1,28] := 'VOLUME';
 planilha.cells[1,29] := 'VALOR NF';

 planilha.cells[1,30] := 'TIPO SERVICO';
 planilha.cells[1,31] := 'VL COD';
 planilha.cells[1,32] := 'FRETE PESO';
 planilha.cells[1,33] := 'EXCEDE PESO';
 planilha.cells[1,34] := 'SEGURO';
 planilha.cells[1,35] := 'GRIS';
 planilha.cells[1,36] := 'PEDAGIO';
 planilha.cells[1,37] := 'TAS';
 planilha.cells[1,38] := 'TDE';
 planilha.cells[1,39] := 'TDA';
 planilha.cells[1,40] := 'TRT';
 planilha.cells[1,41] := 'TEMIS';
 planilha.cells[1,42] := 'OUTROS';
 planilha.cells[1,43] := 'ICMS';
 planilha.cells[1,44] := '%ICMS';
 planilha.cells[1,45] := 'FRETE VALOR C/ ICMS';
 planilha.cells[1,46] := 'FRETE C/ ICMS';
 planilha.cells[1,47] := '%OUTROS C/ ICMS';
 planilha.cells[1,48] := '';
 planilha.cells[1,49] := 'DOWNLOAD XML CTE';
 planilha.cells[1,50] := 'LOJA';
 planilha.cells[1,51] := 'Ocorrência';
 planilha.cells[1,52] := 'Volumes';




 // Dados
 DM1.cdsRomaR.First;
 if JvDBGrid1.SelectedRows.Count>0 then
  begin
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
         linha := linha + 1;
         pb.Position := linha;
         // Linhas
         begin
          {
           for coluna := 1 to DM1.cdsRomaR.FieldCount do
           begin
             if (coluna = 3) then
             begin
              if not (DM1.cdsRomaR.Fields[2].isNull) then
              begin
                //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
                dt := DM1.cdsRomaR.Fields[2].AsDateTime;
                planilha.cells[linha + 2,coluna] :=  dt;
              end;
             end
             else
             begin
               valorcampo := DM1.cdsRomaR.Fields[coluna - 1].AsString;
               if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
               planilha.cells[linha + 2,coluna] :=  valorCampo;
             end;
           end; // fim do FOR
           }
           // Marca como Cobrado no Rel = 2
           Bco := TBco.Create;
           Bco.Marca_Cobrado(DM1.cdsRomaRIDNF.Value,2);
           Bco.Destroy;


           // **************************************
           // ** NAO UTILIZADOS - out/018
           // **************************************
           {
           // -- Romaneio
            valorcampo := DM1.cdsRomaRROMANEIO.AsString;
            planilha.cells[linha + 2,1] :=  valorCampo;

            // -- Motorista
            valorcampo := DM1.cdsRomaRNOME.Value;
            planilha.cells[linha + 2,2] :=  valorCampo;

             // -- HR Entrega
            valorcampo := ' ' + copy(DM1.cdsRomaRHORA.AsString, 1, 5);
            planilha.cells[linha + 2,5] :=  valorCampo;
           }
           // **************************************
           // ** DADOS INICIAIS 1 a 12
           // **************************************
           if DM1.cdsRomaRNCONH.Value>0 then
           begin
             // Marca como Cobrado no Rel = 2
             Bco := TBco.Create;
             Bco.Conhec_PesqNumC(DM1.cdsRomaRNCONH.Value,3);
             Bco.Destroy;

             /// *************************************


              // -- Numero CTe
              valorcampo := DM4.cdsConhNUMC.AsString;
              planilha.cells[linha + 2,2] :=  valorCampo;

              // -- Série Cte
              valorcampo := DM4.cdsConhSERIE.AsString;
              planilha.cells[linha + 2,3] :=  1;

              // -- Chave Cte
              valorcampo := DM4.cdsConhARQUIVO.AsString;
              planilha.cells[linha + 2,4] :=  valorcampo;

              // -- Tipo Cte
              valorcampo := 'Normal';
              planilha.cells[linha + 2,5] :=  valorcampo;

              // -- Tipo Cte
              valorcampo := 'Autorizado';
              if DM4.cdsConhSTATUSENVIO.Value > 4 then valorcampo := 'Cancelado';

              planilha.cells[linha + 2,5] :=  valorcampo;


           end;
           // **************************************
           // ** DADOS A PARTIR DO 13
           // **************************************
            // -- Nota Fiscal
            valorcampo := DM1.cdsRomaRNUMNF.AsString;
            planilha.cells[linha + 2,13] :=  valorCampo;

            // -- Serie
            valorcampo := DM1.cdsRomaRSERIENF.AsString;
            planilha.cells[linha + 2,14] :=  valorCampo;

            // -- Pedido
            valorcampo := DM1.cdsRomaRNUMPED.AsString;
            planilha.cells[linha + 2,15] :=  valorCampo;

            // -- Destinat
            valorcampo := DM1.cdsRomaRNOMEDEST.AsString;
            planilha.cells[linha + 2,16] :=  valorCampo;

            // -- CPF
            valorcampo := DM1.cdsRomaRDOCDEST.AsString;
            planilha.cells[linha + 2,17] :=  valorCampo;

            // -- Cidade 10
            valorcampo := 'SAO PAULO';
            planilha.cells[linha + 2,18] :=  valorCampo;

            // -- CEP
            valorcampo := DM1.cdsRomaRCEP.Value;
            planilha.cells[linha + 2,19] :=  valorCampo;

            // -- UF 11
            valorcampo := 'SP';
            planilha.cells[linha + 2,20] :=  valorCampo;

            // -- Localidade 13
            valorcampo := DM1.cdsRomaRLOCAL.Value;
            planilha.cells[linha + 2,21] :=  valorCampo;

            // -- DT Entrega
            dt := DM1.cdsRomaRDTENT.AsDateTime;
            planilha.cells[linha + 2,23] :=  dt;

            if (length(DM1.cdsRomaRCUB_VOLUME.AsString)=0) or (DM1.cdsRomaRCUB_VOLUME.AsString='0') then
            begin
              // -- Peso NF
              valorcampo := DM1.cdsRomaRPESO.AsString;
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,26] :=  valorCampo;

              // -- Cubagem
              valorcampo := '0';
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,27] :=  valorCampo;
           end
            else
            begin
              // -- Peso NF
              valorcampo := '0';
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,26] :=  valorCampo;

              // -- Cubagem
              valorcampo := DM1.cdsRomaRPESO.AsString;
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,27] :=  valorCampo;
           end;

            // -- valor Volume
            valorcampo := DM1.cdsRomaRVOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,28] :=  valorCampo;

            // -- valor NF
            valorcampo := DM1.cdsRomaRVALOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,29] :=  valorCampo;

            // -- Serviço 2
            valorcampo := DM1.cdsRomaRSERVICO2.Value;
            planilha.cells[linha + 2,30] :=  valorCampo;


           // **************************************
           // ** DADOS DA NF 13 a 28
           // **************************************
           loc := DM1.cdsRomaRtipolocal.Value;
           qtNF:= 1;
           // acrescenta desmembramento
            Neg := TNeg.Create;
            Case DM1.cdsRomaRTIPO_COB.Value of
            1 : Neg.Calcula_Frete_Peso(DM1.cdsRomaRLIGCLI.Value, DM1.cdsRomaRPESO.AsFloat, loc, DM1.cdsRomaRCEP.Value );
            2 : Neg.Calcula_Frete_Taxa(DM1.cdsRomaRLIGCLI.Value,loc,DM1.cdsRomaRVALOR.AsFloat);
            3 : Neg.Calcula_Frete_Entrega(DM1.cdsRomaRLIGCLI.Value, loc);
            4 : Neg.Calcula_Frete_Saida(DM1.cdsRomaRLIGCLI.Value,1,loc,qtNF);
            6 : Neg.Calcula_Frete_Combinado(qtNF,Dm1.cdsRomaRVFRETE.AsFloat);
            end;

            Neg.Calcula_Frete_NF(DM1.cdsRomaRTIPO_COB.Value);
            Neg.Adicional_Simulador(DM1.cdsRomaRLIGCLI.Value, DM1.cdsRomaRTIPOLOCAL.Value,DM1.cdsRomaRPONTO.Value,DM1.cdsRomaRTIPO_COB.Value,DM1.cdsRomaRVALOR.AsFloat, DM1.cdsRomaRPESO.AsFloat);

            // ************************ Mostra Detalhes
            // -- Frete Peso
            valorcampo := FloatToStr(Neg.get_A_fretePeso);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,32] :=  valorCampo;

            // -- Frete Peso Adic
            valorcampo := FloatToStr(Neg.get_K_fretePesoAdic);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,33] :=  valorCampo;

            coluna := 60;

            // -- Seguro = AdValor???
            valorcampo := FloatToStr(Neg.get_01AdValor);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,34] :=  valorCampo;
            // -- Gris
            valorcampo := FloatToStr(Neg.get_03Gris);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,35] :=  valorCampo;
            // -- Pedágio
            valorcampo := FloatToStr(Neg.get_02Pedagio);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,36] :=  valorCampo;
            // -- Impostos (ICMS)
            valorcampo := FloatToStr(Neg.get_05ICMS);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,43] :=  valorCampo;
            planilha.cells[linha + 2,44] :=  12; // %ICMS


            // -- Emissao (Taxa CTRC)  =TEMIS - taxa de EMissao
            valorcampo := FloatToStr(Neg.get_07emissao);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,41] :=  valorCampo;
            // -- GrauD (TDE) Flutua
            valorcampo := FloatToStr(Neg.get_04GrauD);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,38] :=  valorCampo;
             {
            // -- R$ Pontos
            valorcampo := FloatToStr(Neg.get_06Ponto);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+6] :=  valorCampo;
             }
            // -- Outros  Flutua
            valorcampo := FloatToStr(Neg.get_F_outros);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,42] :=  valorCampo;
             {
            // -- Frete Total
            valorcampo := DM1.cdsRomaRVFRETE.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,44] :=  valorCampo;

            // -- Ponto
            valorcampo := DM1.cdsRomaRPONTO.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,79] :=  valorCampo;
             }
            // -- Entregue
            valorcampo := DM1.cdsRomaRLIGCLI.AsString;
            planilha.cells[linha + 2,50] :=  valorCampo;

            // -- Entregue
            valorcampo := DM1.cdsRomaRENTREGUE.value;
            planilha.cells[linha + 2,51] :=  valorCampo;
             {
            // -- recebedor
            valorcampo := DM1.cdsRomaRRECEBEDOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,81] :=  valorCampo;

            // -- Minuta
            valorcampo := DM1.cdsRomaRMINUTA.AsString;
            planilha.cells[linha + 2,82] :=  valorCampo;

            // -- Tipo Cob
            valorcampo := DM1.cdsRomaRTIPO_COB.AsString;
            planilha.cells[linha + 2,83] :=  valorCampo;


            // -- Serviço
            valorcampo := DM1.cdsRomaRSERVICO.Value;
            planilha.cells[linha + 2,84] :=  valorCampo;



            // -- Doc
            valorcampo := DM1.cdsRomaRDOC.Value;
            planilha.cells[linha + 2,86] :=  valorCampo;

            // -- Ocor
            valorcampo := DM1.cdsRomaROCORRENCIA.Value;
            planilha.cells[linha + 2,87] :=  valorCampo;
             }

           DM1.cdsRomaR.Next;

         end;
         // Títulos
         {
         for coluna := 1 to DM1.cdsRomaR.FieldCount do
         begin
           valorcampo := DM1.cdsRomaR.Fields[coluna - 1].DisplayLabel;
           planilha.cells[1,coluna] := valorcampo;
         end;
         planilha.cells[1,coluna]   := 'Ad Valorem';
         planilha.cells[1,coluna+1] := 'Gris';
         planilha.cells[1,coluna+2] := 'Pedágio';
         planilha.cells[1,coluna+3] := 'Impostos';
         planilha.cells[1,coluna+4] := 'Tx CTRC';
         planilha.cells[1,coluna+5] := 'TDE';
         planilha.cells[1,coluna+6] := 'Pontos';
                   }
      end; // for
   end; // count > 0

             // Formata os cabeçalhos
    for ff:=1 to 12 do
    begin
      //Planilha.WorkBooks[1].Sheets[1].Cells[4,x].Font.Bold  := True;
      Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clNavy;
    end;
      Planilha.WorkBooks[1].Sheets[1].Columns[28].Font.Color := clred;

    for ff:=29 to 40 do
    begin
      //Planilha.WorkBooks[1].Sheets[1].Cells[4,x].Font.Bold  := True;
      Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clGreen;
    end;



 planilha.columns.Autofit;

end;

end;

procedure Exporta_Cli2();
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;
    i, loc, qtNF, ff  : Integer;
    Neg : TNeg;
    Bco : TBco;
    vlrFloat : double;

begin
with Excel2 do
begin
 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Excel Cobrança - Cliente';
 planilha.visible := true;
 linha := -1;
 pb.Min := 0;
 pb.Max := JvDBGrid1.SelectedRows.Count;

 // Titulos
 planilha.cells[1,1] := 'NÚMERO DA FATURA';
 planilha.cells[1,2] := 'NOME TRANSPORTADOR';
 planilha.cells[1,3] := 'CNPJ';
 planilha.cells[1,4] := 'TIPO DE FRETE';
 planilha.cells[1,5] := 'CTE';
 planilha.cells[1,6] := 'DATA EMISSÃO CTE';

 planilha.cells[1,7] := 'DESTINATÁRIO';
 planilha.cells[1,8] := 'CPF/CNPJ';
 planilha.cells[1,9] := 'CIDADE DO DESTINATÁRIO';
 planilha.cells[1,10] := 'REGIÂO';
 planilha.cells[1,11] := 'CEP DESTINO';
 planilha.cells[1,12] := 'UF DESTINO';

 planilha.cells[1,13] := 'NÚMERO DO PEDIDO';
 planilha.cells[1,14] := 'NÚMERO NF';
 planilha.cells[1,15] := 'SÉRIE NF';
 planilha.cells[1,16] := 'DATA EMISSÃO NF';
 planilha.cells[1,17] := 'VALOR DA NF';
 planilha.cells[1,18] := 'PESO REAL';
 planilha.cells[1,19] := 'PESO CUBADO';
 planilha.cells[1,20] := 'PESO CONSIDERADO';

 planilha.cells[1,21] := 'FRETE PESO';
 planilha.cells[1,22] := 'PESO EXC';
 planilha.cells[1,23] := 'GRIS';
 planilha.cells[1,24] := 'ADV';
 planilha.cells[1,25] := 'PEDAGIO';
 planilha.cells[1,26] := 'TDE';
 planilha.cells[1,27] := 'TEMIS';
 planilha.cells[1,28] := 'OUTROS';
 planilha.cells[1,29] := 'VLR AGENDADA';
 planilha.cells[1,30] := 'ICMS';
 planilha.cells[1,31] := 'Alíquota de ICMS';
 planilha.cells[1,32] := 'FRETE TOTAL S/ICMS';
 planilha.cells[1,33] := 'FRETE TOTAL C/ICMS';
 planilha.cells[1,34] := 'QTDE DE ITENS';
 planilha.cells[1,35] := 'CHAVE DE ACESSO';
 planilha.cells[1,36] := 'CLI';
 planilha.cells[1,37] := 'OCORRENCIA';

 // Dados
 DM1.cdsRomaR.First;
 if JvDBGrid1.SelectedRows.Count>0 then
  begin
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
         linha := linha + 1;
         pb.Position := linha;
         // Linhas
         begin
          {
           for coluna := 1 to DM1.cdsRomaR.FieldCount do
           begin
             if (coluna = 3) then
             begin
              if not (DM1.cdsRomaR.Fields[2].isNull) then
              begin
                //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
                dt := DM1.cdsRomaR.Fields[2].AsDateTime;
                planilha.cells[linha + 2,coluna] :=  dt;
              end;
             end
             else
             begin
               valorcampo := DM1.cdsRomaR.Fields[coluna - 1].AsString;
               if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
               planilha.cells[linha + 2,coluna] :=  valorCampo;
             end;
           end; // fim do FOR
           }
           // Marca como Cobrado no Rel = 2
           Bco := TBco.Create;
           Bco.Marca_Cobrado(DM1.cdsRomaRIDNF.Value,2);
           Bco.Destroy;


           // **************************************
           // ** NAO UTILIZADOS - out/018
           // **************************************
           {
           // -- Romaneio
            valorcampo := DM1.cdsRomaRROMANEIO.AsString;
            planilha.cells[linha + 2,1] :=  valorCampo;

            // -- Motorista
            valorcampo := DM1.cdsRomaRNOME.Value;
            planilha.cells[linha + 2,2] :=  valorCampo;

             // -- HR Entrega
            valorcampo := ' ' + copy(DM1.cdsRomaRHORA.AsString, 1, 5);
            planilha.cells[linha + 2,5] :=  valorCampo;
           }
           // **************************************
           // ** DADOS INICIAIS 1 a 12
           // **************************************
              // -- Numero da Fatura FIXO
              planilha.cells[linha + 2,1] :=  0;

              // -- Nome do Transportador FIXO
              planilha.cells[linha + 2,2] :=  'FLAYDEL LOG';

              // -- CNPJ FIXO
              planilha.cells[linha + 2,3] :=  '191839920001-68';

            // -- TIPO DE FRETE FIXO -- Serviço 2
            valorcampo := DM1.cdsRomaRSERVICO2.Value;
            planilha.cells[linha + 2,4] :=  valorcampo;

             /// *************************************

           if DM1.cdsRomaRNCONH.Value>0 then
           begin
             // Marca como Cobrado no Rel = 2
             Bco := TBco.Create;
             Bco.Conhec_PesqNumC(DM1.cdsRomaRNCONH.Value,3);
             Bco.Destroy;

             // -- Cte
              valorcampo := DM4.cdsConhNUMC.AsString;
              planilha.cells[linha + 2,5] :=  valorcampo;

              // -- Data da Emissão do CTE
              dt := DM4.cdsConhDATAC.AsDateTime;
              planilha.cells[linha + 2,6] :=  dt;

              // CHAVE DE ACESSO
              valorcampo := DM4.cdsConhARQUIVO.Value;
              planilha.cells[linha + 2,35] :=  valorcampo;
           end;
           // **************************************
           // ** DADOS DESTINATARIO
           // **************************************
            // -- Destinat
            valorcampo := DM1.cdsRomaRNOMEDEST.AsString;
            planilha.cells[linha + 2,7] :=  valorCampo;

            // -- CPF
            valorcampo := DM1.cdsRomaRDOCDEST.AsString;
            planilha.cells[linha + 2,8] :=  valorCampo;

            // -- Cidade
            valorcampo := DM1.cdsRomaRLOCALI.Value;
            planilha.cells[linha + 2,9] :=  valorCampo;

            // -- REGIAO
            valorcampo := DM1.cdsRomaRLOCAL.Value;
            planilha.cells[linha + 2,10] :=  valorCampo;

            // -- CEP
            valorcampo := DM1.cdsRomaRCEP.Value;
            planilha.cells[linha + 2,11] :=  valorCampo;

            // -- UF 11
            valorcampo := 'SP';
            planilha.cells[linha + 2,12] :=  valorCampo;

           // **************************************
           // ** DADOS NF
           // **************************************
            // -- Pedido
            valorcampo := DM1.cdsRomaRNUMPED.AsString;
            planilha.cells[linha + 2,13] :=  valorCampo;

            // -- Nota Fiscal
            valorcampo := DM1.cdsRomaRNUMNF.AsString;
            planilha.cells[linha + 2,14] :=  valorCampo;

            // -- Serie
            valorcampo := DM1.cdsRomaRSERIENF.AsString;
            planilha.cells[linha + 2,15] :=  valorCampo;

            // -- DT EMISSÃO
            dt := DM1.cdsRomaRDTNOTA.AsDateTime;
            planilha.cells[linha + 2,16] :=  dt;

            // -- valor NF
            valorcampo := DM1.cdsRomaRVALOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,17] :=  valorCampo;

            if (length(DM1.cdsRomaRCUB_VOLUME.AsString)=0) or (DM1.cdsRomaRCUB_VOLUME.AsString='0') then
            begin
              // -- Peso NF
              valorcampo := DM1.cdsRomaRPESO.AsString;
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,18] :=  valorCampo;
              planilha.cells[linha + 2,20] :=  valorCampo;

              // -- Cubagem
              valorcampo := '0';
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,19] :=  valorCampo;
           end
            else
            begin
              // -- Peso NF
              valorcampo := '0';
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,18] :=  valorCampo;

              // -- Cubagem
              valorcampo := DM1.cdsRomaRPESO.AsString;
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,19] :=  valorCampo;
              planilha.cells[linha + 2,20] :=  valorCampo;

           end;
           // **************************************
           // ** DADOS NF
           // **************************************

           loc := DM1.cdsRomaRtipolocal.Value;
           qtNF:= 1;
           // acrescenta desmembramento
            Neg := TNeg.Create;
            Case DM1.cdsRomaRTIPO_COB.Value of
            1 : Neg.Calcula_Frete_Peso(DM1.cdsRomaRLIGCLI.Value, DM1.cdsRomaRPESO.AsFloat, loc, DM1.cdsRomaRCEP.Value);
            2 : Neg.Calcula_Frete_Taxa(DM1.cdsRomaRLIGCLI.Value,loc,DM1.cdsRomaRVALOR.AsFloat);
            3 : Neg.Calcula_Frete_Entrega(DM1.cdsRomaRLIGCLI.Value, loc);
            4 : Neg.Calcula_Frete_Saida(DM1.cdsRomaRLIGCLI.Value,1,loc,qtNF);
            6 : Neg.Calcula_Frete_Combinado(qtNF,Dm1.cdsRomaRVFRETE.AsFloat);
            end;

            Neg.Calcula_Frete_NF(DM1.cdsRomaRTIPO_COB.Value);
            Neg.Adicional_Simulador(DM1.cdsRomaRLIGCLI.Value, DM1.cdsRomaRTIPOLOCAL.Value,DM1.cdsRomaRPONTO.Value,DM1.cdsRomaRTIPO_COB.Value,DM1.cdsRomaRVALOR.AsFloat, DM1.cdsRomaRPESO.AsFloat);

            // ************************ Mostra Detalhes
            // -- Frete Peso
            valorcampo := FloatToStr(Neg.get_A_fretePeso);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,21] :=  valorCampo;

            // -- Frete Peso Adic
            valorcampo := FloatToStr(Neg.get_K_fretePesoAdic);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,22] :=  valorCampo;

            // -- Gris
            valorcampo := FloatToStr(Neg.get_03Gris);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,23] :=  valorCampo;

            // -- Seguro = AdValor???
            valorcampo := FloatToStr(Neg.get_01AdValor);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,24] :=  valorCampo;

            // -- Pedágio
            valorcampo := FloatToStr(Neg.get_02Pedagio);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,25] :=  valorCampo;

            // -- TDE - Grau de Dific
            valorcampo := FloatToStr(Neg.get_04GrauD);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,26] :=  valorCampo;

            // -- Emissao (Taxa CTRC)  =TEMIS - taxa de EMissao
            valorcampo := FloatToStr(Neg.get_07emissao);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,27] :=  valorCampo;

            // -- Outros  Flutua
            valorcampo := FloatToStr(Neg.get_F_outros);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,28] :=  valorCampo;

            // VLR AGENDADA
            planilha.cells[linha + 2,29] :=  0;

            // -- Impostos (ICMS)
            valorcampo := FloatToStr(Neg.get_05ICMS);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,30] :=  valorCampo;
            planilha.cells[linha + 2,31] :=  12; // %ICMS

            // -- Frete Total - ICMS
            valorcampo := DM1.cdsRomaRVFRETE.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,32] :=  valorCampo;

            // -- Frete Total
            vlrFloat :=  DM1.cdsRomaRVFRETE.AsFloat + Neg.get_05ICMS;
            valorcampo := vlrFloat.ToString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,33] :=  valorCampo;

            // QTDE DE ITENS - Volume
            valorcampo := DM1.cdsRomaRVOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,34] :=  valorCampo;



            // -- Cliente LIGCLI
            valorcampo := DM1.cdsRomaRLIGCLI.AsString;
            planilha.cells[linha + 2,36] :=  valorCampo;

            // -- oCORRENCIA
            valorcampo := DM1.cdsRomaRENTREGUE.Value;
            planilha.cells[linha + 2,37] :=  valorCampo;


             {

            // -- GrauD (TDE) Flutua
            valorcampo := FloatToStr(Neg.get_04GrauD);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,38] :=  valorCampo;

            // -- R$ Pontos
            valorcampo := FloatToStr(Neg.get_06Ponto);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+6] :=  valorCampo;


            // -- Ponto
            valorcampo := DM1.cdsRomaRPONTO.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,79] :=  valorCampo;

            // -- Entregue
            valorcampo := DM1.cdsRomaRLIGCLI.AsString;
            planilha.cells[linha + 2,50] :=  valorCampo;

            // -- Entregue
            valorcampo := DM1.cdsRomaRENTREGUE.value;
            planilha.cells[linha + 2,51] :=  valorCampo;

            // -- recebedor
            valorcampo := DM1.cdsRomaRRECEBEDOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,81] :=  valorCampo;

            // -- Minuta
            valorcampo := DM1.cdsRomaRMINUTA.AsString;
            planilha.cells[linha + 2,82] :=  valorCampo;

            // -- Tipo Cob
            valorcampo := DM1.cdsRomaRTIPO_COB.AsString;
            planilha.cells[linha + 2,83] :=  valorCampo;


            // -- Serviço
            valorcampo := DM1.cdsRomaRSERVICO.Value;
            planilha.cells[linha + 2,84] :=  valorCampo;

            // -- valor Volume
            valorcampo := DM1.cdsRomaRVOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,28] :=  valorCampo;


            // -- Doc
            valorcampo := DM1.cdsRomaRDOC.Value;
            planilha.cells[linha + 2,86] :=  valorCampo;

            // -- Ocor
            valorcampo := DM1.cdsRomaROCORRENCIA.Value;
            planilha.cells[linha + 2,87] :=  valorCampo;
             }

           DM1.cdsRomaR.Next;

         end;
         // Títulos
         {
         for coluna := 1 to DM1.cdsRomaR.FieldCount do
         begin
           valorcampo := DM1.cdsRomaR.Fields[coluna - 1].DisplayLabel;
           planilha.cells[1,coluna] := valorcampo;
         end;
         planilha.cells[1,coluna]   := 'Ad Valorem';
         planilha.cells[1,coluna+1] := 'Gris';
         planilha.cells[1,coluna+2] := 'Pedágio';
         planilha.cells[1,coluna+3] := 'Impostos';
         planilha.cells[1,coluna+4] := 'Tx CTRC';
         planilha.cells[1,coluna+5] := 'TDE';
         planilha.cells[1,coluna+6] := 'Pontos';
                   }
      end; // for
   end; // count > 0

             // Formata os cabeçalhos
    for ff:=1 to 37 do
    begin
      if ff<7 then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clGray;
      if (ff>6) and (ff<13) then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clNavy;
      if (ff>12) and (ff<36) then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clBlack;
      if ff>35then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clGreen;
    end;

 planilha.columns.Autofit;
end;

end;

procedure TExcel2.btExpCliClick(Sender: TObject);
begin
  Exporta_Cli2;
end;

procedure TExcel2.btSelClick(Sender: TObject);
begin
  JvDBGrid1.SelectAll;
end;

end.
