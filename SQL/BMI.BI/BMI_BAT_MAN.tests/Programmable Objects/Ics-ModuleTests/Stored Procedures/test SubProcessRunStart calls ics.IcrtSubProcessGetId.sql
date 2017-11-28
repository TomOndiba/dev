IF OBJECT_ID('[Ics-ModuleTests].[test SubProcessRunStart calls ics.IcrtSubProcessGetId]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test SubProcessRunStart calls ics.IcrtSubProcessGetId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test SubProcessRunStart calls ics.IcrtSubProcessGetId]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc

		exec tSQLt.SpyProcedure @ProcedureName = N'ics.IcrtSubProcessGetId' ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ProcessGetIdFromIcrtProcessName'
		  , @CommandToExecute = N'set @BatchProcessId=1' ;

		select	'SubPN' IcrtSubProcessName, 1 as BatchProcessId into
				#expected ;
		--! Act
		exec [ics].[SubProcessRunStart]
			@ProcessName = 'PN'
		  , @SubProcessName = 'SubPN'
		  , @ProcessRunId = 1 ;
		 --! Assert
		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'ics.IcrtSubProcessGetId_SpyProcedureLog' ;
	end ;
GO
