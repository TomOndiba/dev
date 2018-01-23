-- <Migration ID="5855ea02-86fb-4e10-a936-64b205a468d0" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_AD_1] on [tsa].[ics_land_Symfonia_AD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_AD_1] ON [tsa].[ics_land_Symfonia_AD] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_AU_1] on [tsa].[ics_land_Symfonia_AU]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_AU_1] ON [tsa].[ics_land_Symfonia_AU] ([id], [o_seed])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_AcInfo_1] on [tsa].[ics_land_Symfonia_AcInfo]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_AcInfo_1] ON [tsa].[ics_land_Symfonia_AcInfo] ([Ac_Name])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_CK_1] on [tsa].[ics_land_Symfonia_CK]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_CK_1] ON [tsa].[ics_land_Symfonia_CK] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_CN_1] on [tsa].[ics_land_Symfonia_CN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_CN_1] ON [tsa].[ics_land_Symfonia_CN] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_CP_1] on [tsa].[ics_land_Symfonia_CP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_CP_1] ON [tsa].[ics_land_Symfonia_CP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_CT_1] on [tsa].[ics_land_Symfonia_CT]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_CT_1] ON [tsa].[ics_land_Symfonia_CT] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_DK_1] on [tsa].[ics_land_Symfonia_DK]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_DK_1] ON [tsa].[ics_land_Symfonia_DK] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_DP_1] on [tsa].[ics_land_Symfonia_DP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_DP_1] ON [tsa].[ics_land_Symfonia_DP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_DT_1] on [tsa].[ics_land_Symfonia_DT]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_DT_1] ON [tsa].[ics_land_Symfonia_DT] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_DW_1] on [tsa].[ics_land_Symfonia_DW]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_DW_1] ON [tsa].[ics_land_Symfonia_DW] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_EK_1] on [tsa].[ics_land_Symfonia_EK]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_EK_1] ON [tsa].[ics_land_Symfonia_EK] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_EP_1] on [tsa].[ics_land_Symfonia_EP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_EP_1] ON [tsa].[ics_land_Symfonia_EP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ErrorLog_1] on [tsa].[ics_land_Symfonia_ErrorLog]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ErrorLog_1] ON [tsa].[ics_land_Symfonia_ErrorLog] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_FP_1] on [tsa].[ics_land_Symfonia_FP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_FP_1] ON [tsa].[ics_land_Symfonia_FP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_HW_1] on [tsa].[ics_land_Symfonia_HW]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_HW_1] ON [tsa].[ics_land_Symfonia_HW] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_IL_1] on [tsa].[ics_land_Symfonia_IL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_IL_1] ON [tsa].[ics_land_Symfonia_IL] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_INIFILE_1] on [tsa].[ics_land_Symfonia_INIFILE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_INIFILE_1] ON [tsa].[ics_land_Symfonia_INIFILE] ([klucz], [plik], [sekcja])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_IP_1] on [tsa].[ics_land_Symfonia_IP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_IP_1] ON [tsa].[ics_land_Symfonia_IP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_IT_1] on [tsa].[ics_land_Symfonia_IT]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_IT_1] ON [tsa].[ics_land_Symfonia_IT] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_KH_1] on [tsa].[ics_land_Symfonia_KH]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_KH_1] ON [tsa].[ics_land_Symfonia_KH] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_KP_1] on [tsa].[ics_land_Symfonia_KP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_KP_1] ON [tsa].[ics_land_Symfonia_KP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_KR_1] on [tsa].[ics_land_Symfonia_KR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_KR_1] ON [tsa].[ics_land_Symfonia_KR] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_LOCAL_LOG_1] on [tsa].[ics_land_Symfonia_LOCAL_LOG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_LOCAL_LOG_1] ON [tsa].[ics_land_Symfonia_LOCAL_LOG] ([id], [term])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_LOG_BASE_1] on [tsa].[ics_land_Symfonia_LOG_BASE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_LOG_BASE_1] ON [tsa].[ics_land_Symfonia_LOG_BASE] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_MG_1] on [tsa].[ics_land_Symfonia_MG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_MG_1] ON [tsa].[ics_land_Symfonia_MG] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_MZ_1] on [tsa].[ics_land_Symfonia_MZ]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_MZ_1] ON [tsa].[ics_land_Symfonia_MZ] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_NT_1] on [tsa].[ics_land_Symfonia_NT]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_NT_1] ON [tsa].[ics_land_Symfonia_NT] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_OP_1] on [tsa].[ics_land_Symfonia_OP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_OP_1] ON [tsa].[ics_land_Symfonia_OP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_PN_1] on [tsa].[ics_land_Symfonia_PN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_PN_1] ON [tsa].[ics_land_Symfonia_PN] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_PO_1] on [tsa].[ics_land_Symfonia_PO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_PO_1] ON [tsa].[ics_land_Symfonia_PO] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_PR_1] on [tsa].[ics_land_Symfonia_PR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_PR_1] ON [tsa].[ics_land_Symfonia_PR] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_PW_1] on [tsa].[ics_land_Symfonia_PW]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_PW_1] ON [tsa].[ics_land_Symfonia_PW] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RE_1] on [tsa].[ics_land_Symfonia_RE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RE_1] ON [tsa].[ics_land_Symfonia_RE] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RLKS_1] on [tsa].[ics_land_Symfonia_RLKS]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RLKS_1] ON [tsa].[ics_land_Symfonia_RLKS] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RN_1] on [tsa].[ics_land_Symfonia_RN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RN_1] ON [tsa].[ics_land_Symfonia_RN] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ROPN_1] on [tsa].[ics_land_Symfonia_ROPN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ROPN_1] ON [tsa].[ics_land_Symfonia_ROPN] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RO_1] on [tsa].[ics_land_Symfonia_RO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RO_1] ON [tsa].[ics_land_Symfonia_RO] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RP_1] on [tsa].[ics_land_Symfonia_RP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RP_1] ON [tsa].[ics_land_Symfonia_RP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RV_1] on [tsa].[ics_land_Symfonia_RV]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RV_1] ON [tsa].[ics_land_Symfonia_RV] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_RZ_1] on [tsa].[ics_land_Symfonia_RZ]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RZ_1] ON [tsa].[ics_land_Symfonia_RZ] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_SD_1] on [tsa].[ics_land_Symfonia_SD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SD_1] ON [tsa].[ics_land_Symfonia_SD] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_SK_1] on [tsa].[ics_land_Symfonia_SK]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SK_1] ON [tsa].[ics_land_Symfonia_SK] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_SM_1] on [tsa].[ics_land_Symfonia_SM]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SM_1] ON [tsa].[ics_land_Symfonia_SM] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_SR_1] on [tsa].[ics_land_Symfonia_SR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SR_1] ON [tsa].[ics_land_Symfonia_SR] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_StanyMinMax_1] on [tsa].[ics_land_Symfonia_StanyMinMax]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_StanyMinMax_1] ON [tsa].[ics_land_Symfonia_StanyMinMax] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_TD_1] on [tsa].[ics_land_Symfonia_TD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_TD_1] ON [tsa].[ics_land_Symfonia_TD] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_TR_1] on [tsa].[ics_land_Symfonia_TR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_TR_1] ON [tsa].[ics_land_Symfonia_TR] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_TW_1] on [tsa].[ics_land_Symfonia_TW]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_TW_1] ON [tsa].[ics_land_Symfonia_TW] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_TX_1] on [tsa].[ics_land_Symfonia_TX]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_TX_1] ON [tsa].[ics_land_Symfonia_TX] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_UZ_1] on [tsa].[ics_land_Symfonia_UZ]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_UZ_1] ON [tsa].[ics_land_Symfonia_UZ] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_WD_1] on [tsa].[ics_land_Symfonia_WD]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_WD_1] ON [tsa].[ics_land_Symfonia_WD] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_XT_1] on [tsa].[ics_land_Symfonia_XT]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_XT_1] ON [tsa].[ics_land_Symfonia_XT] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZE_1] on [tsa].[ics_land_Symfonia_ZE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZE_1] ON [tsa].[ics_land_Symfonia_ZE] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZL_1] on [tsa].[ics_land_Symfonia_ZL]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZL_1] ON [tsa].[ics_land_Symfonia_ZL] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZN_1] on [tsa].[ics_land_Symfonia_ZN]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZN_1] ON [tsa].[ics_land_Symfonia_ZN] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZO_1] on [tsa].[ics_land_Symfonia_ZO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZO_1] ON [tsa].[ics_land_Symfonia_ZO] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZP_1] on [tsa].[ics_land_Symfonia_ZP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZP_1] ON [tsa].[ics_land_Symfonia_ZP] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZR_1] on [tsa].[ics_land_Symfonia_ZR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZR_1] ON [tsa].[ics_land_Symfonia_ZR] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia_ZZ_1] on [tsa].[ics_land_Symfonia_ZZ]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZZ_1] ON [tsa].[ics_land_Symfonia_ZZ] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia__KonwersjaIdToCore_1] on [tsa].[ics_land_Symfonia__KonwersjaIdToCore]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia__KonwersjaIdToCore_1] ON [tsa].[ics_land_Symfonia__KonwersjaIdToCore] ([coreId], [hmfID], [objId])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia__MigracjaDodatkowePolaKh_1] on [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaKh]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia__MigracjaDodatkowePolaKh_1] ON [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaKh] ([id])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Symfonia__MigracjaDodatkowePolaTw_1] on [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaTw]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia__MigracjaDodatkowePolaTw_1] ON [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaTw] ([id])
GO
