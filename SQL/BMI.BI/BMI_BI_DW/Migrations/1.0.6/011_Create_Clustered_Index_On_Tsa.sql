-- <Migration ID="394fbbb1-f838-4b48-92aa-6f1eca3691b4" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_CCURRA_1] on [tsa].[ics_land_M3V10gen_POL_CCURRA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CCURRA_1] ON [tsa].[ics_land_M3V10gen_POL_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_CIDMAS_1] on [tsa].[ics_land_M3V10gen_POL_CIDMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CIDMAS_1] ON [tsa].[ics_land_M3V10gen_POL_CIDMAS] ([IDCONO], [IDSUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_CIDVEN_1] on [tsa].[ics_land_M3V10gen_POL_CIDVEN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CIDVEN_1] ON [tsa].[ics_land_M3V10gen_POL_CIDVEN] ([IICONO], [IISUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_CSYTAB_1] on [tsa].[ics_land_M3V10gen_POL_CSYTAB]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CSYTAB_1] ON [tsa].[ics_land_M3V10gen_POL_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_CSYTXH_1] on [tsa].[ics_land_M3V10gen_POL_CSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CSYTXH_1] ON [tsa].[ics_land_M3V10gen_POL_CSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_FGLEDG_1] on [tsa].[ics_land_M3V10gen_POL_FGLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FGLEDG_1] ON [tsa].[ics_land_M3V10gen_POL_FGLEDG] ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_FRCALP_1] on [tsa].[ics_land_M3V10gen_POL_FRCALP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FRCALP_1] ON [tsa].[ics_land_M3V10gen_POL_FRCALP] ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_FSCASH_1] on [tsa].[ics_land_M3V10gen_POL_FSCASH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FSCASH_1] ON [tsa].[ics_land_M3V10gen_POL_FSCASH] ([ESCONO], [ESDIVI], [ESTSTM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_FSLEDG_1] on [tsa].[ics_land_M3V10gen_POL_FSLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FSLEDG_1] ON [tsa].[ics_land_M3V10gen_POL_FSLEDG] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_FSLEDX_1] on [tsa].[ics_land_M3V10gen_POL_FSLEDX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FSLEDX_1] ON [tsa].[ics_land_M3V10gen_POL_FSLEDX] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_FSYTXH_1] on [tsa].[ics_land_M3V10gen_POL_FSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FSYTXH_1] ON [tsa].[ics_land_M3V10gen_POL_FSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MITAUN_1] on [tsa].[ics_land_M3V10gen_POL_MITAUN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MITAUN_1] ON [tsa].[ics_land_M3V10gen_POL_MITAUN] ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MITBAL_1] on [tsa].[ics_land_M3V10gen_POL_MITBAL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MITBAL_1] ON [tsa].[ics_land_M3V10gen_POL_MITBAL] ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MITFAC_1] on [tsa].[ics_land_M3V10gen_POL_MITFAC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MITFAC_1] ON [tsa].[ics_land_M3V10gen_POL_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MITLOC_1] on [tsa].[ics_land_M3V10gen_POL_MITLOC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MITLOC_1] ON [tsa].[ics_land_M3V10gen_POL_MITLOC] ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MITMAS_1] on [tsa].[ics_land_M3V10gen_POL_MITMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MITMAS_1] ON [tsa].[ics_land_M3V10gen_POL_MITMAS] ([MMCONO], [MMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MITVEN_1] on [tsa].[ics_land_M3V10gen_POL_MITVEN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MITVEN_1] ON [tsa].[ics_land_M3V10gen_POL_MITVEN] ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPDEPR_1] on [tsa].[ics_land_M3V10gen_POL_MPDEPR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPDEPR_1] ON [tsa].[ics_land_M3V10gen_POL_MPDEPR] ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPHEAD_1] on [tsa].[ics_land_M3V10gen_POL_MPHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPHEAD_1] ON [tsa].[ics_land_M3V10gen_POL_MPHEAD] ([IACONO], [IAPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPLIND_1] on [tsa].[ics_land_M3V10gen_POL_MPLIND]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPLIND_1] ON [tsa].[ics_land_M3V10gen_POL_MPLIND] ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPLINE_1] on [tsa].[ics_land_M3V10gen_POL_MPLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPLINE_1] ON [tsa].[ics_land_M3V10gen_POL_MPLINE] ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPLIRE_1] on [tsa].[ics_land_M3V10gen_POL_MPLIRE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPLIRE_1] ON [tsa].[ics_land_M3V10gen_POL_MPLIRE] ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPOEXP_1] on [tsa].[ics_land_M3V10gen_POL_MPOEXP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPOEXP_1] ON [tsa].[ics_land_M3V10gen_POL_MPOEXP] ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPOPLA_1] on [tsa].[ics_land_M3V10gen_POL_MPOPLA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPOPLA_1] ON [tsa].[ics_land_M3V10gen_POL_MPOPLA] ([POCONO], [POPLP2], [POPLPN], [POPLPS], [POPNLI], [POPNLS], [POPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPPOAD_1] on [tsa].[ics_land_M3V10gen_POL_MPPOAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPPOAD_1] ON [tsa].[ics_land_M3V10gen_POL_MPPOAD] ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPPOEX_1] on [tsa].[ics_land_M3V10gen_POL_MPPOEX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPPOEX_1] ON [tsa].[ics_land_M3V10gen_POL_MPPOEX] ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MPPOPA_1] on [tsa].[ics_land_M3V10gen_POL_MPPOPA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPPOPA_1] ON [tsa].[ics_land_M3V10gen_POL_MPPOPA] ([PTCONO], [PTPUNO], [PTPYDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MSYTXH_1] on [tsa].[ics_land_M3V10gen_POL_MSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MSYTXH_1] ON [tsa].[ics_land_M3V10gen_POL_MSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MSYTXL_1] on [tsa].[ics_land_M3V10gen_POL_MSYTXL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MSYTXL_1] ON [tsa].[ics_land_M3V10gen_POL_MSYTXL] ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_MWOPOL_1] on [tsa].[ics_land_M3V10gen_POL_MWOPOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MWOPOL_1] ON [tsa].[ics_land_M3V10gen_POL_MWOPOL] ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OCUSMA_1] on [tsa].[ics_land_M3V10gen_POL_OCUSMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OCUSMA_1] ON [tsa].[ics_land_M3V10gen_POL_OCUSMA] ([OKCONO], [OKCUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_ODHEAD_1] on [tsa].[ics_land_M3V10gen_POL_ODHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_ODHEAD_1] ON [tsa].[ics_land_M3V10gen_POL_ODHEAD] ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_ODLINE_1] on [tsa].[ics_land_M3V10gen_POL_ODLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_ODLINE_1] ON [tsa].[ics_land_M3V10gen_POL_ODLINE] ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OINVOH_1] on [tsa].[ics_land_M3V10gen_POL_OINVOH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OINVOH_1] ON [tsa].[ics_land_M3V10gen_POL_OINVOH] ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OINVOL_1] on [tsa].[ics_land_M3V10gen_POL_OINVOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OINVOL_1] ON [tsa].[ics_land_M3V10gen_POL_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OOHEAD_1] on [tsa].[ics_land_M3V10gen_POL_OOHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OOHEAD_1] ON [tsa].[ics_land_M3V10gen_POL_OOHEAD] ([OACONO], [OAORNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OOLINE_1] on [tsa].[ics_land_M3V10gen_POL_OOLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OOLINE_1] ON [tsa].[ics_land_M3V10gen_POL_OOLINE] ([OBCONO], [OBORNO], [OBPONR], [OBPOSX])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OPAYMD_1] on [tsa].[ics_land_M3V10gen_POL_OPAYMD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OPAYMD_1] ON [tsa].[ics_land_M3V10gen_POL_OPAYMD] ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OPAYMH_1] on [tsa].[ics_land_M3V10gen_POL_OPAYMH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OPAYMH_1] ON [tsa].[ics_land_M3V10gen_POL_OPAYMH] ([UJCONO], [UJPLNB], [UJPMNB])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10gen_POL_OSBSTD_1] on [tsa].[ics_land_M3V10gen_POL_OSBSTD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_OSBSTD_1] ON [tsa].[ics_land_M3V10gen_POL_OSBSTD] ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCPOSX], [UCWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_CCURRA_1] on [tsa].[ics_land_M3V10ved_POL_CCURRA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_CCURRA_1] ON [tsa].[ics_land_M3V10ved_POL_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_CIDMAS_1] on [tsa].[ics_land_M3V10ved_POL_CIDMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_CIDMAS_1] ON [tsa].[ics_land_M3V10ved_POL_CIDMAS] ([IDCONO], [IDSUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_CIDVEN_1] on [tsa].[ics_land_M3V10ved_POL_CIDVEN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_CIDVEN_1] ON [tsa].[ics_land_M3V10ved_POL_CIDVEN] ([IICONO], [IISUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_CSYTAB_1] on [tsa].[ics_land_M3V10ved_POL_CSYTAB]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_CSYTAB_1] ON [tsa].[ics_land_M3V10ved_POL_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_CSYTXH_1] on [tsa].[ics_land_M3V10ved_POL_CSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_CSYTXH_1] ON [tsa].[ics_land_M3V10ved_POL_CSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_FGLEDG_1] on [tsa].[ics_land_M3V10ved_POL_FGLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FGLEDG_1] ON [tsa].[ics_land_M3V10ved_POL_FGLEDG] ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_FRCALP_1] on [tsa].[ics_land_M3V10ved_POL_FRCALP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FRCALP_1] ON [tsa].[ics_land_M3V10ved_POL_FRCALP] ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_FSCASH_1] on [tsa].[ics_land_M3V10ved_POL_FSCASH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FSCASH_1] ON [tsa].[ics_land_M3V10ved_POL_FSCASH] ([ESCONO], [ESDIVI], [ESTSTM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_FSLEDG_1] on [tsa].[ics_land_M3V10ved_POL_FSLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FSLEDG_1] ON [tsa].[ics_land_M3V10ved_POL_FSLEDG] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_FSLEDX_1] on [tsa].[ics_land_M3V10ved_POL_FSLEDX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FSLEDX_1] ON [tsa].[ics_land_M3V10ved_POL_FSLEDX] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_FSYTXH_1] on [tsa].[ics_land_M3V10ved_POL_FSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FSYTXH_1] ON [tsa].[ics_land_M3V10ved_POL_FSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MITAUN_1] on [tsa].[ics_land_M3V10ved_POL_MITAUN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITAUN_1] ON [tsa].[ics_land_M3V10ved_POL_MITAUN] ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MITBAL_1] on [tsa].[ics_land_M3V10ved_POL_MITBAL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITBAL_1] ON [tsa].[ics_land_M3V10ved_POL_MITBAL] ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MITFAC_1] on [tsa].[ics_land_M3V10ved_POL_MITFAC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITFAC_1] ON [tsa].[ics_land_M3V10ved_POL_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MITLOC_1] on [tsa].[ics_land_M3V10ved_POL_MITLOC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITLOC_1] ON [tsa].[ics_land_M3V10ved_POL_MITLOC] ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MITMAS_1] on [tsa].[ics_land_M3V10ved_POL_MITMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITMAS_1] ON [tsa].[ics_land_M3V10ved_POL_MITMAS] ([MMCONO], [MMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MITVEN_1] on [tsa].[ics_land_M3V10ved_POL_MITVEN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITVEN_1] ON [tsa].[ics_land_M3V10ved_POL_MITVEN] ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPDEPR_1] on [tsa].[ics_land_M3V10ved_POL_MPDEPR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPDEPR_1] ON [tsa].[ics_land_M3V10ved_POL_MPDEPR] ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPHEAD_1] on [tsa].[ics_land_M3V10ved_POL_MPHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPHEAD_1] ON [tsa].[ics_land_M3V10ved_POL_MPHEAD] ([IACONO], [IAPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPLIND_1] on [tsa].[ics_land_M3V10ved_POL_MPLIND]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPLIND_1] ON [tsa].[ics_land_M3V10ved_POL_MPLIND] ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPLINE_1] on [tsa].[ics_land_M3V10ved_POL_MPLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPLINE_1] ON [tsa].[ics_land_M3V10ved_POL_MPLINE] ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPLIRE_1] on [tsa].[ics_land_M3V10ved_POL_MPLIRE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPLIRE_1] ON [tsa].[ics_land_M3V10ved_POL_MPLIRE] ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPOEXP_1] on [tsa].[ics_land_M3V10ved_POL_MPOEXP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPOEXP_1] ON [tsa].[ics_land_M3V10ved_POL_MPOEXP] ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPOPLA_1] on [tsa].[ics_land_M3V10ved_POL_MPOPLA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPOPLA_1] ON [tsa].[ics_land_M3V10ved_POL_MPOPLA] ([POCONO], [POPLP2], [POPLPN], [POPLPS], [POPNLI], [POPNLS], [POPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPPOAD_1] on [tsa].[ics_land_M3V10ved_POL_MPPOAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPPOAD_1] ON [tsa].[ics_land_M3V10ved_POL_MPPOAD] ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPPOEX_1] on [tsa].[ics_land_M3V10ved_POL_MPPOEX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPPOEX_1] ON [tsa].[ics_land_M3V10ved_POL_MPPOEX] ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MPPOPA_1] on [tsa].[ics_land_M3V10ved_POL_MPPOPA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPPOPA_1] ON [tsa].[ics_land_M3V10ved_POL_MPPOPA] ([PTCONO], [PTPUNO], [PTPYDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MSYTXH_1] on [tsa].[ics_land_M3V10ved_POL_MSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MSYTXH_1] ON [tsa].[ics_land_M3V10ved_POL_MSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MSYTXL_1] on [tsa].[ics_land_M3V10ved_POL_MSYTXL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MSYTXL_1] ON [tsa].[ics_land_M3V10ved_POL_MSYTXL] ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_MWOPOL_1] on [tsa].[ics_land_M3V10ved_POL_MWOPOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MWOPOL_1] ON [tsa].[ics_land_M3V10ved_POL_MWOPOL] ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OCUSMA_1] on [tsa].[ics_land_M3V10ved_POL_OCUSMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OCUSMA_1] ON [tsa].[ics_land_M3V10ved_POL_OCUSMA] ([OKCONO], [OKCUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_ODHEAD_1] on [tsa].[ics_land_M3V10ved_POL_ODHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_ODHEAD_1] ON [tsa].[ics_land_M3V10ved_POL_ODHEAD] ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_ODLINE_1] on [tsa].[ics_land_M3V10ved_POL_ODLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_ODLINE_1] ON [tsa].[ics_land_M3V10ved_POL_ODLINE] ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OINVOH_1] on [tsa].[ics_land_M3V10ved_POL_OINVOH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OINVOH_1] ON [tsa].[ics_land_M3V10ved_POL_OINVOH] ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OINVOL_1] on [tsa].[ics_land_M3V10ved_POL_OINVOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OINVOL_1] ON [tsa].[ics_land_M3V10ved_POL_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OOHEAD_1] on [tsa].[ics_land_M3V10ved_POL_OOHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OOHEAD_1] ON [tsa].[ics_land_M3V10ved_POL_OOHEAD] ([OACONO], [OAORNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OOLINE_1] on [tsa].[ics_land_M3V10ved_POL_OOLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OOLINE_1] ON [tsa].[ics_land_M3V10ved_POL_OOLINE] ([OBCONO], [OBORNO], [OBPONR], [OBPOSX])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OPAYMD_1] on [tsa].[ics_land_M3V10ved_POL_OPAYMD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OPAYMD_1] ON [tsa].[ics_land_M3V10ved_POL_OPAYMD] ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OPAYMH_1] on [tsa].[ics_land_M3V10ved_POL_OPAYMH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OPAYMH_1] ON [tsa].[ics_land_M3V10ved_POL_OPAYMH] ([UJCONO], [UJPLNB], [UJPMNB])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10ved_POL_OSBSTD_1] on [tsa].[ics_land_M3V10ved_POL_OSBSTD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OSBSTD_1] ON [tsa].[ics_land_M3V10ved_POL_OSBSTD] ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCPOSX], [UCWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_CCURRA_1] on [tsa].[ics_land_M3V10vil_POL_CCURRA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CCURRA_1] ON [tsa].[ics_land_M3V10vil_POL_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_CIDMAS_1] on [tsa].[ics_land_M3V10vil_POL_CIDMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CIDMAS_1] ON [tsa].[ics_land_M3V10vil_POL_CIDMAS] ([IDCONO], [IDSUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_CIDVEN_1] on [tsa].[ics_land_M3V10vil_POL_CIDVEN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CIDVEN_1] ON [tsa].[ics_land_M3V10vil_POL_CIDVEN] ([IICONO], [IISUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_CSYTAB_1] on [tsa].[ics_land_M3V10vil_POL_CSYTAB]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CSYTAB_1] ON [tsa].[ics_land_M3V10vil_POL_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_CSYTXH_1] on [tsa].[ics_land_M3V10vil_POL_CSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CSYTXH_1] ON [tsa].[ics_land_M3V10vil_POL_CSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_FGLEDG_1] on [tsa].[ics_land_M3V10vil_POL_FGLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FGLEDG_1] ON [tsa].[ics_land_M3V10vil_POL_FGLEDG] ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_FRCALP_1] on [tsa].[ics_land_M3V10vil_POL_FRCALP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FRCALP_1] ON [tsa].[ics_land_M3V10vil_POL_FRCALP] ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_FSCASH_1] on [tsa].[ics_land_M3V10vil_POL_FSCASH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FSCASH_1] ON [tsa].[ics_land_M3V10vil_POL_FSCASH] ([ESCONO], [ESDIVI], [ESTSTM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_FSLEDG_1] on [tsa].[ics_land_M3V10vil_POL_FSLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FSLEDG_1] ON [tsa].[ics_land_M3V10vil_POL_FSLEDG] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_FSLEDX_1] on [tsa].[ics_land_M3V10vil_POL_FSLEDX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FSLEDX_1] ON [tsa].[ics_land_M3V10vil_POL_FSLEDX] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_FSYTXH_1] on [tsa].[ics_land_M3V10vil_POL_FSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FSYTXH_1] ON [tsa].[ics_land_M3V10vil_POL_FSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MITAUN_1] on [tsa].[ics_land_M3V10vil_POL_MITAUN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITAUN_1] ON [tsa].[ics_land_M3V10vil_POL_MITAUN] ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MITBAL_1] on [tsa].[ics_land_M3V10vil_POL_MITBAL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITBAL_1] ON [tsa].[ics_land_M3V10vil_POL_MITBAL] ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MITFAC_1] on [tsa].[ics_land_M3V10vil_POL_MITFAC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITFAC_1] ON [tsa].[ics_land_M3V10vil_POL_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MITLOC_1] on [tsa].[ics_land_M3V10vil_POL_MITLOC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITLOC_1] ON [tsa].[ics_land_M3V10vil_POL_MITLOC] ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MITMAS_1] on [tsa].[ics_land_M3V10vil_POL_MITMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITMAS_1] ON [tsa].[ics_land_M3V10vil_POL_MITMAS] ([MMCONO], [MMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MITVEN_1] on [tsa].[ics_land_M3V10vil_POL_MITVEN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITVEN_1] ON [tsa].[ics_land_M3V10vil_POL_MITVEN] ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPDEPR_1] on [tsa].[ics_land_M3V10vil_POL_MPDEPR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPDEPR_1] ON [tsa].[ics_land_M3V10vil_POL_MPDEPR] ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPHEAD_1] on [tsa].[ics_land_M3V10vil_POL_MPHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPHEAD_1] ON [tsa].[ics_land_M3V10vil_POL_MPHEAD] ([IACONO], [IAPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPLIND_1] on [tsa].[ics_land_M3V10vil_POL_MPLIND]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPLIND_1] ON [tsa].[ics_land_M3V10vil_POL_MPLIND] ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPLINE_1] on [tsa].[ics_land_M3V10vil_POL_MPLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPLINE_1] ON [tsa].[ics_land_M3V10vil_POL_MPLINE] ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPLIRE_1] on [tsa].[ics_land_M3V10vil_POL_MPLIRE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPLIRE_1] ON [tsa].[ics_land_M3V10vil_POL_MPLIRE] ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPOEXP_1] on [tsa].[ics_land_M3V10vil_POL_MPOEXP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPOEXP_1] ON [tsa].[ics_land_M3V10vil_POL_MPOEXP] ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPOPLA_1] on [tsa].[ics_land_M3V10vil_POL_MPOPLA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPOPLA_1] ON [tsa].[ics_land_M3V10vil_POL_MPOPLA] ([POCONO], [POPLP2], [POPLPN], [POPLPS], [POPNLI], [POPNLS], [POPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPPOAD_1] on [tsa].[ics_land_M3V10vil_POL_MPPOAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPPOAD_1] ON [tsa].[ics_land_M3V10vil_POL_MPPOAD] ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPPOEX_1] on [tsa].[ics_land_M3V10vil_POL_MPPOEX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPPOEX_1] ON [tsa].[ics_land_M3V10vil_POL_MPPOEX] ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MPPOPA_1] on [tsa].[ics_land_M3V10vil_POL_MPPOPA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPPOPA_1] ON [tsa].[ics_land_M3V10vil_POL_MPPOPA] ([PTCONO], [PTPUNO], [PTPYDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MSYTXH_1] on [tsa].[ics_land_M3V10vil_POL_MSYTXH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MSYTXH_1] ON [tsa].[ics_land_M3V10vil_POL_MSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MSYTXL_1] on [tsa].[ics_land_M3V10vil_POL_MSYTXL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MSYTXL_1] ON [tsa].[ics_land_M3V10vil_POL_MSYTXL] ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_MWOPOL_1] on [tsa].[ics_land_M3V10vil_POL_MWOPOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MWOPOL_1] ON [tsa].[ics_land_M3V10vil_POL_MWOPOL] ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OCUSMA_1] on [tsa].[ics_land_M3V10vil_POL_OCUSMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OCUSMA_1] ON [tsa].[ics_land_M3V10vil_POL_OCUSMA] ([OKCONO], [OKCUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_ODHEAD_1] on [tsa].[ics_land_M3V10vil_POL_ODHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_ODHEAD_1] ON [tsa].[ics_land_M3V10vil_POL_ODHEAD] ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_ODLINE_1] on [tsa].[ics_land_M3V10vil_POL_ODLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_ODLINE_1] ON [tsa].[ics_land_M3V10vil_POL_ODLINE] ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OINVOH_1] on [tsa].[ics_land_M3V10vil_POL_OINVOH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OINVOH_1] ON [tsa].[ics_land_M3V10vil_POL_OINVOH] ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OINVOL_1] on [tsa].[ics_land_M3V10vil_POL_OINVOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OINVOL_1] ON [tsa].[ics_land_M3V10vil_POL_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OOHEAD_1] on [tsa].[ics_land_M3V10vil_POL_OOHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OOHEAD_1] ON [tsa].[ics_land_M3V10vil_POL_OOHEAD] ([OACONO], [OAORNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OOLINE_1] on [tsa].[ics_land_M3V10vil_POL_OOLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OOLINE_1] ON [tsa].[ics_land_M3V10vil_POL_OOLINE] ([OBCONO], [OBORNO], [OBPONR], [OBPOSX])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OPAYMD_1] on [tsa].[ics_land_M3V10vil_POL_OPAYMD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OPAYMD_1] ON [tsa].[ics_land_M3V10vil_POL_OPAYMD] ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OPAYMH_1] on [tsa].[ics_land_M3V10vil_POL_OPAYMH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OPAYMH_1] ON [tsa].[ics_land_M3V10vil_POL_OPAYMH] ([UJCONO], [UJPLNB], [UJPMNB])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_M3V10vil_POL_OSBSTD_1] on [tsa].[ics_land_M3V10vil_POL_OSBSTD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OSBSTD_1] ON [tsa].[ics_land_M3V10vil_POL_OSBSTD] ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCPOSX], [UCWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_CCURRA_1] on [tsa].[ics_land_m3_CCURRA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_CCURRA_1] ON [tsa].[ics_land_m3_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_CSYTAB_1] on [tsa].[ics_land_m3_CSYTAB]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_CSYTAB_1] ON [tsa].[ics_land_m3_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MILOMA_1] on [tsa].[ics_land_m3_MILOMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MILOMA_1] ON [tsa].[ics_land_m3_MILOMA] ([LMBANO], [LMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MITAUN_1] on [tsa].[ics_land_m3_MITAUN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITAUN_1] ON [tsa].[ics_land_m3_MITAUN] ([MUALUN], [MUAUTP], [MUITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MITBAL_1] on [tsa].[ics_land_m3_MITBAL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITBAL_1] ON [tsa].[ics_land_m3_MITBAL] ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MITFAC_1] on [tsa].[ics_land_m3_MITFAC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITFAC_1] ON [tsa].[ics_land_m3_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MITLOC_1] on [tsa].[ics_land_m3_MITLOC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITLOC_1] ON [tsa].[ics_land_m3_MITLOC] ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MITMAS_1] on [tsa].[ics_land_m3_MITMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITMAS_1] ON [tsa].[ics_land_m3_MITMAS] ([MMCONO], [MMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MITPOP_1] on [tsa].[ics_land_m3_MITPOP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITPOP_1] ON [tsa].[ics_land_m3_MITPOP] ([MPALWT], [MPCONO], [MPE0PA], [MPITNO], [MPPOPN], [MPVFDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OCHCUS_1] on [tsa].[ics_land_m3_OCHCUS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OCHCUS_1] ON [tsa].[ics_land_m3_OCHCUS] ([OSCHCT], [OSCONO], [OSCUNO], [OSFVDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OCUSMA_1] on [tsa].[ics_land_m3_OCUSMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OCUSMA_1] ON [tsa].[ics_land_m3_OCUSMA] ([OKCONO], [OKCUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OINVOH_1] on [tsa].[ics_land_m3_OINVOH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OINVOH_1] ON [tsa].[ics_land_m3_OINVOH] ([UHCONO], [UHDIVI], [UHIVNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OINVOL_1] on [tsa].[ics_land_m3_OINVOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OINVOL_1] ON [tsa].[ics_land_m3_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OOHEAD_1] on [tsa].[ics_land_m3_OOHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OOHEAD_1] ON [tsa].[ics_land_m3_OOHEAD] ([OACONO], [OAORNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OOLINE_1] on [tsa].[ics_land_m3_OOLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OOLINE_1] ON [tsa].[ics_land_m3_OOLINE] ([OBCONO], [OBORNO], [OBPONR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_OSBSTD_1] on [tsa].[ics_land_m3_OSBSTD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OSBSTD_1] ON [tsa].[ics_land_m3_OSBSTD] ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_CCURRA_1] on [tsa].[ics_land_m3v7_CCURRA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_CCURRA_1] ON [tsa].[ics_land_m3v7_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_CSYTAB_1] on [tsa].[ics_land_m3v7_CSYTAB]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_CSYTAB_1] ON [tsa].[ics_land_m3v7_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MILOMA_1] on [tsa].[ics_land_m3v7_MILOMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MILOMA_1] ON [tsa].[ics_land_m3v7_MILOMA] ([LMBANO], [LMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MITAUN_1] on [tsa].[ics_land_m3v7_MITAUN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITAUN_1] ON [tsa].[ics_land_m3v7_MITAUN] ([MUALUN], [MUAUTP], [MUITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MITBAL_1] on [tsa].[ics_land_m3v7_MITBAL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITBAL_1] ON [tsa].[ics_land_m3v7_MITBAL] ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MITFAC_1] on [tsa].[ics_land_m3v7_MITFAC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITFAC_1] ON [tsa].[ics_land_m3v7_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MITLOC_1] on [tsa].[ics_land_m3v7_MITLOC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITLOC_1] ON [tsa].[ics_land_m3v7_MITLOC] ([MLBANO], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MITMAS_1] on [tsa].[ics_land_m3v7_MITMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITMAS_1] ON [tsa].[ics_land_m3v7_MITMAS] ([MMCONO], [MMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MITPOP_1] on [tsa].[ics_land_m3v7_MITPOP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITPOP_1] ON [tsa].[ics_land_m3v7_MITPOP] ([MPCONO], [MPE0PA], [MPITNO], [MPPOPN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OCHCUS_1] on [tsa].[ics_land_m3v7_OCHCUS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OCHCUS_1] ON [tsa].[ics_land_m3v7_OCHCUS] ([OSCONO], [OSCUNO], [OSFVDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OCUSMA_1] on [tsa].[ics_land_m3v7_OCUSMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OCUSMA_1] ON [tsa].[ics_land_m3v7_OCUSMA] ([OKCONO], [OKCUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OINVOH_1] on [tsa].[ics_land_m3v7_OINVOH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OINVOH_1] ON [tsa].[ics_land_m3v7_OINVOH] ([UHCONO], [UHIVNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OINVOL_1] on [tsa].[ics_land_m3v7_OINVOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OINVOL_1] ON [tsa].[ics_land_m3v7_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OOHEAD_1] on [tsa].[ics_land_m3v7_OOHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OOHEAD_1] ON [tsa].[ics_land_m3v7_OOHEAD] ([OACONO], [OAORNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OOLINE_1] on [tsa].[ics_land_m3v7_OOLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OOLINE_1] ON [tsa].[ics_land_m3v7_OOLINE] ([OBCONO], [OBORNO], [OBPONR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_OSBSTD_1] on [tsa].[ics_land_m3v7_OSBSTD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OSBSTD_1] ON [tsa].[ics_land_m3v7_OSBSTD] ([UCCONO], [UCDIVI], [UCDLIX], [UCORNO], [UCPONR], [UCWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_CCURRA_1] on [tsa].[ics_land_movex_CCURRA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_CCURRA_1] ON [tsa].[ics_land_movex_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_CSYTAB_1] on [tsa].[ics_land_movex_CSYTAB]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_CSYTAB_1] ON [tsa].[ics_land_movex_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MILOMA_1] on [tsa].[ics_land_movex_MILOMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MILOMA_1] ON [tsa].[ics_land_movex_MILOMA] ([LMBANO], [LMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MITAUN_1] on [tsa].[ics_land_movex_MITAUN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITAUN_1] ON [tsa].[ics_land_movex_MITAUN] ([MUALUN], [MUAUTP], [MUITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MITBAL_1] on [tsa].[ics_land_movex_MITBAL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITBAL_1] ON [tsa].[ics_land_movex_MITBAL] ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MITFAC_1] on [tsa].[ics_land_movex_MITFAC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITFAC_1] ON [tsa].[ics_land_movex_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MITLOC_1] on [tsa].[ics_land_movex_MITLOC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITLOC_1] ON [tsa].[ics_land_movex_MITLOC] ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MITMAS_1] on [tsa].[ics_land_movex_MITMAS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITMAS_1] ON [tsa].[ics_land_movex_MITMAS] ([MMCONO], [MMITNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MITPOP_1] on [tsa].[ics_land_movex_MITPOP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITPOP_1] ON [tsa].[ics_land_movex_MITPOP] ([MPALWT], [MPCONO], [MPE0PA], [MPITNO], [MPPOPN], [MPVFDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OCHCUS_1] on [tsa].[ics_land_movex_OCHCUS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OCHCUS_1] ON [tsa].[ics_land_movex_OCHCUS] ([OSCHCT], [OSCONO], [OSCUNO], [OSFVDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OCUSMA_1] on [tsa].[ics_land_movex_OCUSMA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OCUSMA_1] ON [tsa].[ics_land_movex_OCUSMA] ([OKCONO], [OKCUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OINVOH_1] on [tsa].[ics_land_movex_OINVOH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OINVOH_1] ON [tsa].[ics_land_movex_OINVOH] ([UHCONO], [UHDIVI], [UHIVNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OINVOL_1] on [tsa].[ics_land_movex_OINVOL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OINVOL_1] ON [tsa].[ics_land_movex_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OOHEAD_1] on [tsa].[ics_land_movex_OOHEAD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OOHEAD_1] ON [tsa].[ics_land_movex_OOHEAD] ([OACONO], [OAORNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OOLINE_1] on [tsa].[ics_land_movex_OOLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OOLINE_1] ON [tsa].[ics_land_movex_OOLINE] ([OBCONO], [OBORNO], [OBPONR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_OSBSTD_1] on [tsa].[ics_land_movex_OSBSTD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_OSBSTD_1] ON [tsa].[ics_land_movex_OSBSTD] ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCWHLO])
GO
