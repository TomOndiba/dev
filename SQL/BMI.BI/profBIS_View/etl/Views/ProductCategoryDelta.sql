create view [etl].[ProductCategoryDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.ProductCategoryDelta
DESCRIPTION:    Exposes Product Category changes (new, changed and deleted) in the format best suited to populate the
				Interim Data Warehouse/Mart.
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
		  pc.ProductCategoryKey
		, pc.IsDeleted
		, pc.NativeProductCategoryKey
		, pc.ProductCategoryId
		, pc.ProductCategoryName
		, pc.NodeDepth
		, pc.Level3Id
		, pc.Level3Name
		, pc.Level2Id
		, pc.Level2Name
		, pc.Level1Id
		, pc.Level1Name
		, pc.ProductCategoryDescription
	from
		stg.ProductCategory as pc
	left join stg.ProductCategoryControl as pcc
		on pcc.ProductCategoryKey = pc.ProductCategoryKey
	where
			pcc.ProductCategoryKey is null --! New Product Categorys (not yet added to control)
		or pcc.PreviousDeltaHash <> pc.EtlDeltaHash -- Existing Product Categorys that have been updated
		or pcc.IsDeleted <> pc.IsDeleted --! Product Categorys that have been soft-deleted or (possibly) re-activated

go
exec sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Product Category changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'ProductCategoryDelta';
