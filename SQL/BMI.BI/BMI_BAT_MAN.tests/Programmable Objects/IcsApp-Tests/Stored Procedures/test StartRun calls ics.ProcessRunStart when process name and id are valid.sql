IF OBJECT_ID('[IcsApp-Tests].[test StartRun calls ics.ProcessRunStart when process name and id are valid]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun calls ics.ProcessRunStart when process name and id are valid];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun calls ics.ProcessRunStart when process name and id are valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	declare @_ProcessName varchar(100) = 'A', @_IcrtProcessId int = 99 ;

	select @_ProcessName as [ProcessName], @_IcrtProcessId as [IcrtProcessId] into #expected ;
	
	exec IcsApp.StartRun
		@ProcessName = @_ProcessName
	  , @IcrtProcessId = @_IcrtProcessId
	  , @SubProcessName = null
	  , @MappingConfigTaskName = null
	  , @MappingName = null
	  , @ProcessRunId = null
	  , @SubProcessRunId = null

	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'ics.ProcessRunStart_SpyProcedureLog' ;
end;
GO
