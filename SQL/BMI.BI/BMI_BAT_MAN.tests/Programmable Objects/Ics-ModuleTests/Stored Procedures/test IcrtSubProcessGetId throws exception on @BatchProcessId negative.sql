create procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchProcessId negative]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Batch Process Id (derived from ICRT process name) must be greater than zero%'
	
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = 'A', @BatchProcessId = -1 ;
end;