CREATE procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @IcrtSubProcessName empty]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Sub-process Name input must not be null or empty%'
	
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = '', @BatchProcessId = 1 ;
end;