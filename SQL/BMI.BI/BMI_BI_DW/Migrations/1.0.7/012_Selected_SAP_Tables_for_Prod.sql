-- <Migration ID="b3937585-f74e-4251-802e-93fdc67d9386" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADR6]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADR6] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_ADR6_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADR6]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADR6] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADR6_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADR6]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADR6] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADR6_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADRC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_ADRC_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADRC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADRC_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADRC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADRC_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BKPF] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_BKPF_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BKPF] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BKPF_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BKPF] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BKPF_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_BSEG_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BSEG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BSEG_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CEPC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CEPC] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_CEPC_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CEPC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CEPC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CEPC_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CEPC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CEPC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CEPC_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_CSKS_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKS_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKT] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_CSKT_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKT_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKT_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EBAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EBAN_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EBAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EBAN_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EBAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EBAN_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EINE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EINE] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EINE_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EINE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EINE_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EINE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EINE_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EKAN_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKAN_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKAN_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKES]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKES] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EKES_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKES]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKES] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKES_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKES]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKES] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKES_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKET]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EKET_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKET]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKET_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKET]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKET_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKKO] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EKKO_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKKO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKKO_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKKO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKKO_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_EKPO_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKPO_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKPO_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEKO] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KEKO_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEKO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEKO_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEKO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEKO_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEPH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KEPH_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEPH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEPH_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEPH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEPH_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNA1] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNA1_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNA1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNA1_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNB1_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNB1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNB1_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVH] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNVH_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVH_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVH_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNVK_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVK_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNVP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNVS_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVS_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVV] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KNVV_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVV] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVV_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVV] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVV_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KOND]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KOND_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KOND]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KOND_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KOND]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KOND_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONH] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KONH_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONH_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONH_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KONP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONV] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_KONV_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONV] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONV_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONV] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONV_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_LFA1_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFA1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFA1_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFB1] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_LFB1_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFB1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFB1_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFBK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_LFBK_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFBK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFBK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFBK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFBK_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIKP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_LIKP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIKP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIKP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIKP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIKP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIPS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_LIPS_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIPS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIPS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIPS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIPS_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARA] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MARA_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARA_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARA_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MARC_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARC_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARC_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARM]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARM] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MARM_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARM]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARM] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARM_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARM]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARM] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARM_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MBEW]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MBEW_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MBEW]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MBEW_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MBEW]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MBEW_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MKPF] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MKPF_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MKPF] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MKPF_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MKPF] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MKPF_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MSEG_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MSEG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MSEG_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MVKE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MVKE] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_MVKE_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MVKE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MVKE] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MVKE_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MVKE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MVKE] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MVKE_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RBKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_RBKP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RBKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RBKP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RBKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RBKP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RSEG] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_RSEG_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RSEG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RSEG_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_SKA1_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKA1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKA1_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKB1] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_SKB1_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKB1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKB1_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_STPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_STPO_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_STPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_STPO_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_STPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_STPO_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T001]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T001_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T001]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T001]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006A]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T006A_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006A]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006A_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006A]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006A_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T006_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T016T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T016T_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T016T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T016T_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T016T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T016T_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T023T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T023T] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T023T_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T023T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T023T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T023T_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T023T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T023T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T023T_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T024]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T024_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T024]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T024_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T024]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T024_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052U]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052U] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T052U_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052U]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052U] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T52U_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052U]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052U] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T52U_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T052_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T052_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T052_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T151T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T151T] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T151T_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T151T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T151T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T151T_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T151T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T151T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T151T_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T156]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T156_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T156]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T156_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T156]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T156_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T25B2]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T25B2] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_T25B2_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T25B2]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T25B2] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T25B2_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T25B2]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T25B2] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T25B2_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TBRCT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_TBRCT_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TBRCT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TBRCT_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TBRCT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TBRCT_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA01]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA01] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_TKA01_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA01]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA01] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA01_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA01]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA01] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA01_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA02]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_TKA02_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA02]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA02_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA02]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA02_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TVK0]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TVK0] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_TVK0_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TVK0]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TVK0] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TVK0_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TVK0]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TVK0] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TVK0_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBAK_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAK_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBAP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBEP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBEP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBEP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBEP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBEP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBEP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBFA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBFA] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBFA_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBFA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBFA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBFA_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBFA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBFA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBFA_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBPA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBPA_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBPA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBPA_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBPA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBPA_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRK] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBRK_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRK_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBRP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUK] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBUK_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUK_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VBUP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VEDA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VEDA] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VEDA_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VEDA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VEDA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VEDA_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VEDA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VEDA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VEDA_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VTTK_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTK_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTP] DROP CONSTRAINT [psa_ics_stg_SAP_GBR_VTTP_PK]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTP_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] DROP CONSTRAINT [psa_ics_land_SAP_GBR_ZTERMS]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ZTERMS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ZTERMS_IsIncomplete]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_ADR6]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_ADR6] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ADR6_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_ADR6]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_ADR6] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ADR6_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_ADRC]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_ADRC] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ADRC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_ADRC]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_ADRC] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ADRC_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_BKPF]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_BKPF] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_BKPF_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_BKPF]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_BKPF] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_BKPF_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_BSEG]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_BSEG] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_BSEG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_BSEG]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_BSEG] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_BSEG_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_CEPC]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_CEPC] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CEPC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_CEPC]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_CEPC] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CEPC_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_CSKS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_CSKS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CSKS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_CSKS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_CSKS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CSKS_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_CSKT]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_CSKT] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CSKT_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_CSKT]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_CSKT] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CSKT_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EBAN]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EBAN] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EBAN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EBAN]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EBAN] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EBAN_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EINE]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EINE] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EINE]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EINE] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKAN]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKAN] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKAN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKAN]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKAN] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKAN_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKES]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKES] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKES_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKES]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKES] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKES_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKET]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKET] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKET_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKET]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKET] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKET_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKKO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKKO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKKO_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKKO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKKO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKKO_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKPO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKPO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKPO_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_EKPO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKPO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKPO_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KEKO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KEKO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KEKO_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KEKO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KEKO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KEKO_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KEPH]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KEPH] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KEPH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KEPH]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KEPH] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KEPH_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNA1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNA1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNA1_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNA1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNA1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNA1_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNB1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNB1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNB1_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNB1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNB1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNB1_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVH]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVH] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVH]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVH] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVH_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVK_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVK_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVS_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVV]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVV] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVV_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KNVV]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KNVV] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVV_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KOND]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KOND] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KOND_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KOND]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KOND] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KOND_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KONH]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KONH] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KONH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KONH]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KONH] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KONH_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KONP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KONP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KONP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KONP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KONP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KONP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KONV]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KONV] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KONV_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_KONV]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_KONV] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KONV_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LFA1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LFA1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFA1_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LFA1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LFA1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFA1_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LFB1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LFB1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFB1_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LFB1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LFB1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFB1_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LFBK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LFBK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFBK_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LFBK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LFBK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFBK_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LIKP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LIKP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LIKP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LIKP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LIKP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LIKP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LIPS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LIPS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LIPS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_LIPS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_LIPS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LIPS_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MARA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MARA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARA_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MARC]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARC] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MARC]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARC] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARC_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MARM]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARM] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARM_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MARM]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARM] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARM_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MBEW]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MBEW] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MBEW_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MBEW]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MBEW] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MBEW_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MKPF]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MKPF] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MKPF_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MKPF]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MKPF] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MKPF_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MSEG]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MSEG] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MSEG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MSEG]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MSEG] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MSEG_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MVKE]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MVKE] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MVKE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_MVKE]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MVKE] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MVKE_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_RBKP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_RBKP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_RBKP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_RBKP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_RBKP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_RBKP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_RSEG]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_RSEG] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_RSEG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_RSEG]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_RSEG] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_RSEG_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_SKA1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_SKA1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_SKA1_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_SKA1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_SKA1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_SKA1_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_SKB1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_SKB1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_SKB1_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_SKB1]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_SKB1] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_SKB1_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_STKO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_STKO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_STKO_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_STKO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_STKO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_STKO_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_STPO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_STPO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_STPO_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_STPO]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_STPO] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_STPO_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T001]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T001] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T001]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T001] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T006A]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T006A] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T006A_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T006A]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T006A] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T006A_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T006]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T006] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T006_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T006]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T006] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T006_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T016T]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T016T] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T016T_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T016T]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T016T] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T016T_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T023T]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T023T] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T023T_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T023T]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T023T] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T023T_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T024]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T024] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T024_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T024]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T024] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T024_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T052U]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T052U] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T052U_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T052U]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T052U] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T052U_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T052]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T052] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T052_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T052]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T052] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T052_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T151T]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T151T] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T151T_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T151T]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T151T] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T151T_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T156]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T156] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T156_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T156]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T156] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T156_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T25B2]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T25B2] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T25B2_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T25B2]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T25B2] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T25B2_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TBRCT]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TBRCT] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TBRCT_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TBRCT]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TBRCT] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TBRCT_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TKA01]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TKA01] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TKA01_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TKA01]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TKA01] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TKA01_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TKA02]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TKA02] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TKA02_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TKA02]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TKA02] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TKA02_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TVK0]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TVK0] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TVK0_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_TVK0]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_TVK0] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TVK0_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBAK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBAK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBAK_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBAK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBAK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBAK_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBAP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBAP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBAP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBAP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBAP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBAP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBEP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBEP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBEP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBEP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBEP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBEP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBFA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBFA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBFA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBFA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBFA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBFA_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBPA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBPA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBPA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBPA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBPA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBPA_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBRK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBRK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBRK_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBRK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBRK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBRK_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBRP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBRP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBRP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBRP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBRP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBRP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBUK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBUK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBUK_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBUK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBUK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBUK_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBUP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBUP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBUP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VBUP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VBUP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBUP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VEDA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VEDA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VEDA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VEDA]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VEDA] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VEDA_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VTTK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VTTK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VTTK_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VTTK]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VTTK] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VTTK_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VTTP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VTTP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VTTP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_VTTP]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_VTTP] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VTTP_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_ZTERMS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ZTERMS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_ZTERMS] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ZTERMS_IsDuplicate]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_ADR6_1] from [tsa].[ics_land_SAP_GBR_ADR6]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_ADR6_1] ON [tsa].[ics_land_SAP_GBR_ADR6]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_ADRC_1] from [tsa].[ics_land_SAP_GBR_ADRC]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_ADRC_1] ON [tsa].[ics_land_SAP_GBR_ADRC]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_BKPF_1] from [tsa].[ics_land_SAP_GBR_BKPF]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_BKPF_1] ON [tsa].[ics_land_SAP_GBR_BKPF]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_BSEG_1] from [tsa].[ics_land_SAP_GBR_BSEG]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_BSEG_1] ON [tsa].[ics_land_SAP_GBR_BSEG]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_CEPC_1] from [tsa].[ics_land_SAP_GBR_CEPC]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_CEPC_1] ON [tsa].[ics_land_SAP_GBR_CEPC]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_CSKS_1] from [tsa].[ics_land_SAP_GBR_CSKS]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_CSKS_1] ON [tsa].[ics_land_SAP_GBR_CSKS]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_CSKT_1] from [tsa].[ics_land_SAP_GBR_CSKT]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_CSKT_1] ON [tsa].[ics_land_SAP_GBR_CSKT]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EBAN_1] from [tsa].[ics_land_SAP_GBR_EBAN]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EBAN_1] ON [tsa].[ics_land_SAP_GBR_EBAN]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EINE_1] from [tsa].[ics_land_SAP_GBR_EINE]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EINE_1] ON [tsa].[ics_land_SAP_GBR_EINE]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EKAN_1] from [tsa].[ics_land_SAP_GBR_EKAN]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EKAN_1] ON [tsa].[ics_land_SAP_GBR_EKAN]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EKES_1] from [tsa].[ics_land_SAP_GBR_EKES]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EKES_1] ON [tsa].[ics_land_SAP_GBR_EKES]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EKET_1] from [tsa].[ics_land_SAP_GBR_EKET]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EKET_1] ON [tsa].[ics_land_SAP_GBR_EKET]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EKKO_1] from [tsa].[ics_land_SAP_GBR_EKKO]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EKKO_1] ON [tsa].[ics_land_SAP_GBR_EKKO]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EKPO_1] from [tsa].[ics_land_SAP_GBR_EKPO]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EKPO_1] ON [tsa].[ics_land_SAP_GBR_EKPO]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KEKO_1] from [tsa].[ics_land_SAP_GBR_KEKO]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KEKO_1] ON [tsa].[ics_land_SAP_GBR_KEKO]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KEPH_1] from [tsa].[ics_land_SAP_GBR_KEPH]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KEPH_1] ON [tsa].[ics_land_SAP_GBR_KEPH]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNA1_1] from [tsa].[ics_land_SAP_GBR_KNA1]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNA1_1] ON [tsa].[ics_land_SAP_GBR_KNA1]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNB1_1] from [tsa].[ics_land_SAP_GBR_KNB1]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNB1_1] ON [tsa].[ics_land_SAP_GBR_KNB1]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNVH_1] from [tsa].[ics_land_SAP_GBR_KNVH]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNVH_1] ON [tsa].[ics_land_SAP_GBR_KNVH]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNVK_1] from [tsa].[ics_land_SAP_GBR_KNVK]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNVK_1] ON [tsa].[ics_land_SAP_GBR_KNVK]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNVP_1] from [tsa].[ics_land_SAP_GBR_KNVP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNVP_1] ON [tsa].[ics_land_SAP_GBR_KNVP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNVS_1] from [tsa].[ics_land_SAP_GBR_KNVS]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNVS_1] ON [tsa].[ics_land_SAP_GBR_KNVS]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KNVV_1] from [tsa].[ics_land_SAP_GBR_KNVV]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KNVV_1] ON [tsa].[ics_land_SAP_GBR_KNVV]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KOND_1] from [tsa].[ics_land_SAP_GBR_KOND]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KOND_1] ON [tsa].[ics_land_SAP_GBR_KOND]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KONH_1] from [tsa].[ics_land_SAP_GBR_KONH]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KONH_1] ON [tsa].[ics_land_SAP_GBR_KONH]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KONP_1] from [tsa].[ics_land_SAP_GBR_KONP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KONP_1] ON [tsa].[ics_land_SAP_GBR_KONP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_KONV_1] from [tsa].[ics_land_SAP_GBR_KONV]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_KONV_1] ON [tsa].[ics_land_SAP_GBR_KONV]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_LFA1_1] from [tsa].[ics_land_SAP_GBR_LFA1]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_LFA1_1] ON [tsa].[ics_land_SAP_GBR_LFA1]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_LFB1_1] from [tsa].[ics_land_SAP_GBR_LFB1]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_LFB1_1] ON [tsa].[ics_land_SAP_GBR_LFB1]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_LFBK_1] from [tsa].[ics_land_SAP_GBR_LFBK]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_LFBK_1] ON [tsa].[ics_land_SAP_GBR_LFBK]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_LIKP_1] from [tsa].[ics_land_SAP_GBR_LIKP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_LIKP_1] ON [tsa].[ics_land_SAP_GBR_LIKP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_LIPS_1] from [tsa].[ics_land_SAP_GBR_LIPS]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_LIPS_1] ON [tsa].[ics_land_SAP_GBR_LIPS]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MARA_1] from [tsa].[ics_land_SAP_GBR_MARA]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MARA_1] ON [tsa].[ics_land_SAP_GBR_MARA]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MARC_1] from [tsa].[ics_land_SAP_GBR_MARC]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MARC_1] ON [tsa].[ics_land_SAP_GBR_MARC]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MARM_1] from [tsa].[ics_land_SAP_GBR_MARM]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MARM_1] ON [tsa].[ics_land_SAP_GBR_MARM]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MBEW_1] from [tsa].[ics_land_SAP_GBR_MBEW]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MBEW_1] ON [tsa].[ics_land_SAP_GBR_MBEW]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MKPF_1] from [tsa].[ics_land_SAP_GBR_MKPF]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MKPF_1] ON [tsa].[ics_land_SAP_GBR_MKPF]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MSEG_1] from [tsa].[ics_land_SAP_GBR_MSEG]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MSEG_1] ON [tsa].[ics_land_SAP_GBR_MSEG]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_MVKE_1] from [tsa].[ics_land_SAP_GBR_MVKE]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_MVKE_1] ON [tsa].[ics_land_SAP_GBR_MVKE]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_RBKP_1] from [tsa].[ics_land_SAP_GBR_RBKP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_RBKP_1] ON [tsa].[ics_land_SAP_GBR_RBKP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_RSEG_1] from [tsa].[ics_land_SAP_GBR_RSEG]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_RSEG_1] ON [tsa].[ics_land_SAP_GBR_RSEG]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_SKA1_1] from [tsa].[ics_land_SAP_GBR_SKA1]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_SKA1_1] ON [tsa].[ics_land_SAP_GBR_SKA1]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_SKB1_1] from [tsa].[ics_land_SAP_GBR_SKB1]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_SKB1_1] ON [tsa].[ics_land_SAP_GBR_SKB1]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_STPO_1] from [tsa].[ics_land_SAP_GBR_STPO]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_STPO_1] ON [tsa].[ics_land_SAP_GBR_STPO]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T001_1] from [tsa].[ics_land_SAP_GBR_T001]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T001_1] ON [tsa].[ics_land_SAP_GBR_T001]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T006A_1] from [tsa].[ics_land_SAP_GBR_T006A]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T006A_1] ON [tsa].[ics_land_SAP_GBR_T006A]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T006_1] from [tsa].[ics_land_SAP_GBR_T006]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T006_1] ON [tsa].[ics_land_SAP_GBR_T006]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T016T_1] from [tsa].[ics_land_SAP_GBR_T016T]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T016T_1] ON [tsa].[ics_land_SAP_GBR_T016T]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T023T_1] from [tsa].[ics_land_SAP_GBR_T023T]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T023T_1] ON [tsa].[ics_land_SAP_GBR_T023T]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T024_1] from [tsa].[ics_land_SAP_GBR_T024]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T024_1] ON [tsa].[ics_land_SAP_GBR_T024]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T052U_1] from [tsa].[ics_land_SAP_GBR_T052U]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T052U_1] ON [tsa].[ics_land_SAP_GBR_T052U]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T052_1] from [tsa].[ics_land_SAP_GBR_T052]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T052_1] ON [tsa].[ics_land_SAP_GBR_T052]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T151T_1] from [tsa].[ics_land_SAP_GBR_T151T]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T151T_1] ON [tsa].[ics_land_SAP_GBR_T151T]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T156_1] from [tsa].[ics_land_SAP_GBR_T156]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T156_1] ON [tsa].[ics_land_SAP_GBR_T156]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_T25B2_1] from [tsa].[ics_land_SAP_GBR_T25B2]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_T25B2_1] ON [tsa].[ics_land_SAP_GBR_T25B2]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_TBRCT_1] from [tsa].[ics_land_SAP_GBR_TBRCT]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_TBRCT_1] ON [tsa].[ics_land_SAP_GBR_TBRCT]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_TKA01_1] from [tsa].[ics_land_SAP_GBR_TKA01]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_TKA01_1] ON [tsa].[ics_land_SAP_GBR_TKA01]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_TKA02_1] from [tsa].[ics_land_SAP_GBR_TKA02]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_TKA02_1] ON [tsa].[ics_land_SAP_GBR_TKA02]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_TVK0_1] from [tsa].[ics_land_SAP_GBR_TVK0]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_TVK0_1] ON [tsa].[ics_land_SAP_GBR_TVK0]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBAK_1] from [tsa].[ics_land_SAP_GBR_VBAK]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBAK_1] ON [tsa].[ics_land_SAP_GBR_VBAK]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBAP_1] from [tsa].[ics_land_SAP_GBR_VBAP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBAP_1] ON [tsa].[ics_land_SAP_GBR_VBAP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBEP_1] from [tsa].[ics_land_SAP_GBR_VBEP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBEP_1] ON [tsa].[ics_land_SAP_GBR_VBEP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBFA_1] from [tsa].[ics_land_SAP_GBR_VBFA]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBFA_1] ON [tsa].[ics_land_SAP_GBR_VBFA]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBPA_1] from [tsa].[ics_land_SAP_GBR_VBPA]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBPA_1] ON [tsa].[ics_land_SAP_GBR_VBPA]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBRK_1] from [tsa].[ics_land_SAP_GBR_VBRK]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBRK_1] ON [tsa].[ics_land_SAP_GBR_VBRK]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBRP_1] from [tsa].[ics_land_SAP_GBR_VBRP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBRP_1] ON [tsa].[ics_land_SAP_GBR_VBRP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBUK_1] from [tsa].[ics_land_SAP_GBR_VBUK]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBUK_1] ON [tsa].[ics_land_SAP_GBR_VBUK]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VBUP_1] from [tsa].[ics_land_SAP_GBR_VBUP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VBUP_1] ON [tsa].[ics_land_SAP_GBR_VBUP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VEDA_1] from [tsa].[ics_land_SAP_GBR_VEDA]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VEDA_1] ON [tsa].[ics_land_SAP_GBR_VEDA]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VTTK_1] from [tsa].[ics_land_SAP_GBR_VTTK]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VTTK_1] ON [tsa].[ics_land_SAP_GBR_VTTK]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_VTTP_1] from [tsa].[ics_land_SAP_GBR_VTTP]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_VTTP_1] ON [tsa].[ics_land_SAP_GBR_VTTP]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_ZTERMS_1] from [tsa].[ics_land_SAP_GBR_ZTERMS]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_ZTERMS_1] ON [tsa].[ics_land_SAP_GBR_ZTERMS]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBFA]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBFA]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EBAN]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EBAN]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EKES]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EKES]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T25B2]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T25B2]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNVP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNVP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EKKO]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EKKO]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBEP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBEP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MKPF]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MKPF]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBEP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBEP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T052]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T052]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T052U]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T052U]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNVV]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNVV]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MBEW]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MBEW]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EKET]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EKET]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_LIKP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_LIKP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_SKB1]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_SKB1]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBAK]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBAK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_CEPC]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_CEPC]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EKAN]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EKAN]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T156]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T156]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNA1]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNA1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBAP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBAP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MBEW]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MBEW]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T024]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T024]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_RSEG]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_RSEG]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNVK]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNVK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EINE]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EINE]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MARM]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MARM]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_LFBK]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_LFBK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_RSEG]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_RSEG]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KONP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KONP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_BSEG]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_BSEG]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EINE]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EINE]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T151T]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T151T]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EKES]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EKES]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EKPO]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EKPO]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBAK]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBAK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T016T]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T016T]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KONH]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KONH]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T006A]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T006A]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_RBKP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_RBKP]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNVH]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNVH]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_ZTERMS]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_ZTERMS]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_LFB1]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_LFB1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_RBKP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_RBKP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EKAN]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EKAN]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_ADR6]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_ADR6]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EBAN]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EBAN]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T052]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T052]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KOND]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KOND]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_CSKT]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_CSKT]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_TVK0]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_TVK0]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MSEG]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MSEG]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VTTK]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VTTK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T006]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T006]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T023T]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T023T]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VTTP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VTTP]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_LFB1]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_LFB1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_LFA1]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_LFA1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MVKE]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MVKE]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_CEPC]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_CEPC]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_CSKT]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_CSKT]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_ZTERMS]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_ZTERMS]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T006]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T006]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MSEG]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MSEG]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KONH]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KONH]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_TKA02]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_TKA02]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MARM]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MARM]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_LFA1]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_LFA1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VTTP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VTTP]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T016T]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T016T]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNB1]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNB1]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_BSEG]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_BSEG]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBRP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBRP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KONV]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KONV]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBRK]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBRK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_CSKS]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_CSKS]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_CSKS]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_CSKS]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KOND]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KOND]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MARC]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MARC]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_TKA01]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_TKA01]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T024]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T024]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VEDA]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VEDA]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T006A]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T006A]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_ADR6]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_ADR6]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KEKO]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KEKO]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBAP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBAP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KONP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KONP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNVV]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNVV]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBUP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBUP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_BKPF]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_BKPF]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KONV]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KONV]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_TBRCT]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_TBRCT]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T001]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T001]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MARA]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MARA]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MVKE]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MVKE]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNVS]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNVS]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MARC]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MARC]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBUK]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBUK]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VTTK]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VTTK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T023T]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T023T]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EKKO]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EKKO]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_TVK0]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_TVK0]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_BKPF]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_BKPF]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNVP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNVP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBRP]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBRP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T151T]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T151T]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VEDA]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VEDA]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T052U]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T052U]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_STPO]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_STPO]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_LIPS]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_LIPS]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_SKA1]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_SKA1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNVK]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNVK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_MARA]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_MARA]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBUP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBUP]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNA1]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNA1]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_EKET]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_EKET]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_TKA02]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_TKA02]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KNVS]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KNVS]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNVH]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNVH]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBPA]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBPA]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_ADRC]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_ADRC]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBUK]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBUK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T25B2]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T25B2]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_STKO]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_STKO]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_LIKP]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_LIKP]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_MKPF]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_MKPF]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KNB1]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KNB1]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T001]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T001]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBRK]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBRK]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_EKPO]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_EKPO]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_KEPH]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_KEPH]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_TKA01]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_TKA01]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_ADRC]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_ADRC]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KEPH]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KEPH]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_VBFA]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_VBFA]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_SKA1]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_SKA1]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_VBPA]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_VBPA]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_T156]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_T156]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_SKB1]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_SKB1]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_LFBK]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_LFBK]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_TBRCT]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_TBRCT]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_KEKO]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_KEKO]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_LIPS]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_LIPS]
GO
PRINT N'Dropping [psa].[ics_stg_SAP_GBR_STPO]'
GO
DROP TABLE [psa].[ics_stg_SAP_GBR_STPO]
GO
PRINT N'Creating [tsa].[ics_land_SAP_GBR_T001L]'
GO
CREATE TABLE [tsa].[ics_land_SAP_GBR_T001L]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001L_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001L_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[WERKS] [nvarchar] (4) NULL,
[LGORT] [nvarchar] (4) NULL,
[LGOBE] [nvarchar] (16) NULL,
[SPART] [nvarchar] (2) NULL,
[XLONG] [nvarchar] (1) NULL,
[XBUFX] [nvarchar] (1) NULL,
[DISKZ] [nvarchar] (1) NULL,
[XBLGO] [nvarchar] (1) NULL,
[XRESS] [nvarchar] (1) NULL,
[XHUPF] [nvarchar] (1) NULL,
[PARLG] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[VSTEL] [nvarchar] (4) NULL,
[LIFNR] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[MESBS] [nvarchar] (60) NULL,
[MESST] [nvarchar] (1) NULL,
[OIH_LICNO] [nvarchar] (15) NULL,
[OIG_ITRFL] [nvarchar] (1) NULL,
[OIB_TNKASSIGN] [nvarchar] (1) NULL
)
GO
PRINT N'Creating index [IndClust_tsa_ics_land_SAP_GBR_T001L_1] on [tsa].[ics_land_SAP_GBR_T001L]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_T001L_1] ON [tsa].[ics_land_SAP_GBR_T001L] ([MANDT], [WERKS], [LGORT])
GO
PRINT N'Creating [psa].[ics_stg_SAP_GBR_T001L]'
GO
CREATE TABLE [psa].[ics_stg_SAP_GBR_T001L]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001L_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001L_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NOT NULL,
[WERKS] [nvarchar] (4) NOT NULL,
[LGORT] [nvarchar] (4) NOT NULL,
[LGOBE] [nvarchar] (16) NULL,
[SPART] [nvarchar] (2) NULL,
[XLONG] [nvarchar] (1) NULL,
[XBUFX] [nvarchar] (1) NULL,
[DISKZ] [nvarchar] (1) NULL,
[XBLGO] [nvarchar] (1) NULL,
[XRESS] [nvarchar] (1) NULL,
[XHUPF] [nvarchar] (1) NULL,
[PARLG] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[VSTEL] [nvarchar] (4) NULL,
[LIFNR] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[MESBS] [nvarchar] (60) NULL,
[MESST] [nvarchar] (1) NULL,
[OIH_LICNO] [nvarchar] (15) NULL,
[OIG_ITRFL] [nvarchar] (1) NULL,
[OIB_TNKASSIGN] [nvarchar] (1) NULL
)
GO
PRINT N'Creating primary key [psa_ics_stg_SAP_GBR_T001L_PK] on [psa].[ics_stg_SAP_GBR_T001L]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001L] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_T001L_PK] PRIMARY KEY CLUSTERED  ([MANDT], [WERKS], [LGORT])
GO
