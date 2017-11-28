IF OBJECT_ID('[Ics-ModuleTests].[test ProcessRunStart instructs RUN on no process running]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test ProcessRunStart instructs RUN on no process running];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [Ics-ModuleTests].[test ProcessRunStart instructs RUN on no process running]
as
	begin
		declare @_BatchProcessId int = 999;

		exec tSQLt.FakeTable @TableName = N'batch.ProcessRun' ;
		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
		exec tSQLt.SpyProcedure @ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName', @CommandToExecute = 'set @BatchProcessId = 999;' ;

		insert batch.ProcessRun (ProcessRunId, BatchProcessId, StartTime, EndTime)
		values
			  (2, @_BatchProcessId, '20020201', '20020202')
		

		--! Act
		declare @_actual varchar(50);
		exec [ics].[ProcessRunStart] @ProcessName = 'PA', @IcrtProcessId = 1, @Instruction = @_actual out ;
		
		--! Assert
		exec tSQLt.AssertEqualsString 'RUN', @_actual;
	end ;
GO
