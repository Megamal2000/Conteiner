unit usrvEnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TsrvEnt = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edPL1: TEdit;
    edPL2: TEdit;
    lbResp: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    lbPlaca: TLabel;
    Label4: TLabel;
    lbModelo: TLabel;
    Label6: TLabel;
    lbCor: TLabel;
    Label8: TLabel;
    lbTamanho: TLabel;
    Label3: TLabel;
    lbCli: TLabel;
    Label7: TLabel;
    lbDoc: TLabel;
    Panel3: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure edPL1Change(Sender: TObject);
    procedure edPL1KeyPress(Sender: TObject; var Key: Char);
    procedure edPL2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPL2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  srvEnt: TsrvEnt;

implementation

{$R *.dfm}

uses uDM1, uDM2, uBanco, uLib, ucadPlaca;

procedure Limpar();

begin
  with srvENt do
  begin
    edPL1.Text := '';
    edPL2.Text := '';
  end;
end;


procedure TsrvEnt.FormActivate(Sender: TObject);
begin
  Limpar;
end;

procedure TsrvEnt.edPL1Change(Sender: TObject);
begin
  if (Length(edPL1.Text)=3) then edPl2.SetFocus; 
end;

procedure TsrvEnt.edPL1KeyPress(Sender: TObject; var Key: Char);
begin
  if not ((Key in ['A' .. 'Z']) or (Key in ['a' .. 'z'] ) or (Key = chr(VK_BACK)) or (Key = chr(VK_DELETE))) then Key := #0;
end;

procedure TsrvEnt.edPL2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = VK_BACK) and  (Length( edPL2.Text) =0)) then edPL1.SetFocus;

end;

procedure Preenche(Placa : String);

var bco : TBco;
    usa : TMarco;
    tam : Integer;

begin
  bco := TBco.Create;
  usa := TMarco.Create;

 // bco.Placa_MostraPlaca(Placa);
  with srvEnt do
  begin
    // Placa
    lbPlaca.Caption    := DM1.cdsViewPlacaPLACA.Value;
    lbModelo.Caption   := DM1.cdsViewPlacaMODELO.Value;
    lbCor.Caption      := DM1.cdsViewPlacaCOR.Value;
    tam := DM1.cdsViewPlacaTAMANHO.Value;

    if (tam = 0) then lbTamanho.Caption  := 'Pequeno';
    if (tam = 1) then lbTamanho.Caption  := 'Médio';
    if (tam = 2) then lbTamanho.Caption  := 'Grande';
    if (tam = 3) then lbTamanho.Caption  := 'Especial';

    // Usuário
    lbCli.Caption      := DM1.cdsViewPlacaNOME.Value;
    if (DM1.cdsViewPlacaCPF.Value <> '') then
      lbDoc.Caption      := usa.Monta_DOC( DM1.cdsViewPlacaCPF.Value )
    else
      lbDoc.Caption      := usa.Monta_DOC( DM1.cdsViewPlacaCNPJ.Value );

  end;

end;


procedure TsrvEnt.edPL2KeyPress(Sender: TObject; var Key: Char);

var bco : TBco;
    Pl  : String;
    idv : Integer;


begin
  bco := TBco.Create;
  Pl := edPL1.Text + '-'+ edPL2.Text;
  if (Length( edPL2.Text) < 4) then lbResp.Caption := '';
  if (Length( edPL2.Text) = 4) and (key = #13) then
  begin
    //idv := bco.Veic_Existe(pl);

    if (idv>0) then
    begin
      lbResp.Caption := 'Placa encontrada';
      Preenche(Pl);
      Panel2.Visible := true;
    end;

    if (idv=0) then
    begin
      lbResp.Caption := 'Placa NÃO encontrada';
      Panel2.Visible := false;
      cadPlaca.set_Placa(Pl); 
      cadPlaca.Show;
    end;

  end;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;
end;

end.
