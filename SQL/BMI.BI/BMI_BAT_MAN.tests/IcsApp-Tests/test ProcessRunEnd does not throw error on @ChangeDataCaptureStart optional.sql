create procedure [IcsApp-Tests].[test ProcessRunEnd does not throw error on @ChangeDataCaptureStart optional]
as
	begin
		exec tSQLt.SpyProcedure
			@ProcedureName = N'log4.ExceptionHandler'		-- nvarchar(max)
		  , @CommandToExecute = N'Set @ErrorNumber = 1' ;	-- nvarchar(max)

		exec tSQLt.ExpectNoException ;

	exec dbo.ProcessRunEnd
			@ProcessName = 'pn'
		  , @ProcessRunID = 1
		  , @EndState = 'SUCCEEDED'
		  , @EndMessage = 'default'
		  --, @ChangeDataCaptureStart = '24-July-2017'
		  , @ChangeDataCaptureEnd = '24-July-2017' ;

	end ;