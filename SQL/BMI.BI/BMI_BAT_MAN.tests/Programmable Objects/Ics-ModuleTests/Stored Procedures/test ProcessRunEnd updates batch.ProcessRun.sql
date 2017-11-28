IF OBJECT_ID('[Ics-ModuleTests].[test ProcessRunEnd updates batch.ProcessRun]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test ProcessRunEnd updates batch.ProcessRun];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [Ics-ModuleTests].[test ProcessRunEnd updates batch.ProcessRun]
as
	begin

		declare @SetDate as datetime = getdate() ;

		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;
		alter table batch.StepRun nocheck constraint all ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.FakeTable @TableName = N'batch.Process' ;

		exec tSQLt.FakeTable @TableName = N'batch.ProcessRun' ;


		insert into batch.Process
		(
			BatchProcessId
		  , BatchProcessName
		  , IcrtProcessName
		  , IsDisabled
		  , Narrative
		  , StartCapturePointOverride
		)
		values
		(
			1			-- BatchProcessId - int
		  , 'PN'		-- BatchProcessName - varchar(100)
		  , 'PN'		-- IcrtProcessName - varchar(100)
		  , 0			-- IsDisabled - bit
		  , 'Narrative' -- Narrative - varchar(500)
		  , getdate()	-- StartCapturePointOverride - datetime
		) ;

		insert into batch.ProcessRun
		(
			ProcessRunId
		  , BatchProcessId
		  , IcrtProcessId
		  , StartTime
		  , EndTime
		  , RunStateId
		  , EndState
		  , EndMessage
		  , MinChangeDataCapturePoint
		  , MaxChangeDataCapturePoint
		)
		values
		(
			1
		  , 1			-- BatchProcessId - int
		  , 1			-- IcrtProcessId - int
		  , @SetDate	-- StartTime - datetime
		  , null		-- EndTime - datetime
		  , 1			-- RunStateId - int
		  , null		-- EndState - varchar(16)
		  , null		-- EndMessage - varchar(500)
		  , cast(null as datetime)	-- MinChangeDataCapturePoint - datetime
		  , cast(null as datetime)	-- MaxChangeDataCapturePoint - datetime
		) ;

		select
			1			ProcessRunId
		  , 1			BatchProcessId
		  , 1			IcrtProcessId
		  , @SetDate	StartTime
		  , @SetDate	EndTime
		  , 3			RunStateId
		  , 'SUCCEEDED' EndState				-- varchar(16)
		  , null		EndMessage					   -- varchar(500)
		  , cast(null as datetime)	MinChangeDataCapturePoint  -- datetime
		  , cast(null as datetime)	MaxChangeDataCapturePoint  -- datetime
		into
			#expected ;

		exec [ics].[ProcessRunEnd]
			@ProcessName = 'PN'
		  , @ProcessRunId = 1
		  , @EndState = 'SUCCEEDED'
		  , @SetDate = @SetDate ;

		exec tSQLt.AssertEqualsTable
			@Expected = N'#expected'		-- nvarchar(max)
		  , @Actual = N'batch.ProcessRun' ; -- nvarchar(max)

	end ;
GO
