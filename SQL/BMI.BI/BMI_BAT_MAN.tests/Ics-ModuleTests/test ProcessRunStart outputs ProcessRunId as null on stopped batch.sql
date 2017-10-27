create   procedure [Ics-ModuleTests].[test ProcessRunStart outputs ProcessRunId as null on stopped batch]
as
	begin

		declare @SetDate datetime = getdate() ;

		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;

		delete	from batch.Process ;
		delete	from batch.ProcessRun ;
		dbcc checkident('batch.ProcessRun', reseed, 0) ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
		exec [ics].[ProcessRunStart]
			@ProcessName = 'Test PN1'
		  , @IcrtProcessId = 999
		  , @SetDate = @SetDate ;

		declare
			@return_value int
		  , @ProcessRunId int
		  , @RunType	  varchar(8)
		  , @Instruction  varchar(16)
		  , @Message	  varchar(500)
		  , @expect		  int = null ;

		exec @return_value = [ics].[ProcessRunStart]
			@ProcessName = 'Test PN1'
		  , @IcrtProcessId = 999
		  , @ProcessRunId = @ProcessRunId output
		  , @RunType = @RunType output
		  , @Instruction = @Instruction output
		  , @Message = @Message output
		  , @SetDate = null ;

		exec tSQLt.AssertEqualsString @Expected = @expect, @Actual = @ProcessRunId ;

	end ;