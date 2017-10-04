select
	  p.productid as product_id
	, json_build_object
		(
		  'id', p.productid
		, 'name', p."name"
		, 'number', p.productnumber
		, 'is_manufactured', p.makeflag
		, 'is_saleable', p.finishedgoodsflag
		, 'colour', p.color
		, 'safety_stock_level', p.safetystocklevel
		, 'reorder_point', p.reorderpoint
		, 'standard_cost', p.standardcost
		, 'list_price', p.listprice
		, 'size', p."size"
		, 'size_uom', p.sizeunitmeasurecode
		, 'weight_uom', p.weightunitmeasurecode
		, 'weight', p.weight
		, 'days_to_manufacture', p.daystomanufacture
		, 'product_line', p.productline
		, 'class', p.class
		, 'style', p."style"
		, 'sub_category', json_build_object
			(
			  'id', psc.productsubcategoryid
			, 'name', psc."name"
			, 'modified_on', psc.modifieddate
			, 'category', json_build_object
				(
				  'id', pc.productcategoryid
				, 'name', pc."name"
				, 'modified_on', pc.modifieddate
				)
			)
		, 'model', json_build_object
			(
			  'id', pm.productmodelid
			, 'name', pm."name"
			)
		) as "product"
from
	production.product as p
left join production.productsubcategory as psc
		inner join production.productcategory as pc
			on pc.productcategoryid = psc.productcategoryid
	on psc.productsubcategoryid = p.productsubcategoryid
left join production.productmodel as pm
	on pm.productmodelid = p.productmodelid
where
	p.productsubcategoryid is not null
limit 100


