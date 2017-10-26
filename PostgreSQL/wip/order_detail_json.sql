select
	  sod.salesorderdetailid as "id"
	, sod.salesorderid as "order_id"
	, sod.carriertrackingnumber as "carrier_tracking_number"
	, sod.orderqty as "order_quantity"
	, sod.unitprice as "unit_price"
	, sod.unitpricediscount as "unit_price_discount"
	, (coalesce((sod.unitprice * ((1.0) - sod.unitpricediscount)) * sod.orderqty,(0.0))) as "line_total"
	, sod.modifieddate as "modified_on"
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
	, json_build_object
		(
		  'id', so.specialofferid		
		, 'description', so.Description
		, 'discount_percent', so.DiscountPct
		, 'type', so."type"
		, 'category', so.Category
		, 'start_date', so.StartDate
		, 'end_date', so.EndDate
		, 'min_quantity', so.MinQty
		, 'max_quantity', so.MaxQty
		, 'modified_on', so.ModifiedDate
		) as "special_offer"
from
	sales.salesorderdetail as sod
inner join sales.specialofferproduct as sop
	on sop.specialofferid = sod.specialofferid
	and sop.productid = sod.productid
inner join sales.specialoffer as so
	on so.specialofferid = sop.specialofferid
inner join production.product as p
	on p.productid = sod.productid
left join production.productsubcategory as psc
		inner join production.productcategory as pc
			on pc.productcategoryid = psc.productcategoryid
	on psc.productsubcategoryid = p.productsubcategoryid
left join production.productmodel as pm
	on pm.productmodelid = p.productmodelid
limit 100


