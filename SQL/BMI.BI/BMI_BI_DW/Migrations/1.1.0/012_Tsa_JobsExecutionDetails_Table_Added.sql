-- <Migration ID="3f3d01a4-f7b1-4427-9e4e-e3c5eaa5cdc1" />
go
if object_id('tsa.JobsExecutionDetails', 'U') is not null
	drop table tsa.JobsExecutionDetails ;
go

PRINT N'Creating [tsa].[JobsExecutionDetails]'
GO
CREATE TABLE [tsa].[JobsExecutionDetails]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Action] [nvarchar] (10) NULL CONSTRAINT [JobLoggingDetail_Action_Start] DEFAULT ('RUN'),
[MCTName] [nvarchar] (100) NULL,
[MCTStartTime] [datetime] NULL,
[MCTEndTime] [datetime] NULL,
[MCTTotalExecutionTime] [varchar] (25) NULL,
[SuccessSourceRows] [int] NULL,
[SuccessTargetRows] [int] NULL,
[FailedSourceRows] [int] NULL,
[FailedTargetRows] [int] NULL,
[CDCNoOfIteration] [int] NULL CONSTRAINT [JobsExecutionDetails_CDCNoOfIteration] DEFAULT ((1))
)
GO
PRINT N'Creating primary key [PK_Id_JobsExecutionDetails] on [tsa].[JobsExecutionDetails]'
GO
ALTER TABLE [tsa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
