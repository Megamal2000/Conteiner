unit uClassNotas;

interface

uses
  DB, uDM5, uDM2, uBanco, SysUtils;

  type
  TNotas = class(TObject)
     private

     public
     function Ve_Motivo(mot:Integer):String;

  end;
implementation

{ TNotas }

function TNotas.Ve_Motivo(mot: Integer): String;

   var resp, listaDev, sMotivo : String;

begin
  sMotivo := IntToStr(mot);
  resp := 'reentrega';
  if (mot = 1) then resp := 'entregue';
  listaDev := DM2.Lista('TB_OCORR',' USO = 2','id', true);
  if (Pos(','+sMotivo+',', listaDev)>0) then resp := 'devolve';


  Ve_Motivo := resp;
end;

end.
