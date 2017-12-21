-- <Migration ID="8ea5bee5-7f37-4bd0-86fe-e00233ef3cbb" />
GO

PRINT N'Creating [psa].[JobsExecutionDetails]'
GO
CREATE TABLE [psa].[JobsExecutionDetails]
(
[Id] [int] NOT NULL,
[Action] [nvarchar] (10) NULL,
[MCTName] [nvarchar] (100) NULL,
[MCTStartTime] [datetime] NULL,
[MCTEndTime] [datetime] NULL,
[MCTTotalExecutionTime] [varchar] (25) NULL,
[SuccessSourceRows] [int] NULL,
[SuccessTargetRows] [int] NULL,
[FailedSourceRows] [int] NULL,
[FailedTargetRows] [int] NULL,
[CDCNoOfIteration] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Id_JobsExecutionDetails] on [psa].[JobsExecutionDetails]'
GO
ALTER TABLE [psa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
