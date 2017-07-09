if objectpropertyex(object_id(N'pbi.dimCustomerShippedTo'), N'IsView') = 1
	drop view pbi.dimCustomerShippedTo
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimCustomerShippedTo]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimCustomerShippedTo
DESCRIPTION:    Exposes current state of the Customer dimension imported from QlikView (no history available)
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
		, c.CustomerCategoryBaseLevel
		, c.CustomerCategoryLevel1
		, c.CustomerCategoryLevel2
		, c.CustomerCategoryLevel3
		, c.CustomerCategoryLevel4
		, c.CustomerCategoryLevel5
		, c.CustomerCategoryLevel6
		, c.CustomerCategoryLevel7
		, c.CustomerCategoryLevel8
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, c.IsDeleted
	from
		qvi.dimCustomer as c
go
