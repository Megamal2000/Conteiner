unit uFinanceiro;

interface

uses SysUtils, Vcl.ComCtrls, uBanco, uDM5, Vcl.StdCtrls;

Type
  TFin = class(TObject)
    private
      Bco : TBco;

    public
      procedure Preenche_Esquema(var TV:TTreeView);
      function  Seleciona_Item(absIndex:Integer):Integer;
      function  Calcula_NovoNivel(NivelAtual:Smallint):Smallint;
      procedure Salvar(idF:Integer; Nivel, Status:Smallint; NomeConta:String);
      procedure Preenche_Combo(var cbFin:TComboBox);
      function  Apagar(iNivel:Smallint):Smallint;

  end;

implementation

{ TFin }

function TFin.Apagar(iNivel: Smallint): Smallint;
begin
  Bco := TBco.Create;
  Bco.Fin_Conta_Apagar(iNivel);
  Bco.Destroy;
end;

function TFin.Calcula_NovoNivel(NivelAtual: Smallint): Smallint;
var resp, ni, r, op : Smallint;
begin
  resp := 0;
  if (DM5.cdsFinC.RecordCount>0) then
  begin
    ni := DM5.cdsFinCNIVEL.Value;
    if ni mod 100 = 0 then
    begin
      r := ni div 100;
      op := r*100 + 10;
      while (not DM5.cdsFinC.Eof) and (DM5.cdsFinCNIVEL.Value<(r+1)*100) do
      begin
        if (op <= DM5.cdsFinCNIVEL.Value) then
          op := op + 10;
        DM5.cdsFinC.Next;
      end;
      if (op = (r+1)*100) then resp := 99 else resp := op;
    end
    else
    if ni mod 10 = 0 then
    begin
      r := ni div 10;
      op := r*10 + 1;
      while (not DM5.cdsFinC.Eof) and (DM5.cdsFinCNIVEL.Value<(r+1)*10) do
      begin
        if (op <= DM5.cdsFinCNIVEL.Value) then
          op := op + 1;
        DM5.cdsFinC.Next;
      end;
      if (op = (r+1)*10) then resp := 99 else resp := op;

    end;

  end;

  Calcula_NovoNivel := resp;

end;

procedure TFin.Preenche_Combo(var cbFin: TComboBox);

var Cam1, Cam2:String;
    ni : Smallint;

begin
  Bco := TBco.Create;
  Bco.Fin_Conta_Mostra(2);
  Bco.Destroy;

  cbFin.Clear;
  Cam1 := '';
  DM5.cdsFinC.First;
  while not (DM5.cdsFinC.Eof) do
  begin
    ni := DM5.cdsFinCNIVEL.Value;
    if (ni mod 100 = 0) then
    begin
      Cam1 := DM5.cdsFinCNOMECONTA.Value;
      cbFin.Items.Append(Cam1);
    end
    else if (ni mod 10 = 0) then
    begin
      Cam2 :=  Cam1 + '\' + DM5.cdsFinCNOMECONTA.Value;
      cbFin.Items.Append(Cam2);
    end
    else  cbFin.Items.Append(Cam2 + '\' + DM5.cdsFinCNOMECONTA.Value);

    DM5.cdsFinC.Next;
  end;
end;

procedure TFin.Preenche_Esquema(var TV:TTreeView);

var
  Nivel1, Nivel2: TTreeNode;
  ni : Smallint;

begin
  Bco := TBco.Create;
  Bco.Fin_Conta_Mostra(2);
  Bco.Destroy;

  TV.Items.Clear;
  DM5.cdsFinC.First;
  while not (DM5.cdsFinC.Eof) do
  begin
    ni := DM5.cdsFinCNIVEL.Value;
    if (ni mod 100 = 0) then Nivel1 :=  TV.Items.Add(nil, DM5.cdsFinCNOMECONTA.Value)
    else if (ni mod 10 = 0) then Nivel2 := TV.Items.AddChild(Nivel1, DM5.cdsFinCNOMECONTA.Value)
    else  TV.Items.AddChild(Nivel2, DM5.cdsFinCNOMECONTA.Value);

    DM5.cdsFinC.Next;
  end;
  TV.FullExpand;

end;

procedure TFin.Salvar(idF:Integer; Nivel, Status: Smallint; NomeConta: String);

begin
  Bco := TBco.Create;
  if (idF=0) then
    Bco.Fin_Conta_Insere(Nivel, NomeConta);
  if (idF>0) then
    Bco.Fin_Conta_Altera(idF, Nivel, Status, NomeConta);
  Bco.Destroy;
end;

function TFin.Seleciona_Item(absIndex: Integer): Integer;
var i, resp : Integer;

begin
  resp := 0;
  if (DM5.cdsFinC.RecordCount>0) then
  begin
    DM5.cdsFinC.First;
    for i := 0 to absIndex-1 do DM5.cdsFinC.Next;
    resp := DM5.cdsFinCNIVEL.Value;
  end;

  Seleciona_Item := resp;
end;

end.
