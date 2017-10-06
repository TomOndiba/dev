CREATE   procedure [Ics-ModuleTests].[test SubProcessRunStart insert rows into batch.StepRun table]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc
		declare @SetDate as datetime = getdate() ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName'
		  , @CommandToExecute = N'set @BatchProcessId=1' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'ics.IcrtSubProcessGetId'
		  , @CommandToExecute = N'set @IcrtSubProcessId=1' ; ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.StepGetId'
		  , @CommandToExecute = N'set @StepId=1' ; 

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
		  , @SetDate = @SetDate ;

		select
			cast(1 as int) as StepRunId
		  , cast(1 as int) as ProcessRunId
		  , cast(1 as int) as StepId
		  , @SetDate	   as StartTime
		  , cast (null as datetime)			   as EndTime
		  , cast(1 as int) as RunStateId
		  , ''			   as EndState
		  , ''			   as EndMessage
		into
			#expected ;

		declare
			@actual	  varchar(50) = 'batch.StepRun'
		  , @expected varchar(50) = '#expected' ;

		--------! Assert
		exec tSQLt.AssertEqualsTable
			@Expected = @expected	-- N'' -- nvarchar(max)
		  , @Actual = @actual ;		--N''	-- nvarchar(max)
	end ;