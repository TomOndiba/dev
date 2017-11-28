create   procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Name input must not be null or empty%'
	
	exec batch.ProcessGetIdFromIcrtProcessName  @IcrtProcessName = null
end;