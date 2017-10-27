CREATE   procedure [Ics-ModuleTests].[test SubProcessRunEnd updates batch.StepRun]
as
	begin

		declare @SetDate as datetime = getdate() ;

		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;
		alter table batch.StepRun nocheck constraint all ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		--exec tSQLt.FakeTable @TableName = N'batch.Process' ;

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
		  , @SetDate	-- StartTime - datetime
		  , null		-- EndTime - datetime
		  , 1			-- RunStateId - int
		  , null		-- EndState - varchar(16)
		  , null		-- EndMessage - varchar(500)
		) ;

		select
			1		 StepRunId
		  , 1		 ProcessRunId	   -- int
		  , 1		 StepId			   -- int
		  , @SetDate StartTime	-- datetime
		  , @SetDate EndTime	-- datetime
		  , 9		 RunStateId		   -- int
		  , 'Succeeded'		 EndState		  -- varchar(16)
		  , null		 EndMessage		  -- varchar(500)
		into
			#expected ;

		exec [ics].[SubProcessRunEnd]
			@ProcessName = 'PN'
		  , @SubProcessName = 'SPN'
		  , @SubProcessRunId = 1
		  , @EndState = 'Succeeded'
		  , @EndMessage = null
		  , @SetDate = @SetDate ;

		exec tSQLt.AssertEqualsTable
			@Expected = N'#expected'		-- nvarchar(max)
		  , @Actual = N'batch.StepRun' ; -- nvarchar(max)

	end ;