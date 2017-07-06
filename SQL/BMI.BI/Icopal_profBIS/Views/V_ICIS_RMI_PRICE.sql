


CREATE  VIEW [dbo].[V_ICIS_RMI_PRICE]
AS
select ip.ICIS_PRODUCT, ip.ICIS_DATE, 
       (((ip.PRICE + ip.SHIPPING_COST + ip.TERMINAL_COST) * cr.CURRENCY_RATE) / eurr.CURRENCY_RATE) as PRICE,
       cr.DATE_ACTIVE as CURRENCY_DATE, 
       cr.CURRENCY_RATE,
       (((i100.PRICE + i100.SHIPPING_COST + i100.TERMINAL_COST) * cr.CURRENCY_RATE) / eurr.CURRENCY_RATE) as INDEX100_PRICE
from MD_ICIS_PRICE as ip
       join
          MD_ICIS_PRODUCT as prod on (prod.ICIS_PRODUCT = ip.ICIS_PRODUCT)
       left outer join
          MD_ICIS_PRICE as i100 on (i100.ICIS_PRODUCT = prod.ICIS_PRODUCT and
                                    i100.ICIS_DATE    = prod.INDEX100_DATE)
       join
          MD_CURRENCY_RATE as cr on (cr.CURRENCY = prod.CURRENCY and
                                     cr.CURRENCY_RATE_TYPE = 3)
       join
         MD_CURRENCY_RATE as eurr on (eurr.CURRENCY = 'EUR' and
                                      eurr.CURRENCY_RATE_TYPE = 3)
where cr.DATE_ACTIVE  = (select TOP 1 DATE_ACTIVE
                         from MD_CURRENCY_RATE
                         where CURRENCY     = prod.CURRENCY and
                               CURRENCY_RATE_TYPE = 3 and
                               DATE_ACTIVE <= ip.ICIS_DATE
                         order by DATE_ACTIVE desc) and
      eurr.DATE_ACTIVE = (select TOP 1 DATE_ACTIVE
                          from MD_CURRENCY_RATE
                          where CURRENCY     = 'EUR' and
                                CURRENCY_RATE_TYPE = 3 and
                                DATE_ACTIVE <= ip.ICIS_DATE
                          order by DATE_ACTIVE desc)
        
union

select 'IndexMix ' + sbu.SBU,
       ip1.ICIS_DATE, 
       ((((ip1.PRICE + ip1.SHIPPING_COST + ip1.TERMINAL_COST) * cr1.CURRENCY_RATE) / eurr1.CURRENCY_RATE) * sbu.ICIS_PCT_1 / 100) +
       ((((ip2.PRICE + ip2.SHIPPING_COST + ip2.TERMINAL_COST) * cr1.CURRENCY_RATE) / eurr1.CURRENCY_RATE) * SBU.ICIS_PCT_2 / 100) as PRICE,
       cr1.DATE_ACTIVE as CURRENCY_DATE, 
	   cr1.CURRENCY_RATE,
	   ((((i1001.PRICE + i1001.SHIPPING_COST + i1001.TERMINAL_COST) * cr1.CURRENCY_RATE) / eurr1.CURRENCY_RATE) * sbu.ICIS_PCT_1 / 100) +
       ((((i1002.PRICE + i1002.SHIPPING_COST + i1002.TERMINAL_COST) * cr1.CURRENCY_RATE) / eurr1.CURRENCY_RATE) * sbu.ICIS_PCT_2 / 100) INDEX100_PRICE
from MD_SBU as sbu
       join
          MD_ICIS_PRICE as ip1 on (ip1.ICIS_PRODUCT = sbu.ICIS_PRODUCT_1) 
       join
          MD_ICIS_PRODUCT as prod1 on (prod1.ICIS_PRODUCT = ip1.ICIS_PRODUCT)
       left outer join
          MD_ICIS_PRICE as i1001 on (i1001.ICIS_PRODUCT = prod1.ICIS_PRODUCT and
                                     i1001.ICIS_DATE    = prod1.INDEX100_DATE)
       join
          MD_CURRENCY_RATE as cr1 on (cr1.CURRENCY = prod1.CURRENCY and
                                      cr1.CURRENCY_RATE_TYPE = 3)
       join
         MD_CURRENCY_RATE as eurr1 on (eurr1.CURRENCY = 'EUR' and
                                       eurr1.CURRENCY_RATE_TYPE = 3)

       join
          MD_ICIS_PRICE as ip2 on (ip2.ICIS_PRODUCT = sbu.ICIS_PRODUCT_2) 
       join
          MD_ICIS_PRODUCT as prod2 on (prod2.ICIS_PRODUCT = ip2.ICIS_PRODUCT)
       left outer join
          MD_ICIS_PRICE as i1002 on (i1002.ICIS_PRODUCT = prod2.ICIS_PRODUCT and
                                     i1002.ICIS_DATE    = prod2.INDEX100_DATE)
where sbu.ICIS_PRODUCT_1 <> '' and sbu.ICIS_PRODUCT_2 <> '' and
      cr1.DATE_ACTIVE  = (select TOP 1 DATE_ACTIVE
                         from MD_CURRENCY_RATE
                         where CURRENCY     = prod1.CURRENCY and
                               CURRENCY_RATE_TYPE = 3 and
                               DATE_ACTIVE <= ip1.ICIS_DATE
                         order by DATE_ACTIVE desc) and
      eurr1.DATE_ACTIVE = (select TOP 1 DATE_ACTIVE
                          from MD_CURRENCY_RATE
                          where CURRENCY     = 'EUR' and
                                CURRENCY_RATE_TYPE = 3 and
                                DATE_ACTIVE <= ip1.ICIS_DATE
                          order by DATE_ACTIVE desc) 
	  and
      ip2.ICIS_DATE  = (select TOP 1 ICIS_DATE
                        from MD_ICIS_PRICE
                         where ICIS_PRODUCT   = prod2.ICIS_PRODUCT and
                               ICIS_DATE     <= ip1.ICIS_DATE
                         order by ICIS_DATE desc)