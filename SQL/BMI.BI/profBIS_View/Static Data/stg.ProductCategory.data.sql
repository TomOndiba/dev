set identity_insert stg.ProductCategory on;
go

;with sourceCte (ProductCategoryKey, IsDeleted, ProductCategoryCode, ProductCategoryName, ProductCategoryDescription)
as
(
			  select -1, 'N', 'N/S', 'Not Specified at Source'		, 'Indicates that the value in the source system was NULL'
	union all select -2, 'N', 'N/F', 'Lookup Not Found'				, 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select -3, 'N', 'N/I', 'Not Implemented in Source'	, 'Used when the source system does not support the concept of a Business Unit'
	union all select -4, 'N', 'N/A', 'Not Applicable'				, 'Used in a context where Business Unit has no relevance in this context'
	union all select -5, 'N', 'N/D', 'Not Defined'					, 'The logic to identify the Business Unit has not been supplied or specified'
)
merge into stg.ProductCategory as tgt
using sourceCte as src
	on src.ProductCategoryKey = tgt.ProductCategoryKey
when not matched
	then insert
	(
	  ProductCategoryKey
	, IsDeleted
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
	, NativeProductCategoryKey
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
	)
	values
	(
	  src.ProductCategoryKey
	, src.IsDeleted
	, src.ProductCategoryCode -- EtlDeltaHash
	, getdate() -- EtlCreatedOn
	, 'add seed values' -- EtlCreatedBy
	, getdate() -- EtlUpdatedOn
	, 'add seed values'  -- EtlUpdatedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, src.ProductCategoryCode -- NativeProductCategoryKey
	, src.ProductCategoryKey
	, src.ProductCategoryName
	, 1
	, src.ProductCategoryKey
	, src.ProductCategoryName
	, src.ProductCategoryKey
	, src.ProductCategoryName
	, src.ProductCategoryKey
	, src.ProductCategoryName
	, src.ProductCategoryDescription
	)
when matched
	and tgt.IsDeleted <> src.IsDeleted
	or tgt.NativeProductCategoryKey <> src.ProductCategoryCode
	or tgt.ProductCategoryId <> src.ProductCategoryKey
	or tgt.ProductCategoryName <> src.ProductCategoryName
	or tgt.ProductCategoryDescription <> src.ProductCategoryDescription
then update
	set
		  tgt.IsDeleted = src.IsDeleted
		, tgt.EtlDeltaHash = src.ProductCategoryCode
		, tgt.EtlUpdatedOn = getdate()
		, tgt.EtlUpdatedBy = 'update seed values' 
		, tgt.EtlDeletedOn = case when src.IsDeleted = 'Y' then getdate() else tgt.EtlDeletedOn end
		, tgt.EtlDeletedBy = case when src.IsDeleted = 'Y' then 'update seed values' else tgt.EtlDeletedBy end
		, tgt.NativeProductCategoryKey = src.ProductCategoryCode
		, tgt.ProductCategoryId = src.ProductCategoryKey
		, tgt.ProductCategoryName = src.ProductCategoryName
		, tgt.Level3Id = src.ProductCategoryKey
		, tgt.Level3Name = src.ProductCategoryName
		, tgt.Level2Id = src.ProductCategoryKey
		, tgt.Level2Name = src.ProductCategoryName
		, tgt.Level1Id = src.ProductCategoryKey
		, tgt.Level1Name = src.ProductCategoryName
		, tgt.ProductCategoryDescription = src.ProductCategoryDescription
;
	
set identity_insert stg.ProductCategory off;
go
