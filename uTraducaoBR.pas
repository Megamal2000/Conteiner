unit uTraducaoBR;

interface

uses
  Windows, consts;
Type
  TTraducao = Class
    private
      class procedure SetResourceString(xOldResourceString: PResStringRec;
                                         xValueChanged: PChar);
    public
      class procedure ChangeValues;
  End;

implementation

class procedure TTraducao.SetResourceString(xOldResourceString: PResStringRec;
                                           xValueChanged: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^),
                 PAGE_EXECUTE_READWRITE, @POldProtect);
   xOldResourceString^.Identifier := Integer(xValueChanged);
   VirtualProtect(xOldResourceString,SizeOf(xOldResourceString^),POldProtect,
                  @POldProtect);
end;

class procedure TTraducao.ChangeValues;
begin
  SetResourceString(@SMsgDlgYes, 'Sim');
  SetResourceString(@SMsgDlgWarning,'Atenção');
  SetResourceString(@SMsgDlgError, 'Erro');
  SetResourceString(@SMsgDlgInformation,'Information');
  SetResourceString(@SMsgDlgConfirm , 'Confirm');
  SetResourceString(@SMsgDlgYes , '&Sim');
  SetResourceString(@SMsgDlgNo , '&Não');
  SetResourceString(@SMsgDlgOK , 'OK');
  SetResourceString(@SMsgDlgCancel , 'Cancelar');
  SetResourceString(@SMsgDlgHelp , '&Ajuda');
  SetResourceString(@SMsgDlgHelpHelp , 'Ajuda');
  SetResourceString(@SMsgDlgAbort , '&Abortar');
  SetResourceString(@SMsgDlgRetry , '&Repetir');
  SetResourceString(@SMsgDlgIgnore , '&Ignorar');
  SetResourceString(@SMsgDlgAll , '&Tudo');
  SetResourceString(@SMsgDlgNoToAll , 'N&ao para Tudo');
  SetResourceString(@SMsgDlgYesToAll , 'Sim para &Tudo');
  SetResourceString(@SMsgDlgClose , '&Fechar');
end;



end.
