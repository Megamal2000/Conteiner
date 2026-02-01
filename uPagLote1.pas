unit uPagLote1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TPagLote1 = class(TForm)
    Label1: TLabel;
    edLote: TEdit;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entra (q:smallint; total:Double; idPG:Integer; dt1, dt2: TDateTime);
  end;

var
  PagLote1: TPagLote1;
  quant:smallint;
  vTotal : Double;
  idP : Integer;
  data1, data2 : TDateTime;
implementation

{$R *.dfm}

uses uBanco, uPagR1;


procedure TPagLote1.Entra(q: smallint; total:Double; idPG:Integer; dt1, dt2: TDateTime);
begin
  quant := q;
  vtotal := total;
  idP   := idPg;
  data1 := dt1;
  data2 := dt2;
end;

procedure TPagLote1.btOKClick(Sender: TObject);

var idLote : Integer;
    Bco : TBco;

begin
  if (Length(edLote.Text)>0) then
  begin
    Bco := TBco.Create;
    idLote := Bco.PagLote_Inserir(edLote.Text,quant,vTotal);
    Bco.Destroy;

    with PagR1 do
    begin
      Tab.First;
      while not Tab.Eof do
      begin
        Bco := TBco.Create;
        //Bco.Pag
        Bco.Destroy;

        Tab.Next;
      end;
    end;
  end;
end;


end.
