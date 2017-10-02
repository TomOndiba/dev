select
	  sod.salesorderdetailid as "id"
	, sod.salesorderid as "order_id"
	, sod.carriertrackingnumber as "carrier_tracking_number"
	, sod.orderqty as "order_quantity"
	, sod.unitprice as "unit_price"
	, sod.unitpricediscount as "unit_price_discount"
	, (coalesce((sod.unitprice * ((1.0) - sod.unitpricediscount)) * sod.orderqty,(0.0))) as "line_total"
	, sod.modifieddate as "modified_on"
	, sod.productid as "product.id"
	, p.p_json
from
	sales.salesorderdetail as sod
,	(
		select
			  array_to_json(array_agg(row_to_json(p)))
		from
			(
				select
					  productid as "product.id"
					, name as "product.name"
					, productnumber as "product.number"
					, makeflag as "product.is_manufactured"
					, finishedgoodsflag as "product.is_saleable"
					, color as "product.color"
					, safetystocklevel as "product.safety_stock_level"
					, reorderpoint as "product.reorder_point"
					, standardcost as "product.standard_cost"
					, listprice as "product.list_price"
					, size as "product.size"
					, sizeunitmeasurecode as "product.size_unit_of_measure_code"
					, weightunitmeasurecode as "product.weight_unit_of_measure_code"
					, weight as "product.weight"
					, daystomanufacture as "product.days_to_manufacture"
					, productline as "product.product_line"
					, class as "product.class"
					, style as "product.style"
					, productsubcategoryid as "product.sub_category.id"
				from
					production.product
				where
					production.product.productid = sales.salesorderdetail.productid
				limit 100
			) as p	
	) as p_json
limit 100


