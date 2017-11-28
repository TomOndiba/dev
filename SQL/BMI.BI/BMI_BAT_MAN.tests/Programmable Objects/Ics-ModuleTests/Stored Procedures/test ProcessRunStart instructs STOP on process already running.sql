IF OBJECT_ID('[Ics-ModuleTests].[test ProcessRunStart instructs STOP on process already running]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test ProcessRunStart instructs STOP on process already running];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [Ics-ModuleTests].[test ProcessRunStart instructs STOP on process already running]
as
	begin
		declare @_BatchProcessId int = 999;

		exec tSQLt.FakeTable @TableName = N'batch.ProcessRun' ;
			 
		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
		exec tSQLt.SpyProcedure @ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName', @CommandToExecute = 'set @BatchProcessId = 999;' ;

		insert batch.ProcessRun (ProcessRunId, BatchProcessId, StartTime, EndTime)
		values
			  (2, @_BatchProcessId, '20020202', null)
			, (3, @_BatchProcessId, '20020202', '20020203')

		--! Act
		declare @_actual varchar(50);
		exec [ics].[ProcessRunStart] @ProcessName = 'PA', @IcrtProcessId = 1, @Instruction = @_actual out ;
		
		--! Assert
		exec tSQLt.AssertEqualsString 'STOP', @_actual;
	end ;
GO
