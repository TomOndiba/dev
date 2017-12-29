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
ALTER TABLE [psa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
