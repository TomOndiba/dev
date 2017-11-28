create   procedure [Ics-ModuleTests].[test ThreadRunStart sets @Message]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc
		declare
			@SetDate as datetime	= getdate()
		  , @expected	varchar(50) = ''
		  , @actual		varchar(50) ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.SpyProcedure @ProcedureName = N'ics.MappingConfigTaskGetId' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ThreadGetId'
		  , @CommandToExecute = N'set @StepId=1' ;

		--! Act
		exec [ics].[ThreadRunStart]
			@MappingConfigTaskName = 'MCTN'
		  , @MappingName = 'MN'
		  , @SubProcessRunId = 1
		  , @Message = @actual output ;

		--------! Assert
		exec tSQLt.AssertEquals
			@Expected = @expected	-- sql_variant
		  , @Actual = @actual ;		-- sql_variant

	end ;