unit uBipRoma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvMemoryDataset, JvDataSource, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, StdCtrls, Buttons, JvExStdCtrls, JvRichEdit, ExtCtrls, MMSystem;

type
  TBipRoma = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    edCEP: TEdit;
    hist: TJvRichEdit;
    btSalvar: TBitBtn;
    Panel2: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    JvDBGrid1: TJvDBGrid;
    btSel: TBitBtn;
    Panel4: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    JvDBGrid2: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab1: TJvMemoryData;
    Tab1CEP: TStringField;
    Tab1volTot: TIntegerField;
    Tab1volBip: TIntegerField;
    Tab1numnf: TIntegerField;
    Tab1origem: TStringField;
    Tab2: TJvMemoryData;
    Tab2CEP: TStringField;
    Tab2vol: TIntegerField;
    Tab2ERRO: TStringField;
    JvDataSource2: TJvDataSource;
    JvDataSource3: TJvDataSource;
    Panel5: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdUsuario: TEdit;
    EdSenha: TEdit;
    btOk: TBitBtn;
    btSair: TBitBtn;
    GroupBox1: TGroupBox;
    rbCEP: TRadioButton;
    rbNF: TRadioButton;
    lbVol: TLabel;
    lbVolBip: TLabel;
    Tab1idcli: TIntegerField;
    procedure btSelClick(Sender: TObject);
    procedure edCEPKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSalvarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure EdUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure rbCEPClick(Sender: TObject);
    procedure rbNFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  BipRoma: TBipRoma;
  PrimRota : String;

implementation

{$R *.dfm}

uses uBanco, uDM5, uDM1, Global, uBIPclass;

// Apoio

procedure Limpar;

begin
  with BipRoma do
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
  d:= pastaMeses(Now)+'\bipRoma '+ FormatDateTime('yyyyMMdd HHmm',Now)+ ' '+PrimRota+' '+ tipo+'.txt';
  BipRoma.Hist.Lines.SaveToFile(d);
end;

procedure Historico(s : String);

var comp : String;
    i : Integer;
    d : String;

begin
 getDir(0,d);
  with BipRoma do
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


procedure Mostrar_Selecionados();
var Bco : TBco;
    i, contVol : Integer;
    orig, sCEP : String;

begin
  Historico(nmUser + '--['+IntToStr(idUser)+']');

  with BipRoma do
  begin
   if JvDBGrid1.SelectedRows.Count>0 then
     with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Historico('Romaneio '+DM5.cdsBipRROMANEIO.AsString);

      end;

      PrimRota := DM5.cdsBipRROMANEIO.AsString;
      Bco := TBco.Create;
      Bco.Romaneio_MostraNotas(DM5.cdsBipRNUM.Value);
      Bco.Destroy;

      Tab1.Active := false;
      Tab1.EmptyTable;
      Tab1.Active := true;

      Tab2.Active := false;
      Tab2.EmptyTable;
      Tab2.Active := true;
      contVol := 0;
      DM1.cdsRomaNF.First;
      while not DM1.cdsRomaNF.Eof do
      begin
         Tab1.Insert;
         sCEP := DM1.cdsRomaNFCEP.AsString.Replace('-','');
         if sCEP.Length<8 then sCEP := (sCEP + '00000').PadLeft(8);

         Tab1CEP.Value    := sCEP;
         Tab1volTot.Value := DM1.cdsRomaNFVOLUME.Value;
         contVol := contVol + Tab1volTot.Value;
         Tab1numnf.Value  := DM1.cdsRomaNFNUMNF.Value;
         orig := 'N';
         if (DM1.cdsRomaNFORIGEM.Value = 4) then orig := 'R';
         Tab1origem.Value := orig;
         Tab1volBip.Value := 0;
         Tab1idcli.Value := DM1.cdsRomaNFIDCLI.Value;
         Tab1.Post;
         DM1.cdsRomaNF.Next;
      end;
      Tab1.Refresh;
      lbVol.Caption := contVol.ToString;
      lbVolBip.Caption := '0';

  end;
end;

procedure Inserir_Erro(cep, sE:String);

var achei : boolean;
    n : Integer;

begin
  with BipRoma do
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

procedure procurar_CEP(cepX:String);

var achei : boolean;
    n, err, contaBIP : Integer;
    sErr, marca, cep : String;

begin
  with BipRoma do
  begin
    contaBIP := 0;
    cep := cepX.Replace('-','');
    err := 0;
    achei := false;
    Tab1.First;
    while (not Tab1.Eof) and (not achei) do
    begin
      if (trim(Tab1CEP.Value) = cep) then
      begin
        if (Tab1volBip.value<Tab1volTot.Value) then
        begin
          contaBIP := contaBIP + 1;
          lbVolBip.Caption := contaBIP.ToString;

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

function LeNOTA(s:String):Integer;
  var Bip : TBIP;
      n : Integer;
begin
  Bip := TBIP.Create;
  n := Bip.ConverteNumeroNota(s);
  Bip.Destroy;
  LeNOTA := n;
end;

procedure procurar_NOTA(numN:String);

var achei : boolean;
    n, err, nNota, contaBIP : Integer;
    sErr, marca, tmp : String;

begin
  with BipRoma do
  begin
    contaBIP := 0;
    tmp   := numN.Replace('-','');
    nNota := LeNOTA(tmp);
    err := 0;
    achei := false;
    Tab1.First;
    while (not Tab1.Eof) and (not achei) do
    begin
      if (Tab1numnf.Value = nNota) then
      begin
        if (Tab1volBip.value<Tab1volTot.Value) then
        begin
          contaBIP := contaBIP + 1;
          lbVolBip.Caption := contaBIP.ToString;

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
        Historico(' -- ERRO: NOTA '+nNota.ToString+' não encontrada ');
      end;
    end;

    if (err>0) then
    begin
      if (err = 1) then sErr := 'EX' else sErr := 'NE';
      Inserir_Erro(nNota.ToString, sErr);
    end;


  end;
end;



{ TBipRoma }

procedure TBipRoma.Entrar;

  var Bco : tBco;

begin
  Limpar;
  Bco := tBco.Create;
  Bco.BIP_Roma_Mostra;
  Bco.Destroy;
end;



procedure TBipRoma.btSelClick(Sender: TObject);
begin
  lbVol.Caption := '0';
  lbVolBip.Caption := '0';
  Mostrar_Selecionados;
  edCEP.SetFocus;
end;

procedure TBipRoma.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  if (lbVol.Caption <> '0') then
  begin
    if Length(edCEP.Text)>0 then
    begin
      if rbCEP.Checked then procurar_CEP(edCEP.Text);
      if rbNF.Checked then procurar_NOTA(edCEP.Text);

      edCEP.Text := '';
      edCEP.SetFocus;
      JvDBGrid2.Refresh;
    end;
  end
  else ShowMessage('Selecione um Romaneio');
end;

procedure TBipRoma.JvDBGrid2DrawColumnCell(Sender: TObject;
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

procedure TBipRoma.rbCEPClick(Sender: TObject);
begin
  edCEP.SetFocus;
end;

procedure TBipRoma.rbNFClick(Sender: TObject);
begin
  edCEP.SetFocus;
end;

procedure TBipRoma.btSalvarClick(Sender: TObject);

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
  // Assina
  EdUsuario.Text := '';
  EdSenha.Text := '';

  Panel5.Visible := true;
  EdUsuario.SetFocus;
  
  // Finaliza
  Limpar;
  Hist.Clear;
  Tab1.Active := false;
  Tab2.Active := false;

  PrimRota := '';
  edCEP.setFocus;
end;

procedure TBipRoma.btSairClick(Sender: TObject);
begin
  Panel5.Visible := false;
  edCEP.SetFocus;
end;

procedure Conferir();
var Bco : TBco;
    ok : boolean;

begin
  with BipRoma do
  if (length(EdUsuario.Text)>0) and (Length(EdSenha.Text) > 0) then
  begin
    Bco := TBco.Create;
    ok := Bco.BIP_Roma_Confere(DM5.cdsBipRNUM.Value, 1, EdUsuario.Text, EdSenha.Text);
    Bco.Destroy;

    if ok then Panel5.Visible := false
    else
    begin
      BipRoma.EdUsuario.SetFocus;
      ShowMessage('Usuário não encontrado');

    end;
  end
  else ShowMessage('Preencha o usuário e a Senha');

end;

procedure TBipRoma.btOkClick(Sender: TObject);

begin
  Conferir;
  edCEP.SetFocus;
end;

procedure TBipRoma.EdUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then EdSenha.SetFocus;
end;

procedure TBipRoma.EdSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Conferir;
end;

end.
