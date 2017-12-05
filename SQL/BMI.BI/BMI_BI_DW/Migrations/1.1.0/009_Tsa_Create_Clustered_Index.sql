-- <Migration ID="8b08deb2-18da-4c5b-8bd9-f06b7360b0f4" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_ADRC_1] on [tsa].[ics_land_SAP_SVK_ADRC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_ADRC_1] ON [tsa].[ics_land_SAP_SVK_ADRC] ([ADDRNUMBER], [CLIENT], [DATE_FROM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_EKBE_1] on [tsa].[ics_land_SAP_SVK_EKBE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_EKBE_1] ON [tsa].[ics_land_SAP_SVK_EKBE] ([BELNR], [BUZEI], [EBELN], [EBELP], [GJAHR], [MANDT], [VGABE], [ZEKKN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_EKBZ_1] on [tsa].[ics_land_SAP_SVK_EKBZ]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_EKBZ_1] ON [tsa].[ics_land_SAP_SVK_EKBZ] ([BELNR], [BUZEI], [EBELN], [ZAEHK])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_EKET_1] on [tsa].[ics_land_SAP_SVK_EKET]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_EKET_1] ON [tsa].[ics_land_SAP_SVK_EKET] ([EBELN], [EBELP], [ETENR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_EKKO_1] on [tsa].[ics_land_SAP_SVK_EKKO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_EKKO_1] ON [tsa].[ics_land_SAP_SVK_EKKO] ([EBELN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_EKPO_1] on [tsa].[ics_land_SAP_SVK_EKPO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_EKPO_1] ON [tsa].[ics_land_SAP_SVK_EKPO] ([EBELN], [EBELP])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_LFA1_1] on [tsa].[ics_land_SAP_SVK_LFA1]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_LFA1_1] ON [tsa].[ics_land_SAP_SVK_LFA1] ([LIFNR], [MANDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_LFB1_1] on [tsa].[ics_land_SAP_SVK_LFB1]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_LFB1_1] ON [tsa].[ics_land_SAP_SVK_LFB1] ([BUKRS], [LIFNR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_LFM1_1] on [tsa].[ics_land_SAP_SVK_LFM1]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_LFM1_1] ON [tsa].[ics_land_SAP_SVK_LFM1] ([EKORG], [LIFNR], [MANDT])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_MAKT_1] on [tsa].[ics_land_SAP_SVK_MAKT]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_MAKT_1] ON [tsa].[ics_land_SAP_SVK_MAKT] ([MATNR], [SPRAS])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_MARA_1] on [tsa].[ics_land_SAP_SVK_MARA]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_MARA_1] ON [tsa].[ics_land_SAP_SVK_MARA] ([MATNR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_MARM_1] on [tsa].[ics_land_SAP_SVK_MARM]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_MARM_1] ON [tsa].[ics_land_SAP_SVK_MARM] ([MATNR], [MEINH])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_T001W_1] on [tsa].[ics_land_SAP_SVK_T001W]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_T001W_1] ON [tsa].[ics_land_SAP_SVK_T001W] ([MANDT], [WERKS])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_T052U_1] on [tsa].[ics_land_SAP_SVK_T052U]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_T052U_1] ON [tsa].[ics_land_SAP_SVK_T052U] ([MANDT], [SPRAS], [ZTAGG], [ZTERM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_SVK_TCURR_1] on [tsa].[ics_land_SAP_SVK_TCURR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_SVK_TCURR_1] ON [tsa].[ics_land_SAP_SVK_TCURR] ([FCURR], [GDATU], [KURST], [MANDT], [TCURR])
GO
