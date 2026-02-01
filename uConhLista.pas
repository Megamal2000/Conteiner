unit uConhLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB,
  JvExDBGrids, JvDBGrid, Menus;

type
  TConhLista = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btproc: TSpeedButton;
    Label3: TLabel;
    lbNT: TLabel;
    cbCli: TComboBox;
    dta: TDateTimePicker;
    btGerar: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    PopupMenu1: TPopupMenu;
    RecolocaNmerodoCTe1: TMenuItem;
    pb: TProgressBar;
    N1: TMenuItem;
    MostrarNotaFiscal1: TMenuItem;
    MostrarCTe1: TMenuItem;
    Panel2: TPanel;
    Label4: TLabel;
    JvDBGrid2: TJvDBGrid;
    DataSource2: TDataSource;
    dtb: TDateTimePicker;
    N2: TMenuItem;
    Agruparnotasselecionadas1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure btprocClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure RecolocaNmerodoCTe1Click(Sender: TObject);
    procedure MostrarNotaFiscal1Click(Sender: TObject);
    procedure MostrarCTe1Click(Sender: TObject);
    procedure dtaChange(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure Agruparnotasselecionadas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodMunicipio : Integer;

  end;

var
  ConhLista: TConhLista;
  idClie : integer;
  CodMunicipio : Integer;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM4, uBanco, uNegocio, uLib, uIBGE, uNotas, uCtePQ;


procedure Atualiza(idC:Integer);
var bco : TBco;

begin
  if (idC>0) then
  begin
    bco := TBco.Create;
    bco.Conhec_MostraData(idC, ConhLista.dta.DateTime, ConhLista.dtb.DateTime, true );
    Bco.Conhec_MostraDataNaoGeradosGrupo( ConhLista.dta.DateTime, ConhLista.dtb.DateTime);
    bco.Destroy;

    ConhLista.lbNT.Caption := IntToStr(DM4.cdsCT.RecordCount);
  end;
end;

procedure TConhLista.FormActivate(Sender: TObject);
begin
  if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    cbCli.Items.Append('<Nenhum>');
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 and cteemite=1 ');

    cbCli.ItemIndex := 0;
    if cbCli.Items.Count>1 then cbCli.ItemIndex := 1;


    dtb.DateTime := Now;
    dta.DateTime := Now - 7;

  end;
end;


function CodMuni(idCli, numNF: Integer):boolean;


var resp, ok : boolean;
    usa : TMarco;
    Bco : TBco;
    ret : String;

begin
  CodMunicipio := 0;
  resp := false;
  usa := TMarco.Create;
  usa.Le_INI;
  ok := usa.TestaCon(DM4.ConectaCONH, usa.get_EspelhoServ);
  usa.Destroy;

  if (ok) then
  begin
    Bco := TBco.Create;
    Bco.Espelho_Mostra(idCli, numNF);
    Bco.Destroy;

    ret := IBGE.Procura3(DM4.cdsEspelhoCIDADE.Value, DM4.cdsEspelhoESTADO.Value);
    if (ret <> 'erro') then
    begin
      CodMunicipio := StrToInt(ret);
      Bco := TBco.Create;
      Bco.Espelho_InsereCodMun(DM4.cdsEspelhoID.Value, CodMunicipio);
      Bco.Destroy;
      resp := true;
    end;
  end;

  CodMuni := resp;
end;



procedure TConhLista.Agruparnotasselecionadas1Click(Sender: TObject);
  var Bco : TBco;
      i, idG : Integer;
begin
     Bco := TBco.Create;
     idG := 0;
  // Agrupar
    if JvDBGrid1.SelectedRows.Count>0 then
      with JvDBGrid1.DataSource.DataSet do
        for i:= 0 to JvDBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
          if idG =0 then idG := DM4.cdsCTIDNOTA.Value;
          Bco.Notas_MarcaGrupo(DM4.cdsCTIDNOTA.Value, idG);
          DM4.cdsCT.Edit;
          DM4.cdsCTCTEGRUPO.Value := idG;
          DM4.cdsCT.Post;
        end;
    Bco.Destroy;
end;

procedure TConhLista.btGerarClick(Sender: TObject);

var bco : TBco;
    neg : TNeg;
    i, ligT, contaNAO, Grupo   : Integer;
    MotN, MotP, MotV : String;
    okCompl, temOutraTransp : boolean;
    vPeso, vValor, valorComb : Double;
    Hoje : TDateTime;


begin
  idClie := 0;
  if (cbCli.ItemIndex > 0) then
    idClie := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');
  vPeso := 0;
  vValor:= 0;


  /// gera as selecionadas
  /// -----------------------------------------
  if 1=1 then
  begin
    bco := TBco.Create;
    neg := TNeg.Create;

    contaNAO := 0;
    if JvDBGrid1.SelectedRows.Count>0 then
      with JvDBGrid1.DataSource.DataSet do
        begin
          i := 0;
          pb.Min := 0;
          pb.Max := JvDBGrid1.SelectedRows.Count+1;
          pb.Position := 0;
          pb.Visible := true;
          while i <= JvDBGrid1.SelectedRows.Count-1 do
          begin
            GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
            vPeso := 0;
            vValor:= 0;
            idClie := DM4.cdsCTLIGCLI.Value;

            // procura Nota
            bco.Notas_MostraId(DM4.cdsCTIDNOTA.Value);
            vValor := DM1.cdsNotasVALOR.AsFloat;
            vPeso  := DM1.cdsNotasPESO.AsFloat;
            // Verifica Grupo e Totais
            grupo := 0;
            if DM4.cdsCTCTEGRUPO.Value<>Null then
              if DM4.cdsCTCTEGRUPO.Value>0 then
              begin
                grupo := DM4.cdsCTCTEGRUPO.Value;
                Bco.Conhec_GrupoSoma(grupo, dta.DateTime);
                vPeso := DM2.cdsTMP.Fields[0].AsExtended;
                vValor:= DM2.cdsTMP.Fields[1].AsExtended;
              end;

            // Calcula o Frete
            if (DM1.cdsNotasVLRCOMBINADO.Value = 0) then
            begin
              // FRETE PESO
              neg.Calcula_Frete_Peso(idClie, vPeso, DM1.cdsNotasTIPOLOCAL.Value, DM1.cdsNotasCEP.Value);
              neg.Calcula_Frete_NF(1);
              neg.Adicional_AlteraValor(DM4.cdsCTIDNOTA.Value, idClie, DM1.cdsNotasTIPOLOCAL.Value,DM1.cdsNotasPONTO.Value ,1, vValor,vPeso);
            end
            else
            begin
              // FRETE COMBINADO
              // criar valor comb por nota
              //Corrigir AQUI
              if (DM1.cdsNotasTIPO_COB.Value = 7) then
              begin
                ValorComb := DM1.cdsNotasVLRCOMBINADO.AsFloat;
                neg.Calcula_Frete_Combinado(2, ValorComb);
                neg.Calcula_Frete_NF(7);
              end;

              if (DM1.cdsNotasTIPO_COB.Value = 8) then
              begin
                ValorComb := DM1.cdsNotasVLRCOMBINADO.AsFloat;
                neg.Calcula_Frete_Fixo(ValorComb, DM1.cdsNotasVALOR.AsFloat, DM1.cdsNotasPESO.AsFloat);
                neg.Calcula_Frete_NF(8);
              end;

            end;

            CodMuni(idClie, DM1.cdsNotasNUMNF.Value);        // Grava dados
            Bco.Conhec_Motor(DM4.cdsCTIDNOTA.Value);
            MotN := 'Fabio';
            MotP := 'EFV-6657';
            MotV := 'VAN';
            if (DM2.cdsTMP.Fields[2].Value <> null) then MotN := copy(DM2.cdsTMP.Fields[2].Value,1,20);
            if (DM2.cdsTMP.Fields[3].Value <> null) then MotP := DM2.cdsTMP.Fields[3].Value;
            if (DM2.cdsTMP.Fields[4].Value <> null) then MotV := copy(DM2.cdsTMP.Fields[4].Value,1,20);

            // verifica se possui informações
            Bco.Espelho_Mostra(DM1.cdsNotasLIGCLI.Value, DM1.cdsNotasNUMNF.Value);
            okCompl := true;
            if (DM4.cdsEspelho.RecordCount = 0)      then okCompl := false;
            if (DM4.cdsEspelhoCHAVENFE.Value = null) then okCompl := false;

            // grava o valor do Frete na Nota
            Bco.Notas_AlterarFrete(DM4.cdsCTIDNOTA.Value, neg.get_freteTot);

            Hoje := Now;
            if (okCompl = true ) then
            begin
              if Not (bco.Conhec_ExisteNF(DM4.cdsCTIDNOTA.Value)) then
              begin
                ligT := DM1.cdsNotasLIGTRANSP.Value;
                if (DM1.cdsNotasligTransp.Value<>null) then
                  if (DM1.cdsNotasligTransp.Value>0) then ligT := DM1.cdsNotasligTransp.Value;


                if grupo = 0 then
                begin
                  bco.Conhec_InsereCalc(ligT, DM1.cdsNotasNUMNF.Value, idClie, 1,  neg.get_A_fretePeso, neg.get_01AdValor, neg.get_C_secCAT,neg.get_D_despacho, neg.get_02Pedagio,
                    neg.get_F_outros, neg.get_G_total,neg.get_H_base, neg.get_I_aliq, neg.get_J_ICMS ,neg.get_K_fretePesoAdic, neg.get_03Gris, neg.get_07emissao, neg.get_04GrauD, neg.get_06Ponto, neg.get_08devolucao,  DM4.cdsCTIDNOTA.Value,Grupo, Hoje, MotN, MotP, MotV);
                  Bco.Conhec_Numera(DM4.cdsCTIDNOTA.Value);
                end
                else
                begin
                  if not Bco.Conhec_NotaCalculada(DM4.cdsCTIDNOTA.Value) then
                    bco.Conhec_InsereCalc(ligT, DM1.cdsNotasNUMNF.Value, idClie, 1,  neg.get_A_fretePeso, neg.get_01AdValor, neg.get_C_secCAT,neg.get_D_despacho, neg.get_02Pedagio,
                      neg.get_F_outros, neg.get_G_total,neg.get_H_base, neg.get_I_aliq, neg.get_J_ICMS ,neg.get_K_fretePesoAdic, neg.get_03Gris, neg.get_07emissao, neg.get_04GrauD, neg.get_06Ponto, neg.get_08devolucao,  DM4.cdsCTIDNOTA.Value,Grupo, Hoje, MotN, MotP, MotV);
                  Bco.Conhec_NumeraGrupo(DM4.cdsCTIDNOTA.Value, grupo);
                end;
              end
              else
              begin
                bco.Conhec_AlteraCalc(DM2.cdsTMP.Fields[0].AsInteger, DM1.cdsNotasNUMNF.Value, -1,DM1.cdsNotasID.Value, neg.get_A_fretePeso, neg.get_01AdValor, neg.get_C_secCAT,neg.get_D_despacho, neg.get_02Pedagio,
                  neg.get_F_outros,neg.get_G_total,neg.get_H_base, neg.get_I_aliq, neg.get_J_ICMS ,neg.get_K_fretePesoAdic, neg.get_03Gris, neg.get_07emissao, neg.get_04GrauD, neg.get_06Ponto, neg.get_08devolucao, Hoje, MotN, MotP, MotV);
              end;
            end
            else contaNAO := contaNAO + 1;
            i := i + 1;
            pb.Position := i;
          end;
        end;
     pb.Visible := false;
     ShowMessage('Notas Calculadas: '+IntToStr(JvDBGrid1.SelectedRows.Count));
     Atualiza(idClie);
     if (contaNAO > 0) then ShowMessage('Notas sem Chave '+IntToStr(contaNAO));
     neg.Destroy;
     bco.Destroy;
  end
    else ShowMessage('ERRO: tem outra transportadores entre os selecionados!');
end;

procedure TConhLista.btprocClick(Sender: TObject);
var bco : TBco;

begin
  idClie := 0;
  if (cbCli.ItemIndex > 0) then
    idClie := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');
  Atualiza(idClie);
end;

procedure TConhLista.dtaChange(Sender: TObject);
begin
  dtb.DateTime := dta.DateTime + 8;
end;

procedure TConhLista.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if (DM4.cdsCTCTEGRUPO.Value>0) then
  begin
    if (DM4.cdsCTNCONH.Value = 0) then JvDBGrid1.Canvas.Font.Color := clGreen
      else JvDBGrid1.Canvas.Font.Color := clLime;
  end
  else
  begin
    if (DM4.cdsCTNCONH.Value = 0) then JvDBGrid1.Canvas.Font.Color := clRed
      else JvDBGrid1.Canvas.Font.Color := clGray;
  end;


  JvDBGrid1.Canvas.FillRect(rect);
  JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);

end;

procedure TConhLista.JvDBGrid1TitleClick(Column: TColumn);
begin
       // Marca a Coluna e Ordena
  DM4.cdsCT.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TConhLista.JvDBGrid2CellClick(Column: TColumn);
  var BCo : TBco;
begin
  if (DM4.cdsCTngLIGCLI.Value > 0) then
  begin
    Bco := TBco.Create;
    Bco.Conhec_MostraData(DM4.cdsCTngLIGCLI.Value, dta.DateTime, dtb.DateTime, false);
    Bco.Destroy;
    lbNT.Caption := DM4.cdsCTngQT.AsString + ' não geradas ';
  end;
end;

procedure TConhLista.MostrarCTe1Click(Sender: TObject);
begin
  if Dm4.cdsCTNCONH.Value > 0 then
  begin
    CtePQ.Entrar;
    CtePQ.PesqCTe(DM4.cdsCTNCONH.AsString);
    CtePQ.Show;
  end;
end;

procedure TConhLista.MostrarNotaFiscal1Click(Sender: TObject);
begin
   NotasP.Entrar;
   NotasP.Show;
   NotasP.PesqExterna(DM4.cdsCTNUMNF.AsString);
end;

procedure TConhLista.RecolocaNmerodoCTe1Click(Sender: TObject);
  var i : Integer;
  Bco : TBco;

begin
  Bco := TBco.Create;

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i := 0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Bco.Conhec_Numera(DM4.cdsCTIDNOTA.Value);
      end;
  Bco.Destroy;
end;

end.
