-- <Migration ID="a60617ac-a992-4145-bbbf-55efa1260bbb" />
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADRC_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ADRC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADRC_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BSEG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_BSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BSEG_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_CSKS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKS_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EBAN_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EBAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EBAN_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKAN_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKAN_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKET_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKET]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKET_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKPO_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_EKPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKPO_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEPH_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KEPH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEPH_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNB1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNB1_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVK_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KNVS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVS_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KOND_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KOND]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KOND_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_KONP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONP_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFA1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFA1_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFBK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LFBK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFBK_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIPS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_LIPS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIPS_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MAKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MAKT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MAKT_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MAKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MAKT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MAKT_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARC_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARC_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARD]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARD] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARD_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MARD]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARD] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARD_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MBEW_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MBEW]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MBEW_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MSEG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_MSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MSEG_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RBKP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_RBKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RBKP_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKA1_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_SKA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKA1_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_STPO_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_STPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_STPO_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T001W]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001W] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001W_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T001W]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001W] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001W_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006A_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T006A]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006A_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T016T_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T016T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T016T_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T024_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T024]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T024_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T052_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T052]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T052_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T156_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_T156]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T156_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TBRCT_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TBRCT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TBRCT_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA02_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_TKA02]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA02_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBAK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAK_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBEP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBEP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBEP_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBPA_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBPA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBPA_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBRP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRP_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUP_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VBUP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUP_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTK_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_VTTK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTK_IsIncomplete]
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
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ZTERMS_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] DROP CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ZTERMS_IsIncomplete]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T52U]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T52U] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T52U_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_SAP_GBR_T52U]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_T52U] DROP CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T52U_IsDuplicate]
GO
PRINT N'Dropping [tsa].[ics_land_SAP_GBR_T52U]'
GO
DROP TABLE [tsa].[ics_land_SAP_GBR_T52U]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_ADR6]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADR6] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADR6_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADR6] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADR6_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_ADRC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADRC_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADRC] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ADRC_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_BKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BKPF] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BKPF_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BKPF] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BKPF_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_BSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BSEG_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_BSEG_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_CEPC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CEPC] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CEPC_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CEPC] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CEPC_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_CSKS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKS_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKS_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_CSKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKT] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKT_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_CSKT] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_CSKT_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EBAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EBAN_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EBAN] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EBAN_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EINE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EINE_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EINE_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EKAN]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKAN_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKAN_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EKES]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKES] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKES_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKES] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKES_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EKET]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKET_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKET_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EKKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKKO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKKO_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKKO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKKO_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_EKPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKPO_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKPO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_EKPO_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KEKO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEKO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEKO_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEKO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEKO_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KEPH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEPH_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KEPH_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNA1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNA1_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNA1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNA1_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNB1_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNB1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNB1_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNVH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVH] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVH_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVH] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVH_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNVK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVK_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVK_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNVP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNVS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVS_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVS_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KNVV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVV] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVV_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVV] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KNVV_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KOND]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KOND_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KOND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KOND_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KONH]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONH] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONH_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONH] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONH_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KONP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_KONV]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONV] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONV_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONV] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_KONV_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_LFA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFA1_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFA1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFA1_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_LFB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFB1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFB1_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFB1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFB1_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_LFBK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFBK_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LFBK_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_LIKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIKP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIKP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIKP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIKP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_LIPS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIPS_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_LIPS_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MAKT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MAKT] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MAKT_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MAKT] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MAKT_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MARA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARA_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARA_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MARC]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARC_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARC_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MARD]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARD] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARD_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARD] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARD_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MARM]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARM] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARM_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARM] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARM_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MBEW]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MBEW_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MBEW] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MBEW_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MKPF]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MKPF] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MKPF_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MKPF] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MKPF_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MSEG_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MSEG_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_MVKE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MVKE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MVKE_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MVKE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MVKE_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_RBKP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RBKP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RBKP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RBKP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_RSEG]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RSEG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RSEG_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_RSEG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_RSEG_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_SKA1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKA1_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKA1_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_SKB1]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKB1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKB1_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKB1] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_SKB1_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_STPO]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_STPO_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_STPO] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_STPO_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T001W]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001W] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001W_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001W] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001W_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T001]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T001] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T001_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T006A]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006A_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006A_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T006]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T006_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T016T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T016T_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T016T] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T016T_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T023T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T023T] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T023T_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T023T] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T023T_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T024]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T024_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T024_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T052U]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052U] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T52U_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052U] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T52U_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T052]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T052_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T052_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T151T]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T151T] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T151T_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T151T] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T151T_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T156]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T156_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T156] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T156_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_T25B2]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T25B2] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T25B2_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T25B2] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_T25B2_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_TBRCT]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TBRCT_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TBRCT_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_TKA01]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA01] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA01_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA01] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA01_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_TKA02]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA02_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TKA02] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TKA02_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_TVK0]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TVK0] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TVK0_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TVK0] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_TVK0_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBAK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAK_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAK_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBAP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBAP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBAP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBEP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBEP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBEP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBEP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBFA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBFA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBFA_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBFA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBFA_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBPA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBPA_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBPA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBPA_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBRK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRK_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRK_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBRP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBRP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBRP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBUK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUK_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUK_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VBUP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VBUP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VBUP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VEDA]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VEDA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VEDA_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VEDA] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VEDA_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VTTK]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTK_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTK] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTK_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_VTTP]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTP_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTP] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_VTTP_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_SAP_GBR_ZTERMS]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ZTERMS_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_ZTERMS_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
