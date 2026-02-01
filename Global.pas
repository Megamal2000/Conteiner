unit Global;

interface

var idCli, idUser, idNFpesquisa : Integer;
    nmCli, nmUser : String;
    dtSistema : TDateTime;
    dtPag1, dtPag2 : TDateTime;
    // =================   Estoque
    eCli : Integer;

Const
  ATIVO = 1;
  INATIVO = 0;

  NF_STATUS_INICIADO = 0;
  NF_STATUS_PRONTO = 1;
  NF_STATUS_CONFERIDO = 2;
  NF_STATUS_ESTOQUE = 3;
  NF_STATUS_CANCELADO = 4;



  implementation

end.
 