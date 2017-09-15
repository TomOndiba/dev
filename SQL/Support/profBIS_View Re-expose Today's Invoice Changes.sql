select * from stg.Invoice where INVOICE_NUMBER = '0001071103'

select * from stg.InvoiceControl where InvoiceKey in (1979548, 1978467, 1977839)

select count(*) as [InsertCount] from stg.Invoice where EtlCreatedOn = '20170912 08:41:49.493' and EtlUpdatedOn = '20170912 08:41:49.493'
select count(*) as [UpdateCount] from stg.Invoice where EtlCreatedOn < '20170912 08:41:49.493' and EtlUpdatedOn = '20170912 08:41:49.493'
select count(*) as [AllChanges] from stg.Invoice where EtlUpdatedOn = '20170912 08:41:49.493'

begin tran

select 'BEFORE' as [BEFORE], * from etl.InvoiceDelta where InvoiceKey in (1979548, 1978467, 1977839)

--! Reset today's updates
update
	ic
set
	  ic.IsDeleted = 'X'
from
	stg.Invoice as i
inner join stg.InvoiceControl as ic
	on ic.InvoiceKey = i.InvoiceKey
where
		i.EtlCreatedOn < '20170912 08:41:49.493'
	and i.EtlUpdatedOn = '20170912 08:41:49.493'

--! Reset today's insert
delete
	ic
from
	stg.Invoice as i
inner join stg.InvoiceControl as ic
	on ic.InvoiceKey = i.InvoiceKey
where
		i.EtlCreatedOn = '20170912 08:41:49.493'
	and i.EtlUpdatedOn = '20170912 08:41:49.493'
	

--delete stg.InvoiceControl where InvoiceKey in (1979548, 1978467, 1977839)

select 'AFTER' as [AFTER], * from etl.InvoiceDelta -- where InvoiceKey in (1979548, 1978467, 1977839)

rollback tran

