unit uPagGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DateUtils;

type
  TpagGrupo = class(TForm)
    Label1: TLabel;
    lbInic: TLabel;
    Label3: TLabel;
    lbFim: TLabel;
    Ano: TLabel;
    lbAno: TLabel;
    Label4: TLabel;
    edDesc: TEdit;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  pagGrupo: TpagGrupo;
  dt1, dt2 : TDateTime;
  nAno : Integer;


implementation

uses uPagR1, uBanco, uDM4;

{$R *.dfm}

procedure TpagGrupo.Entrar;
begin
  with pagGrupo do
  begin
    lbInic.Caption := '';
    lbFim.Caption  := '';
    lbAno.Caption  := '';
    edDesc.Text    := '';

    dt1 := PagR1.dat1.dateTime;
    dt2 := PagR1.dat2.DateTime;
    nAno := YearOf(Now);

    lbInic.Caption := FormatDateTime('dd/MM/yyyy',dt1);
    lbFim.Caption  := FormatDateTime('dd/MM/yyyy',dt2);;
    lbAno.Caption  := IntToStr(nAno);

  end;
end;

procedure TpagGrupo.btSalvarClick(Sender: TObject);

var Bco : Tbco;
    idPg : Integer;
begin
  if (Length(edDesc.Text) > 3) then
  begin
    Bco := TBco.Create;
    idPg := Bco.PagGrupo_Grupoinsere(nAno, edDesc.Text, dt1, dt2 );
    with PagR1 do
    begin
      Tab.First;
      while not Tab.Eof do
      begin
        if (TabServ.Value > 0) and (TabTotal.Value<>0) then
          Bco.PagGrupo_ItensInsere(idPg, TabidMot.Value, TabServ.Value, TabCreditos.Value, TabVales.Value, TabTotal.Value);
        Tab.Next;
      end;
    end;
    Bco.Destroy;
    PagGrupo.Hide;
  end
  else
    Showmessage('É necessário preencher a descrição');
end;

procedure TpagGrupo.btCancelarClick(Sender: TObject);
begin
  Paggrupo.Hide;
end;

end.
