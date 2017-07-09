if objectpropertyex(object_id(N'pbi.factSaleForecastTotal'), N'IsView') = 1
	drop view pbi.factSaleForecastTotal
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factSaleForecastTotal]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factSaleForecastTotal
DESCRIPTION:    Exposes current state of the Invoice facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

select
	  SiteKey
	, ProductKey
	, SoldToCustomerKey
	, ShippedToCustomerKey
	, sum(TotalGroupAmountEUR) as [TotalGroupAmountEUR]
from
	(
			select
				  i.SiteKey
				, i.ProductKey
				, i.SoldToCustomerKey
				, i.ShippedToCustomerKey
				, sum(coalesce(i.GroupAmountEUR, 0)) as [TotalGroupAmountEUR]
			from
				qvi.factInvoice as i
			where
				i.IsDeleted = 'N'
			group by
				  i.SiteKey
				, i.ProductKey
				, i.SoldToCustomerKey
				, i.ShippedToCustomerKey
		union
			select
				  osni.SiteKey
				, osni.ProductKey
				, osni.SoldToCustomerKey
				, osni.ShippedToCustomerKey
				, sum(coalesce(osni.GroupAmountEUR, 0)) as [TotalGroupAmountEUR]
			from
				qvi.factOrderShippedNotInvoiced as osni
			where
				osni.IsDeleted = 'N'
			group by
				  osni.SiteKey
				, osni.ProductKey
				, osni.SoldToCustomerKey
				, osni.ShippedToCustomerKey
		union
			select
				  ob.SiteKey
				, ob.ProductKey
				, ob.SoldToCustomerKey
				, ob.ShippedToCustomerKey
				, sum(coalesce(ob.GroupAmountEUR, 0)) as [TotalGroupAmountEUR]
			from
				qvi.factOrderBacklog as ob
			where
				ob.IsDeleted = 'N'
			group by
				  ob.SiteKey
				, ob.ProductKey
				, ob.SoldToCustomerKey
				, ob.ShippedToCustomerKey
	) as x
group by
	  SiteKey
	, ProductKey
	, SoldToCustomerKey
	, ShippedToCustomerKey
go
