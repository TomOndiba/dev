create  procedure [IcsApp-Tests].[test SubProcessRunEnd accepts @EndState "FAILED"]
as
begin
	exec tSQLt.SpyProcedure
		@ProcedureName = N'log4.ExceptionHandler'	-- nvarchar(max)
		, @CommandToExecute = N'Set @ErrorNumber = 1' -- nvarchar(max)

	exec tSQLt.ExpectNoException

			exec dbo.SubProcessRunEnd
			@ProcessName = 'pn'
		  , @SubProcessName = 'spn' 
		  , @SubProcessRunID = 1
		  , @EndState = 'FAILED'
		  , @EndMessage = 'default'
end ;