IF OBJECT_ID('[Ics-ModuleTests].[test ThreadRunStart insert rows into batch.ThreadRun table]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test ThreadRunStart insert rows into batch.ThreadRun table];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test ThreadRunStart insert rows into batch.ThreadRun table]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc
		--batch.StepRun


		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;
		alter table batch.StepRun nocheck constraint all ;
		alter table batch.Thread nocheck constraint all ;
		alter table batch.ThreadRun nocheck constraint all ;

		declare @SetDate as datetime = getdate() ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'ics.MappingConfigTaskGetId'
		  , @CommandToExecute = N'set @MappingConfigTaskId=1' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ThreadGetId'
		  , @CommandToExecute = N'set @ThreadId=1' ;

		delete	from batch.StepRun ;

		exec tSQLt.FakeTable @TableName = N'batch.StepRun' ;

		insert into batch.StepRun
		(
			StepRunId
		  , ProcessRunId
		  , StepId
		  , StartTime
		  , EndTime
		  , RunStateId
		  , EndState
		  , EndMessage
		)
		values
		(
			1
		  , 1			-- ProcessRunId - int
		  , 1			-- StepId - int
		  , getdate()	-- StartTime - datetime
		  , getdate()	-- EndTime - datetime
		  , 1			-- RunStateId - int
		  , ''			-- EndState - varchar(16)
		  , ''			-- EndMessage - varchar(500)
		) ;

		delete	from batch.ThreadRun ;

		select
			1					   as StepRunId
		  , 1					   as ThreadId
		  , @SetDate				   StartTime
		  , cast(null as datetime) EndTime
		  , 1					   RunStateId
		  , ''					   EndState
		  , ''					   EndMessage
		  , 0					   SuccessSourceRows
		  , 0					   FailedSourceRows
		  , 0					   SuccessTargetRows
		  , 0					   FailedTargetRows
		  , cast(null as datetime) as MinChangeDataCapturePoint
		  , cast(null as datetime) as MaxChangeDataCapturePoint
		into
			#expected ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.StepGetId'
		  , @CommandToExecute = N'set @StepId=1' ;

		exec [ics].[ThreadRunStart]
			@MappingConfigTaskName = 'MCTN'
		  , @MappingName = 'MN'
		  , @SubProcessRunId = 1
		  , @SetDate = @SetDate ;
		  
		declare
			@actual	  varchar(50) = 'batch.ThreadRun'
		  , @expected varchar(50) = '#expected' ;

		--------! Assert
		exec tSQLt.AssertEqualsTable @Expected = @expected, @Actual = @actual ;

	end ;
GO
