use profBIS_View
go

; with countsCte
as
(
			  select 'BusinessUnit' as [TableName], count(*) as [DeltaCount] from etl.BusinessUnitDelta							-- 
	union all select 'Customer' as [TableName], count(*) as [DeltaCount] from etl.CustomerDelta									-- 
	union all select 'Invoice' as [TableName], count(*) as [DeltaCount] from etl.InvoiceDelta									-- 
	union all select 'OrderBacklog' as [TableName], count(*) as [DeltaCount] from etl.OrderBacklogDelta							-- 
	union all select 'OrderShippedNotInvoiced' as [TableName], count(*) as [DeltaCount] from etl.OrderShippedNotInvoicedDelta	-- 
	union all select 'PaymentTerm' as [TableName], count(*) as [DeltaCount] from etl.PaymentTermDelta							-- 
	union all select 'Product' as [TableName], count(*) as [DeltaCount] from etl.ProductDelta									-- 
	union all select 'ProductCategory' as [TableName], count(*) as [DeltaCount] from etl.ProductCategoryDelta					-- 
	union all select 'Site' as [TableName], count(*) as [DeltaCount] from etl.SiteDelta											-- 
)
select * from countsCte order by countsCte.TableName;
go

exec log4Utils.JournalReader @StartDate = '20170829'

exec log4Utils.JournalPrinter @JournalId = 630 -- int
exec log4Utils.JournalPrinter @JournalId = 468 -- int
exec log4Utils.JournalPrinter @JournalId = 461 -- int

exec log4Utils.ExceptionReader

--exec etl.PrepareStagingData @LoadStart = '20170807 16:00:00', @DebugLevel = 5 ;

-- exec etl.SetStagingDelta @LoadEnd = '20170830 12:57:00', @DebugLevel = 5 ;




