unit uPrazos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, JvDataSource,
  Vcl.ComCtrls, Vcl.Menus;

type
  TPrazos = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lbpqt: TLabel;
    btNovoP: TBitBtn;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    Panel3: TPanel;
    btSalvarPr: TBitBtn;
    btCancelPr: TBitBtn;
    Label2: TLabel;
    edDescr: TEdit;
    dtVal: TDateTimePicker;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    Apagar1: TMenuItem;
    Alterar1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    JvDBGrid2: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    Panel4: TPanel;
    JvDBGrid4: TJvDBGrid;
    JvDataSource3: TJvDataSource;
    JvDataSource4: TJvDataSource;
    Label4: TLabel;
    lbSelPrazo: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    lbSelPrazo2: TLabel;
    btNovoF: TBitBtn;
    btCopiaF: TBitBtn;
    btCancelF: TBitBtn;
    btSalvarF: TBitBtn;
    Label7: TLabel;
    edFinic: TEdit;
    Label8: TLabel;
    edFfim: TEdit;
    Label9: TLabel;
    edFdias: TEdit;
    Panel6: TPanel;
    Label6: TLabel;
    lbSelPrazo3: TLabel;
    btCopia: TBitBtn;
    btCancel3: TBitBtn;
    Label10: TLabel;
    cbPraz: TComboBox;
    Label11: TLabel;
    lbQTf: TLabel;
    btCliretira: TBitBtn;
    btCliinsere: TBitBtn;
    lbCli1: TLabel;
    lbCli2: TLabel;
    PopupMenu2: TPopupMenu;
    Apagar2: TMenuItem;
    Alterar2: TMenuItem;
    PopupMenu3: TPopupMenu;
    AlterarPadro1: TMenuItem;
    ckRisco: TCheckBox;
    procedure btNovoPClick(Sender: TObject);
    procedure btCancelPrClick(Sender: TObject);
    procedure btSalvarPrClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure btNovoFClick(Sender: TObject);
    procedure btSalvarFClick(Sender: TObject);
    procedure btCancelFClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btCopiaFClick(Sender: TObject);
    procedure edFinicKeyPress(Sender: TObject; var Key: Char);
    procedure edFfimKeyPress(Sender: TObject; var Key: Char);
    procedure edFdiasKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid3DblClick(Sender: TObject);
    procedure btCopiaClick(Sender: TObject);
    procedure btCancel3Click(Sender: TObject);
    procedure btCliretiraClick(Sender: TObject);
    procedure btCliinsereClick(Sender: TObject);
    procedure Apagar2Click(Sender: TObject);
    procedure Alterar2Click(Sender: TObject);
    procedure AlterarPadro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Prazos: TPrazos;
  idPr1, idPr2Fa : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM5, uDM2;

procedure Limpar();
begin
  with Prazos do
  begin
    edDescr.Text := '';
    dtVal.DateTime := Now + 730;
    edFinic.Text := '';
    edFfim.Text  := '';
    lbSelPrazo.Caption := '';
  end;
end;

procedure Atualiza_Copia();
begin
  with Prazos do
  begin
    cbPraz.clear;
    DM2.DBCb_Preenche(cbPraz, 'TB_PRAZO', 'DESCREVE', 'ID <> '+idpr1.ToString);
  end;
end;

procedure Mostrar_Prazos();

  var conta : integer;
      Bco : tBco;

begin
  Bco := TBco.Create;
  Bco.Prazos_Mostrar(0);
  Bco.Destroy;

  conta := DM5.cdsPr1.RecordCount;
  Prazos.lbpqt.Caption := conta.ToString;

end;

procedure Mostrar_Faixas(idPrazo:Integer);
  var conta : integer;
      Bco : tBco;

begin
  Bco := TBco.Create;
  Bco.PrazosFaixa_Mostrar(idPrazo);
  Bco.Destroy;

  conta := DM5.cdsPr2.RecordCount;
  Prazos.lbQTf.Caption := conta.ToString;
end;

procedure Mostrar_Clientes(idPrazo:Integer);
  var conta : integer;
      Bco : tBco;

begin
  Bco := TBco.Create;
  Bco.PrazosClientes_Mostra(idPrazo);
  Bco.Destroy;

  conta := DM5.cdsPrCli1.RecordCount;
  Prazos.lbCli1.Caption := conta.ToString;
end;

procedure Mostrar_ClientesNao();
  var conta : integer;
      Bco : tBco;

begin
  Bco := TBco.Create;
  Bco.PrazosClientes_Nao();
  Bco.Destroy;

  conta := DM5.cdsPrCli2.RecordCount;
  Prazos.lbCli2.Caption := conta.ToString;
end;

procedure Salvar_Prazos();
  var
      Bco : tBco;

begin
  Bco := TBco.Create;
  with Prazos do
  if idPr1 >0 then
    Bco.Prazos_Alterar(idPr1, edDescr.Text, dtVal.DateTime)
  else
    Bco.Prazos_Inserir(edDescr.Text, dtVal.DateTime);

  Bco.Destroy;
  Atualiza_Copia;
end;

procedure Salvar_Faixas();
  var
      Bco : tBco;
      nPr, nInic, nFim:Integer;
      sRisco : String;

begin
  sRisco := 'S';
  nPr   := StrToInt(Prazos.edFdias.Text);
  nInic := StrToInt(Prazos.edFinic.Text);
  nFim  := StrToInt(Prazos.edFfim.Text);
  if not Prazos.ckRisco.Checked then sRisco := 'N';


  Bco := TBco.Create;
  if idPr2Fa >0 then
    Bco.PrazosFaixa_Alterar(idPr2Fa, nPr, nInic, nFim, sRisco)
  else
    Bco.PrazosFaixa_Inserir(idPr1, nPr, nInic, nFim, sRisco);

  Bco.Destroy;

end;


{ TPrazos }

procedure TPrazos.Alterar1Click(Sender: TObject);
begin
  // Alterar Prazo
  Limpar;
  Panel3.Visible := true;
  Panel1.Visible := false;
  idPr1 := DM5.cdsPr1ID.Value;
  edDescr.Text := DM5.cdsPr1DESCREVE.Value;
  dtVal.DateTime := DM5.cdsPr1VALIDADE.AsDateTime;

end;

procedure TPrazos.Alterar2Click(Sender: TObject);
begin
  idPr2fa :=  DM5.cdsPr2ID.Value;
  edFinic.Text := DM5.cdsPr2CEPI.AsString;
  edFfim.Text  := DM5.cdsPr2CEPF.AsString;
  edFdias.Text := DM5.cdsPr2PRAZO.AsString;

  panel5.Visible := true;
  panel2.Visible := false;
end;

procedure TPrazos.AlterarPadro1Click(Sender: TObject);
  var
      nPadrao : Smallint;
      s : String;
      i : integer;

begin
  nPadrao := DM5.cdsPrCli1Prazo.Value;
  s := InputBox('Prazo Padrão', 'Digite o novo Prazo Padrão', nPadrao.ToString);
  if (s.Length>0) and (DM5.cdsPrCli1.RecordCount>0) then
  begin
    nPadrao := StrToInt(s);
    DM5.cdsPrCli1.First;
    while not DM5.cdsPrCli1.Eof do
         begin
           DM2.Altera_Status('TB_Cliente', 'Prazo', DM5.cdsPrCli1ID.Value, nPadrao);
           DM5.cdsPrCli1.Next;
         end;
    Mostrar_Clientes(idPr1);

  end;


end;

procedure TPrazos.Apagar1Click(Sender: TObject);
var Bco : TBco;
begin
  // Apagar Prazo
  if (DM5.cdsPr1.RecordCount>0) then
  if MessageDlg('Tem certeza que deseja APAGAR o Prazo ' + DM5.cdsPr1DESCREVE.Value + '? ',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.Prazos_Apagar(DM5.cdsPr1ID.Value);
    Bco.Destroy;

    Mostrar_Prazos;
  end;
end;

procedure TPrazos.Apagar2Click(Sender: TObject);
var Bco : TBco;
begin
  // Apagar Prazo
  if (DM5.cdsPr2.RecordCount>0) then
  if MessageDlg('Tem certeza que deseja APAGAR a Faixa '+#13+'De ' + DM5.cdsPr2CEPi.AsString + ' a '+DM5.cdsPr2CEPF.AsString +' ? ',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.PrazosFaixa_Apagar(DM5.cdsPr2ID.Value);
    Bco.Destroy;

    Mostrar_Faixas(idPr1);
  end;
end;

procedure TPrazos.btCancel3Click(Sender: TObject);
begin
  Panel2.Visible := TRUe;
  Panel6.Visible := false;
end;

procedure TPrazos.btCancelFClick(Sender: TObject);
begin
  Panel2.Visible := TRUe;
  Panel5.Visible := false;
end;

procedure TPrazos.btCancelPrClick(Sender: TObject);
begin
  Panel1.Visible := TRUe;
  Panel3.Visible := false;
end;

procedure TPrazos.btCliinsereClick(Sender: TObject);
  var qtSel, i : Integer;
      Bco : TBco;

begin
  if (idPr1 > 0) then
  begin
    qtSel := JvDBGrid4.SelectedRows.Count;
    if qtSel > 0 then
    begin
     Bco := TBco.Create;
     with JvDBGrid4.DataSource.DataSet do
       for i:=0 to JvDBGrid4.SelectedRows.Count-1 do
       begin
         GotoBookmark((JvDBGrid4.SelectedRows.Items[i]));
         Bco.PrazosClientes_Altera(DM5.cdsPrCli2ID.Value, idPr1);
       end;
     Bco.Destroy;
    end
    else ShowMessage('Nenhum Cliente Selecionado');
    Mostrar_Clientes(idPr1);
    Mostrar_ClientesNao;
  end
  else ShowMessage('Selecione um Prazo');
end;

procedure TPrazos.btCliretiraClick(Sender: TObject);
  var qtSel, i : Integer;
      Bco : TBco;
begin
  qtSel := JvDBGrid2.SelectedRows.Count;
  if qtSel > 0 then
  begin
  if MessageDlg('Selecionados '+qtSel.ToString+#13+'Tem certeza que deseja RETIRAR esse Cliente ?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       Bco := TBco.Create;
       with JvDBGrid2.DataSource.DataSet do
         for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
         begin
           GotoBookmark((JvDBGrid2.SelectedRows.Items[i]));
           Bco.PrazosClientes_Altera(DM5.cdsPrCli1ID.Value, 0);
         end;
       Bco.Destroy;
       Mostrar_Clientes(idPr1);
       Mostrar_ClientesNao;
     end;
  end
  else ShowMessage('Nenhum Cliente Selecionado');

end;

procedure TPrazos.btCopiaClick(Sender: TObject);

var idPr3 : Integer;
    nPr, nInic, nFim : Integer;
    Bco : TBco;
    ok : boolean;
    qtFaixas : Integer;
    sRisco : String;

begin
  idPr3 := DM2.DBCp_leid(cbPraz.Items[cbPraz.Itemindex], 'TB_PRAZO', 'DESCREVE');

  if idPr3 <> idPr1 then
  begin
    qtFaixas := DM5.cdsPr2.RecordCount;
    ok := false;
    if (qtFaixas = 0) then ok := true;

    if not ok then
      if MessageDlg(DM5.cdsPr1DESCREVE.Value +#13+ 'Existem '+qtFaixas.ToString+' faixas de CEPs neste prazo. Elas serão apagadas na Cópia.'+#13+'Tem certeza que deseja copiar ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then  ok := true;

    if ok then
    begin
      if (qtFaixas > 0) then
      begin
        // ===== APAGA ===============
        // Apaga as fiaxas atuais
        Bco := TBco.Create;

        DM5.cdsPr2.First;
        while not DM5.cdsPr2.Eof do
        begin
          Bco.PrazosFaixa_Apagar(DM5.cdsPr2ID.Value);

          DM5.cdsPr2.Next;
        end;
        bco.Destroy;
      end;

      // ===== COPIA ===============
      Mostrar_Faixas(idPr3);

      Bco := TBco.Create;

      DM5.cdsPr2.First;
      while not DM5.cdsPr2.Eof do
      begin
        nPr   := DM5.cdsPr2PRAZO.Value;
        nInic := DM5.cdsPr2CEPI.Value ;
        nFim  := DM5.cdsPr2CEPF.Value ;
        sRisco:= DM5.cdsPr2AREARISCO.Value;

        Bco.PrazosFaixa_Inserir(idPr1, nPr, nInic, nFim, sRisco);

        DM5.cdsPr2.Next;
      end;
      bco.Destroy;
    end;
  end
  else ShowMessage('Não pode usar a mesma faixa');

end;

procedure TPrazos.btCopiaFClick(Sender: TObject);
begin
  if (idPr1>0) then
  begin
    if cbpraz.Items.Count > 1 then
    begin
      Limpar;
      Panel6.Visible := true;
      Panel2.Visible := false;
      cbPraz.ItemIndex := 0;
    end
    else ShowMessage('Não existem outros Prazos para copiar');
  end
  else ShowMessage('Selecione um Prazo!');

end;

procedure TPrazos.btNovoFClick(Sender: TObject);
begin
  if (idPr1>0) then
  begin
    Limpar;
    edFdias.Text := '';
    Panel5.Visible := true;
    Panel2.Visible := false;
    idPr2Fa := 0;
  end
  else ShowMessage('Selecione um Prazo!');
end;

procedure TPrazos.btNovoPClick(Sender: TObject);
begin
  Limpar;
  Panel3.Visible := true;
  Panel1.Visible := false;
  idPr1 := 0;
end;

procedure TPrazos.btSalvarFClick(Sender: TObject);
begin
  if (Length(edFinic.Text)>0) and (Length(edFfim.Text)>0) and (Length(edFdias.Text)>0)  then
  begin
   Salvar_Faixas;
   Mostrar_Faixas(idPr1);
   idPr2Fa := 0;
   Limpar;
  end
  else ShowMessage('Preencha todos os campos');
end;

procedure TPrazos.btSalvarPrClick(Sender: TObject);
begin
  if (Length(edDescr.Text)>3)   then
  begin
   Salvar_Prazos;
   Mostrar_Prazos;
   Panel1.Visible := TRUe;
   Panel3.Visible := false;
  end
  else ShowMessage('Preencha todos o Campo Descrição');

end;

procedure TPrazos.edFdiasKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    if (edFdias.Text <> '') then
      btSalvarF.SetFocus;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;

end;

procedure TPrazos.edFfimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    if (edFfim.Text <> '') then
      edFdias.SetFocus;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TPrazos.edFinicKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    if (edFinic.Text <> '') then
      edFfim.SetFocus;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TPrazos.Entrar;
begin
  idPr1 := 0;
  idPr2Fa := 0;
  Mostrar_Prazos;
  Panel3.Visible := False;
  Panel5.Visible := false;
  Panel6.Visible := false;
  Atualiza_Copia;
  PageControl1.TabIndex := 0;
  Mostrar_ClientesNao;
end;

procedure TPrazos.JvDBGrid1CellClick(Column: TColumn);
begin
  idPr1 := DM5.cdsPr1ID.Value;
  lbSelPrazo.Caption  := DM5.cdsPr1DESCREVE.Value;
  lbSelPrazo2.Caption  := DM5.cdsPr1DESCREVE.Value;
  lbSelPrazo3.Caption  := DM5.cdsPr1DESCREVE.Value;
  Mostrar_Faixas(idPr1);
  Mostrar_Clientes(idPr1);


end;

procedure TPrazos.JvDBGrid1DblClick(Sender: TObject);
begin
  Limpar;
  Panel3.Visible := true;
  Panel1.Visible := false;
  idPr1 := DM5.cdsPr1ID.Value;
  edDescr.Text := DM5.cdsPr1DESCREVE.Value;
  dtVal.DateTime := DM5.cdsPr1VALIDADE.AsDateTime;

end;

procedure TPrazos.JvDBGrid3DblClick(Sender: TObject);
begin
  idPr2fa :=  DM5.cdsPr2ID.Value;
  edFinic.Text := DM5.cdsPr2CEPI.AsString;
  edFfim.Text  := DM5.cdsPr2CEPF.AsString;
  edFdias.Text := DM5.cdsPr2PRAZO.AsString;
  ckRisco.Checked := (DM5.cdsPr2AREARISCO.AsString = 'S');

  panel5.Visible := true;
  panel2.Visible := false;
end;

end.
