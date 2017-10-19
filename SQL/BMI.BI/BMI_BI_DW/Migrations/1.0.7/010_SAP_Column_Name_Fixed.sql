-- <Migration ID="cce2b28d-ce9e-4f6f-b37a-3991a82cf86b" />
GO

PRINT N'Altering [psa].[ics_stg_SAP_GBR_KNB1]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_KNB1].[Qstg]', N'QLAND', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_BSEG]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_BSEG].[stgL]', N'LANDL', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_CEPC]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_CEPC].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_KNA1]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_KNA1].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_LFA1]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_LFA1].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_LFB1]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_LFB1].[Qstg]', N'QLAND', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_VBAK]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_VBAK].[stgTX]', N'LANDTX', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_VBPA]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_VBPA].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_VBRP]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_VBRP].[Astg]', N'ALAND', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_VBRP].[Lstg_AUFT]', N'LLAND_AUFT', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_VBRK]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_VBRK].[stg1]', N'LAND1', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_VBRK].[stgTX]', N'LANDTX', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_RBKP]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_RBKP].[stg1]', N'LAND1', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_RBKP].[stgL]', N'LANDL', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_T001]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_T001].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_T001W]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_T001W].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_CSKS]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_CSKS].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_EKAN]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_EKAN].[stg1]', N'LAND1', N'COLUMN'
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_EKKO]'
GO
EXEC sp_rename N'[psa].[ics_stg_SAP_GBR_EKKO].[stgS]', N'LANDS', N'COLUMN'
GO
