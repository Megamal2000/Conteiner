unit veDocVer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvDataSource, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, Vcl.StdCtrls, DataSnap.DBClient,
  Vcl.Buttons;

type
  TDocVer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    lbOpcArm: TLabel;
    lbOpcMov: TLabel;
    lbOpcSeg: TLabel;
    lbOpcPack: TLabel;
    lbOpcExped: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lbDoc: TLabel;
    lbTipo: TLabel;
    lbNF: TLabel;
    lbDataNF: TLabel;
    lbVol: TLabel;
    lbOrig: TLabel;
    lbDataCria: TLabel;
    lbStatus: TLabel;
    lbVProd: TLabel;
    lbVnf: TLabel;
    lbItens: TLabel;
    btImprimir: TBitBtn;
  private
    { Private declarations }
    CDSnota:TClientDataset;
  public
    { Public declarations }
    procedure setCDS(cds:TClientDataset);
    procedure Entrar;
  end;

var
  DocVer: TDocVer;

implementation

{$R *.dfm}

uses veEstoque, veDM;

procedure Preenche();
  var Stok : TStok;
      cor : Integer;
begin
  Stok := TStok.Create;
  with DocVer do
  begin
    lbDoc.Caption := CDsnota.Fields[12].Value;
    lbTipo.Caption := Stok.moTipo( CDsnota.Fields[5].AsString );
    lbNF.Caption := CDsnota.Fields[2].Value;
    lbdataNF.Caption := CDsnota.Fields[4].Value;
    lbVol.Caption := CDsnota.Fields[9].Value;

    lbOrig.Caption := Stok.moOrigem( CDsnota.Fields[10].Value );
    lbDataCria.Caption := CDsnota.Fields[3].Value;
    lbStatus.Caption := Stok.moStatus( CDsnota.Fields[11].Value );

    lbVProd.Caption := CDsnota.Fields[7].Value;
    lbVnf.Caption := CDsnota.Fields[6].Value;
    lbItens.Caption := CDsnota.Fields[8].Value;

    Stok.moItens(CDsnota.Fields[0].Value);

    cor := clBtnFace;
    if (CDsnota.Fields[15].Value=1) then cor := clYellow else cor := clBtnFace;
    lbOpcArm.Color := cor;
    lbOPcArm.Refresh;
    if (CDsnota.Fields[16].Value=1) then cor := clYellow else cor := clBtnFace;
    lbOpcMov.Color := cor;
    if (CDsnota.Fields[17].Value=1) then cor := clYellow else cor := clBtnFace;
    lbOpcSeg.Color := cor;
    if (CDsnota.Fields[18].Value=1) then cor := clYellow else cor := clBtnFace;
    lbOpcPack.Color := cor;
    if (CDsnota.Fields[19].Value=1) then cor := clYellow else cor := clBtnFace;
    lbOpcExped.Color := cor;


  end;
  Stok.Destroy;
end;

{ TDocVer }

procedure TDocVer.Entrar;
begin
  Preenche();
end;

procedure TDocVer.setCDS(cds: TClientDataset);
begin
  CDSnota := cds;
end;

end.
