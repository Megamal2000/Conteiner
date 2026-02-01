unit uBipCEP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, DB,
  JvMemoryDataset, JvDataSource, Buttons, ComCtrls, JvExStdCtrls,
  JvRichEdit, MMSystem;

type
  TBipCEP = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edCEP: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    JvDBGrid1: TJvDBGrid;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btSel: TBitBtn;
    JvDBGrid2: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab1: TJvMemoryData;
    Tab2: TJvMemoryData;
    Tab1CEP: TStringField;
    Tab1volTot: TIntegerField;
    Tab1volBip: TIntegerField;
    JvDataSource2: TJvDataSource;
    JvDataSource3: TJvDataSource;
    Tab2CEP: TStringField;
    Tab2vol: TIntegerField;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    Label5: TLabel;
    Tab2ERRO: TStringField;
    hist: TJvRichEdit;
    Tab1numnf: TIntegerField;
    Tab1origem: TStringField;
    btSalvar: TBitBtn;
    procedure btSelClick(Sender: TObject);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  BipCEP: TBipCEP;
  PrimRota : String;

implementation

{$R *.dfm}


uses uBanco, uDM2, uDM5, Global;

procedure Limpar;

begin
  with BipCEP do
  begin
    lb1.Caption := '';
    lb2.Caption := '';
    lb3.Caption := '';
    edCEP.Text  := '';
    Hist.Lines.Clear;
  end;
end;

function pastaMeses(dt:TDateTime):String;

var am : String;
    Bco : TBco;

begin
  Bco := Tbco.Create;
  am := Bco.Config_BIP_Mostra;
  Bco.Destroy;
  am := am + '\' + FormatDateTime('yyyyMM',dt);
  if not(DirectoryExists(am)) then CreateDir(am);

  pastaMeses := am;
end;

procedure Salva_RelBIP(tipo:String);

var d:string;

begin
  d:= pastaMeses(Now)+'\bip '+ FormatDateTime('yyyyMMdd HHmm',Now)+ ' '+PrimRota+' '+ tipo+'.txt';
  BipCEp.Hist.Lines.SaveToFile(d);
end;

procedure Historico(s : String);

var comp : String;
    i : Integer;
    d : String;

begin
 getDir(0,d);
  with BipCEP do
  begin
    comp := FormatDateTime('HH:mm:ss',Now)+' | '+edCEP.Text+' - '+s;

    //hist.WordAttributes.Color := clNavy;
    //if (pos('ERRO',s)>0) then hist.WordAttributes.Color := clRed;
    hist.Lines.Insert(0,comp);
    //hist.Lines.Append(comp);
    // Somente WAV

    if (pos('ERRO',s)>0) then  PlaySound(PChar(d+'\Sons\erro1.wav'), 1, SND_ASYNC)
      else PlaySound(PChar(d+'\Sons\certo1.wav'), 1, SND_ASYNC);

    lb3.Caption := lb2.Caption;
    lb2.Caption := lb1.Caption;
    lb1.Caption := comp;
    edCEP.Text  := '';
    edCEP.SetFocus;
  end;
end;

procedure Mostrar_Rotas();
var Bco : TBco;

begin
  // Acessando os dados
  Bco := TBco.Create;
  Bco.Rotas_adm_Conta;
  BCo.Destroy;
end;

procedure Mostrar_Selecionados();
var Bco : TBco;
    i : Integer;
    whr, orig : String;

begin
  Historico(nmUser + '--['+IntToStr(idUser)+']');
  PrimRota := '';
  whr := '';
  with BipCEP do
  begin
   if JvDBGrid1.SelectedRows.Count>0 then
     with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Historico(DM5.cdsRcontaROTA.Value);
        if (Length(primRota)=0) then PrimRota := DM5.cdsRcontaROTA.Value;
        if (Length(whr) > 0) then whr := whr + ' or ligRot= '+DM5.cdsRcontaLIGROT.AsString
          else whr := whr + ' ligRot= '+DM5.cdsRcontaLIGROT.AsString;
      end;
    if (Length(whr) > 0) then
    begin
      whr := ' and (' + whr + ') ';
      Bco := TBco.Create;
      Bco.Rotas_bip_CEP(whr);
      Bco.Destroy;

      Tab1.Active := false;
      Tab1.EmptyTable;
      Tab1.Active := true;

      Tab2.Active := false;
      Tab2.EmptyTable;
      Tab2.Active := true;

      DM2.cdsTMP.First;
      while not DM2.cdsTMP.Eof do
      begin
         Tab1.Insert;
         Tab1CEP.Value    := DM2.cdsTMP.Fields[0].Value;
         Tab1volTot.Value := DM2.cdsTMP.Fields[1].Value;
         Tab1numnf.Value  := DM2.cdsTMP.Fields[2].Value;
         orig := 'N';
         if (DM2.cdsTMP.Fields[3].Value = 4) then orig := 'R';
         Tab1origem.Value := orig;
         Tab1volBip.Value := 0;
         Tab1.Post;
         DM2.cdsTMP.Next;
      end;
      Tab1.Refresh;

    end;
  end;
end;

procedure Inserir_Erro(cep, sE:String);

var achei : boolean;
    n : Integer;

begin
  with BipCEP do
  begin
    achei := false;
    if (Tab2.RecordCount > 0) then
    begin
      Tab2.First;
      while (not Tab2.Eof) and (not achei) do
      begin
        if (Tab2CEP.Value = cep) then
        begin
          achei := true;
          n := Tab2vol.Value + 1;
          Tab2.Edit;
          Tab2vol.Value := n;
          Tab2.post;
        end
        else Tab2.Next;
      end;
    end;
    if (not achei) then
    begin
      Tab2.Insert;
      Tab2CEP.Value := cep;
      Tab2vol.Value := 1;
      Tab2ERRO.Value:= sE;
      Tab2.post;
    end;
  end;
end;

procedure procurar_CEP(cep:String);

var achei : boolean;
    n, err : Integer;
    sErr, marca : String;

begin
  with BipCEP do
  begin
    err := 0;
    achei := false;
    Tab1.First;
    while (not Tab1.Eof) and (not achei) do
    begin
      if (trim(Tab1CEP.Value) = cep) then
      begin
        if (Tab1volBip.value<Tab1volTot.Value) then
        begin
          achei := true;
          n := Tab1volBip.Value + 1;
          Tab1.Edit;
          Tab1volBip.value := n;
          Tab1.Post;
          Historico(' -- volume OK NF: '+Tab1numnf.AsString);
          marca := '';
          err := 0;
        end
        else
        begin
          err := 1;
          marca := ' -- ERRO: volume a mais NF: '+Tab1numnf.AsString;

        end;
      end;
      Tab1.Next;
    end;

    if (not achei) then
    begin
      if (err = 1) then Historico(marca)
      else
      begin
        err := 2;
        Historico(' -- ERRO: volume com CEP inexistente ');
      end;  
    end;

    if (err>0) then
    begin
      if (err = 1) then sErr := 'EX' else sErr := 'NE';
      Inserir_Erro(cep, sErr);
    end;


  end;
end;



procedure TBipCEP.Entrar;
begin
  PrimRota := '';
  Limpar;
  Mostrar_Rotas;
end;

procedure TBipCEP.btSelClick(Sender: TObject);
begin
  if (LengTh(primRota) = 0) then
  begin
    Limpar;
    Tab1.Active:= false;
    Mostrar_Selecionados;
    edCEP.Text := '';
    edCEP.SetFocus;
  end
  else
  ShowMessage('Salve o Serviço antes');
end;

procedure TBipCEP.JvDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

  var dif : Integer;

begin
    dif := Tab1volTot.Value - Tab1volBip.Value;
    JvDBGrid2.Canvas.Font.Color := clBlack;
   
    if (tab1volBip.Value > 0) then
    begin
      if (dif > 0) then
      begin
        //DBGrid1.Canvas.Brush.Color := clYellow;
        //JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsStrikeOut];
        JvDBGrid2.Canvas.Font.Color := clRed;
      end
      else
      begin
        //DBGrid1.Canvas.Brush.Color := clYellow;
        JvDBGrid2.Canvas.Font.Style := JvDBGrid2.Canvas.Font.Style + [fsBold];
        JvDBGrid2.Canvas.Font.Color := clSilver;
      end;

    end;
    JvDBGrid2.Canvas.FillRect(rect);
    JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);


end;

procedure TBipCEP.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    procurar_CEP(edCEP.Text);
    edCEP.Text := '';
    edCEP.SetFocus;
    JvDBGrid2.Refresh;
  end;
end;

procedure TBipCEP.btSalvarClick(Sender: TObject);
var tot, comp, incomp, vtot, vbip, erros :Integer;
begin
  hist.Lines.Append('');
  hist.Lines.Append('');
  hist.Lines.Append('Relatório Final');
  hist.Lines.Append('===========================');
  tot:=0; comp:=0; incomp:=0; vtot:=0; vbip:=0;
  Tab1.First;
  while not Tab1.Eof do
  begin
    tot := tot + 1;
    if (Tab1volTot.Value=Tab1volBip.Value) then comp := comp + 1
      else incomp := incomp + 1;
    vTot := vtot + Tab1volTot.Value;
    vbip := vbip + Tab1volBip.Value;
    Tab1.Next;
  end;
  hist.Lines.Append(' >> Total de Itens..: '+IntToStr(tot));
  hist.Lines.Append(' >> Itens completos..: '+IntToStr(comp));
  hist.Lines.Append(' >> Itens incompletos..: '+IntToStr(incomp));
  hist.Lines.Append(' >> Total de Volumes..: '+IntToStr(vtot));
  hist.Lines.Append(' >> Volumes Conferidos..: '+IntToStr(vbip));

  erros := 0;
  Tab2.First;
  while not Tab2.Eof do
  begin
    erros := erros + Tab2vol.Value;
    Tab2.Next;
  end;

  hist.Lines.Append(' >> Erros..: '+IntToStr(erros));

  hist.Lines.Append('');
  hist.Lines.Append('');
  hist.Lines.Append('Tabela 1 - Volumes');
  Tab1.First;
  while not Tab1.Eof do
  begin
    hist.Lines.Append(Tab1CEP.Value + ' / '+Tab1volTot.AsString+ ' / '+Tab1volBip.AsString+ ' / '+Tab1numnf.AsString);
    Tab1.Next;
  end;

  hist.Lines.Append('');
  hist.Lines.Append('');
  hist.Lines.Append('Tabela 2 - Erros');
  Tab2.First;
  while not Tab2.Eof do
  begin
    hist.Lines.Append(Tab2CEP.Value + ' | ' + Tab2vol.AsString + ' | ' + Tab2ERRO.Value );
    Tab2.Next;
  end;

  if (incomp > 0) then Salva_RelBIP('INCOMP') else Salva_RelBIP('COMP');
  Limpar;
  Hist.Clear;
  Tab1.Active := false;
  Tab2.Active := false;

  PrimRota := '';

end;

end.
