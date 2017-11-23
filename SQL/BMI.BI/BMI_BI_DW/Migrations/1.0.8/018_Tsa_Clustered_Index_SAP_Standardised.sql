-- <Migration ID="8c8838b9-4fe8-4206-9fd5-2c8457f7123c" />
GO

PRINT N'Dropping index [tsa_ics_land_SAP_GBR_ADRC_1] from [tsa].[ics_land_SAP_GBR_ADRC]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_ADRC_1] ON [tsa].[ics_land_SAP_GBR_ADRC]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_EKBE_1] from [tsa].[ics_land_SAP_GBR_EKBE]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_EKBE_1] ON [tsa].[ics_land_SAP_GBR_EKBE]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_EKBZ_1] from [tsa].[ics_land_SAP_GBR_EKBZ]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_EKBZ_1] ON [tsa].[ics_land_SAP_GBR_EKBZ]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_EKET_1] from [tsa].[ics_land_SAP_GBR_EKET]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_EKET_1] ON [tsa].[ics_land_SAP_GBR_EKET]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_EKKO_1] from [tsa].[ics_land_SAP_GBR_EKKO]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_EKKO_1] ON [tsa].[ics_land_SAP_GBR_EKKO]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_EKPO_1] from [tsa].[ics_land_SAP_GBR_EKPO]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_EKPO_1] ON [tsa].[ics_land_SAP_GBR_EKPO]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_LFA1_1] from [tsa].[ics_land_SAP_GBR_LFA1]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_LFA1_1] ON [tsa].[ics_land_SAP_GBR_LFA1]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_LFB1_1] from [tsa].[ics_land_SAP_GBR_LFB1]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_LFB1_1] ON [tsa].[ics_land_SAP_GBR_LFB1]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_LFM1_1] from [tsa].[ics_land_SAP_GBR_LFM1]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_LFM1_1] ON [tsa].[ics_land_SAP_GBR_LFM1]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_LIKP_1] from [tsa].[ics_land_SAP_GBR_LIKP]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_LIKP_1] ON [tsa].[ics_land_SAP_GBR_LIKP]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_MARM_1] from [tsa].[ics_land_SAP_GBR_MARM]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_MARM_1] ON [tsa].[ics_land_SAP_GBR_MARM]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_T052U_1] from [tsa].[ics_land_SAP_GBR_T052U]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_T052U_1] ON [tsa].[ics_land_SAP_GBR_T052U]
GO
PRINT N'Dropping index [tsa_ics_land_SAP_GBR_TCURR_1] from [tsa].[ics_land_SAP_GBR_TCURR]'
GO
DROP INDEX [tsa_ics_land_SAP_GBR_TCURR_1] ON [tsa].[ics_land_SAP_GBR_TCURR]
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_ADRC_1] on [tsa].[ics_land_SAP_GBR_ADRC]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_ADRC_1] ON [tsa].[ics_land_SAP_GBR_ADRC] ([ADDRNUMBER], [DATE_FROM])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_EKBE_1] on [tsa].[ics_land_SAP_GBR_EKBE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKBE_1] ON [tsa].[ics_land_SAP_GBR_EKBE] ([BELNR], [EBELN], [MANDT], [EBELP], [BUZEI], [GJAHR], [VGABE], [ZEKKN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_EKBZ_1] on [tsa].[ics_land_SAP_GBR_EKBZ]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKBZ_1] ON [tsa].[ics_land_SAP_GBR_EKBZ] ([EBELN], [ZAEHK], [BELNR], [BUZEI])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_EKET_1] on [tsa].[ics_land_SAP_GBR_EKET]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKET_1] ON [tsa].[ics_land_SAP_GBR_EKET] ([EBELN], [EBELP], [ETENR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_EKKO_1] on [tsa].[ics_land_SAP_GBR_EKKO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKKO_1] ON [tsa].[ics_land_SAP_GBR_EKKO] ([EBELN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_EKPO_1] on [tsa].[ics_land_SAP_GBR_EKPO]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKPO_1] ON [tsa].[ics_land_SAP_GBR_EKPO] ([EBELN], [EBELP])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_LFA1_1] on [tsa].[ics_land_SAP_GBR_LFA1]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_LFA1_1] ON [tsa].[ics_land_SAP_GBR_LFA1] ([LIFNR])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_LFB1_1] on [tsa].[ics_land_SAP_GBR_LFB1]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_LFB1_1] ON [tsa].[ics_land_SAP_GBR_LFB1] ([LIFNR], [BUKRS])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_LFM1_1] on [tsa].[ics_land_SAP_GBR_LFM1]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_LFM1_1] ON [tsa].[ics_land_SAP_GBR_LFM1] ([MANDT], [LIFNR], [EKORG])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_LIKP_1] on [tsa].[ics_land_SAP_GBR_LIKP]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_LIKP_1] ON [tsa].[ics_land_SAP_GBR_LIKP] ([VBELN])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_MARM_1] on [tsa].[ics_land_SAP_GBR_MARM]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_MARM_1] ON [tsa].[ics_land_SAP_GBR_MARM] ([MATNR], [MEINH])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_T052U_1] on [tsa].[ics_land_SAP_GBR_T052U]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_T052U_1] ON [tsa].[ics_land_SAP_GBR_T052U] ([MANDT], [SPRAS], [ZTERM], [ZTAGG])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_TCURR_1] on [tsa].[ics_land_SAP_GBR_TCURR]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_TCURR_1] ON [tsa].[ics_land_SAP_GBR_TCURR] ([MANDT], [KURST], [FCURR], [TCURR], [GDATU])
GO
