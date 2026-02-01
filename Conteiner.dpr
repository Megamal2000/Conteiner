program Conteiner;

uses
  Forms,
  uPrinc in 'uPrinc.pas' {Princ},
  uDM1 in 'uDM1.pas' {DM1: TDataModule},
  uDM2 in 'uDM2.pas' {DM2: TDataModule},
  uLib in 'uLib.pas',
  utmpConexao in 'utmpConexao.pas' {tmpConexao},
  utmpAcesso in 'utmpAcesso.pas' {tmpAcesso},
  utmpTela in 'utmpTela.pas' {tmpTela},
  ucadUser1 in 'ucadUser1.pas' {cadUser1},
  uBanco in 'uBanco.pas',
  ucadUser2 in 'ucadUser2.pas' {cadUser2},
  utmpEntra in 'utmpEntra.pas' {tmpEntra},
  usmpPreco in 'usmpPreco.pas' {smpPreco},
  usmpGrupo in 'usmpGrupo.pas' {smpGrupo},
  usmpModelo in 'usmpModelo.pas' {smpModelo},
  ucadCli in 'ucadCli.pas' {cadCli},
  ucadFuncs in 'ucadFuncs.pas' {cadFuncs},
  upsqCli in 'upsqCli.pas' {psqCli},
  usrvEnt in 'usrvEnt.pas' {srvEnt},
  upsqFuncs in 'upsqFuncs.pas' {psqFuncs},
  ucadPlaca in 'ucadPlaca.pas' {cadPlaca},
  ucliEscolhe in 'ucliEscolhe.pas' {cliEscolhe},
  Global in 'Global.pas',
  ucadProd in 'ucadProd.pas' {cadProd},
  upqProd in 'upqProd.pas' {pqProd},
  uConfig in 'uConfig.pas' {Config},
  uEstoque in 'uEstoque.pas',
  uVisualEst in 'uVisualEst.pas' {VisualEst},
  uNotas in 'uNotas.pas' {NotasP},
  uNotasPQ in 'uNotasPQ.pas' {NotasPQ},
  uDM3 in 'uDM3.pas' {DM3: TDataModule},
  uRoman in 'uRoman.pas' {Roman},
  uRoma in 'uRoma.pas',
  uWebEnv in 'uWebEnv.pas' {WebEnv},
  service1 in 'service1.pas',
  uRegiao in 'uRegiao.pas' {Regiao},
  uRegiaoPQ in 'uRegiaoPQ.pas' {RegiaoPQ},
  uRomaSem in 'uRomaSem.pas' {RomaSem},
  uWebRec in 'uWebRec.pas' {WebRec},
  uRomaRes in 'uRomaRes.pas' {RomaRes},
  uControlR in 'uControlR.pas' {ControlR},
  uControlT in 'uControlT.pas' {ControlT},
  uResto in 'uResto.pas' {Resto},
  uOcorre in 'uOcorre.pas' {Ocorre},
  uOcorrePQ in 'uOcorrePQ.pas' {OcorrePQ},
  uReet in 'uReet.pas' {Reet},
  uControlL in 'uControlL.pas' {ControlL},
  uDataS in 'uDataS.pas' {DataS},
  uFrete1 in 'uFrete1.pas' {Frete1},
  uFTPeso in 'uFTPeso.pas' {FTPeso},
  uFTEnt in 'uFTEnt.pas' {FTEnt},
  uRel1 in 'uRel1.pas' {RelGer},
  uRel2 in 'uRel2.pas' {Rel2},
  uRel3 in 'uRel3.pas' {Rel3},
  uRel4 in 'uRel4.pas' {Rel4},
  uNegocio in 'uNegocio.pas',
  uExpEdi in 'uExpEdi.pas' {expEdi},
  uEDIoco in 'uEDIoco.pas',
  uFTSaida in 'uFTSaida.pas' {FTSaida},
  uEDIconh in 'uEDIconh.pas',
  uEDIdoc in 'uEDIdoc.pas',
  uFTcont in 'uFTcont.pas' {FTCont},
  uContDias in 'uContDias.pas' {ContDias},
  uPagCont in 'uPagCont.pas' {PagCont},
  uPagNota in 'uPagNota.pas' {PagNota},
  uPagDiv in 'uPagDiv.pas' {PagDiv},
  uPagms in 'uPagms.pas',
  uPagR1 in 'uPagR1.pas' {PagR1},
  uPagVale in 'uPagVale.pas' {PagVale},
  uImpXLS in 'uImpXLS.pas' {ImpXLS},
  uOcorreNF in 'uOcorreNF.pas' {OcorreNF},
  uFTcont2 in 'uFTcont2.pas' {FTcont2},
  uCob1 in 'uCob1.pas' {Cob1},
  uCob2 in 'uCob2.pas' {Cob2},
  uSimula in 'uSimula.pas' {Simula},
  uExcel2 in 'uExcel2.pas' {Excel2},
  uAguarde in 'uAguarde.pas' {Aguarde},
  uContCob in 'uContCob.pas' {ContCob},
  uContSalv in 'uContSalv.pas' {ContSalv},
  uContImp in 'uContImp.pas' {ContImp},
  uContPag in 'uContPag.pas' {ContPag},
  uRespXL in 'uRespXL.pas' {RespXL},
  uRomaPQ in 'uRomaPQ.pas' {RomaPQ},
  uAverb in 'uAverb.pas' {Averb},
  uListaRe in 'uListaRe.pas' {ListaRe},
  uDM4 in 'uDM4.pas' {DM4: TDataModule},
  uAverbacao in 'uAverbacao.pas',
  uSemTK in 'uSemTK.pas' {SemTK},
  uListaFunc in 'uListaFunc.pas' {ListaFunc},
  uConhLista in 'uConhLista.pas' {ConhLista},
  uConhImp in 'uConhImp.pas' {ConhImp},
  uImp in 'uImp.pas',
  uPagFunc in 'uPagFunc.pas' {PagFunc},
  uFTtaxa in 'uFTtaxa.pas' {FTtaxa},
  uNFfora in 'uNFfora.pas' {NFfora},
  uNFconta in 'uNFconta.pas' {NFconta},
  uCobOut in 'uCobOut.pas' {CobOut},
  uNotasCOM in 'uNotasCOM.pas' {NotasCOM},
  uTikDev in 'uTikDev.pas' {TikDev},
  uTikDev2 in 'uTikDev2.pas' {TikDev2},
  upsqCar in 'upsqCar.pas' {psqCar},
  utikDT in 'utikDT.pas' {tikDT},
  uTikCol in 'uTikCol.pas' {TikCol},
  uTikCol2 in 'uTikCol2.pas' {TikCol2},
  uExped in 'uExped.pas' {Exped},
  uGanhoM in 'uGanhoM.pas' {GanhoM},
  uBaixaRb in 'uBaixaRb.pas' {BaixaRb},
  uPagCred in 'uPagCred.pas' {PagCred},
  uPagLote1 in 'uPagLote1.pas' {PagLote1},
  uListaServ in 'uListaServ.pas' {ListaServ},
  uPagFunc2 in 'uPagFunc2.pas' {PagFunc2},
  uCarro in 'uCarro.pas' {Carro},
  upqCarC in 'upqCarC.pas' {pqCarC},
  upqCarM in 'upqCarM.pas' {pqCarM},
  uAvisoCfg in 'uAvisoCfg.pas' {avisoCfg},
  uAvisoVe in 'uAvisoVe.pas' {avisoVe},
  uAvisos in 'uAvisos.pas',
  uAvisoPQ in 'uAvisoPQ.pas' {AvisoPQ},
  uWebAtual in 'uWebAtual.pas' {WebAtual},
  uNFreent in 'uNFreent.pas' {NFreent},
  uTktxls in 'uTktxls.pas' {Tktxls},
  uScanner in 'uScanner.pas',
  uFotoT in 'uFotoT.pas' {FotoT},
  uMailmz in 'uMailmz.pas',
  uTktxls2 in 'uTktxls2.pas' {Tktxls2},
  uCTe in 'uCTe.pas',
  uCtePad in 'uCtePad.pas' {CTePad},
  uCteGer in 'uCteGer.pas' {CTeGer},
  uIBGE in 'uIBGE.pas' {IBGE},
  uSemCob in 'uSemCob.pas' {SemCob},
  uCteDet in 'uCteDet.pas' {CteDet},
  uCteOut in 'uCteOut.pas' {CteOut},
  uCteClass in 'uCteClass.pas' {CteClass},
  uImpXML in 'uImpXML.pas' {impXML},
  uMotList in 'uMotList.pas' {MotList},
  uPagGrupo in 'uPagGrupo.pas' {pagGrupo},
  uPagLista in 'uPagLista.pas' {PagLista},
  uPagVe in 'uPagVe.pas' {PagVe},
  uPagPago in 'uPagPago.pas' {PagPago},
  uCliGP in 'uCliGP.pas' {cliGP},
  uCota1 in 'uCota1.pas' {Cota1},
  uCota2 in 'uCota2.pas' {Cota2},
  uStokCentral in 'uStokCentral.pas' {stkCentral},
  uStokContrato in 'uStokContrato.pas' {stokContrato},
  uNFcli in 'uNFcli.pas' {NFcli},
  uImprimeXML in 'uImprimeXML.pas' {ImprimeXML},
  uGraficos in 'uGraficos.pas' {Graficos},
  uStokCV in 'uStokCV.pas' {StokCV},
  uAltCob in 'uAltCob.pas' {AltCob},
  uCobZero in 'uCobZero.pas' {CobZero},
  uNotas2 in 'uNotas2.pas' {Notas2},
  uNfPQ in 'uNfPQ.pas' {nfPQ},
  uWebSEM in 'uWebSEM.pas' {WebSEM},
  uEntDia in 'uEntDia.pas' {EntDia},
  uEstatCli in 'uEstatCli.pas' {EstatCli},
  uEstatistica in 'uEstatistica.pas',
  uEstatMOT in 'uEstatMOT.pas' {EstatMOT},
  service in 'service.pas',
  uNivel in 'uNivel.pas' {Nivel},
  uRastreio in 'uRastreio.pas',
  uSMSenv in 'uSMSenv.pas' {SMSenv},
  uSMSclasse in 'uSMSclasse.pas',
  uPrazo in 'uPrazo.pas' {Prazo},
  uPrazoDet in 'uPrazoDet.pas' {PrazoDet},
  uRotas in 'uRotas.pas' {Rotas},
  uDM5 in 'uDM5.pas' {DM5: TDataModule},
  uRotasAdm in 'uRotasAdm.pas' {RotasAdm},
  uBipCEP in 'uBipCEP.pas' {BipCEP},
  uCobr2 in 'uCobr2.pas' {Cobr2},
  uSemCli in 'uSemCli.pas' {SemCli},
  uDiarioCli in 'uDiarioCli.pas' {DiarioCli},
  uCobranca in 'uCobranca.pas',
  uBaixaRap in 'uBaixaRap.pas' {BaixaRap},
  uBipRoma in 'uBipRoma.pas' {BipRoma},
  uDiasCria in 'uDiasCria.pas' {DiasCria},
  uNFsegue in 'uNFsegue.pas' {NFsegue},
  uTraducaoBR in 'uTraducaoBR.pas',
  uFinContas in 'uFinContas.pas' {FinContas},
  uFinanceiro in 'uFinanceiro.pas',
  uFinContab in 'uFinContab.pas' {FinContab},
  uFinPrev in 'uFinPrev.pas' {FinPrev},
  uFinRelC in 'uFinRelC.pas' {FinRelC},
  uFinRelP in 'uFinRelP.pas' {FinRelP},
  uPendeVisual in 'uPendeVisual.pas' {PendVisual},
  uClassNotas in 'uClassNotas.pas',
  uPrazos in 'uPrazos.pas' {Prazos},
  uPrazo2 in 'uPrazo2.pas' {Prazo2},
  uNFsegue2 in 'uNFsegue2.pas' {NFsegue2},
  uInuteis in 'uInuteis.pas' {Inuteis},
  uBIPnota in 'uBIPnota.pas' {BIPnota},
  uNFManual in 'uNFManual.pas' {NfManual},
  uBIP2 in 'uBIP2.pas' {BIP2},
  uBIPclass in 'uBIPclass.pas',
  uCadBanco in 'uCadBanco.pas' {CadBanco},
  uDocCob in 'uDocCob.pas' {DocCob},
  uRespCte in 'uRespCte.pas' {RespCte},
  uReenviarOco in 'uReenviarOco.pas' {ReenviaOco},
  uPagDeta in 'uPagDeta.pas' {PagDeta},
  uCtePQ in 'uCtePQ.pas' {CtePQ},
  uNFenvio in 'uNFenvio.pas' {NFenvio},
  uWebBaixa in 'uWebBaixa.pas' {WebBaixa},
  api2 in 'api2.pas',
  servTiny in 'servTiny.pas',
  uTinyNF in 'uTinyNF.pas' {TinyNF},
  uCobv in 'uCobv.pas',
  uCteEdit in 'uCteEdit.pas' {CteEdit},
  uCubagem in 'uCubagem.pas' {Cubagem},
  uWEBsinc in 'uWEBsinc.pas' {WEBsinc},
  uREST in 'uREST.pas',
  uSACnotas in 'uSACnotas.pas' {SACnotas},
  uEnviaRest in 'uEnviaRest.pas' {EnviaRest},
  veBarra in 'veBarra.pas' {eBarra},
  veDM in 'veDM.pas' {eDM: TDataModule},
  veBanco in 'veBanco.pas',
  veEstoque in 'veEstoque.pas',
  veCadatro in 'veCadatro.pas' {eCadastro},
  gBanco in 'gBanco.pas',
  veNFs in 'veNFs.pas' {eNFs},
  veGerencial in 'veGerencial.pas' {eGerencial},
  veConfig in 'veConfig.pas' {eConfig},
  uCTeXML in 'uCTeXML.pas' {CTeXML},
  uCTeVer in 'uCTeVer.pas' {CTeVer},
  uFrete in 'uFrete.pas' {Frete},
  uProc1 in 'uProc1.pas',
  uExcelComp in 'uExcelComp.pas',
  uDiasUteis in 'uDiasUteis.pas',
  uRetornaR in 'uRetornaR.pas' {RetornaR},
  uWebSinc2 in 'uWebSinc2.pas' {WEBsinc2},
  ServiceLW in 'ServiceLW.pas',
  uTemp in 'uTemp.pas' {Temp},
  uCTeErros in 'uCTeErros.pas' {CteErros},
  uNFdia in 'uNFdia.pas' {NFdia},
  uOcorreCli in 'uOcorreCli.pas' {OcorreCli},
  uEnviarRest2 in 'uEnviarRest2.pas' {EnviarRest2},
  ExcelResponde in 'ExcelResponde.pas',
  veDocVer in 'veDocVer.pas' {DocVer},
  veImportaP in 'veImportaP.pas' {eImportaPr},
  veImportaNF in 'veImportaNF.pas' {eImportaNF},
  veImportaAvanti in 'veImportaAvanti.pas' {eImportaAvanti},
  vejAltQUant in 'vejAltQUant.pas' {ejAltQuant},
  veStok in 'veStok.pas' {eStok},
  uEnviaRest3 in 'uEnviaRest3.pas' {EnviaRest3};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Conteiner';
  TTraducao.ChangeValues;
  Application.CreateForm(TPrinc, Princ);
  Application.CreateForm(TtmpConexao, tmpConexao);
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TDM2, DM2);
  Application.CreateForm(TDM3, DM3);
  Application.CreateForm(TtmpAcesso, tmpAcesso);
  Application.CreateForm(TcadUser1, cadUser1);
  Application.CreateForm(TcadUser2, cadUser2);
  Application.CreateForm(TtmpEntra, tmpEntra);
  Application.CreateForm(TsmpPreco, smpPreco);
  Application.CreateForm(TsmpGrupo, smpGrupo);
  Application.CreateForm(TsmpModelo, smpModelo);
  Application.CreateForm(TcadCli, cadCli);
  Application.CreateForm(TcadFuncs, cadFuncs);
  Application.CreateForm(TpsqCli, psqCli);
  Application.CreateForm(TsrvEnt, srvEnt);
  Application.CreateForm(TpsqFuncs, psqFuncs);
  Application.CreateForm(TcadPlaca, cadPlaca);
  Application.CreateForm(TcliEscolhe, cliEscolhe);
  Application.CreateForm(TcadProd, cadProd);
  Application.CreateForm(TpqProd, pqProd);
  Application.CreateForm(TConfig, Config);
  Application.CreateForm(TVisualEst, VisualEst);
  Application.CreateForm(TNotasP, NotasP);
  Application.CreateForm(TNotasPQ, NotasPQ);
  Application.CreateForm(TRoman, Roman);
  Application.CreateForm(TWebEnv, WebEnv);
  Application.CreateForm(TRegiao, Regiao);
  Application.CreateForm(TRegiaoPQ, RegiaoPQ);
  Application.CreateForm(TRomaSem, RomaSem);
  Application.CreateForm(TWebRec, WebRec);
  Application.CreateForm(TRomaRes, RomaRes);
  Application.CreateForm(TControlR, ControlR);
  Application.CreateForm(TControlT, ControlT);
  Application.CreateForm(TResto, Resto);
  Application.CreateForm(TOcorre, Ocorre);
  Application.CreateForm(TOcorrePQ, OcorrePQ);
  Application.CreateForm(TReet, Reet);
  Application.CreateForm(TControlL, ControlL);
  Application.CreateForm(TDataS, DataS);
  Application.CreateForm(TFrete1, Frete1);
  Application.CreateForm(TFTPeso, FTPeso);
  Application.CreateForm(TFTEnt, FTEnt);
  Application.CreateForm(TRelGer, RelGer);
  Application.CreateForm(TRel2, Rel2);
  Application.CreateForm(TRel3, Rel3);
  Application.CreateForm(TRel4, Rel4);
  Application.CreateForm(TexpEdi, expEdi);
  Application.CreateForm(TFTSaida, FTSaida);
  Application.CreateForm(TFTCont, FTCont);
  Application.CreateForm(TContDias, ContDias);
  Application.CreateForm(TPagCont, PagCont);
  Application.CreateForm(TPagNota, PagNota);
  Application.CreateForm(TPagDiv, PagDiv);
  Application.CreateForm(TPagR1, PagR1);
  Application.CreateForm(TPagVale, PagVale);
  Application.CreateForm(TImpXLS, ImpXLS);
  Application.CreateForm(TOcorreNF, OcorreNF);
  Application.CreateForm(TFTcont2, FTcont2);
  Application.CreateForm(TCob1, Cob1);
  Application.CreateForm(TCob2, Cob2);
  Application.CreateForm(TSimula, Simula);
  Application.CreateForm(TExcel2, Excel2);
  Application.CreateForm(TAguarde, Aguarde);
  Application.CreateForm(TContCob, ContCob);
  Application.CreateForm(TContSalv, ContSalv);
  Application.CreateForm(TContImp, ContImp);
  Application.CreateForm(TContPag, ContPag);
  Application.CreateForm(TRespXL, RespXL);
  Application.CreateForm(TRomaPQ, RomaPQ);
  Application.CreateForm(TAverb, Averb);
  Application.CreateForm(TListaRe, ListaRe);
  Application.CreateForm(TDM4, DM4);
  Application.CreateForm(TSemTK, SemTK);
  Application.CreateForm(TListaFunc, ListaFunc);
  Application.CreateForm(TConhLista, ConhLista);
  Application.CreateForm(TConhImp, ConhImp);
  Application.CreateForm(TPagFunc, PagFunc);
  Application.CreateForm(TFTtaxa, FTtaxa);
  Application.CreateForm(TNFfora, NFfora);
  Application.CreateForm(TNFconta, NFconta);
  Application.CreateForm(TCobOut, CobOut);
  Application.CreateForm(TNotasCOM, NotasCOM);
  Application.CreateForm(TTikDev, TikDev);
  Application.CreateForm(TTikDev2, TikDev2);
  Application.CreateForm(TpsqCar, psqCar);
  Application.CreateForm(TtikDT, tikDT);
  Application.CreateForm(TTikCol, TikCol);
  Application.CreateForm(TTikCol2, TikCol2);
  Application.CreateForm(TExped, Exped);
  Application.CreateForm(TGanhoM, GanhoM);
  Application.CreateForm(TBaixaRb, BaixaRb);
  Application.CreateForm(TPagCred, PagCred);
  Application.CreateForm(TPagLote1, PagLote1);
  Application.CreateForm(TListaServ, ListaServ);
  Application.CreateForm(TPagFunc2, PagFunc2);
  Application.CreateForm(TCarro, Carro);
  Application.CreateForm(TpqCarC, pqCarC);
  Application.CreateForm(TpqCarM, pqCarM);
  Application.CreateForm(TavisoCfg, avisoCfg);
  Application.CreateForm(TavisoVe, avisoVe);
  Application.CreateForm(TAvisoPQ, AvisoPQ);
  Application.CreateForm(TWebAtual, WebAtual);
  Application.CreateForm(TNFreent, NFreent);
  Application.CreateForm(TTktxls, Tktxls);
  Application.CreateForm(TFotoT, FotoT);
  Application.CreateForm(TTktxls2, Tktxls2);
  Application.CreateForm(TCTePad, CTePad);
  Application.CreateForm(TCTeGer, CTeGer);
  Application.CreateForm(TIBGE, IBGE);
  Application.CreateForm(TSemCob, SemCob);
  Application.CreateForm(TCteDet, CteDet);
  Application.CreateForm(TCteOut, CteOut);
  Application.CreateForm(TCteClass, CteClass);
  Application.CreateForm(TimpXML, impXML);
  Application.CreateForm(TMotList, MotList);
  Application.CreateForm(TpagGrupo, pagGrupo);
  Application.CreateForm(TPagLista, PagLista);
  Application.CreateForm(TPagVe, PagVe);
  Application.CreateForm(TPagPago, PagPago);
  Application.CreateForm(TcliGP, cliGP);
  Application.CreateForm(TCota1, Cota1);
  Application.CreateForm(TCota2, Cota2);
  Application.CreateForm(TstkCentral, stkCentral);
  Application.CreateForm(TstokContrato, stokContrato);
  Application.CreateForm(TNFcli, NFcli);
  Application.CreateForm(TImprimeXML, ImprimeXML);
  Application.CreateForm(TGraficos, Graficos);
  Application.CreateForm(TStokCV, StokCV);
  Application.CreateForm(TAltCob, AltCob);
  Application.CreateForm(TCobZero, CobZero);
  Application.CreateForm(TNotas2, Notas2);
  Application.CreateForm(TnfPQ, nfPQ);
  Application.CreateForm(TWebSEM, WebSEM);
  Application.CreateForm(TEntDia, EntDia);
  Application.CreateForm(TEstatCli, EstatCli);
  Application.CreateForm(TEstatMOT, EstatMOT);
  Application.CreateForm(TNivel, Nivel);
  Application.CreateForm(TSMSenv, SMSenv);
  Application.CreateForm(TPrazo, Prazo);
  Application.CreateForm(TPrazoDet, PrazoDet);
  Application.CreateForm(TRotas, Rotas);
  Application.CreateForm(TDM5, DM5);
  Application.CreateForm(TRotasAdm, RotasAdm);
  Application.CreateForm(TBipCEP, BipCEP);
  Application.CreateForm(TCobr2, Cobr2);
  Application.CreateForm(TSemCli, SemCli);
  Application.CreateForm(TDiarioCli, DiarioCli);
  Application.CreateForm(TBaixaRap, BaixaRap);
  Application.CreateForm(TBipRoma, BipRoma);
  Application.CreateForm(TDiasCria, DiasCria);
  Application.CreateForm(TNFsegue, NFsegue);
  Application.CreateForm(TFinContas, FinContas);
  Application.CreateForm(TFinContab, FinContab);
  Application.CreateForm(TFinPrev, FinPrev);
  Application.CreateForm(TFinRelC, FinRelC);
  Application.CreateForm(TFinRelP, FinRelP);
  Application.CreateForm(TPendVisual, PendVisual);
  Application.CreateForm(TPrazos, Prazos);
  Application.CreateForm(TPrazo2, Prazo2);
  Application.CreateForm(TNFsegue2, NFsegue2);
  Application.CreateForm(TInuteis, Inuteis);
  Application.CreateForm(TBIPnota, BIPnota);
  Application.CreateForm(TNfManual, NfManual);
  Application.CreateForm(TBIP2, BIP2);
  Application.CreateForm(TCadBanco, CadBanco);
  Application.CreateForm(TDocCob, DocCob);
  Application.CreateForm(TRespCte, RespCte);
  Application.CreateForm(TReenviaOco, ReenviaOco);
  Application.CreateForm(TPagDeta, PagDeta);
  Application.CreateForm(TCtePQ, CtePQ);
  Application.CreateForm(TNFenvio, NFenvio);
  Application.CreateForm(TWebBaixa, WebBaixa);
  Application.CreateForm(TTinyNF, TinyNF);
  Application.CreateForm(TCteEdit, CteEdit);
  Application.CreateForm(TCubagem, Cubagem);
  Application.CreateForm(TWEBsinc, WEBsinc);
  Application.CreateForm(TSACnotas, SACnotas);
  Application.CreateForm(TEnviaRest, EnviaRest);
  Application.CreateForm(TeBarra, eBarra);
  Application.CreateForm(TeDM, eDM);
  Application.CreateForm(TeCadastro, eCadastro);
  Application.CreateForm(TeNFs, eNFs);
  Application.CreateForm(TeGerencial, eGerencial);
  Application.CreateForm(TeConfig, eConfig);
  Application.CreateForm(TCTeXML, CTeXML);
  Application.CreateForm(TCTeVer, CTeVer);
  Application.CreateForm(TFrete, Frete);
  Application.CreateForm(TRetornaR, RetornaR);
  Application.CreateForm(TWEBsinc2, WEBsinc2);
  Application.CreateForm(TTemp, Temp);
  Application.CreateForm(TCteErros, CteErros);
  Application.CreateForm(TNFdia, NFdia);
  Application.CreateForm(TOcorreCli, OcorreCli);
  Application.CreateForm(TEnviarRest2, EnviarRest2);
  Application.CreateForm(TDocVer, DocVer);
  Application.CreateForm(TeImportaPr, eImportaPr);
  Application.CreateForm(TeImportaNF, eImportaNF);
  Application.CreateForm(TeImportaAvanti, eImportaAvanti);
  Application.CreateForm(TejAltQuant, ejAltQuant);
  Application.CreateForm(TeStok, eStok);
  Application.CreateForm(TEnviaRest3, EnviaRest3);
  Application.Run;
end.
