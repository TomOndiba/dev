create view [etl].[CustomerDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.CustomerDelta
DESCRIPTION:    Exposes Customer changes (new, changed and deleted) in the format best suited to populate the Interim
				Data Warehouse/Mart.
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  c.CustomerKey
        , c.IsDeleted
		--! The standard products (N/S, N/F, N/I etc) already have the correct QlikViewSourceSystemId
        , case when c.QlikViewSourceSystemId = 100000 then c.QlikViewSourceSystemId else c.QlikViewSourceSystemId + 100100 end as [DataSourceKey]
        , c.NativeCustomerKey
        , c.CustomerNumber
        , c.CustomerName
        , c.CustomerAddress1
        , c.CustomerAddress2
        , c.CustomerAddress3
        , c.CustomerZipCode
        , c.CustomerCity
        , c.CustomerCountry
        , c.CustomerVatNumber
        , c.CustomerTypeId
        , c.CustomerTypeName
        , c.CustomerGroup1
        , c.CustomerGroup2
        , c.CustomerGroup3
        , c.CustomerGroup4
        , c.CustomerGroup5
        , c.CategoryIsMapped
        , c.NativeCustomerCategoryKey
        , c.CustomerCategoryBaseLevel
        , c.CustomerCategoryLevel1
        , c.CustomerCategoryLevel2
        , c.CustomerCategoryLevel3
        , c.CustomerCategoryLevel4
        , c.CustomerCategoryLevel5
        , c.CustomerCategoryLevel6
        , c.CustomerCategoryLevel7
        , c.CustomerCategoryLevel8
	from
		stg.Customer as c
	left join stg.CustomerControl as cc
		on cc.CustomerKey = c.CustomerKey
	where
			cc.CustomerKey is null --! New Customers (not yet added to control)
		or cc.PreviousDeltaHash <> c.EtlDeltaHash -- Existing Customers that have been updated
		or cc.IsDeleted <> c.IsDeleted --! Customers that have been soft-deleted or (possibly) re-activated
go
exec sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Customer changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'CustomerDelta';
