IF OBJECT_ID('[batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName empty]') IS NOT NULL
	DROP PROCEDURE [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName empty];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws exception on @IcrtProcessName empty]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Name input must not be null or empty%'
	
	exec batch.ProcessGetIdFromIcrtProcessName @IcrtProcessName = ''
end;
GO
