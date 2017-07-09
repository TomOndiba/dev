if objectpropertyex(object_id(N'pbi.dimProduct'), N'IsView') = 1
	drop view pbi.dimProduct
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimProduct]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimProduct
DESCRIPTION:    Exposes current state of the Product dimension imported from QlikView (no history available)
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
		  p.ProductKey
		, p.ProductNumber
		, p.ProductName
		, p.ProductTypeId
		, p.ProductTypeName
		, p.ProductGnit
		, p.ProductDescription1
		, p.ProductDescription2
		, p.LocalProductGroup1
		, p.LocalProductGroup2
		, p.LocalProductGroup3
		, p.LocalProductGroup4
		, p.LocalProductGroup5
		, p.NativeProductCategoryKey
		, p.ProductCategoryBaseLevel
		, p.ProductCategoryLevel1
		, p.ProductCategoryLevel2
		, p.ProductCategoryLevel3
		, p.ProductCategoryLevel4
		, p.ProductCategoryLevel5
		, p.EnglishProductName
		, p.EnglishProductTypeName
		, p.EnglishProductDescription1
		, p.EnglishProductDescription2
		, p.EnglishConfidenceScore
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, p.IsDeleted
	from
		qvi.dimProduct as p
go
