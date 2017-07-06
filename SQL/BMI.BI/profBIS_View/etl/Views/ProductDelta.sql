create view [etl].[ProductDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.ProductDelta
DESCRIPTION:    Exposes Product changes (new, changed and deleted) in the format best suited to populate the Interim
				Data Warehouse/Mart.
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    30-MAY-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		30-MAY-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  p.ProductKey
        , p.IsDeleted
		--! The standard products (N/S, N/F, N/I etc) already have the correct QlikViewSourceSystemId
        , case when p.QlikViewSourceSystemId = 100000 then p.QlikViewSourceSystemId else p.QlikViewSourceSystemId + 100100 end as [DataSourceKey]
        , p.NativeProductKey
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
		, p.ProductCategoryLevel1Id
        , p.ProductCategoryLevel1
 		, p.ProductCategoryLevel2Id
        , p.ProductCategoryLevel2
		, p.ProductCategoryLevel3Id
        , p.ProductCategoryLevel3
		, p.ProductCategoryLevel4Id
        , p.ProductCategoryLevel4
		, p.ProductCategoryLevel5Id
        , p.ProductCategoryLevel5
		, p.ProductCategoryLevel6Id
        , p.ProductCategoryLevel6
	from
		stg.Product as p
	left join stg.ProductControl as pc
		on pc.ProductKey = p.ProductKey
	where
			pc.ProductKey is null --! New Products (not yet added to control)
		or pc.PreviousDeltaHash <> p.EtlDeltaHash -- Existing Products that have been updated
		or pc.IsDeleted <> p.IsDeleted --! Products that have been soft-deleted or (possibly) re-activated
go
exec sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Product changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'ProductDelta';
