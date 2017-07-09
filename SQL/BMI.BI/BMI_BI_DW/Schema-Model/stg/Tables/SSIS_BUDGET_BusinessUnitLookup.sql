CREATE TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup]
(
[RegionCode] [varchar] (8) NOT NULL,
[SBU] [varchar] (8) NOT NULL,
[BusinessUnitName] [varchar] (50) NOT NULL,
[BusinessUnitLookup] [varchar] (50) NOT NULL
)
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [PK_SSIS_BUDGET_BusinessUnitLookup] PRIMARY KEY CLUSTERED  ([SBU])
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_BusinessUnitLookup__BusinessUnitLookup] UNIQUE NONCLUSTERED  ([BusinessUnitLookup])
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_BusinessUnitLookup_BusinessUnitName] UNIQUE NONCLUSTERED  ([BusinessUnitName])
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [FK_SSIS_BUDGET_BusinessUnitLookup_Region] FOREIGN KEY ([RegionCode]) REFERENCES [stg].[SSIS_BUDGET_RegionLookup] ([RegionCode])
GO
