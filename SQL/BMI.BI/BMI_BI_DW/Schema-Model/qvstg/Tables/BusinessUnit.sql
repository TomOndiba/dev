CREATE TABLE [qvstg].[BusinessUnit]
(
[BusinessUnitKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeBusinessUnitKey] [nvarchar] (50) NOT NULL,
[StrategicBusinessUnitCode] [nvarchar] (20) NOT NULL,
[SalesCenterSbuCode] [nvarchar] (20) NOT NULL,
[BusinessUnitName] [nvarchar] (100) NOT NULL,
[RegionId] [int] NULL,
[RegionName] [nvarchar] (50) NOT NULL,
[RegionDescription] [nvarchar] (1000) NOT NULL
)
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [CK_qvstg_BusinessUnit_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [PK_qvstg_BusinessUnit] PRIMARY KEY CLUSTERED  ([BusinessUnitKey])
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [AK_qvstg_BusinessUnit_NativeBusinessUnitKey] UNIQUE NONCLUSTERED  ([NativeBusinessUnitKey])
GO
