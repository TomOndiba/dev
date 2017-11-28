IF OBJECT_ID('[Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId zero]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId zero];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId zero]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Batch Process Id (derived from ICRT process name) must be greater than zero%'
	
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = 'A', @BatchProcessId = 0 ;
end;
GO
