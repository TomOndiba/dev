-- <Migration ID="7b5935df-e161-4895-8a18-1ef12c7d966e" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_EKBE_1] on [tsa].[ics_land_SAP_GBR_EKBE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKBE_1] ON [tsa].[ics_land_SAP_GBR_EKBE] ([BELNR], [EBELN], [MANDT], [EBELP], [BUZEI], [GJAHR], [VGABE], [ZEKKN])
GO
