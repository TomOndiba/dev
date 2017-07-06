

CREATE view [dbo].[V_MD_SBU_AMM] as
select sb.IPROBIS_AMM_NAME as SBU,
       sb.REGION_ID
from V_MD_SBU_DIRECT md
      join
        MD_SBU as sb on (sb.SBU = md.SBU)
where (sb.IPROBIS_AMM = 'Y') or
      (sb.IPROBIS_AMM_PVC = 'Y')