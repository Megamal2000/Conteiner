unit uNFdia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvMemoryDataset, JvDataSource,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, ComObj;

type
  TNFdia = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    cbCli: TComboBox;
    btPesq: TBitBtn;
    btExcel: TBitBtn;
    DataP: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    TabEntrada: TDateField;
    TabNumNF: TIntegerField;
    TabValor: TFloatField;
    TabStatus: TStringField;
    StatusBar1: TStatusBar;
    TabTenta: TIntegerField;
    TabDataE: TDateField;
    TabRecebedor: TStringField;
    TabMarca: TStringField;
    Bevel1: TBevel;
    vNota: TJvValidateEdit;
    Label1: TLabel;
    btProcNF: TBitBtn;
    lbNota: TLabel;
    btSalvar: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure btPesqClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure vNotaKeyPress(Sender: TObject; var Key: Char);
    procedure btProcNFClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure TabRecebedorChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  NFdia: TNFdia;
  modif : smallint;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM5;


function Le_Ocorre(num:Integer):String;
  var Bco : TBco;
      resp : String;
begin
  Bco := TBco.Create;
  Resp := Bco.Ocorre_fPesq(num);
  Bco.Destroy;

  result := Resp;
end;

procedure Exporta_Excel(sCliente:String; nPlanilha:Integer);
var linha, coluna, i, local,oc, nPlan : integer;
    ntot : double;
    notaAtual : integer;
    planilha : variant;

    nAnt, conta, contaE, repetido, TotCol : Integer;
    st : string;


var valorcampo : string;
var dtAtual, dt : TDateTime;
    Bco : TBco;

begin
 with NFdia do
 begin
   planilha:= CreateoleObject('Excel.Application');
   planilha.WorkBooks.add(1);
   planilha.caption := 'Notas por Dia';
   planilha.visible := true;
   for I := 1 to 6 do planilha.WorkBooks[1].Sheets.Add;

   nPlan := 0;
   TotCol := 13;


    if DM5.cdsNFac.RecordCount> 0 then
    begin
      DM5.cdsNFac.First;
      dtAtual := DM5.cdsNFacENTRADA.AsDateTime - 30;

      // Preenche
      nAnt := 0;  conta := 0; contaE := 0;
      while not DM5.cdsNFac.Eof do
      begin

        if nAnt<>DM5.cdsNFacNUMNF.Value  then
        begin
          repetido := 1;
          conta := conta + 1;
          nAnt := DM5.cdsNFacNUMNF.Value;

                  {
           ==============================================
             cabecalho
           ==============================================
           }
          if (dtAtual <> DM5.cdsNFacENTRADA.AsDateTime) then
          begin
            if nPlan > 0 then
            begin
              planilha.WorkBooks[1].Sheets[nPlan].columns.Autofit;
              planilha.WorkBooks[1].Sheets[nPlan].Columns[2].Font.Color := clGreen;
              planilha.WorkBooks[1].Sheets[nPlan].Columns[2].Interior.Color := clYellow;

             // Formata os cabeçalhos
              for i:=1 to TotCol do
              begin
                planilha.WorkBooks[1].Sheets[nPlan].Cells[1,i].Font.Bold  := True;
                planilha.WorkBooks[1].Sheets[nPlan].Cells[1,i].Font.Color := clNavy;
                planilha.WorkBooks[1].Sheets[nPlan].Cells[1,i].Interior.Color := clSilver;
              end;

              linha := linha + 2;
              planilha.WorkBooks[1].Sheets[nPlan].cells[linha+1,3] := 'Total de Notas: '+conta.ToString;
              planilha.WorkBooks[1].Sheets[nPlan].cells[linha+2,3] := 'Notas Entregues: '+contaE.ToString;
              conta := 1; contaE := 0;
            end;

            dtAtual := DM5.cdsNFacENTRADA.AsDateTime;
            nPLan := nPlan+1;


          // -------------- PLANILHA DE NOTAS
          // Nome do relatório
            planilha.WorkBooks[1].Sheets[nPlan].Name := 'Dia_'+FormatDateTime('dd',dtAtual)+'_Plan'+nPlan.ToString;  (*
                                                    *)
            coluna := 1;
            linha := 1;

            //planilha.WorkBooks[1].Sheets[nPlan].Name := sCliente;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna] := 'Entrada';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+1] := 'Nota F';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+2] := 'Valor';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+3] := 'Status';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+4] := 'CEP';

            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+5] := 'Localidade';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+6] := 'Núm. Ocorrência';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+7] := 'Ocorrência';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8] := 'Destinatário';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+9] := 'Documento Dest.';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+10] := 'Recebedor';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+11] := 'Data Entrega';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+12] := 'Hora Entrega';

          end;
                  {
           ==============================================
             DADOS
           ==============================================
           }
           linha := linha + 1;

            // -- Data Entrada
            dt := DM5.cdsNFacENTRADA.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna] :=  dt;

            // -- Código (NUM NF
            valorcampo := DM5.cdsNFacNUMNF.AsString;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+1] :=  valorCampo;

           // -- Valor da NF
            valorcampo := DM5.cdsNFacVALOR.AsString.Replace(',','.');
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+2] :=  valorCampo;


           // -- Status
            st := '-';
            if DM5.cdsNFacNOCORR.Value =  1 then
            begin
              contaE := contaE + 1;
              st := 'Entregue';
            end
            else
            begin
              if DM5.cdsNFacNRoma.Value =  0 then
                st := 'Na Transportadora'
              else
                st := 'Em Rota';
            end;
            valorcampo := st;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+3] :=  valorCampo;

            // -- CEP
            valorcampo := DM5.cdsNFacCEP.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+4] :=  valorCampo;

            // -- Localidade
            valorcampo := DM5.cdsNFacLOCALI.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+5] :=  valorCampo;

            // -- Num Ocorrência
            valorcampo := DM5.cdsNFacNOCORR.AsString;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+6] :=  valorCampo;

            // -- Ocorrência
            valorcampo := DM5.cdsNFacOBS.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+7] :=  valorCampo;

            // -- Destinatário
            valorcampo := DM5.cdsNFacNOMEDEST.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8] :=  valorCampo;

            // -- Documento
            valorcampo := DM5.cdsNFacDOCDEST.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+9] :=  valorCampo;

            // -- Recebedor
            valorcampo := DM5.cdsNFacRECEBEDOR.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+10] :=  valorCampo;

            // -- Data da Entrega
            if DM5.cdsNFacDTENT.Value<> null then
            begin
              dt := DM5.cdsNFacDTENT.Value;
              planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+11] :=  dt;
            end;

            // -- Hora
            valorcampo := DM5.cdsNFacHRENT.AsString;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+12] :=  valorCampo;
        end
        else
        begin
          repetido := repetido + 1;
          // -- Código (NUM NF
          valorcampo := DM5.cdsNFacNUMNF.AsString;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+14] :=  valorCampo;

          dt := DM5.cdsNFacDTENT.Value;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+9+repetido*3] :=  dt;
          // -- Num Ocorrência
          valorcampo := DM5.cdsNFacNOCORR.AsString;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+10+repetido*3] :=  valorCampo;
          // -- Descricao Ocorrência
          valorcampo := Le_Ocorre(DM5.cdsNFacNOCORR.Value);
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+11+repetido*3] :=  valorCampo;
        end;


        DM5.cdsNFac.Next;
      end;
      planilha.WorkBooks[1].Sheets[nPlan].columns.Autofit;

      linha := linha + 2;
      planilha.WorkBooks[1].Sheets[nPlan].cells[linha+1,2] := 'Total de Notas: '+conta.ToString;
      planilha.WorkBooks[1].Sheets[nPlan].cells[linha+2,2] := 'Notas Entregues: '+contaE.ToString;

      planilha.WorkBooks[1].Sheets[nPlan].Columns[2].Font.Color := clGreen;
      planilha.WorkBooks[1].Sheets[nPlan].Columns[2].Interior.Color := clYellow;

     // Formata os cabeçalhos
     for i:=1 to TotCol do
     begin
       planilha.WorkBooks[1].Sheets[nPlan].Cells[1,i].Font.Bold  := True;
       planilha.WorkBooks[1].Sheets[nPlan].Cells[1,i].Font.Color := clNavy;
       planilha.WorkBooks[1].Sheets[nPlan].Cells[1,i].Interior.Color := clYellow;
     end;
          {
           planilha.WorkBooks[1].Sheets[nPlan].Columns[6].Font.Color := clred;
           planilha.WorkBooks[1].Sheets[nPlan].Columns[7].Font.Color := clGreen;
           planilha.WorkBooks[1].Sheets[nPlan].Columns[7].Interior.Color := clYellow;
           planilha.WorkBooks[1].Sheets[nPlan].Columns[10].Interior.Color := clYellow;
           planilha.WorkBooks[1].Sheets[nPlan].Columns[3].Font.Bold  := True;


           planilha.WorkBooks[1].Sheets[nPlan].Cells[5,6].Font.Color := clBlack;


           // Format o Titulo
           planilha.WorkBooks[1].Sheets[nPlan].Cells[1,2].Font.Bold  := True;
           planilha.WorkBooks[1].Sheets[nPlan].Cells[1,2].Font.Color := clNavy;
           planilha.WorkBooks[1].Sheets[nPlan].Cells[1,2].Font.Size := 12;
           planilha.WorkBooks[1].Sheets[nPlan].Cells[2,2].Font.Color := clgreen;

           // Formata os cabeçalhos
           for i:=1 to 6 do
           begin
             planilha.WorkBooks[1].Sheets[nPlan].Cells[i,7].Interior.Color := clwhite;
             planilha.WorkBooks[1].Sheets[nPlan].Cells[i,10].Interior.Color := clWhite;
           end;

           for i:=1 to 15 do
           begin
             planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Font.Bold  := True;
             planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Font.Color := clNavy;
             planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Interior.Color := clYellow;
           end;

            for i:=7 to 10 do
           begin
             planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Interior.Color := clLime;
           end;

           // formata Geral

           }
    end
    else ShowMessage('Nenhum registro encontrado!');
  end;
 end;


procedure Procura_Nota();
begin
  with NFdia do
  begin
    if (length(vNota.Text)>0) then
    begin


      if (vNota.Value > DM5.cdsNFacNUMNF.Value ) then Tab.First;
      if Tab.Locate('NumNF', vNota.Value, []) then lbNota.Caption := vNota.Text + ' ok'
        else lbNota.Caption := vNota.Text+ ' x';
      vNota.Text := '';
    end;

  end;
end;

procedure Procura_dias(d : TDateTime);
  var Bco : TBco;
      idC : Integer;
      d1, d2 : TDateTime;
begin
  with NFdia do
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');
  Bco := TBco.Create;
  Bco.Notas_Unica_DiasProcura(d, idC);
  Bco.Ocorre_Mostra;
  if DM5.cdsBIPt.RecordCount>0 then
  begin
    DM5.cdsBIPt.First;
    d2 := DM5.cdsBIPtDTCRIADA.AsDateTime;
    DM5.cdsBIPt.Last;
    d1 := DM5.cdsBIPtDTCRIADA.AsDateTime;
    Bco.Notas_Unica_Acompanha(d1,d2, idC);
  end;
  Bco.Destroy;
end;



procedure TNFdia.btExcelClick(Sender: TObject);

begin
  Exporta_Excel('', 1);
end;

procedure TNFdia.btPesqClick(Sender: TObject);
  var nAnt, conta, contaE, repetido : Integer;
      st : string;
begin
  with NFdia do
  begin
    modif := 1;
    Procura_dias(DataP.DateTime);
    if DM5.cdsNFac.RecordCount> 0 then
    begin
      // Llimpa
      Tab.Active := false;
      Tab.EmptyTable;
      Tab.Active := true;

      // Preenche

      nAnt := 0;  conta := 0; contaE := 0;
      DM5.cdsNFac.First;
      while not DM5.cdsNFac.Eof do
      begin

        if nAnt<>DM5.cdsNFacNUMNF.Value  then
        begin
          repetido := 1;
          st := '-';
          conta := conta + 1;
          if DM5.cdsNFacNOCORR.Value =  1 then
          begin
            contaE := contaE + 1;
            st := 'Entregue';
          end
          else
          begin
            if DM5.cdsNFacNRoma.Value =  0 then
              st := 'Na Transportadora'
            else
              st := 'Em Rota';
          end;
          nAnt := DM5.cdsNFacNUMNF.Value;
          Tab.Append;
          TabEntrada.Value := DM5.cdsNFacENTRADA.Value;
          TabNumNF.Value   := DM5.cdsNFacNUMNF.Value;
          TabValor.Value   := DM5.cdsNFacVALOR.AsFloat;
          TabStatus.Value  := st;
          TabTenta.Value   := repetido;
          TabDataE.Value   :=  DM5.cdsNFacDTENT.Value;
          TabRecebedor.Value := DM5.cdsNFacRECEBEDOR.Value;
          Tab.Post;
          //Tab.Last;
        end
        else
        begin
          Tab.Last;
          repetido := repetido + 1;
          Tab.Edit;
          TabTenta.Value := repetido;
          if DM5.cdsNFacNOCORR.Value =  1 then
          begin
            TabStatus.Value  := 'Entregue';
            TabDataE.Value   :=  DM5.cdsNFacDTENT.Value;
          end;
          Tab.Post;
        end;

        DM5.cdsNFac.Next;
      end;
      Tab.SortOnFields('NumNF', false, false);
      Tab.First;
      StatusBar1.Panels[0].Text := 'Total de Notas: '+conta.ToString;
      StatusBar1.Panels[1].Text := 'Total de Notas Entregues: '+contaE.ToString;
    end
    else ShowMessage('Nenhum registro encontrado!');
  modif := 0;
  end;
end;

procedure TNFdia.btProcNFClick(Sender: TObject);
begin
  Procura_Nota;
end;

procedure Salvar_Recebedor();

begin
  if DM5.cdsNFacNOCORR.Value = 1 then
  begin
    DM5.cdsNFac.Edit;
    DM5.cdsNFacRECEBEDOR.Value := NFdia.TabRecebedor.Value;
    DM5.cdsNFac.Post;

    DM2.Altera_Texto('TB_NOTAF','Recebedor', DM5.cdsNFacIDNF.Value, NFdia.TabRecebedor.Value);

    NFdia.Tab.Edit;
    NFdia.TabMarca.Value := '';
    NFdia.Tab.Post;
  end;

end;

procedure TNFdia.btSalvarClick(Sender: TObject);
begin
  Tab.Filtered := false;
  Tab.Filter   := 'Marca = '+QuotedStr('*');
  Tab.Filtered := true;

  Tab.First;
  while not Tab.Eof do
  begin
    if DM5.cdsNFac.Locate('NumNF', TabNumNf.Value, []) then
      Salvar_Recebedor
    else Tab.Next;
  end;
  Tab.Filtered := false;
  Tab.First;
end;

procedure TNFdia.Entrar;
begin
  DataP.Date := Now;
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  cbCli.ItemIndex := 0;
  modif := 0;
end;



procedure TNFdia.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TabStatus.Value  = 'Entregue') then
  if not (gdSelected in State) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    //DBGrid1.Canvas.Font.Style := DBGrid1.Canvas.Font.Style + [fsitalic];
    JvDBGrid1.Canvas.Font.Color := clRed;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TNFdia.TabRecebedorChange(Sender: TField);
begin
  if modif = 0 then
  begin
    if (TabMarca.Value <> '*') and (TabMarca.Value <> 'x') then
    if (TabStatus.Value = 'Entregue') then
    begin
      Tab.Edit;
      TabMarca.Value := '*';
      Tab.Post;
    end
    else
    begin
      Tab.Edit;
      TabMarca.Value := 'x';
      Tab.Post;
    end;
  end;
end;

procedure TNFdia.vNotaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then Procura_Nota;

end;


end.


