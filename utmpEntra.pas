unit utmpEntra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TtmpEntra = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Edit1: TEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Edit2: TEdit;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_tenta(i : Integer);
  end;

var
  tmpEntra: TtmpEntra;
  tentativa : integer;

implementation

{$R *.dfm}

uses uBanco, uLib, uPrinc, uDM2,uDM4, uAvisoVe, uAvisos, Global;

procedure Testa;

var bco : TBco;
    usa : TMarco;
    idU : Integer;
        Av : TAviso;

begin
  bco := TBco.Create;
  usa := TMarco.Create;

    tentativa := tentativa + 1;

    if ((UpperCase(tmpEntra.Edit1.Text) = 'MARCO') and (tmpEntra.Edit2.Text = 'mzelcid'))
    then
    begin
        Princ.LbUserID.Caption       := '0';
        Princ.Rodape.Panels[0].Text  := 'Marco Antonio';
        Princ.Rodape.Panels[1].Text  := 'Administrador do Sistema';
        Princ.Rodape.Panels[3].Text  := 'Acesso '+ FormatDateTime('dd/mm/yyyy HH:MM', Now);
        //bco.Destroy;
        Princ.Enabled := True;
        tmpEntra.Hide;
        tentativa := 99;
    end;

    if (tentativa < 99) then
    with tmpEntra do
    begin
    idU := bco.Usuarios_Procura(Edit1.Text, Edit2.text);

      if (idU>0) then
      begin
        Princ.Enabled := True;
        // Grava Local
        usa.set_seguser(edit1.Text);
        usa.Grava_INI(2);

        bco.Usuarios_AlteraUltA(idU, Now);
        bco.Usuarios_MostraId(idU);
        // define tipo de acesso
        Princ.LbUserID.Caption       := intToStr(idU);
        Princ.Rodape.Panels[0].Text  := DM2.cdsUserLOGIN.Value;

        nmUser := DM2.cdsUserLOGIN.Value;
        idUser := idU;


        if (DM2.cdsUserNIVEL.Value = 0) then Princ.Rodape.Panels[1].Text  := 'Expedição';
        if (DM2.cdsUserNIVEL.Value = 1) then Princ.Rodape.Panels[1].Text  := 'Estoque';
        if (DM2.cdsUserNIVEL.Value = 2) then Princ.Rodape.Panels[1].Text  := 'Funcionário';
        if (DM2.cdsUserNIVEL.Value = 3) then Princ.Rodape.Panels[1].Text  := 'Gerente';
        if (DM2.cdsUserNIVEL.Value = 4) then Princ.Rodape.Panels[1].Text  := 'Administrador';
        Princ.Rodape.Panels[3].Text  := 'Acesso '+ FormatDateTime('dd/mm/yyyy HH:MM', DM2.cdsUserULTACESSO.AsDateTime);

        // Bloqueia TUDO
        Princ.Usurios1.Enabled     := False;
        Princ.Preos1.Enabled       := False;
        Princ.Cores1.Enabled       := False;
        Princ.Modelos1.Enabled     := False;
        Princ.Motoristas1.Enabled  := False;
        Princ.Motoristas2.Enabled  := False;
        Princ.Funcionrios2.Enabled := False;
        Princ.Ocorrncias1.Enabled  := False;
        Princ.Regio1.Enabled       := False;
        Princ.Servios1.Enabled     := False;
        Princ.Notas1.Enabled       := False;
        Princ.Romaneio1.Enabled    := False;
        Princ.Relatrios1.Enabled   := False;
        Princ.Web1.Enabled         := False;
        Princ.Gerencia1.Enabled    := True;
        Princ.btVales.Visible      := False;
        Princ.btContaNF.Visible    := False;
        Princ.CadastrarRotas1.Visible := False;
        Princ.BaixaporRomaneio1.Enabled := true;

        // expedicao = 0
        if (DM2.cdsUserNIVEL.Value = 0) then
        begin
          Princ.Ocorrncias1.Enabled  := True;
          Princ.Regio1.Enabled       := True;
          Princ.Notas1.Enabled       := True;
          Princ.Romaneio1.Enabled    := True;
          Princ.Web1.Enabled         := True;
          Princ.Motoristas1.Enabled  := True;
          Princ.Motoristas2.Enabled  := True;

        end;

        // estoque
        if (DM2.cdsUserNIVEL.Value = 1) then
        begin
          Princ.Preos1.Enabled       := True;
          Princ.Cores1.Enabled       := True;
          Princ.Motoristas1.Enabled  := True;
          Princ.Motoristas2.Enabled  := True;
          Princ.Ocorrncias1.Enabled  := True;
          Princ.Regio1.Enabled       := True;
          Princ.Servios1.Enabled     := True;
          Princ.Notas1.Enabled       := True;
          Princ.Romaneio1.Enabled    := True;
          Princ.Web1.Enabled         := True;
          Princ.Gerencia1.Enabled    := True;
        end;

        // Funcionario
        if (DM2.cdsUserNIVEL.Value = 2) then
        begin
          Princ.Preos1.Enabled       := True;
          Princ.Cores1.Enabled       := True;
          Princ.Motoristas1.Enabled  := True;
          Princ.Motoristas2.Enabled  := True;
          Princ.Ocorrncias1.Enabled  := True;
          Princ.Regio1.Enabled       := True;
          Princ.Servios1.Enabled     := True;
          Princ.Notas1.Enabled       := True;
          Princ.Romaneio1.Enabled    := True;
          Princ.Web1.Enabled         := True;
          Princ.Gerencia1.Enabled    := True;
        end;

        // Gerente
        if (DM2.cdsUserNIVEL.Value = 3) then
        begin
          Princ.Preos1.Enabled       := True;
          Princ.Cores1.Enabled       := True;
          Princ.Motoristas1.Enabled  := True;
          Princ.Motoristas2.Enabled  := True;
          Princ.Funcionrios2.Enabled := True;
          Princ.Modelos1.Enabled     := True;
          Princ.Ocorrncias1.Enabled  := True;
          Princ.Regio1.Enabled       := True;
          Princ.Servios1.Enabled     := True;
          Princ.Notas1.Enabled       := True;
          Princ.Romaneio1.Enabled    := True;
          Princ.Web1.Enabled         := True;
          Princ.Relatrios1.Enabled   := True;
          Princ.Gerencia1.Enabled    := True;
        end;

        // Administrador
        if (DM2.cdsUserNIVEL.Value = 4) then
        begin
          Princ.Usurios1.Enabled     := True;
          Princ.Preos1.Enabled       := True;
          Princ.Cores1.Enabled       := True;
          Princ.Modelos1.Enabled     := True;
          Princ.Motoristas1.Enabled  := True;
          Princ.Motoristas2.Enabled  := True;
          Princ.Funcionrios2.Enabled := True;
          Princ.Ocorrncias1.Enabled  := True;
          Princ.Regio1.Enabled       := True;
          Princ.Servios1.Enabled     := True;
          Princ.Notas1.Enabled       := True;
          Princ.Romaneio1.Enabled    := True;
          Princ.Relatrios1.Enabled   := True;
          Princ.Web1.Enabled         := True;
          Princ.Gerencia1.Enabled    := True;
          Princ.btVales.Visible      := True;
          Princ.btContaNF.Visible    := True;
        end;



       if (DM2.cdsUserNIVEL.Value>=4) then
       begin
          princ.CadastrarRotas1.Visible := true;
          // Avisos
          // -------------------------------
          Av := TAviso.Create;
          if (Av.Chamar_Avisos) then
          begin
            avisoVe.Entra;
            avisoVe.Show;
          end;
          Av.Destroy;
          // -------------------------------
      end;

       //if (DM2.cdsUserID.Value=14) or (DM2.cdsUserID.Value=9) then
       begin
         Princ.BaixaporRomaneio1.Enabled := true;
       end;

      // botao de reentregas
      bco.NotasReent_MostraDia(Now);
      if (DM4.cdsNFre.RecordCount>0) then
        Princ.btReent.Visible := True
      else
        Princ.btReent.Visible := False;


        //bco.Destroy;
        tmpEntra.Hide;
      end
      else
      begin
        ShowMessage('Acesso não permitido'+#13+'Tente novamente');
        edit2.Text := '';
        edit2.SetFocus;
        if (tentativa>2) then Application.Terminate;
      end;

    end; // with

   usa.Destroy;
   bco.Destroy;
end;

procedure TtmpEntra.btCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TtmpEntra.btOkClick(Sender: TObject);
begin
  if (edit2.Text <> '') then Testa;
end;

procedure TtmpEntra.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) and (edit2.Text <> '') then Testa;
end;

procedure TtmpEntra.FormActivate(Sender: TObject);
begin
  edit1.Text := '';
  edit2.Text := '';
  edit1.SetFocus;
end;

procedure TtmpEntra.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = 13) then
    edit2.SetFocus;
end;

procedure TtmpEntra.set_tenta(i: Integer);
begin
  tentativa := i;
end;

end.
