IF OBJECT_ID('[Ics-ModuleTests].[test ThreadRunStart throws error after handling exception]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test ThreadRunStart throws error after handling exception];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [Ics-ModuleTests].[test ThreadRunStart throws error after handling exception]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	--! Assert
	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	--! For now, as this is just a stub, the only way we can force an error is to drop a dependant column
	--! on the stub results table - we will need to refactor this test when that stub table is replaced
	alter table dbo.StubResultSet drop column ThreadRunID;

	--! Act
	exec ics.ThreadRunStart
		  @MappingConfigTaskName = 'D'
		, @MappingName = 'C'
		, @SubProcessRunId = 22
end;
GO
