CREATE   procedure [Ics-ModuleTests].[test SubProcessRunStart sets @StepRunId]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc
		declare
			@SetDate as datetime = getdate()
		  , @expected	int		 = 1
		  , @actual		int ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName'
		  , @CommandToExecute = N'set @BatchProcessId=1' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'ics.IcrtSubProcessGetId'
		  , @CommandToExecute = N'set @IcrtSubProcessId=1' ; ;

		delete	from batch.StepRun ;

		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;
		alter table batch.StepRun nocheck constraint all ;

		dbcc checkident('batch.StepRun', reseed, 0) ;
		--! Act
		exec [ics].[SubProcessRunStart]
			@ProcessName = 'PN'
		  , @SubProcessName = 'SubPN'
		  , @ProcessRunId = 1
		  , @SetDate = @SetDate 
		  ,@SubProcessRunId= @actual output
	

		--------! Assert
		exec tSQLt.AssertEquals
			@Expected = @expected	-- sql_variant
		  , @Actual = @actual ;		-- sql_variant

	end ;