-- <Migration ID="79e3895c-9028-410a-81ec-1a77a207368b" />
GO

PRINT N'Dropping constraints from [psa].[JobsExecutionDetails]'
GO
ALTER TABLE [psa].[JobsExecutionDetails] DROP CONSTRAINT [PK_Id_JobsExecutionDetails]
GO
PRINT N'Dropping constraints from [tsa].[JobsExecutionDetails]'
GO
ALTER TABLE [tsa].[JobsExecutionDetails] DROP CONSTRAINT [PK_Id_JobsExecutionDetails]
GO
PRINT N'Dropping constraints from [tsa].[JobsExecutionDetails]'
GO
ALTER TABLE [tsa].[JobsExecutionDetails] DROP CONSTRAINT [JobLoggingDetail_Action_Start]
GO
PRINT N'Dropping constraints from [tsa].[JobsExecutionDetails]'
GO
ALTER TABLE [tsa].[JobsExecutionDetails] DROP CONSTRAINT [JobsExecutionDetails_CDCNoOfIteration]
GO
PRINT N'Dropping [psa].[JobsExecutionDetails]'
GO
DROP TABLE [psa].[JobsExecutionDetails]
GO
PRINT N'Dropping [tsa].[JobsExecutionDetails]'
GO
DROP TABLE [tsa].[JobsExecutionDetails]
GO
