CREATE TABLE [stg].[SSIS_BUDGET_RegionLookup]
(
[RegionCode] [varchar] (8) NOT NULL,
[RegionName] [varchar] (50) NOT NULL,
[RegionLookup] [varchar] (50) NOT NULL
)
GO
ALTER TABLE [stg].[SSIS_BUDGET_RegionLookup] ADD CONSTRAINT [PK_stg_SSIS_BUDGET_RegionLookup] PRIMARY KEY CLUSTERED  ([RegionCode])
GO
ALTER TABLE [stg].[SSIS_BUDGET_RegionLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_RegionLookup_RegionLookup] UNIQUE NONCLUSTERED  ([RegionLookup])
GO
ALTER TABLE [stg].[SSIS_BUDGET_RegionLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_RegionLookup_RegionName] UNIQUE NONCLUSTERED  ([RegionName])
GO
