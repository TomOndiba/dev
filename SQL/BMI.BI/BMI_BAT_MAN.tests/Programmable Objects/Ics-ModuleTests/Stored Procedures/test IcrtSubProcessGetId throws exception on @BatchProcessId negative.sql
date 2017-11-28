IF OBJECT_ID('[Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId negative]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId negative];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId negative]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Batch Process Id (derived from ICRT process name) must be greater than zero%'
	
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = 'A', @BatchProcessId = -1 ;
end;
GO
