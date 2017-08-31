--!
--! 
--!
select
	  DataSourceKey
	, OrderNumber
	, NativeOrderLineNumber
	, count(*) as [DupeCount]
from
	qvstg.OrderBacklog
where
	IsDeleted = 'N'
group by
		DataSourceKey
	, OrderNumber
	, NativeOrderLineNumber
having
	count(*) > 1
order by
	[DupeCount] desc
go

/*
select * from qvstg.OrderBacklog
where 
		(DataSourceKey = 000 and OrderNumber = '' and NativeOrderLineNumber = '') -- 
	--or (DataSourceKey = 000 and OrderNumber = '' and NativeOrderLineNumber = '') -- 
	--or (DataSourceKey = 000 and OrderNumber = '' and NativeOrderLineNumber = '') -- 
order by DataSourceKey, OrderNumber, NativeOrderLineNumber, EtlCreatedOn desc
*/

--!
--! 
--!
select
	  DataSourceKey
	, OrderNumber
	, NativeOrderLineNumber
	, NativeShippingDocumentKey
	, count(*) as [DupeCount]
from
	qvstg.OrderShippedNotInvoiced
where
	IsDeleted = 'N'
group by
		DataSourceKey
	, OrderNumber
	, NativeOrderLineNumber
	, NativeShippingDocumentKey
having
	count(*) > 1
order by
	[DupeCount] desc
go

/*
select * from qvstg.OrderShippedNotInvoiced
where 
		(DataSourceKey = 000 and OrderNumber = '' and NativeOrderLineNumber = '' and NativeShippingDocumentKey = '') -- 
	--or (DataSourceKey = 000 and OrderNumber = '' and NativeOrderLineNumber = '' and NativeShippingDocumentKey = '') -- 
	--or (DataSourceKey = 000 and OrderNumber = '' and NativeOrderLineNumber = '' and NativeShippingDocumentKey = '') -- 
order by DataSourceKey, OrderNumber, NativeOrderLineNumber, EtlCreatedOn desc
*/

--!
--! 
--!
select
	  i.DataSourceKey
    , i.InvoiceNumber
    , i.NativeInvoiceLineNumber
    , i.OrderNumber
    , i.NativeOrderLineNumber
	, count(*) as [DupeCount]
from
	qvstg.Invoice as i
where
	IsDeleted = 'N'
group by
	i.DataSourceKey
    , i.InvoiceNumber
    , i.NativeInvoiceLineNumber
    , i.OrderNumber
    , i.NativeOrderLineNumber
having
	count(*) > 1
order by
	[DupeCount] desc
go

/*
select * from qvstg.Invoice
where 
		(DataSourceKey = 000 and InvoiceNumber = '' and NativeInvoiceLineNumber = '' and OrderNumber = '' and NativeOrderLineNumber = '') -- 
	--or (DataSourceKey = 000 and InvoiceNumber = '' and NativeInvoiceLineNumber = '' and OrderNumber = '' and NativeOrderLineNumber = '') -- 
	--or (DataSourceKey = 000 and InvoiceNumber = '' and NativeInvoiceLineNumber = '' and OrderNumber = '' and NativeOrderLineNumber = '') -- 
order by DataSourceKey, InvoiceNumber, InvoiceLineNumber, OrderNumber, NativeOrderLineNumber, EtlCreatedOn desc
*/
