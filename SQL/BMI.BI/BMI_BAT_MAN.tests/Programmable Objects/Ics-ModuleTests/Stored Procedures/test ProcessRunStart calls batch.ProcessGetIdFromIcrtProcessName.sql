create  procedure [Ics-ModuleTests].[test ProcessRunStart calls batch.ProcessGetIdFromIcrtProcessName]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName' ;

				exec tSQLt.SpyProcedure
			@ProcedureName = N'log4.ExceptionHandler' ;

		select	'PA' IcrtProcessName, null BatchProcessName, null BatchProcessId into
				#expected ;

		--! Act
		exec [ics].[ProcessRunStart] @ProcessName = 'PA', @IcrtProcessId = 1 ;
		
		


		--! Assert
		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'batch.ProcessGetIdFromIcrtProcessName_SpyProcedureLog' ;
	end ;