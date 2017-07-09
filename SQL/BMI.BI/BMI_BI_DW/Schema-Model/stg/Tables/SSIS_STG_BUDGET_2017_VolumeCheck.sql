CREATE TABLE [stg].[SSIS_STG_BUDGET_2017_VolumeCheck]
(
[RegionName] [nvarchar] (200) NOT NULL,
[ProductGroup] [nvarchar] (200) NOT NULL,
[Jan_YTD] [decimal] (38, 16) NULL,
[Feb_YTD] [decimal] (38, 16) NULL,
[Mar_YTD] [decimal] (38, 16) NULL,
[Apr_YTD] [decimal] (38, 16) NULL,
[May_YTD] [decimal] (38, 16) NULL,
[Jun_YTD] [decimal] (38, 16) NULL,
[Jul_YTD] [decimal] (38, 16) NULL,
[Aug_YTD] [decimal] (38, 16) NULL,
[Sep_YTD] [decimal] (38, 16) NULL,
[Oct_YTD] [decimal] (38, 16) NULL,
[Nov_YTD] [decimal] (38, 16) NULL,
[Dec_YTD] [decimal] (38, 16) NULL
)
GO
ALTER TABLE [stg].[SSIS_STG_BUDGET_2017_VolumeCheck] ADD CONSTRAINT [PK_stg_SSIS_STG_BUDGET_2017_VolumeCheck] PRIMARY KEY CLUSTERED  ([RegionName], [ProductGroup])
GO
