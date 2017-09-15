CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions calls log4.JournalWriter on success]
as
begin
	exec tSQLt.FakeTable @TableName = N'qvstg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderBacklog' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderShippedNotInvoiced' ;
	exec tSQLt.SpyProcedure @ProcedureName = 'log4.JournalWriter' ;

	select
		  cast('[etl].[CheckForDuplicateQlikViewTransactions]' as varchar(256))		as [FunctionName]
		, cast('OnComplete' as varchar(128))										as [StepInFunction]
		, cast('QlikView-to-DW Load' as varchar(128))								as [Task]
		, cast(null as int)															as [ExceptionId]
	into
		#expected
	
	--! Act
	exec etl.CheckForDuplicateQlikViewTransactions ;

	--! Assert (1)
	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'log4.JournalWriter_SpyProcedureLog', @Message = 'The call to log4.JournalWriter did not occur as expected ' ;

	--! Assert (2)
	declare @_ExpectedMessagePattern nvarchar(1000) = 'Found no active duplicate Invoices or Orders in a total run time of % milliseconds'
	declare @_ActualMessage nvarchar(1000) = (select MessageText from log4.JournalWriter_SpyProcedureLog)

	if @_ActualMessage not like @_ExpectedMessagePattern
		begin
			declare @_FailMsg nvarchar(max) = 'Expected MessageText to be like <<' + @_ExpectedMessagePattern + '>>'
				+ ' but was <<' + coalesce(@_ActualMessage, 'NULL') + '>>' ;

			exec tSQLt.Fail @_FailMsg ;
		end
end