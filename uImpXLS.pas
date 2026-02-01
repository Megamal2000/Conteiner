unit uImpXLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ComObj;

type
  TImpXLS = class(TForm)
    Panel1: TPanel;
    lbCli: TLabel;
    Bevel1: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    btImportar: TBitBtn;
    OpenDialog1: TOpenDialog;
    PBnotas: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbCli: TComboBox;
    Label9: TLabel;
    Edit7: TEdit;
    Label10: TLabel;
    btParar: TBitBtn;
    Label11: TLabel;
    Edit8: TEdit;
    Label12: TLabel;
    Edit9: TEdit;
    Label13: TLabel;
    Edit10: TEdit;
    Label14: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit12: TEdit;
    Label16: TLabel;
    Edit13: TEdit;
    Label17: TLabel;
    Edit14: TEdit;
    Label18: TLabel;
    LibNao: TListBox;
    Label19: TLabel;
    edDOCD: TEdit;
    procedure btImportarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure set_idCli(i : integer);

  end;

var
  ImpXLS: TImpXLS;
  idCli : Integer;
  NumLinha : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM2, uRastreio;

  function cod_ascii(S : String):integer;

  var
    letra : char;
    i  : integer;

  begin
    S := Uppercase(copy(S, 0, 1));
    letra := S[1];
    i := ord(letra) - 64;

    cod_ascii := i;
  end;


procedure TImpXLS.btImportarClick(Sender: TObject);

var Arq_escolhido : String;
    Repet : Integer;
    Bco : TBco;
    Rast : TRastreio;
    Importa : Variant;
    col, lin, linha, coluna  : Integer;
    i, colNF : Integer;
    temp : variant;
    S : String;

    tmpNF, tmpVolume, tmpconh : Integer;
    tmpValor, tmpPeso : Double;
    tmpCEP, tmpLocal, tmpdest, tmpFoneD : String;
    tmpNControl, tmpUnid : Integer;

    clNF, clValor, clPeso, clVolume, clCEP, clLocal, clDest, clFone, clDOCD:Integer;
    Cont : Integer;

    // Espelho
    clEnder, clNum, clComp, clBairro, clCidade, clUF : Integer;
    tmpEnder, tmpComp, tmpBairro, tmpCidade, tmpUF, tmpDOCD : String;
    tmpNum, k : integer;


begin
  //Sai se nao existe cliente
  If (lbCli.Caption = 'Sem Cliente') then Exit;

  if (OpenDialog1.Execute) then
    Arq_escolhido := OpenDialog1.FileName
  else Exit;

  Label2.Caption := '';
   //Abre o arquivo Excel para importar
  Importa := CreateOleObject('Excel.Application');
  Importa.Visible := False;
  Importa.WorkBooks.Open(Arq_escolhido);

 {
   ===========================================
        Posições
   ===========================================
  }

  clNF    := 0;
  clValor := 0;
  clPeso  := 0;
  clVolume:= 0;
  clCEP   := 0;
  cllocal := 0;
  clDest  := 0;
  clFone  := 0;
  clEnder := 0;
  clNum   := 0;
  clComp  := 0;
  clBairro:= 0;
  clCidade:= 0;
  clUF    := 0;
  clDOCD  := 0;

  if (edit1.text <> '') then clNF    := cod_ascii(edit1.Text);
  if (edit2.text <> '') then clValor := cod_ascii(edit2.Text);
  if (edit3.text <> '') then clPeso  := cod_ascii(edit3.Text);
  if (edit4.text <> '') then clVolume:= cod_ascii(edit4.Text);
  if (edit5.text <> '') then clCEP   := cod_ascii(edit5.Text);
  if (edit6.text <> '') then cllocal := cod_ascii(edit6.Text);
  if (edit7.text <> '') then clDest  := cod_ascii(edit7.Text);
  if (edit8.text <> '') then clFone  := cod_ascii(edit8.Text);
  if (edit9.text <> '') then clEnder := cod_ascii(edit9.Text);
  if (edit10.text <> '') then clNum   := cod_ascii(edit10.Text);
  if (edit11.text <> '') then clComp  := cod_ascii(edit11.Text);
  if (edit12.text <> '') then clBairro:= cod_ascii(edit12.Text);
  if (edit13.text <> '') then clCidade:= cod_ascii(edit13.Text);
  if (edit14.text <> '') then clUF    := cod_ascii(edit14.Text);
  if (edDOCD.text <> '') then clDOCD    := cod_ascii(edDOCD.Text);

  idCli := DM2.DBCp_leid(cbCli.Items[cbCli.Itemindex], 'TB_CLIENTE', 'Nome');

 {
   ===========================================
        Calcula o total de linhas e colunas
   ===========================================
  }
    //Colunas
  S := 'A';

  col := 0;
  while (S<>'') do
  begin
    col := col + 1;
    S := Importa.Workbooks[1].Sheets[1].Cells[3, col];
  end;

  S := 'A';
  //Linhas
  lin := 0;
  while (S<>'') do
  begin
    lin := lin + 1;
    S := Importa.Workbooks[1].Sheets[1].Cells[lin, 3];
  end;

  //Preparando
  PBNotas.Min := 0;
  PBNotas.Max := lin-1;
  PBNotas.Position := 0;
  PBNotas.Refresh;

  //Importando
  LibNao.Clear;
  for linha:=2 to Lin-1 do
  begin
    pbNotas.Position := linha;
    pbNotas.Refresh;

    Label2.Caption := 'Linha atual '+ IntToStr(linha);
    Label2.Refresh;
    Application.ProcessMessages;
    //pega o número da NF
    if clNF<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clNF];
    tmpNF   := temp;
    end;

    //pega o Valor da NF
    if clValor<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clValor];
    tmpValor   := temp;
    end;

    //pega o Volume da NF
    if clVolume<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clVolume];
    tmpVolume   := temp;
    end;

    //pega o Peso da NF
    if clPeso<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clPeso];
    tmpPeso   := temp;
    end;

    //pega o CEP
    if clCEP<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clCEP];
    tmpCEP   := temp;
    if (Pos('-',tmpCEP)>0)  then
      tmpCEP := copy('00000000'+tmpCEP, length('00000000'+tmpCEP)-8, 9)
    else
      tmpCEP := copy('00000000'+tmpCEP, length('00000000'+tmpCEP)-7, 8);
    end;

    //pega o Local
    if clLocal<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clLocal];
    tmpLocal   := copy(temp,1,25);
    end;

    //pega o Desinatario
    if clDest<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clDest];
    tmpDest   := copy(temp,1,50);
    end;

    //pega o Fone do Desinatario
    if clFone<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clFone];
    tmpFoneD   := copy(temp,1,14);
    end;

    //pega o Fone do Desinatario
    if clDOCD<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clDOCD];
    tmpDOCD   := copy(temp,1,18);
    end;

    //pega o Endereço
    if clEnder<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clEnder];
    tmpEnder   := copy(temp,1,70);
    end;

    tmpComp := '';
    //pega o Número
    if clNum<>0 then
    begin
    tmpNum := 0;
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clNum];
    if  TryStrToInt(temp, k) then tmpNum   := k
      else tmpComp := temp;
    end;

    //pega o Complemento
    if (clComp<>0) and (length(tmpComp)=0) then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clComp];
    tmpComp   := copy(temp,1,15);
    end;

    //pega o Bairro
    if clBairro<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clBairro];
    tmpBairro   := copy(temp,1,30);
    end;

    //pega o Cidade
    if clCidade<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clCidade];
    tmpCidade   := copy(temp,1,30);
    end;

    //pega o Estado
    if clUF<>0 then
    begin
    temp := Importa.Workbooks[1].Sheets[1].Cells[linha, clUF];
    tmpUF   := copy(temp,1,2);
    end;





    //Conta notas repetidas
    //if DM.TLista.FindKey([tmpNF]) then Repet := Repet + 1;

    //Insere no arquivo TB_Notaf
    Bco := TBco.Create;
    if Not (Bco.Notas_Existe(idCli, tmpNF,0,0) ) then
    begin
      Bco.Notas_Inserir(idCli,tmpNF, tmpVolume, tmpValor, tmpPeso, tmpCEP, tmpLocal, 0, 6, 0,tmpDest, tmpFoneD, tmpDOCD,'', 1, 0);
      // EVENTO NF - Rastreio
      Rast := TRastreio.Create;
      Rast.set_ocor(tmpNF, idCli,0, evrImportado);
      Rast.Destroy;
      Bco.Espelho_XML_Importa(idCli, tmpNF, tmpVolume, tmpValor, tmpPeso, tmpCEP, tmpLocal, tmpdest, '', tmpdest, tmpEnder, tmpComp, tmpBairro, tmpCidade, '', tmpUF, tmpNum, 0, '', '', '');
    end
    else
    begin
       LibNao.Items.Append(IntTostr(tmpNF));
       Bco.Espelho_XML_Altera(idCli, tmpNF, tmpVolume, tmpValor, tmpPeso, tmpCEP, tmpLocal, tmpdest, '', tmpdest, tmpEnder, tmpComp, tmpBairro, tmpCidade, '', tmpUF, tmpNum, 0, '', '', '');
    end;
    Bco.Destroy;
  end;

  ShowMessage('Total de registros encontrados ' + IntToStr(Lin-1));

  //Atualizando os dados do controle
  //Gravando o Controle da Importação

  Importa.quit;
  Label2.Caption := '';

end;

procedure TImpXLS.set_idCli(i: integer);
begin
  idCli := i;
end;

procedure TImpXLS.FormActivate(Sender: TObject);
begin
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  DM2.DBCp_Pos(cbCli,'TB_CLIENTE', IntToStr(idCli), 'NOME');
end;

end.
