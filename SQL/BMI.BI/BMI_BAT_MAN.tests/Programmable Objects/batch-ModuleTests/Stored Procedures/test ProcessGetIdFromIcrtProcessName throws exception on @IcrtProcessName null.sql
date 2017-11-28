IF OBJECT_ID('[batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName null]') IS NOT NULL
	DROP PROCEDURE [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName null];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Name input must not be null or empty%'
	
	exec batch.ProcessGetIdFromIcrtProcessName  @IcrtProcessName = null
end;
GO
