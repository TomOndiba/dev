CREATE procedure [IcsApp-Tests].[test ThreadRunEnd does not throw error on @EndMessage optional]
as
	begin
		exec tSQLt.SpyProcedure
			@ProcedureName = N'log4.ExceptionHandler'		-- nvarchar(max)
		  , @CommandToExecute = N'Set @ErrorNumber = 1' ;	-- nvarchar(max)

		exec tSQLt.ExpectNoException ;

		exec dbo.ThreadRunEnd
			@MappingName = 'mn'
		  , @MappingConfigTaskName = 'mctn'
		  , @ThreadRunID = 1
		  , @EndState = 'Failed'
			--@EndMessage='',
		  , @SuccessSourceRows = 100
		  , @FailedSourceRows = 1
		  , @SuccessTargetRows = 101
		  , @FailedTargetRows = 1 ;

	end ;