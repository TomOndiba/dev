CREATE procedure [Ics-ModuleTests].[test ThreadRunEnd updates batch.ThreadRun]
as
	begin

		declare @SetDate as datetime = getdate() ;

		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;
		alter table batch.StepRun nocheck constraint all ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.FakeTable @TableName = N'batch.ThreadRun' ;

		insert into batch.ThreadRun
		(
			ThreadRunId
		  , StepRunId
		  , ThreadId
		  , StartTime
		  , EndTime
		  , RunStateId
		  , EndState
		  , EndMessage
		  , SuccessSourceRows
		  , FailedSourceRows
		  , SuccessTargetRows
		  , FailedTargetRows
		  , MinChangeDataCapturePoint
		  , MaxChangeDataCapturePoint
		)
		values
		(
			1
		  , 1			-- StepRunId - int
		  , 1			-- ThreadId - int
		  , @SetDate	-- StartTime - datetime
		  , null		-- EndTime - datetime
		  , 1			-- RunStateId - int
		  , null		-- EndState - varchar(16)
		  , null		-- EndMessage - varchar(500)
		  , 0			-- SuccessSourceRows - int
		  , 0			-- FailedSourceRows - int
		  , 0			-- SuccessTargetRows - int
		  , 0			-- FailedTargetRows - int
		  , null		-- MinChangeDataCapturePoint - datetime
		  , null		-- MaxChangeDataCapturePoint - datetime
		) ;

		select
			1					   ThreadRunId
		  , 1					   StepRunId					-- int
		  , 1					   ThreadId						 -- int
		  , @SetDate			   StartTime					-- datetime
		  , @SetDate			   EndTime						-- datetime
		  , 15					   RunStateId					-- int
		  , 'SUCCEEDED'			   EndState						-- varchar(16)
		  , null				   EndMessage					-- varchar(500)
		  , 10					   SuccessSourceRows			-- int
		  , 1					   FailedSourceRows				-- -int
		  , 100					   SuccessTargetRows			 -- int
		  , 1					   FailedTargetRows				 -- int
		  , cast(null as datetime) MinChangeDataCapturePoint	-- datetime
		  , cast(null as datetime) MaxChangeDataCapturePoint	-- datetime
		into
			#expected ;

		exec [ics].[ThreadRunEnd]
			@MappingConfigTaskName = 'MCTN'
		  , @MappingName = 'MN'
		  , @ThreadRunId = 1
		  , @EndState = 'SUCCEEDED'
		  , @EndMessage = null
		  , @SuccessSourceRows = 10
		  , @FailedSourceRows = 1
		  , @SuccessTargetRows = 100
		  , @FailedTargetRows = 1
		  , @SetDate = @SetDate ;

		exec tSQLt.AssertEqualsTable
			@Expected = N'#expected'		-- nvarchar(max)
		  , @Actual = N'batch.ThreadRun' ;	-- nvarchar(max)

	end ;