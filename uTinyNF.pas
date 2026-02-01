unit uTinyNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvMemoryDataset,
  JvDataSource, Vcl.ExtCtrls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  JvComponentBase, JvThreadTimer;

type
  TTinyNF = class(TForm)
    Panel1: TPanel;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    JvDBGrid1: TJvDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    cbCli: TComboBox;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btPesq: TBitBtn;
    Memo1: TMemo;
    XMLDocument1: TXMLDocument;
    StatusBar1: TStatusBar;
    TabnumNF: TIntegerField;
    TabSerieNF: TIntegerField;
    TabVolume: TIntegerField;
    TabCEP: TStringField;
    TabLocali: TStringField;
    TabCidade: TStringField;
    TabTipo: TStringField;
    TabNumPed: TStringField;
    TabTransp: TStringField;
    TabValorNF: TFloatField;
    TabNomeDest: TStringField;
    TabdocDest: TStringField;
    TabEnder: TStringField;
    TabNumero: TIntegerField;
    TabComp: TStringField;
    TabCodMun: TStringField;
    TabEstado: TStringField;
    TabChaveNF: TStringField;
    Tabie: TStringField;
    Tabvfrete: TFloatField;
    TabvPeso: TFloatField;
    Tempor: TJvThreadTimer;
    TabidNF: TIntegerField;
    pb: TProgressBar;
    ckVisual: TCheckBox;
    Tabfone: TStringField;
    Btrast: TBitBtn;
    TemporRast: TJvThreadTimer;
    TabidPed: TIntegerField;
    procedure dt1Change(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure TemporTimer(Sender: TObject);
    procedure TemporRastTimer(Sender: TObject);
    procedure BtrastClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  TinyNF: TTinyNF;
  idC : Integer;
  fase : Smallint;

implementation

{$R *.dfm}

uses uBanco, uDM2, servTiny, uIBGE, uLib;

procedure Salvar();
begin

end;

procedure ExisteNF();
begin

end;

function CodM(cid, uf:String):String;
var resp : String;

begin
  resp := '';
  IBGE.set_cid(cid);
  IBGE.set_uf(uf);
  resp := IBGE.PesquisaValor;

  result := resp;
end;

function SoNumeros(n:String):String;
  var usa : TMarco;
      resp : String;
begin
  resp := n;
  usa := TMarco.Create;
  resp := usa.Formata_DOC(n);
  usa.Destroy;
  result := resp;
end;

function EndNum(n:String):Integer;
  var resp : Integer;
begin
   resp := -1;
   if n='S/N' then resp := 0;
   if resp = -1 then TryStrToInt(n, resp);

   result := resp;
end;

{ TTinyNF }

procedure TTinyNF.btPesqClick(Sender: TObject);
 var d:String;
    resp:WideString;
    servt : TTiny;
    i, j, noDoc, noTab, volNf: Integer;
    s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12 : String;
    e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12 : String;
    vlrNF, vTotal, vMedio, conta, pesoNF, vlrFrete: Double;

    filtro : boolean;

begin
  IBGE.ConectaIBGE;
  btRast.Enabled := false;
  if not ckVisual.Checked then btRast.Enabled := true;

  // *********************************************
  /// [1] Ler o WEBservice
  // *********************************************
  d := FormatDateTime('dd/MM/yyyy', dt1.DateTime);
  servt := TTiny.Create;
  resp := servt.Nota_PesqData(d);
  servt.Destroy;

  Memo1.Clear;
  Memo1.Lines.Append(resp);
  {
  Memo1.Lines[0] := Memo1.Lines[0].Replace('UTF-8', 'ISO-8859-1');
  Memo1.Lines[1] := Memo1.Lines[1].Replace('_', '');
  Memo1.Lines[2] := Memo1.Lines[1].Replace('_', '');
  Memo1.Lines[3] := Memo1.Lines[3].Replace('_', '');
  }

  // *********************************************
  /// [2] Salvar e Carregar no objeto
  // *********************************************
  XMLDocument1.XML.Clear;
  XMLDocument1.XML.Append(resp);
  XMLDocument1.Active := true;

  if not DirectoryExists('c:\MZp\xmlAPI') then  CreateDir('c:\MZp\xmlAPI');

  Memo1.Lines.SaveToFile('c:\MZp\xmlAPI\XML_'+FormatDateTime('yyyy MM dd HHmm',Now)+ '.XML');

  // *********************************************
  /// [3] Inserir na Tabela
  // *********************************************

      Tab.Active := false;
      Tab.EmptyTable;
      Tab.Active := true;

      noDoc := 2;
      noDoc := XMLDocument1.DocumentElement.ChildNodes.Count;
      Memo1.Lines.Append(noDoc.ToString);
        vTotal := 0;
        conta := 0;
      //for i := 0 to 0 do
      s1 := XMLDocument1.DocumentElement.ChildNodes['status_processamento'].NodeValue;
      if s1 = '3' then
      begin
        noTab := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes.Count;
        Memo1.Lines.Append(noTab.ToString);

        for j := 0 to noTab - 1 do
        begin
          vlrNF := 0;
          volNf := 0;
          pesoNF := 5;
          vlrFrete := 0;
          //s1  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].NodeName;
          s1  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['numero'].NodeValue;
          s2  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['serie'].NodeValue;
          //s3  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['endereco'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['cep'].NodeValue <>Null then
            s3  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['cep'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['bairro'].NodeValue <> null then
            s4  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['bairro'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['cidade'].NodeValue <>Null then
            s8  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['cidade'].NodeValue;

          s5  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['tipo'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['numero_ecommerce'].NodeValue <> null then
            s6  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['numero_ecommerce'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['transportador'].ChildNodes['nome'].NodeValue <> null then
            s7  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['transportador'].ChildNodes['nome'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['valor'].NodeValue <> null then
          begin
            s9  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['valor'].NodeValue;
            vlrNF := StrToFloat( s9.Replace('.', ',') );
          end;

          s10  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['nome'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['cpf_cnpj'].NodeValue <> null then
            s11  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['cpf_cnpj'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['ie'].NodeValue <> null then
            s12  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['ie'].NodeValue;

         //s12  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['situacao'].NodeValue;

          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['endereco'].NodeValue <>Null then
            e1  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['endereco'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['numero'].NodeValue <>Null then
            e2  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['numero'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['complemento'].NodeValue <>Null then
            e3  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['complemento'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['uf'].NodeValue <>Null then
            e4  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['endereco_entrega'].ChildNodes['uf'].NodeValue;

          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['chave_acesso'].NodeValue <>Null then
            e5  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['chave_acesso'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['valor_frete'].NodeValue <> Null then
            e6  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['valor_frete'].NodeValue;
            vlrFrete :=  StrToFloat( e6.Replace('.', ',') );
          e7  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['id'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['fone'].NodeValue <> null then
            e8  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['cliente'].ChildNodes['fone'].NodeValue;
          if XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['codigo_rastreamento'].NodeValue <> null then
            e9  := XMLDocument1.DocumentElement.ChildNodes['notas_fiscais'].ChildNodes[j].ChildNodes['codigo_rastreamento'].NodeValue;

          filtro := ckVisual.Checked;

          // s12 - situacao = 6 = Autorizada
          //if (s7='total_express:0') and (s8 = 'São Paulo') and (s12='6') then
          //if (s7='total_express:0') and (s12='6') then
          //if (s8 = 'São Paulo') and (s12='6') then
          if ((s7='flaydel:485')) or (filtro) then
          begin
            vTotal := vTotal + vlrNF;
            conta := conta + 1;

            Tab.Insert;
            TabnumNF.Value := StrToInt(s1);
            TabSerieNF.Value := StrToInt(s2);
            TabCEP.Value := SoNumeros(s3);
            TabLocali.Value := s4;
            TabCidade.Value := s8;
            TabTipo.Value := s5;
            TabNumPed.Value := s6;
            TabTransp.Value := s7;
            TabValorNF.Value := vlrNF;
            TabNomeDest.Value := s10;
            TabdocDest.Value := SoNumeros(s11);
            Tabie.Value :=  SonUmeros(s12);

            // Endereço de Entrega
            TabEnder.Value := e1;
            TabNumero.Value := EndNum(e2);
            TabComp.Value := e3;
            TabEstado.Value := e4;
            TabChaveNF.Value := e5;
            Tabvfrete.Value := vlrFrete;
            TabidNF.Value := StrToInt(e7);
            tabfone.Value := e8;

            TabCodMun.Value:= '';
            TabVolume.Value := 0;
            TabvPeso.Value:= 0;

            Tab.Post;
          end;  // filtro

          //s2  := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['nRoma'].NodeValue;
          //Memo1.Lines.Append(' ['+j.ToString+']. '+ s1+ ' '+ s2 + '.. '+s3+ '/'+s4);
        end;
          // *********************************************
          /// [4] Completar a Tabela 1 (CodMun)
          // *********************************************
          Tab.First;
          if not ckVisual.Checked then
          begin
            Tab.First;
            while not Tab.Eof do
            begin
              // codMun no S3 =====================
              s1 := TabCidade.Value;
              s2 := TabEstado.Value;

              s3 := '';
              if s1='São Paulo' then s3 := '3550308' else s3 := CodM(s1, s2);

              Tab.Edit;
              TabCodMun.Value := s3;
              Tab.Post;


              Tab.Next;
            end;
          end;
            // *********************************************
            /// [4] Completar a Tabela 1 (CodMun)
            // *********************************************

            Tempor.Enabled := false;
            Tempor.Interval:= 4000;
            pb.Min:= 0;
            pb.Max:= Tab.RecordCount;
            pb.Position := 0;

            if (Tab.RecordCount>0) then
            begin
               Tab.First;
               if (not ckVisual.Checked) and (Tab.RecordCount>0) then  Tempor.Enabled := true;
            end;

        // *********************************************
        /// [5] Finaliza
        // *********************************************

            if conta > 0 then vMedio := vTotal / conta;
            StatusBar1.Panels[0].Text := 'Notas '+conta.ToString+ ' de '+ Tab.RecordCount.ToString;
            StatusBar1.Panels[1].Text := 'Total '+vTotal.ToString;
            StatusBar1.Panels[2].Text := 'Valor Médio '+FormatFloat('#,##0.00', vMedio);


      end
      else
      begin
        s2 := XMLDocument1.DocumentElement.ChildNodes['codigo_erro'].NodeValue;

        s4 := 'Erro desconhecido';
        if s2 = '1' then s4 := 'token não informado';
        if s2 = '2' then s4 := 'token inválido ou não encontrado';
        if s2 = '3' then s4 := 'XML mal formado ou com erros';
        if s2 = '4' then s4 := 'Erro de procesamento de XML';
        if s2 = '5' then s4 := 'API bloqueada ou sem acesso';
        if s2 = '6' then s4 := 'API bloqueada momentaneamente - muitos acessos no último minuto';
        if s2 = '7' then s4 := 'Espaço da empresa Esgotado';
        if s2 = '8' then s4 := 'Empresa Bloqueada';
        if s2 = '9' then s4 := 'Números de sequencia em duplicidade';
        if s2 = '10' then s4 := 'Parametro não informado';
        if s2 = '20' then s4 := 'A Consulta não retornou registros';
        if s2 = '21' then s4 := 'A Consulta retornou muitos registros';
        if s2 = '22' then s4 := 'O xml tem mais registros que o permitido por lote de envio';
        if s2 = '23' then s4 := 'A página que você está tentanto obter não existe';
        if s2 = '30' then s4 := 'Erro de Duplicidade de Registro';
        if s2 = '31' then s4 := 'Erros de Validação';
        if s2 = '32' then s4 := 'Registro não localizado';
        if s2 = '33' then s4 := 'Registro localizado em duplicidade';
        if s2 = '34' then s4 := 'Nota Fiscal não autorizada';
        if s2 = '99' then s4 := 'Sistema em manutenção';

        StatusBar1.Panels[0].Text := 'ERRO ';
        StatusBar1.Panels[1].Text := 'Código '+s2;
        StatusBar1.Panels[2].Text := 'Mens.: '+s4;

      end;

end;


procedure TTinyNF.BtrastClick(Sender: TObject);
begin
  fase := 1;
  pb.Position := 1;
  Tab.First;
  TemporRast.Enabled := true;
end;

procedure TTinyNF.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 1;
end;

procedure TTinyNF.Entrar;
begin
  cbCli.Clear;
  idC := 2;
  dt1.DateTime := Now;
  dt2.DateTime := Now;
end;

procedure TTinyNF.TemporRastTimer(Sender: TObject);
  var servt : TTiny;
     resp :Integer;
     sresp, s1 : string;

begin
  if (fase = 1) then
  begin
    if (Not Tab.Eof) then
    begin
      pb.Position := pb.Position + 1;
      servt := TTiny.Create;
      sresp := servt.Pedido_Pesquisar(TabNumPed.AsInteger);
      servt.Destroy;

      XMLDocument1.Active := false;
      XMLDocument1.XML.Clear;
      XMLDocument1.XML.Append(sresp);
      XMLDocument1.Active := true;
      Memo1.Clear;
      Memo1.Lines.Append(sresp);

      s1  := XMLDocument1.DocumentElement.ChildNodes['pedidos'].ChildNodes['pedido'].ChildNodes['id'].NodeValue;

      Tab.Edit;
      TabidPed.Value := StrToInt(s1);
      Tab.Post;


      Tab.Next;
    end
    else
    begin
      fase := 2;
      Tab.First;
    end;
  end;

  if fase = 2 then
  begin
    if (Not Tab.Eof) then
    begin
      pb.Position := pb.Position + 1;
      servt := TTiny.Create;
      sresp := servt.nota_rastreio(TabidPed.Value, TabnumNF.Value, TabTransp.Value);
      servt.Destroy;

      Memo1.Clear;
      Memo1.Lines.Append(sresp);


      Tab.Next;
    end
    else fase := 3;
  end;

  if fase = 3 then
  begin
    TemporRast.Enabled := false;
    ShowMessage('Processo terminado!');
  end;

end;

procedure TTinyNF.TemporTimer(Sender: TObject);

  var     servt : TTiny;
          resp : WideString;
          s0, s1, s2 : String;
          vlrPeso : Double;
          qtVol : Integer;
begin
  if Not (Tab.Eof)  then
  begin
    pb.Position := pb.Position + 1;

    servt := TTiny.Create;
    resp := servt.Nota_MostrarID(TabidNf.Value);
    servt.Destroy;

    Memo1.Clear;
    Memo1.Lines.Append(resp);

    XMLDocument1.Active := false;
    XMLDocument1.XML.Clear;
    XMLDocument1.XML.Append(resp);
    XMLDocument1.Active := true;

    s0  := XMLDocument1.DocumentElement.ChildNodes['status_processamento'].NodeValue;

    if s0='3' then
    begin
      s1 := '0'; s2 := '0';
       qtVol  := XMLDocument1.DocumentElement.ChildNodes['nota_fiscal'].ChildNodes['itens'].ChildNodes.Count;
;
      if XMLDocument1.DocumentElement.ChildNodes['nota_fiscal'].ChildNodes['peso_bruto'].NodeValue<>null then
        s2  := XMLDocument1.DocumentElement.ChildNodes['nota_fiscal'].ChildNodes['peso_bruto'].NodeValue;

      vlrPeso :=  StrToFloat( s2.Replace('.', ',') );

      Tab.Edit;
      TabVolume.Value := qtVol;
      TabvPeso.Value  := vlrPeso;
      Tab.Post;
    end;

    Tab.Next;
  end
  else
    begin
      pb.Max := Tab.RecordCount+1;
      pb.Position := 1;
      Tempor.Enabled := false;
      ShowMessage('Processo terminado!');

      servt := TTiny.Create;

      Tab.Last;
      while not Tab.Bof do
      begin
        pb.Position := pb.Position + 1;
        servt.Nota_Salvar(TabnumNF.Value, TabSerieNF.Value, TabVolume.Value, TabNumero.Value, TabValorNF.Value,TabvPeso.Value, TabCEP.Value, TabLocali.Value,
          TabNomeDest.Value, tabfone.value, TabdocDest.Value, TabEnder.Value, TabComp.Value, TabCidade.Value, TabCodMun.Value, TabEstado.Value, Tabie.Value,TabChaveNF.Value );

        Tab.Prior;
      end;
      servt.Destroy
    end;

end;

end.
