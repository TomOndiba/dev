-- <Migration ID="8865e78b-a9f9-415c-be7d-55959e638939" />
GO

PRINT N'Dropping [dbo].[inventory_snapshot_sap_gbr]'
GO
IF OBJECT_ID(N'[dbo].[inventory_snapshot_sap_gbr]', 'V') IS NOT NULL
DROP VIEW [dbo].[inventory_snapshot_sap_gbr]
GO
