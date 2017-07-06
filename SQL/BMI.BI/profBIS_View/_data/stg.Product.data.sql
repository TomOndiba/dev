set identity_insert stg.Product on;
go

;with sourceCte (ProductKey, IsDeleted, QlikViewSourceSystemId, ProductNumber, ProductName, ProductDescription1)
as
(
			  select -1, 'N', 100000, 'N/S', 'Not Specified at Source'	, 'Indicates that the value in the source system was NULL'
	union all select -2, 'N', 100000, 'N/F', 'Lookup Not Found'			, 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select -3, 'N', 100000, 'N/I', 'Not Implemented in Source'	, 'Used when the source system does not support the concept of a product'
	union all select -4, 'N', 100000, 'N/A', 'Not Applicable'			, 'Used in a context where product has no relevance in this context'
	union all select -5, 'N', 100000, 'N/D', 'Not Defined'				, 'The logic to identify the product has not been supplied or specified'
)
merge into stg.Product as tgt
using sourceCte as src
	on src.ProductKey = tgt.ProductKey
when not matched
	then insert
	(
	  ProductKey
	, IsDeleted
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
	, QlikViewSourceSystemId
	, NativeProductKey
	, ProductNumber
	, ProductName
	, ProductTypeId
	, ProductTypeName
	, ProductGnit
	, ProductDescription1
	, ProductDescription2
	, LocalProductGroup1
	, LocalProductGroup2
	, LocalProductGroup3
	, LocalProductGroup4
	, LocalProductGroup5
	, NativeProductCategoryKey
	, ProductCategoryBaseLevel
	, ProductCategoryLevel1
	, ProductCategoryLevel2
	, ProductCategoryLevel3
	, ProductCategoryLevel4
	, ProductCategoryLevel5
	, ProductCategoryLevel6
	)
	values
	(
	  src.ProductKey
	, src.IsDeleted
	, src.ProductNumber -- EtlDeltaHash
	, getdate() -- EtlCreatedOn
	, 'add seed values' -- EtlCreatedBy
	, getdate() -- EtlUpdatedOn
	, 'add seed values'  -- EtlUpdatedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, src.QlikViewSourceSystemId
	, src.ProductNumber -- NativeProductKey
	, src.ProductNumber
	, src.ProductName
	, null -- ProductTypeId
	, src.ProductName -- ProductTypeName
	, '' -- ProductGnit
	, src.ProductDescription1
	, '' -- ProductDescription2
	, src.ProductName -- src.LocalProductGroup1
	, '' -- LocalProductGroup2
	, '' -- LocalProductGroup3
	, '' -- LocalProductGroup4
	, '' -- LocalProductGroup5
	, src.ProductNumber -- NativeProductCategoryKey
	, src.ProductName -- ProductCategoryBaseLevel
	, src.ProductName -- ProductCategoryLevel1
	, '' -- ProductCategoryLevel2
	, '' -- ProductCategoryLevel3
	, '' -- ProductCategoryLevel4
	, '' -- ProductCategoryLevel5
	, '' -- ProductCategoryLevel6
	)
when matched
	and tgt.IsDeleted <> src.IsDeleted
	or tgt.QlikViewSourceSystemId <> src.QlikViewSourceSystemId
	or tgt.ProductNumber <> src.ProductNumber
	or tgt.ProductName <> src.ProductName
	or tgt.ProductDescription1 <> src.ProductDescription1
then update
	set
		  tgt.IsDeleted = src.IsDeleted
		, tgt.EtlDeltaHash = src.ProductNumber
		, tgt.EtlUpdatedOn = getdate()
		, tgt.EtlUpdatedBy = 'update seed values' 
		, tgt.EtlDeletedOn = case when src.IsDeleted = 'Y' then getdate() else tgt.EtlDeletedOn end
		, tgt.EtlDeletedBy = case when src.IsDeleted = 'Y' then 'update seed values' else tgt.EtlDeletedBy end
		, tgt.QlikViewSourceSystemId = src.QlikViewSourceSystemId
		, tgt.NativeProductKey = src.ProductNumber
		, tgt.ProductNumber = src.ProductNumber
		, tgt.ProductName = src.ProductName
		, tgt.ProductTypeName = src.ProductName
		, tgt.ProductDescription1 = src.ProductDescription1
		, tgt.LocalProductGroup1 = src.ProductName
		, tgt.NativeProductCategoryKey = src.ProductNumber
		, tgt.ProductCategoryBaseLevel = src.ProductName
		, tgt.ProductCategoryLevel1 = src.ProductName
;
	
set identity_insert stg.Product off;
go
