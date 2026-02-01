unit uWebBaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  JvMemoryDataset, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.ComCtrls, Vcl.ExtCtrls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TWebBaixa = class(TForm)
    Panel1: TPanel;
    dt1: TDateTimePicker;
    Label1: TLabel;
    dt2: TDateTimePicker;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    btBaixa: TBitBtn;
    TabNFid: TIntegerField;
    TabNFnum: TIntegerField;
    TabRetornoNUM: TIntegerField;
    TabRetornoDescr: TStringField;
    Memo1: TMemo;
    XMLDocument1: TXMLDocument;
    procedure btBaixaClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dt1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  WebBaixa: TWebBaixa;

implementation

{$R *.dfm}

uses uBanco, service, uDM4;


procedure TWebBaixa.btBaixaClick(Sender: TObject);

var resp, dirP : String;
    noDoc, noTab, i, Resp_i:Integer;
    sNotaID, sNotaNUM : String;
    Bco : TBco;
    idNF, roma, nNf, st, nMot, idMoto, Baixa2:Integer;
    sDt, stHr, sPerm, sDoc : String;

begin
  Memo1.Clear;
  Tab.Active := false;
  Tab.EmptyTable;
  Tab.Active := true;

  resp := '<M>';

  //resp := GetService1Soap().Sistema_XML(FormatDateTime('dd/MM/yyyy',dt1.DateTime), '7020856032');
  resp := GetServiceSoap().Lista_semBaixa(FormatDateTime('yyyy-MM-dd',dt1.DateTime), FormatDateTime('yyyy-MM-dd',dt2.DateTime), '7020856032');

  Memo1.Clear;
  Memo1.Lines.Append(resp);

  GetDir(0, dirP);
  Memo1.Lines.SaveToFile(dirP+'\xml\Notas_sem_Baixa_XML '+FormatDateTime('yyyy MM dd HH:mm',Now)+ '.XML');
  if (Length(resp) > 16) then
  begin
    XMLDocument1.LoadFromFile(dirP+'\xml\Notas_sem_Baixa_XML '+FormatDateTime('yyyy MM dd HH:mm',Now)+ '.XML');
    noDoc := XMLDocument1.ChildNodes[0].ChildNodes.Count;
    noTab := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes.Count;
    for i := 0 to noDoc - 1 do
    begin
      sNotaID := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['idNota'].NodeValue;
      sNotaNUM := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['nNota'].NodeValue;

      Tab.Insert;
      TabNFnum.Value := StrToInt(sNotaNUM);
      TabNFid.Value := StrToInt(sNotaID);
      Tab.Post;
    end;

    Bco := TBco.Create;

    Resp_i := 0;
    if Tab.RecordCount > 0 then
    for i := 1 to Tab.RecordCount do
    begin
      // Pesquisa Nota no sistema
      Bco.WebAt_Pesq3(TabNFid.Value);
      if DM4.cdsWEBc.RecordCount > 0 then
      begin
        if DM4.cdsWEBcNOCORR.Value> 0 then
        begin

          idNf := TabNFid.Value;
          roma := DM4.cdsWEBcROMANEIO.Value;
          nNf  := TabNFnum.Value;
          st   := DM4.cdsWEBcSTATUS_ENT.Value;
          nMot := DM4.cdsWEBcNOCORR.Value;
          idMoto := DM4.cdsWEBcLIGMOT.Value;

          sDt  := FormatDateTime('yyyy-MM-dd',DM4.cdsWEBcDTENT.Value);
          stHr := FormatDateTime('HH:mm',DM4.cdsWEBcHRENT.Value);
          sPerm:= '2458229467';
          sDoc := DM4.cdsWEBcDOCDEST.Value;


          Memo1.Lines.Append('id '+idNf.ToString+' roma '+ roma.ToString+ ' nNf '+nNf.ToString+' status '+st.ToString + ' data '+ sDT+ ' hora '+ stHr+ ' motivo '+ nMot.ToString+ ' P '+ sPerm+ ' Motorista '+ idMoto.ToString+ ' doc '+ sDoc);
          //ShowMessage('id '+idNf.ToString+' roma '+ roma.ToString+ ' nNf '+nNf.ToString+' status '+st.ToString + ' data '+ sDT+ ' hora '+ stHr+ ' motivo '+ nMot.ToString+ ' P '+ sPerm+ ' Motorista '+ idMoto.ToString+ ' doc '+ sDoc);
          // Altera os dados da Nota
          Resp_i := GetServiceSoap().Registra_Entrega3(idNf, roma, nNf,  st, sDT, stHr, nMot, sPerm, idMoto, sDoc);

         if Resp_i = 4 then
          begin
            if DM4.cdsWEBcBAIXA_ORIG.Value = 11 then Baixa2 := 1;
            if DM4.cdsWEBcBAIXA_ORIG.Value = 13 then Baixa2 := 3;
            Bco.Notas_MarcarBaixa2(DM4.cdsWEBcID.Value, Baixa2);
          end;
          // marca a resposta na tabela
          //if Resp_i > 0 then
          begin
            Tab.Edit;
            TabRetornoNUM.Value := Resp_i;
            if Resp_i = 4 then TabRetornoDescr.Value := 'Ok. Nota Alterada';
            if Resp_i = 5 then TabRetornoDescr.Value := 'SEM Permissão';
            if Resp_i = 7 then TabRetornoDescr.Value := 'Nota não encontrada';
            Tab.Post;
          end;
        end
        else
          begin
            Tab.Edit;
            TabRetornoNUM.Value := 10;
            TabRetornoDescr.Value := 'Nota SEM ocorrência!';
            Tab.Post;
          end;
      end
        else
          begin
            Resp_i := GetServiceSoap().Apaga_Notas_ID(TabNFid.Value, '7020856032');
            Tab.Edit;
            TabRetornoNUM.Value := 11;
            TabRetornoDescr.Value := 'ID inexistente. A Nota foi APAGADA !';
            Tab.Post;
          end;
      Tab.Next;
    end;
    ShowMessage('Foram processadas '+Tab.RecordCount.TosTring+ ' notas');
    Bco.Destroy;

  end;
end;

procedure TWebBaixa.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 3;
end;

procedure TWebBaixa.Entrar;
begin
  dt2.DateTime := Now -2;
  dt1.DateTime := Now -9;

  Tab.Active := false;
  Tab.EmptyTable;
  Tab.Active := true;


end;

procedure TWebBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Tab.Active := false;
end;

procedure TWebBaixa.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TabRetornoNUM.Value <> 4) then
  if not (gdSelected in State) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    JvDBGrid1.Canvas.Font.Color := clRed;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

end.
