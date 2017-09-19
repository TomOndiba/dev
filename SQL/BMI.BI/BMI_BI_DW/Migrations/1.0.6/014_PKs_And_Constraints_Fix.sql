-- <Migration ID="7811b2ef-7fd4-4ce6-a871-49f56359dba6" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_movex_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_movex_OINVOL] DROP CONSTRAINT [PK_stg_movex_OINVOL]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CCURRA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CCURRA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CIDMAS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CIDMAS_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CIDVEN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CIDVEN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CSYTAB_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CSYTAB_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_CSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FGLEDG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FGLEDG_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FRCALP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FRCALP_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSCASH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSCASH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSLEDG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSLEDG_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSLEDX_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSLEDX_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_FSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITAUN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITAUN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITBAL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITBAL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITFAC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITFAC_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITLOC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITLOC_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITMAS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITMAS_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITVEN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MITVEN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPDEPR_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPDEPR_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLIND_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLIND_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLIRE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLIRE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPOEXP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPOEXP_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPOPLA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPOPLA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPPOAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPPOAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPPOEX_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPPOEX_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPPOPA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPPOPA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MSYTXL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MSYTXL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MWOPOL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MWOPOL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OCUSMA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OCUSMA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OCUSMA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OCUSMA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_ODHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_ODHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_ODLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_ODLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OINVOH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OINVOH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OINVOL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OINVOL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OOHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OOHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OOLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OOLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OPAYMD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OPAYMD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OPAYMH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OPAYMH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OSBSTD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10gen_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OSBSTD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CCURRA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CCURRA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDMAS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDMAS_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDVEN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDVEN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTAB_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTAB_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FGLEDG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FGLEDG_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FRCALP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FRCALP_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSCASH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSCASH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSLEDG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSLEDG_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSLEDX_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSLEDX_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_FSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITAUN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITAUN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITBAL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITBAL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITFAC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITFAC_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITLOC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITLOC_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITMAS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITMAS_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITVEN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MITVEN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPDEPR_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPDEPR_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPLIND_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPLIND_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPLIRE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPLIRE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPOEXP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPOEXP_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPOPLA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPOPLA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOEX_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOEX_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOPA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOPA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MSYTXL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MSYTXL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MWOPOL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MWOPOL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OCUSMA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OCUSMA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OCUSMA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OCUSMA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_ODHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_ODHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_ODLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_ODLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OINVOH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OINVOH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OINVOL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OINVOL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OOHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OOHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OOLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OOLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OPAYMD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OPAYMD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OPAYMH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OPAYMH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OSBSTD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10ved_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_OSBSTD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CCURRA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CCURRA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CIDMAS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CIDMAS_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CIDVEN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CIDVEN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CSYTAB_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CSYTAB_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FGLEDG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FGLEDG_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FRCALP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FRCALP_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSCASH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] DROP CONSTRAINT [DF_psa_icsics_stg_M3V10vil_POL_FSCASH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSLEDG_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSLEDG_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSLEDX_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSLEDX_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITAUN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITAUN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITBAL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITBAL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITFAC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITFAC_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITLOC_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITLOC_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITMAS_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITMAS] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITMAS_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITVEN_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MITVEN_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPDEPR_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPDEPR_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPLIND_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPLIND_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPLIRE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPLIRE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPOEXP_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPOEXP_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPOPLA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPOPLA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOEX_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOEX_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOPA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOPA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MSYTXH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MSYTXH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MSYTXL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MSYTXL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MWOPOL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MWOPOL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OCUSMA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OCUSMA_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OCUSMA] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OCUSMA_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_ODHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_ODHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_ODLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_ODLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OINVOH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OINVOH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OINVOL_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OINVOL_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OOHEAD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOHEAD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OOHEAD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OOLINE_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OOLINE_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OPAYMD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OPAYMD_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OPAYMH_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OPAYMH_IsDuplicate]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OSBSTD_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_M3V10vil_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] DROP CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OSBSTD_IsDuplicate]
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] ALTER COLUMN [IDCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] ALTER COLUMN [IDSUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_CIDMAS] on [psa].[ics_stg_M3V10ved_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CIDMAS] PRIMARY KEY CLUSTERED  ([IDCONO], [IDSUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ALTER COLUMN [ICCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ALTER COLUMN [ICPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ALTER COLUMN [ICPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ALTER COLUMN [ICPNLX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ALTER COLUMN [ICPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPLIND] on [psa].[ics_stg_M3V10vil_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPLIND] PRIMARY KEY CLUSTERED  ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESSEXI] [nvarchar] (45) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESSEXN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESSEXS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ALTER COLUMN [ESYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FSLEDX] on [psa].[ics_stg_M3V10gen_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FSLEDX] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] ALTER COLUMN [IICONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] ALTER COLUMN [IISUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_CIDVEN] on [psa].[ics_stg_M3V10ved_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CIDVEN] PRIMARY KEY CLUSTERED  ([IICONO], [IISUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVBANO] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVCDSE] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVCEID] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVEXTY] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ALTER COLUMN [IVREPN] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPOEXP] on [psa].[ics_stg_M3V10vil_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPOEXP] PRIMARY KEY CLUSTERED  ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HEBJNO] [nvarchar] (18) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HECONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HEITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HEMRGD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HEMRGT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HETMSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HETRDT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HETRTM] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ALTER COLUMN [HEWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FRCALP] on [psa].[ics_stg_M3V10gen_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FRCALP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FRCALP] PRIMARY KEY CLUSTERED  ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITMAS] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITMAS] ALTER COLUMN [MMCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITMAS] ALTER COLUMN [MMITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MITMAS] on [psa].[ics_stg_M3V10ved_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITMAS] PRIMARY KEY CLUSTERED  ([MMCONO], [MMITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] ALTER COLUMN [PTCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] ALTER COLUMN [PTPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] ALTER COLUMN [PTPYDT] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPPOPA] on [psa].[ics_stg_M3V10vil_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPPOPA] PRIMARY KEY CLUSTERED  ([PTCONO], [PTPUNO], [PTPYDT])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] ALTER COLUMN [ESTSTM] [varchar] (26) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FSCASH] on [psa].[ics_stg_M3V10gen_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSCASH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FSCASH] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESTSTM])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OCUSMA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OCUSMA] ALTER COLUMN [OKCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OCUSMA] ALTER COLUMN [OKCUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OCUSMA] on [psa].[ics_stg_M3V10ved_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OCUSMA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OCUSMA] PRIMARY KEY CLUSTERED  ([OKCONO], [OKCUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MSYTXH] on [psa].[ics_stg_M3V10vil_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] ALTER COLUMN [ESJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] ALTER COLUMN [ESJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] ALTER COLUMN [ESYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FSLEDG] on [psa].[ics_stg_M3V10gen_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDG] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FSLEDG] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] ALTER COLUMN [OBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] ALTER COLUMN [OBORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] ALTER COLUMN [OBPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] ALTER COLUMN [OBPOSX] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OOLINE] on [psa].[ics_stg_M3V10ved_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OOLINE] PRIMARY KEY CLUSTERED  ([OBCONO], [OBORNO], [OBPONR], [OBPOSX])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] ALTER COLUMN [IBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] ALTER COLUMN [IBPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] ALTER COLUMN [IBPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] ALTER COLUMN [IBPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPLINE] on [psa].[ics_stg_M3V10vil_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPLINE] PRIMARY KEY CLUSTERED  ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FSYTXH] on [psa].[ics_stg_M3V10gen_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ALTER COLUMN [CTCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ALTER COLUMN [CTDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ALTER COLUMN [CTLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ALTER COLUMN [CTSTCO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ALTER COLUMN [CTSTKY] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_CSYTAB] on [psa].[ics_stg_M3V10ved_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CSYTAB] PRIMARY KEY CLUSTERED  ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POPLP2] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POPLPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POPLPS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ALTER COLUMN [POPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPOPLA] on [psa].[ics_stg_M3V10vil_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOPLA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPOPLA] PRIMARY KEY CLUSTERED  ([POCONO], [POPLP2], [POPLPN], [POPLPS], [POPNLI], [POPNLS], [POPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] ALTER COLUMN [MUALUN] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] ALTER COLUMN [MUAUTP] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] ALTER COLUMN [MUCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] ALTER COLUMN [MUITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MITAUN] on [psa].[ics_stg_M3V10gen_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITAUN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITAUN] PRIMARY KEY CLUSTERED  ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_CSYTXH] on [psa].[ics_stg_M3V10ved_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] ALTER COLUMN [ADCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] ALTER COLUMN [ADPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] ALTER COLUMN [ADPOAD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] ALTER COLUMN [ADPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPPOAD] on [psa].[ics_stg_M3V10vil_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPPOAD] PRIMARY KEY CLUSTERED  ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] ALTER COLUMN [M9CONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] ALTER COLUMN [M9FACI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] ALTER COLUMN [M9ITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MITFAC] on [psa].[ics_stg_M3V10gen_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITFAC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITFAC] PRIMARY KEY CLUSTERED  ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] ALTER COLUMN [EGCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] ALTER COLUMN [EGDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] ALTER COLUMN [EGJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] ALTER COLUMN [EGJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] ALTER COLUMN [EGYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FGLEDG] on [psa].[ics_stg_M3V10ved_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGLEDG] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FGLEDG] PRIMARY KEY CLUSTERED  ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ALTER COLUMN [TLCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ALTER COLUMN [TLDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ALTER COLUMN [TLLINO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ALTER COLUMN [TLLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ALTER COLUMN [TLTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ALTER COLUMN [TLTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MSYTXL] on [psa].[ics_stg_M3V10vil_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MSYTXL] PRIMARY KEY CLUSTERED  ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] ALTER COLUMN [MBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] ALTER COLUMN [MBITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] ALTER COLUMN [MBWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MITBAL] on [psa].[ics_stg_M3V10gen_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITBAL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITBAL] PRIMARY KEY CLUSTERED  ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESSEXI] [nvarchar] (45) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESSEXN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESSEXS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ALTER COLUMN [ESYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FSLEDX] on [psa].[ics_stg_M3V10ved_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FSLEDX] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] ALTER COLUMN [BHCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] ALTER COLUMN [BHFACI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] ALTER COLUMN [BHPLNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] ALTER COLUMN [BHWOSQ] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MWOPOL] on [psa].[ics_stg_M3V10vil_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MWOPOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MWOPOL] PRIMARY KEY CLUSTERED  ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLBANO] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLCAMU] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLREPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLWHLO] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ALTER COLUMN [MLWHSL] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MITLOC] on [psa].[ics_stg_M3V10gen_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITLOC] PRIMARY KEY CLUSTERED  ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HEBJNO] [nvarchar] (18) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HECONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HEITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HEMRGD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HEMRGT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HETMSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HETRDT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HETRTM] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ALTER COLUMN [HEWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FRCALP] on [psa].[ics_stg_M3V10ved_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FRCALP] PRIMARY KEY CLUSTERED  ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] ALTER COLUMN [UACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] ALTER COLUMN [UADLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] ALTER COLUMN [UAORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] ALTER COLUMN [UAWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_ODHEAD] on [psa].[ics_stg_M3V10vil_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_ODHEAD] PRIMARY KEY CLUSTERED  ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] ALTER COLUMN [IFCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] ALTER COLUMN [IFITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] ALTER COLUMN [IFPRCS] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] ALTER COLUMN [IFSUFI] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] ALTER COLUMN [IFSUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MITVEN] on [psa].[ics_stg_M3V10gen_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITVEN] PRIMARY KEY CLUSTERED  ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] ALTER COLUMN [ESTSTM] [varchar] (26) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FSCASH] on [psa].[ics_stg_M3V10ved_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSCASH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FSCASH] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESTSTM])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ALTER COLUMN [UBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ALTER COLUMN [UBDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ALTER COLUMN [UBORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ALTER COLUMN [UBPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ALTER COLUMN [UBPOSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ALTER COLUMN [UBWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_ODLINE] on [psa].[ics_stg_M3V10vil_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_ODLINE] PRIMARY KEY CLUSTERED  ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILDSPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILLEDT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILPLPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILPLPS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ALTER COLUMN [ILRGTM] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPDEPR] on [psa].[ics_stg_M3V10gen_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPDEPR] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPDEPR] PRIMARY KEY CLUSTERED  ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] ALTER COLUMN [ESJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] ALTER COLUMN [ESJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] ALTER COLUMN [ESYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FSLEDG] on [psa].[ics_stg_M3V10ved_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSLEDG] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FSLEDG] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ALTER COLUMN [UHCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ALTER COLUMN [UHDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ALTER COLUMN [UHINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ALTER COLUMN [UHIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ALTER COLUMN [UHYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OINVOH] on [psa].[ics_stg_M3V10vil_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OINVOH] PRIMARY KEY CLUSTERED  ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] ALTER COLUMN [IACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] ALTER COLUMN [IAPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPHEAD] on [psa].[ics_stg_M3V10gen_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPHEAD] PRIMARY KEY CLUSTERED  ([IACONO], [IAPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FSYTXH] on [psa].[ics_stg_M3V10ved_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONIVRF] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONIVTP] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONWHLO] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ALTER COLUMN [ONYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OINVOL] on [psa].[ics_stg_M3V10vil_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] ALTER COLUMN [IRCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] ALTER COLUMN [IRPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] ALTER COLUMN [IRPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] ALTER COLUMN [IRPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPLIRE] on [psa].[ics_stg_M3V10gen_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPLIRE] PRIMARY KEY CLUSTERED  ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] ALTER COLUMN [MUALUN] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] ALTER COLUMN [MUAUTP] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] ALTER COLUMN [MUCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] ALTER COLUMN [MUITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MITAUN] on [psa].[ics_stg_M3V10ved_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITAUN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITAUN] PRIMARY KEY CLUSTERED  ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOHEAD] ALTER COLUMN [OACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOHEAD] ALTER COLUMN [OAORNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OOHEAD] on [psa].[ics_stg_M3V10vil_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OOHEAD] PRIMARY KEY CLUSTERED  ([OACONO], [OAORNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] ALTER COLUMN [PECONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] ALTER COLUMN [PEFUDX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] ALTER COLUMN [PEPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] ALTER COLUMN [PEPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] ALTER COLUMN [PEPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPPOEX] on [psa].[ics_stg_M3V10gen_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOEX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPPOEX] PRIMARY KEY CLUSTERED  ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] ALTER COLUMN [M9CONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] ALTER COLUMN [M9FACI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] ALTER COLUMN [M9ITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MITFAC] on [psa].[ics_stg_M3V10ved_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITFAC] PRIMARY KEY CLUSTERED  ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ALTER COLUMN [ULCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ALTER COLUMN [ULINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ALTER COLUMN [ULIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ALTER COLUMN [ULPLNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ALTER COLUMN [ULPMNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ALTER COLUMN [ULYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OPAYMD] on [psa].[ics_stg_M3V10vil_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OPAYMD] PRIMARY KEY CLUSTERED  ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] ALTER COLUMN [ICCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] ALTER COLUMN [ICPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] ALTER COLUMN [ICPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] ALTER COLUMN [ICPNLX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] ALTER COLUMN [ICPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPLIND] on [psa].[ics_stg_M3V10gen_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPLIND] PRIMARY KEY CLUSTERED  ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] ALTER COLUMN [MBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] ALTER COLUMN [MBITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] ALTER COLUMN [MBWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MITBAL] on [psa].[ics_stg_M3V10ved_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITBAL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITBAL] PRIMARY KEY CLUSTERED  ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] ALTER COLUMN [UJCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] ALTER COLUMN [UJPLNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] ALTER COLUMN [UJPMNB] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OPAYMH] on [psa].[ics_stg_M3V10vil_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OPAYMH] PRIMARY KEY CLUSTERED  ([UJCONO], [UJPLNB], [UJPMNB])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVBANO] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVCDSE] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVCEID] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVEXTY] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ALTER COLUMN [IVREPN] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPOEXP] on [psa].[ics_stg_M3V10gen_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOEXP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPOEXP] PRIMARY KEY CLUSTERED  ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLBANO] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLCAMU] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLREPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLWHLO] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ALTER COLUMN [MLWHSL] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MITLOC] on [psa].[ics_stg_M3V10ved_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITLOC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITLOC] PRIMARY KEY CLUSTERED  ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCORIG] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCPOSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ALTER COLUMN [UCWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OSBSTD] on [psa].[ics_stg_M3V10vil_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OSBSTD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OSBSTD] PRIMARY KEY CLUSTERED  ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCPOSX], [UCWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] ALTER COLUMN [PTCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] ALTER COLUMN [PTPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] ALTER COLUMN [PTPYDT] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPPOPA] on [psa].[ics_stg_M3V10gen_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOPA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPPOPA] PRIMARY KEY CLUSTERED  ([PTCONO], [PTPUNO], [PTPYDT])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] ALTER COLUMN [IFCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] ALTER COLUMN [IFITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] ALTER COLUMN [IFPRCS] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] ALTER COLUMN [IFSUFI] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] ALTER COLUMN [IFSUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MITVEN] on [psa].[ics_stg_M3V10ved_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITVEN] PRIMARY KEY CLUSTERED  ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MSYTXH] on [psa].[ics_stg_M3V10gen_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILDSPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILLEDT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILPLPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILPLPS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ALTER COLUMN [ILRGTM] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPDEPR] on [psa].[ics_stg_M3V10ved_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPDEPR] PRIMARY KEY CLUSTERED  ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] ALTER COLUMN [IBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] ALTER COLUMN [IBPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] ALTER COLUMN [IBPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] ALTER COLUMN [IBPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPLINE] on [psa].[ics_stg_M3V10gen_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPLINE] PRIMARY KEY CLUSTERED  ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPHEAD] ALTER COLUMN [IACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPHEAD] ALTER COLUMN [IAPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPHEAD] on [psa].[ics_stg_M3V10ved_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPHEAD] PRIMARY KEY CLUSTERED  ([IACONO], [IAPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POPLP2] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POPLPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POPLPS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ALTER COLUMN [POPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPOPLA] on [psa].[ics_stg_M3V10gen_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPOPLA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPOPLA] PRIMARY KEY CLUSTERED  ([POCONO], [POPLP2], [POPLPN], [POPLPS], [POPNLI], [POPNLS], [POPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] ALTER COLUMN [IRCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] ALTER COLUMN [IRPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] ALTER COLUMN [IRPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] ALTER COLUMN [IRPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPLIRE] on [psa].[ics_stg_M3V10ved_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIRE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPLIRE] PRIMARY KEY CLUSTERED  ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] ALTER COLUMN [ADCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] ALTER COLUMN [ADPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] ALTER COLUMN [ADPOAD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] ALTER COLUMN [ADPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MPPOAD] on [psa].[ics_stg_M3V10gen_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPPOAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPPOAD] PRIMARY KEY CLUSTERED  ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] ALTER COLUMN [PECONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] ALTER COLUMN [PEFUDX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] ALTER COLUMN [PEPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] ALTER COLUMN [PEPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] ALTER COLUMN [PEPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPPOEX] on [psa].[ics_stg_M3V10ved_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOEX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPPOEX] PRIMARY KEY CLUSTERED  ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ALTER COLUMN [TLCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ALTER COLUMN [TLDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ALTER COLUMN [TLLINO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ALTER COLUMN [TLLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ALTER COLUMN [TLTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ALTER COLUMN [TLTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MSYTXL] on [psa].[ics_stg_M3V10gen_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MSYTXL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MSYTXL] PRIMARY KEY CLUSTERED  ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ALTER COLUMN [CUCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ALTER COLUMN [CUCRTP] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ALTER COLUMN [CUCUCD] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ALTER COLUMN [CUCUTD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ALTER COLUMN [CUDIVI] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_CCURRA] on [psa].[ics_stg_M3V10vil_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CCURRA] PRIMARY KEY CLUSTERED  ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] ALTER COLUMN [ICCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] ALTER COLUMN [ICPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] ALTER COLUMN [ICPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] ALTER COLUMN [ICPNLX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] ALTER COLUMN [ICPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPLIND] on [psa].[ics_stg_M3V10ved_POL_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPLIND] PRIMARY KEY CLUSTERED  ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] ALTER COLUMN [BHCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] ALTER COLUMN [BHFACI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] ALTER COLUMN [BHPLNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] ALTER COLUMN [BHWOSQ] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MWOPOL] on [psa].[ics_stg_M3V10gen_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MWOPOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MWOPOL] PRIMARY KEY CLUSTERED  ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDMAS] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDMAS] ALTER COLUMN [IDCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDMAS] ALTER COLUMN [IDSUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_CIDMAS] on [psa].[ics_stg_M3V10vil_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CIDMAS] PRIMARY KEY CLUSTERED  ([IDCONO], [IDSUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVBANO] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVCDSE] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVCEID] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVEXTY] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ALTER COLUMN [IVREPN] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPOEXP] on [psa].[ics_stg_M3V10ved_POL_MPOEXP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOEXP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPOEXP] PRIMARY KEY CLUSTERED  ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] ALTER COLUMN [UACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] ALTER COLUMN [UADLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] ALTER COLUMN [UAORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] ALTER COLUMN [UAWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_ODHEAD] on [psa].[ics_stg_M3V10gen_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_ODHEAD] PRIMARY KEY CLUSTERED  ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDVEN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDVEN] ALTER COLUMN [IICONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDVEN] ALTER COLUMN [IISUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_CIDVEN] on [psa].[ics_stg_M3V10vil_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CIDVEN] PRIMARY KEY CLUSTERED  ([IICONO], [IISUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] ALTER COLUMN [PTCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] ALTER COLUMN [PTPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] ALTER COLUMN [PTPYDT] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPPOPA] on [psa].[ics_stg_M3V10ved_POL_MPPOPA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPPOPA] PRIMARY KEY CLUSTERED  ([PTCONO], [PTPUNO], [PTPYDT])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ALTER COLUMN [UBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ALTER COLUMN [UBDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ALTER COLUMN [UBORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ALTER COLUMN [UBPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ALTER COLUMN [UBPOSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ALTER COLUMN [UBWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_ODLINE] on [psa].[ics_stg_M3V10gen_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_ODLINE] PRIMARY KEY CLUSTERED  ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITMAS] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITMAS] ALTER COLUMN [MMCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITMAS] ALTER COLUMN [MMITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MITMAS] on [psa].[ics_stg_M3V10vil_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MITMAS] PRIMARY KEY CLUSTERED  ([MMCONO], [MMITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MSYTXH] on [psa].[ics_stg_M3V10ved_POL_MSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] ALTER COLUMN [UHCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] ALTER COLUMN [UHDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] ALTER COLUMN [UHINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] ALTER COLUMN [UHIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] ALTER COLUMN [UHYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OINVOH] on [psa].[ics_stg_M3V10gen_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OINVOH] PRIMARY KEY CLUSTERED  ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OCUSMA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OCUSMA] ALTER COLUMN [OKCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OCUSMA] ALTER COLUMN [OKCUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OCUSMA] on [psa].[ics_stg_M3V10vil_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OCUSMA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OCUSMA] PRIMARY KEY CLUSTERED  ([OKCONO], [OKCUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] ALTER COLUMN [IBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] ALTER COLUMN [IBPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] ALTER COLUMN [IBPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] ALTER COLUMN [IBPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPLINE] on [psa].[ics_stg_M3V10ved_POL_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPLINE] PRIMARY KEY CLUSTERED  ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONIVRF] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONIVTP] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONWHLO] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ALTER COLUMN [ONYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OINVOL] on [psa].[ics_stg_M3V10gen_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OINVOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] ALTER COLUMN [OBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] ALTER COLUMN [OBORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] ALTER COLUMN [OBPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] ALTER COLUMN [OBPOSX] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_OOLINE] on [psa].[ics_stg_M3V10vil_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OOLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OOLINE] PRIMARY KEY CLUSTERED  ([OBCONO], [OBORNO], [OBPONR], [OBPOSX])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POPLP2] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POPLPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POPLPS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ALTER COLUMN [POPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPOPLA] on [psa].[ics_stg_M3V10ved_POL_MPOPLA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPOPLA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPOPLA] PRIMARY KEY CLUSTERED  ([POCONO], [POPLP2], [POPLPN], [POPLPS], [POPNLI], [POPNLS], [POPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] ALTER COLUMN [OACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] ALTER COLUMN [OAORNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OOHEAD] on [psa].[ics_stg_M3V10gen_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OOHEAD] PRIMARY KEY CLUSTERED  ([OACONO], [OAORNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] ALTER COLUMN [CTCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] ALTER COLUMN [CTDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] ALTER COLUMN [CTLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] ALTER COLUMN [CTSTCO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] ALTER COLUMN [CTSTKY] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_CSYTAB] on [psa].[ics_stg_M3V10vil_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTAB] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CSYTAB] PRIMARY KEY CLUSTERED  ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] ALTER COLUMN [ADCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] ALTER COLUMN [ADPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] ALTER COLUMN [ADPOAD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] ALTER COLUMN [ADPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MPPOAD] on [psa].[ics_stg_M3V10ved_POL_MPPOAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPPOAD] PRIMARY KEY CLUSTERED  ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ALTER COLUMN [ULCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ALTER COLUMN [ULINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ALTER COLUMN [ULIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ALTER COLUMN [ULPLNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ALTER COLUMN [ULPMNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ALTER COLUMN [ULYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OPAYMD] on [psa].[ics_stg_M3V10gen_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OPAYMD] PRIMARY KEY CLUSTERED  ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_CSYTXH] on [psa].[ics_stg_M3V10vil_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ALTER COLUMN [TLCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ALTER COLUMN [TLDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ALTER COLUMN [TLLINO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ALTER COLUMN [TLLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ALTER COLUMN [TLTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ALTER COLUMN [TLTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MSYTXL] on [psa].[ics_stg_M3V10ved_POL_MSYTXL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MSYTXL] PRIMARY KEY CLUSTERED  ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] ALTER COLUMN [UJCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] ALTER COLUMN [UJPLNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] ALTER COLUMN [UJPMNB] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OPAYMH] on [psa].[ics_stg_M3V10gen_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OPAYMH] PRIMARY KEY CLUSTERED  ([UJCONO], [UJPLNB], [UJPMNB])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] ALTER COLUMN [EGCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] ALTER COLUMN [EGDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] ALTER COLUMN [EGJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] ALTER COLUMN [EGJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] ALTER COLUMN [EGYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FGLEDG] on [psa].[ics_stg_M3V10vil_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGLEDG] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FGLEDG] PRIMARY KEY CLUSTERED  ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] ALTER COLUMN [BHCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] ALTER COLUMN [BHFACI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] ALTER COLUMN [BHPLNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] ALTER COLUMN [BHWOSQ] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_MWOPOL] on [psa].[ics_stg_M3V10ved_POL_MWOPOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MWOPOL] PRIMARY KEY CLUSTERED  ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCORIG] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCPOSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ALTER COLUMN [UCWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OSBSTD] on [psa].[ics_stg_M3V10gen_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OSBSTD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OSBSTD] PRIMARY KEY CLUSTERED  ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCPOSX], [UCWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESSEXI] [nvarchar] (45) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESSEXN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESSEXS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ALTER COLUMN [ESYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FSLEDX] on [psa].[ics_stg_M3V10vil_POL_FSLEDX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FSLEDX] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] ALTER COLUMN [UACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] ALTER COLUMN [UADLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] ALTER COLUMN [UAORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] ALTER COLUMN [UAWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_ODHEAD] on [psa].[ics_stg_M3V10ved_POL_ODHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_ODHEAD] PRIMARY KEY CLUSTERED  ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HEBJNO] [nvarchar] (18) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HECONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HEITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HEMRGD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HEMRGT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HETMSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HETRDT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HETRTM] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ALTER COLUMN [HEWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FRCALP] on [psa].[ics_stg_M3V10vil_POL_FRCALP]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FRCALP] PRIMARY KEY CLUSTERED  ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ALTER COLUMN [UBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ALTER COLUMN [UBDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ALTER COLUMN [UBORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ALTER COLUMN [UBPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ALTER COLUMN [UBPOSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ALTER COLUMN [UBWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_ODLINE] on [psa].[ics_stg_M3V10ved_POL_ODLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_ODLINE] PRIMARY KEY CLUSTERED  ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] ALTER COLUMN [ESTSTM] [varchar] (26) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FSCASH] on [psa].[ics_stg_M3V10vil_POL_FSCASH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSCASH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FSCASH] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESTSTM])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] ALTER COLUMN [UHCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] ALTER COLUMN [UHDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] ALTER COLUMN [UHINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] ALTER COLUMN [UHIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] ALTER COLUMN [UHYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OINVOH] on [psa].[ics_stg_M3V10ved_POL_OINVOH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OINVOH] PRIMARY KEY CLUSTERED  ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] ALTER COLUMN [ESCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] ALTER COLUMN [ESDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] ALTER COLUMN [ESJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] ALTER COLUMN [ESJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] ALTER COLUMN [ESYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FSLEDG] on [psa].[ics_stg_M3V10vil_POL_FSLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDG] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FSLEDG] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONIVRF] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONIVTP] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONWHLO] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ALTER COLUMN [ONYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OINVOL] on [psa].[ics_stg_M3V10ved_POL_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FSYTXH] on [psa].[ics_stg_M3V10vil_POL_FSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOHEAD] ALTER COLUMN [OACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOHEAD] ALTER COLUMN [OAORNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OOHEAD] on [psa].[ics_stg_M3V10ved_POL_OOHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OOHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OOHEAD] PRIMARY KEY CLUSTERED  ([OACONO], [OAORNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] ALTER COLUMN [MUALUN] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] ALTER COLUMN [MUAUTP] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] ALTER COLUMN [MUCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] ALTER COLUMN [MUITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MITAUN] on [psa].[ics_stg_M3V10vil_POL_MITAUN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITAUN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MITAUN] PRIMARY KEY CLUSTERED  ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ALTER COLUMN [ULCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ALTER COLUMN [ULINPX] [nchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ALTER COLUMN [ULIVNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ALTER COLUMN [ULPLNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ALTER COLUMN [ULPMNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ALTER COLUMN [ULYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OPAYMD] on [psa].[ics_stg_M3V10ved_POL_OPAYMD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OPAYMD] PRIMARY KEY CLUSTERED  ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] ALTER COLUMN [CUCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] ALTER COLUMN [CUCRTP] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] ALTER COLUMN [CUCUCD] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] ALTER COLUMN [CUCUTD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] ALTER COLUMN [CUDIVI] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_CCURRA] on [psa].[ics_stg_M3V10gen_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CCURRA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CCURRA] PRIMARY KEY CLUSTERED  ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] ALTER COLUMN [M9CONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] ALTER COLUMN [M9FACI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] ALTER COLUMN [M9ITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MITFAC] on [psa].[ics_stg_M3V10vil_POL_MITFAC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITFAC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MITFAC] PRIMARY KEY CLUSTERED  ([M9CONO], [M9FACI], [M9ITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] ALTER COLUMN [UJCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] ALTER COLUMN [UJPLNB] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] ALTER COLUMN [UJPMNB] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OPAYMH] on [psa].[ics_stg_M3V10ved_POL_OPAYMH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OPAYMH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OPAYMH] PRIMARY KEY CLUSTERED  ([UJCONO], [UJPLNB], [UJPMNB])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] ALTER COLUMN [IDCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] ALTER COLUMN [IDSUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_CIDMAS] on [psa].[ics_stg_M3V10gen_POL_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CIDMAS] PRIMARY KEY CLUSTERED  ([IDCONO], [IDSUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] ALTER COLUMN [MBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] ALTER COLUMN [MBITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] ALTER COLUMN [MBWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MITBAL] on [psa].[ics_stg_M3V10vil_POL_MITBAL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITBAL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MITBAL] PRIMARY KEY CLUSTERED  ([MBCONO], [MBITNO], [MBWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCDLIX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCORIG] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCPOSX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ALTER COLUMN [UCWHLO] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_OSBSTD] on [psa].[ics_stg_M3V10ved_POL_OSBSTD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OSBSTD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OSBSTD] PRIMARY KEY CLUSTERED  ([UCCONO], [UCDIVI], [UCDLIX], [UCORIG], [UCORNO], [UCPONR], [UCPOSX], [UCWHLO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] ALTER COLUMN [IICONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] ALTER COLUMN [IISUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_CIDVEN] on [psa].[ics_stg_M3V10gen_POL_CIDVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CIDVEN] PRIMARY KEY CLUSTERED  ([IICONO], [IISUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLBANO] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLCAMU] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLREPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLWHLO] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ALTER COLUMN [MLWHSL] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MITLOC] on [psa].[ics_stg_M3V10vil_POL_MITLOC]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITLOC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MITLOC] PRIMARY KEY CLUSTERED  ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITMAS] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITMAS] ALTER COLUMN [MMCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITMAS] ALTER COLUMN [MMITNO] [nchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_MITMAS] on [psa].[ics_stg_M3V10gen_POL_MITMAS]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITMAS] PRIMARY KEY CLUSTERED  ([MMCONO], [MMITNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] ALTER COLUMN [IFCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] ALTER COLUMN [IFITNO] [nchar] (15) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] ALTER COLUMN [IFPRCS] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] ALTER COLUMN [IFSUFI] [nvarchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] ALTER COLUMN [IFSUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MITVEN] on [psa].[ics_stg_M3V10vil_POL_MITVEN]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MITVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MITVEN] PRIMARY KEY CLUSTERED  ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
PRINT N'Altering [psa].[ics_stg_movex_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_movex_OINVOL] ALTER COLUMN [ONINPX] [nvarchar] (255) NULL
GO
PRINT N'Creating primary key [PK_stg_movex_OINVOL] on [psa].[ics_stg_movex_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_movex_OINVOL] ADD CONSTRAINT [PK_stg_movex_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OCUSMA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OCUSMA] ALTER COLUMN [OKCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OCUSMA] ALTER COLUMN [OKCUNO] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OCUSMA] on [psa].[ics_stg_M3V10gen_POL_OCUSMA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OCUSMA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OCUSMA] PRIMARY KEY CLUSTERED  ([OKCONO], [OKCUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILDSPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILLEDT] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILPLPN] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILPLPS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILPUNO] [nchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ALTER COLUMN [ILRGTM] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPDEPR] on [psa].[ics_stg_M3V10vil_POL_MPDEPR]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPDEPR] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPDEPR] PRIMARY KEY CLUSTERED  ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] ALTER COLUMN [OBCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] ALTER COLUMN [OBORNO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] ALTER COLUMN [OBPONR] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] ALTER COLUMN [OBPOSX] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_OOLINE] on [psa].[ics_stg_M3V10gen_POL_OOLINE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OOLINE] PRIMARY KEY CLUSTERED  ([OBCONO], [OBORNO], [OBPONR], [OBPOSX])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPHEAD] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPHEAD] ALTER COLUMN [IACONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPHEAD] ALTER COLUMN [IAPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPHEAD] on [psa].[ics_stg_M3V10vil_POL_MPHEAD]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPHEAD] PRIMARY KEY CLUSTERED  ([IACONO], [IAPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ALTER COLUMN [CTCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ALTER COLUMN [CTDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ALTER COLUMN [CTLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ALTER COLUMN [CTSTCO] [nchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ALTER COLUMN [CTSTKY] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_CSYTAB] on [psa].[ics_stg_M3V10gen_POL_CSYTAB]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CSYTAB] PRIMARY KEY CLUSTERED  ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] ALTER COLUMN [IRCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] ALTER COLUMN [IRPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] ALTER COLUMN [IRPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] ALTER COLUMN [IRPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPLIRE] on [psa].[ics_stg_M3V10vil_POL_MPLIRE]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIRE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPLIRE] PRIMARY KEY CLUSTERED  ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ALTER COLUMN [THCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ALTER COLUMN [THDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ALTER COLUMN [THLNCD] [nchar] (2) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ALTER COLUMN [THTXID] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ALTER COLUMN [THTXVR] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_CSYTXH] on [psa].[ics_stg_M3V10gen_POL_CSYTXH]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
PRINT N'Altering [psa].[ics_stg_M3V10ved_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] ALTER COLUMN [CUCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] ALTER COLUMN [CUCRTP] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] ALTER COLUMN [CUCUCD] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] ALTER COLUMN [CUCUTD] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] ALTER COLUMN [CUDIVI] [nchar] (3) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_CCURRA] on [psa].[ics_stg_M3V10ved_POL_CCURRA]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CCURRA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CCURRA] PRIMARY KEY CLUSTERED  ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
PRINT N'Altering [psa].[ics_stg_M3V10vil_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ALTER COLUMN [PECONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ALTER COLUMN [PEFUDX] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ALTER COLUMN [PEPNLI] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ALTER COLUMN [PEPNLS] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ALTER COLUMN [PEPUNO] [nchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_MPPOEX] on [psa].[ics_stg_M3V10vil_POL_MPPOEX]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPPOEX] PRIMARY KEY CLUSTERED  ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
PRINT N'Altering [psa].[ics_stg_M3V10gen_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] DROP
COLUMN [ExcludeFromMerge],
COLUMN [IsDuplicate]
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] ALTER COLUMN [EGCONO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] ALTER COLUMN [EGDIVI] [nchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] ALTER COLUMN [EGJRNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] ALTER COLUMN [EGJSNO] [numeric] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] ALTER COLUMN [EGYEA4] [numeric] (18, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FGLEDG] on [psa].[ics_stg_M3V10gen_POL_FGLEDG]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGLEDG] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FGLEDG] PRIMARY KEY CLUSTERED  ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
