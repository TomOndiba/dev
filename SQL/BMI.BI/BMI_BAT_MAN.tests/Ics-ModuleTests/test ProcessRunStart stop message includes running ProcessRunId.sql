CREATE   procedure [Ics-ModuleTests].[test ProcessRunStart stop message includes running ProcessRunId]
as
	begin
		declare @_BatchProcessId int = 999;

		exec tSQLt.FakeTable @TableName = N'batch.ProcessRun' ;
		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
		exec tSQLt.SpyProcedure @ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName', @CommandToExecute = 'set @BatchProcessId = 999;' ;

		insert batch.ProcessRun (ProcessRunId, BatchProcessId, StartTime, EndTime)
		values
			  (2, @_BatchProcessId, '20020202', null)
			, (3, @_BatchProcessId, '20020202', '20020202')

		--! Act
		declare @_actual varchar(500);
		exec [ics].[ProcessRunStart] @ProcessName = 'PA', @IcrtProcessId = 1, @Message = @_actual out ;
	
		declare @_expected varchar(500) = 'Failed to start new batch process as it is already in progress with a ProcessRunId of 2'
		
		--! Assert
		exec tSQLt.AssertEqualsString @_expected, @_actual;
	end ;