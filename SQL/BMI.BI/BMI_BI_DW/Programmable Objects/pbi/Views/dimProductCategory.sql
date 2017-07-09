IF OBJECT_ID('[pbi].[dimProductCategory]') IS NOT NULL
	DROP VIEW [pbi].[dimProductCategory];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [pbi].[dimProductCategory]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimProductCategory
DESCRIPTION:    Exposes current state of the Product Category dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    19-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		19-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  s.ProductCategoryKey
		, ProductCategoryId
		, ProductCategoryName
		, NodeDepth
		, Level3Id
		, Level3Name
		, Level2Id
		, Level2Name
		, Level1Id
		, Level1Name
		, ProductCategoryDescription 
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, s.IsDeleted
	from
		qvstg.ProductCategory as s
GO
