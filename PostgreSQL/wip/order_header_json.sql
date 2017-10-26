select
	  soh.salesorderid as order_id
	, soh.revisionnumber as revision_number
	, soh.orderdate as order_date
	, soh.duedate as due_date
	, soh.shipdate as ship_date
	, soh.status as status
	, soh.onlineorderflag as is_online_order
	, soh.purchaseordernumber as purchase_order_number
	, soh.accountnumber as account_number
	, soh.customerid as customer_id
	, psn.persontype as customer_type
	, psn.lastname as customer_last_name
	, psn.firstname as customer_first_name
	, psn.modifieddate as customer_modified_on
	, soh.salespersonid as sales_person_id
	, soh.territoryid as _territory_id
	, soh.billtoaddressid as bill_to_address_id
	, soh.shiptoaddressid as ship_to_address_id
	, soh.shipmethodid as ship_method_id
	, soh.creditcardid as credit_card_id
	, soh.creditcardapprovalcode as credit_card_approval_code
	, soh.currencyrateid as currency_rate_id
	, soh.subtotal as sub_total
	, soh.taxamt as tax_amount
	, soh.freight as freight
	, soh.totaldue as total_due
	, soh."comment" as "comment"
	, soh.modifieddate as modified_on
	, json_agg(json_build_object
		(
		  'id', sod.salesorderdetailid
		, 'carrier_tracking_number', sod.carriertrackingnumber
		, 'order_quantity', sod.orderqty
		, 'unit_price', sod.unitprice
		, 'unit_price_discount', sod.unitpricediscount
		, 'line_total', (coalesce((sod.unitprice * ((1.0) - sod.unitpricediscount)) * sod.orderqty,(0.0)))
		, 'modified_on', sod.modifieddate
		, 'product', json_build_object
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
			)
		, 'special_offer', json_build_object
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
			)
		)) as "order_details"
from
	sales.salesorderheader as soh
inner join sales.customer as c
	on c.customerid = soh.customerid
left join person.person as psn
	on psn.businessentityid = c.personid
inner join sales.salesorderdetail as sod
	on sod.salesorderid = soh.salesorderid
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
where
	soh.salesorderid = '43659'
group by
	  soh.salesorderid
	, soh.revisionnumber
	, soh.orderdate
	, soh.duedate
	, soh.shipdate
	, soh.status
	, soh.onlineorderflag
	, soh.purchaseordernumber
	, soh.accountnumber
	, soh.customerid
	, psn.persontype
	, psn.lastname
	, psn.firstname
	, psn.modifieddate
	, soh.salespersonid
	, soh.territoryid
	, soh.billtoaddressid
	, soh.shiptoaddressid
	, soh.shipmethodid
	, soh.creditcardid
	, soh.creditcardapprovalcode
	, soh.currencyrateid
	, soh.subtotal
	, soh.taxamt
	, soh.freight
	, soh.totaldue
	, soh."comment"
	, soh.modifieddate

--limit 100