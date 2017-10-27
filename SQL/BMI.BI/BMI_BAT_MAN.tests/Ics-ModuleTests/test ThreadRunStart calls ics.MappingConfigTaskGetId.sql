create   procedure [Ics-ModuleTests].[test ThreadRunStart calls ics.MappingConfigTaskGetId]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc

		exec tSQLt.SpyProcedure @ProcedureName = N'ics.MappingConfigTaskGetId' ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		select	'MCTN' MappingConfigTaskName, 'MN' MappingName into
				#expected ;
		--! Act
		exec [ics].[ThreadRunStart]
			@MappingConfigTaskName = 'MCTN'
		  , @MappingName = 'MN'
		  , @SubProcessRunId = 1 ;
		  
		--! Assert
		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'ics.MappingConfigTaskGetId_SpyProcedureLog' ;
	end ;