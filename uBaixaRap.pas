unit uBaixaRap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, JvMemoryDataset, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, StdCtrls, Buttons, ComCtrls, Mask, JvExMask,
  JvSpin, uRastreio;

type
  TBaixaRap = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    Panel3: TPanel;
    dsTab: TJvDataSource;
    Tab: TJvMemoryData;
    TabSel: TBooleanField;
    TabidNF: TIntegerField;
    TabnumNF: TIntegerField;
    Label1: TLabel;
    edRoma: TEdit;
    btMostrar: TBitBtn;
    TabValor: TFloatField;
    TabnOcorr: TIntegerField;
    TabdatEnt: TDateField;
    TabhoraEnt: TTimeField;
    TabCliente: TStringField;
    TabRecedor: TStringField;
    TabFlag: TSmallintField;
    lbMot: TLabel;
    Label2: TLabel;
    dtBaixa: TDateTimePicker;
    Label3: TLabel;
    hri: TJvSpinEdit;
    hrf: TJvSpinEdit;
    btCompletar: TBitBtn;
    btRecebe: TBitBtn;
    btGravar: TBitBtn;
    lbMens: TLabel;
    TabOrigem: TIntegerField;
    TabObs: TStringField;
    btReent: TBitBtn;
    Tabligcli: TIntegerField;
    btRetirar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    btMarca: TSpeedButton;
    btDesmarca: TSpeedButton;
    Bevel1: TBevel;
    TabcriaDT: TDateTimeField;
    procedure btMostrarClick(Sender: TObject);
    procedure edRomaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btCompletarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btRecebeClick(Sender: TObject);
    procedure btReentClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btRetirarClick(Sender: TObject);
    procedure btMarcaClick(Sender: TObject);
    procedure btDesmarcaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure set_Roma(nR: String);
  end;

var
  BaixaRap: TBaixaRap;

implementation

{$R *.dfm}

uses uBanco, uDM2, uRoma, DateUtils, uOcorrePQ, uDM1, Global, uNotas, uPrinc;

procedure Ordena;

begin
  with BaixaRap do
  begin
    if (Tab.Active)  then
    if (Tab.RecordCount>0) then
    begin
      Tab.SortOnFields('nOcorr; numNF', false, true);
    end;
  end;
end;

procedure Mostrar_Roma(nR:String);

var Bco : TBco;
    Rm : Troma;
    numRoma : Integer;
    dtC : TDatetime;

begin
  Rm := Troma.Create;
  numRoma := Rm.Pesquisa_Romaneio(nR);
  BaixaRap.lbMot.Caption := nR + ' - ' + Rm.Pesquisa_Romaneio_Motorista(nR);
  Rm.Destroy;

  Bco := TBco.Create;
  Bco.Romaneio_NotasBaixa(numRoma);
  Bco.Destroy;

  if (DM2.cdsTMP.RecordCount > 0) then
  with BaixaRap do
  begin
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;

    DM2.cdsTMP.First;
    while not DM2.cdsTMP.Eof do
    begin
      Tab.Insert;

      TabSel.Value     := false;
      TabidNF.Value    := DM2.cdsTMP.Fields[0].AsInteger;
      TabnumNF.Value   := DM2.cdsTMP.Fields[1].AsInteger;
      TabValor.Value   := DM2.cdsTMP.Fields[2].AsFloat;
      TabnOcorr.Value  := DM2.cdsTMP.Fields[4].AsInteger;
      if (DM2.cdsTMP.Fields[5].Value <> null) then
        TabdatEnt.Value  := DM2.cdsTMP.Fields[5].AsDateTime;
      if (DM2.cdsTMP.Fields[6].Value <> null) then
        TabhoraEnt.Value := DM2.cdsTMP.Fields[6].AsDateTime;
      TabCliente.Value := DM2.cdsTMP.Fields[8].AsString;
      TabRecedor.Value := DM2.cdsTMP.Fields[7].AsString;
      TabOrigem.Value  := DM2.cdsTMP.Fields[9].AsInteger;
      TabObs.Value     := DM2.cdsTMP.Fields[10].AsString;
      Tabligcli.Value  := DM2.cdsTMP.Fields[11].AsInteger;
      TabcriaDT.Value  := DM2.cdsTMP.Fields[12].AsDateTime;

      TabFlag.Value    := 0;  // não pode alterar
      if (DM2.cdsTMP.Fields[4].AsInteger=0) then
      begin
        TabFlag.Value    := 1;
        TabSel.Value := true;
      end;
      Tab.Post;
      DM2.cdsTMP.Next;
    end;

  end;
end;


procedure TBaixaRap.btMostrarClick(Sender: TObject);
begin
  if (Length(edRoma.Text)>0) then
  begin
    Mostrar_Roma(edRoma.Text);
    ordena;
  end;
end;

procedure TBaixaRap.Entrar;
begin
  lbMot.Caption := '';
  edRoma.Text := '';
  dtBaixa.DateTime := Now;
  hri.MinValue := 6;
  hri.MaxValue := 22;
  hri.Value    := 8;
  hrf.MinValue := 6;
  hrf.MaxValue := 22;
  hrf.Value    := 18;

end;

procedure TBaixaRap.edRomaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if (edRoma.Text <> '') then
    begin
      Mostrar_Roma(edRoma.Text);
      Ordena;
    end;
  if not(Key in ['0'..'9',Chr(8),'/']) then Key := #0;
end;

procedure TBaixaRap.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  JvDBGrid1.Canvas.Brush.Color := clWhite;
  JvDBGrid1.Canvas.Font.Color  := clBlack;

  if not (gdSelected in State) and (Column.FieldName<>'Sel') then
  begin
     if (TabFlag.Value = 0) then JvDBGrid1.Canvas.Font.Color := clRed;
     if (TabnOcorr.Value > 1) then
     begin
       JvDBGrid1.Canvas.Brush.Color := clYellow;
       JvDBGrid1.Canvas.Font.Color := clNavy;
     end;
     if (TabnOcorr.Value = 0) then JvDBGrid1.Canvas.Font.Color := clGreen;

     JvDBGrid1.DefaultDrawColumnCell(Rect,DatacOl, Column, State);
  end;

end;

function Conta_Notas(tipo:Smallint):Smallint ;

var resp : Smallint;
begin
  resp := 0;


  with BaixaRap do
  if (Tab.RecordCount > 0) then
  begin
    if (tipo = 1) then resp := Tab.RecordCount;  // Todas
    Tab.First;
    while not Tab.Eof do
    begin
      if (tipo=2) then  // somente os selecionados possiveis
        if (TabSel.Value = true) and (TabFlag.Value =1) then resp := resp + 1;
      if (tipo=3) then  // somente as NÃO Entregues
        if (TabnOcorr.Value > 1) then resp := resp + 1;

      Tab.Next;
    end;
  end;


  Conta_Notas := resp;
end;


procedure TBaixaRap.btCompletarClick(Sender: TObject);

var NotasOK : Smallint;
    hora : TTime;
    i, j : Integer;
    dtCriaNF, dtMarca : TDatetime;
    a,mes,d,h,mi:word;

begin
  dtMarca := dtBaixa.DateTime;
  DecodeDate(dtMarca, a, mes, d);

  // Conta Notas para alterar
  NotasOK := Conta_Notas(2);
  LbMens.Caption := 'Alterando ' + IntToStr(NotasOK) + ' notas. Aguarde ... ';
  i := hri.AsInteger;
  j := MinuteOf(Now) mod 10;
  J := j * 10;
  Tab.First;
  while not Tab.Eof do
  begin
    if (TabSel.Value) and (Tabflag.Value = 1) then
    begin
      j := j + 20;
      if (j>50) then
      begin
        i := i + 1;
        j := j - 60;
      end;
      if (i > hrf.AsInteger-1) then
      begin
        i := hri.AsInteger + 2;
        j := j + 10;
      end;

      hora := EncodeTime(i, j, 0, 0);


      dtCriaNF := TabcriaDT.AsDateTime;
      dtMarca  := EncodeDateTime(a, mes, d, i, j,0,0);


      Tab.Edit;
      TabnOcorr.Value := 1;
      TabdatEnt.Value := dtBaixa.Date;
      TabhoraEnt.Value:= hora;
      TabRecedor.Value := '';
      if dtCriaNF>dtMarca then TabRecedor.Value := 'ERRO: data cria maior que data baixa';
      
      Tab.Post;
    end;
    Tab.Next;
  end;

  LbMens.Caption := '' + IntToStr(NotasOK) + ' notas ALTERADAS. Clique em GRAVAR BAIXAS ';

end;

procedure SalvarNR(idNota, nNota, ligcli,  idUs, Origem, iOcor : Integer; sObs, sReceb:String; dt,hr:TDateTime);

var Bco : TBco;
    sSIMNAO, sdt, shora : String;
    iEnt, Baixa_Tipo : Integer;
    Rast : TRastreio;

begin
  Bco := TBco.Create;
  with BaixaRap do
  begin
    // Ajustes
    sSIMNAO := 'Sim';
    iEnt := 1;
    if (iOcor > 1) then
    begin
      sSIMNAO := 'Nao';
      iENt := 2;
    end;
    if (iOcor = 1) then sObs := 'Entrega Realizada Normalmente';

    sdt   := FormatDateTime('yyyy-MM-dd', dt);
    sHora := FormatDateTime('HH:mm', hr);

    Baixa_Tipo := 11;
    if (DM1.cdsNotasBaixa_Orig.Value = 2) then Baixa_Tipo := 13;

    BaixaFeita := DM1.cdsNotasNOCORR.Value;
    if (idNota > 0) then
    begin
      Bco.Notas_Entregas_Alterar(idNota, sdt, shora, copy(sObs,1,52) + ' :.', sReceb, sSIMNAO, iOcor);
      Bco.Notas_MarcarBaixa(idNota, idUs, Baixa_Tipo );
      Bco.NotasVolta_Marca(idNota, 0);
      // VER TRIGGER if (iOcor = 1) then Bco.Notas_Unica_AltStatus(TabnumNF.Value, Tabligcli.Value, 1);
      if BaixaFeita <> iOcor then
      begin
        // EVENTO NF - Rastreio
        Rast := TRastreio.Create;
        Rast.Insere_Baixa(nNota, ligcli,iOcor , idUs );
        Rast.Destroy;
      end;
    end;
  end;
  Bco.Destroy;
  DM2.Altera_Status('TB_NOTAF', 'STATUS_ENT', idNota, iEnt);
end;

procedure TBaixaRap.btDesmarcaClick(Sender: TObject);
begin
  Tab.First;
  while not Tab.Eof do
  begin
    Tab.Edit;
    TabSel.Value :=  false ;
    Tab.Post;

    Tab.Next;
  end;

end;

procedure TBaixaRap.btGravarClick(Sender: TObject);

var idU : Integer;
begin
  idU := idUser;
  Tab.First;
  while not Tab.Eof do
  begin
    if (TabSel.Value) and (Tabflag.Value = 1) then
    begin
      // Gravar Aqui
      SalvarNR(TabidNF.Value, TabnumNF.Value, Tabligcli.Value, idU, TabOrigem.Value, TabnOcorr.Value, TabObs.Value, TabRecedor.Value, TabdatEnt.Value, TabhoraEnt.Value);
    end;
    Tab.Next;
  end;
  Ordena;
  lbMens.Caption := 'Notas Salvas com sucesso!';
end;

procedure TBaixaRap.JvDBGrid1CellClick(Column: TColumn);
begin
 if (Column.FieldName = 'nOcorr') then
  begin
    if (OcorrePQ.ShowModal = mrOk) and (TabFlag.Value = 1) then
    begin
     Tab.Edit;
     TabnOcorr.Value :=  DM1.cdsOcNUM.AsInteger;
     TabObs.Value    :=  DM1.cdsOcDESCR.AsString;
     Tab.Post;
    end;
  end;

 if (Column.FieldName = 'Sel') and (TabFlag.Value = 1) then
  begin
     Tab.Edit;
     TabSel.Value :=  not TabSel.value ;
     Tab.Post;
  end;

end;

procedure TBaixaRap.set_Roma(nR: String);
begin
  Mostrar_Roma(nR);
  Ordena;
end;

procedure TBaixaRap.btMarcaClick(Sender: TObject);
begin
  Tab.First;
  while not Tab.Eof do
  begin
    Tab.Edit;
    TabSel.Value :=  true ;
    Tab.Post;

    Tab.Next;
  end;

end;

procedure TBaixaRap.btRecebeClick(Sender: TObject);

var Bco : TBco;

begin
  Tab.First;
  Bco := TBco.Create;
  while not Tab.Eof do
  begin
    if (Length(TabRecedor.Value)>0) and (TabFlag.Value=0) then
    begin
      // Gravar Aqui
      Bco.Notas_AlteraRecebedor(TabidNF.AsInteger, TabRecedor.Value);
    end;
    Tab.Next;
  end;
  Bco.Destroy;
end;

procedure TBaixaRap.btReentClick(Sender: TObject);

  var Bco : TBco;
      tp : String;
      ic : Smallint;

begin
  Tab.First;
  Bco := TBco.Create;
  ic := 0;
  Tab.First;
  while not Tab.Eof do
  begin
    if (TabnOcorr.Value>1) and (TabFlag.Value=0) then
    begin
      // Gravar Aqui
      tp := Bco.Ocorrencia_Traduz(2, TabnOcorr.Value);
      if (tp = 'Reentrega') then
      begin
        // verifica se existe reentrega
        if not (Bco.Notas_Existe_Reentrega(TabidNF.Value, TabnumNF.Value, Tabligcli.Value) ) then
        begin
          Bco.Notas_Reentrega(TabidNF.Value);
          ic := ic + 1;
        end;

      end;
    end;
    Tab.Next;
  end;
  Bco.Destroy;

  ShowMessage('Reentregas feitas '+ IntToStr(ic));

end;

procedure Retira_Baixa(idNota:Integer);
var Bco : TBco;
    idUs : integer;
    Rast : TRastreio;

begin
  DM2.Altera_Status('TB_NOTAF', 'STATUS_ENT', idNota, 0);
  DM2.Altera_Status('TB_NOTAF', 'STATUS_EDI', idNota, 0);
  DM2.Altera_Status('TB_NOTAF', 'NOCORR'    , idNota, 0);

  idUs := StrToInt(princ.LbUserID.Caption);

  Bco := TBco.Create;
  Bco.Notas_MarcarBaixa(idNota, idUs, 4); // Tipo=4 Flaydel/Apagado
  Bco.Notas_MostraId(idNota);
  Bco.Destroy;

  // EVENTO NF - Rastreio
  Rast := TRastreio.Create;
  Rast.set_ocor(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value ,DM1.cdsNotasSERIENF.Value, evrRetiraBaixa,idUs);
  Rast.Destroy;

end;


procedure TBaixaRap.btRetirarClick(Sender: TObject);

begin
  if MessageDlg('Tem certeza que deseja RETIRAR a baixa das notas selecionadas? ',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Tab.First;
    while not Tab.Eof do
    begin
      if (TabSel.Value) and (TabnOcorr.Value>0) then
      begin
        Tab.Edit;
        TabnOcorr.Value :=  0;
        Tab.Post;
        Retira_Baixa(TabidNF.Value);
      end;
      Tab.Next;
    end;
  end;

end;

procedure TBaixaRap.JvDBGrid1DblClick(Sender: TObject);
begin
  if (Tab.RecordCount > 0) then
  begin
    NotasP.Entrar;
    NotasP.Mostrar_Nota_id(TabidNF.Value);
    NotasP.Show;
  end;
end;

end.
