


create view [dbo].[v_MD_SBU_DIRECT] as
SELECT sit.SBU, sit.REGION_ID, sb.SBU_NAME
FROM MD_SITE as sit
     join
	   MD_SBU as sb on (sb.SBU = sit.SBU)
where sb.IPROBIS_PURCHASE = 'Y'
group by sit.SBU, sit.REGION_ID, sb.SBU_NAME