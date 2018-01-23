-- <Migration ID="3f14a55d-a5d9-49d2-af8b-f2f984187214" />
GO

PRINT N'Altering [psa].[ics_stg_Symfonia_SR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SR] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_SR] on [psa].[ics_stg_Symfonia_SR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_SR] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_StanyMinMax]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_StanyMinMax] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_StanyMinMax] on [psa].[ics_stg_Symfonia_StanyMinMax]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_StanyMinMax] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_StanyMinMax] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_CT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CT] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_CT] on [psa].[ics_stg_Symfonia_CT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CT] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_CT] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_DT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DT] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_DT] on [psa].[ics_stg_Symfonia_DT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DT] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_DT] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_TX]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TX] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_TX] on [psa].[ics_stg_Symfonia_TX]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TX] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_TX] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_TD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TD] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_TD] on [psa].[ics_stg_Symfonia_TD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TD] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_TD] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_TR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TR] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_TR] on [psa].[ics_stg_Symfonia_TR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_TR] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_EP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_EP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_EP] on [psa].[ics_stg_Symfonia_EP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_EP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_EP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZE] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZE] on [psa].[ics_stg_Symfonia_ZE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZE] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZE] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_CK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CK] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_CK] on [psa].[ics_stg_Symfonia_CK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CK] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_CK] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZN] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZN] on [psa].[ics_stg_Symfonia_ZN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZN] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_CN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CN] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_CN] on [psa].[ics_stg_Symfonia_CN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_CN] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_TW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TW] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_TW] on [psa].[ics_stg_Symfonia_TW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TW] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_TW] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_DK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DK] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_DK] on [psa].[ics_stg_Symfonia_DK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DK] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_DK] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_DP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_DP] on [psa].[ics_stg_Symfonia_DP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_DP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_UZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_UZ] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_UZ] on [psa].[ics_stg_Symfonia_UZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_UZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_UZ] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_DW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DW] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_DW] on [psa].[ics_stg_Symfonia_DW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_DW] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_DW] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_WD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_WD] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_WD] on [psa].[ics_stg_Symfonia_WD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_WD] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_WD] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ErrorLog]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ErrorLog] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ErrorLog] on [psa].[ics_stg_Symfonia_ErrorLog]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ErrorLog] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ErrorLog] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_FP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_FP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_FP] on [psa].[ics_stg_Symfonia_FP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_FP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_FP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZR] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZR] on [psa].[ics_stg_Symfonia_ZR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZR] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_EK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_EK] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_EK] on [psa].[ics_stg_Symfonia_EK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_EK] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_EK] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_XT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_XT] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_XT] on [psa].[ics_stg_Symfonia_XT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_XT] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_XT] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_HW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_HW] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_HW] on [psa].[ics_stg_Symfonia_HW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_HW] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_HW] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZL]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZL] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZL] on [psa].[ics_stg_Symfonia_ZL]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZL] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZL] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_IL]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_IL] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_IL] on [psa].[ics_stg_Symfonia_IL]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_IL] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_IL] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZO]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZO] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZO] on [psa].[ics_stg_Symfonia_ZO]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZO] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZO] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_INIFILE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_INIFILE] ALTER COLUMN [klucz] [varchar] (100) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Symfonia_INIFILE] ALTER COLUMN [plik] [varchar] (100) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Symfonia_INIFILE] ALTER COLUMN [sekcja] [varchar] (100) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_INIFILE] on [psa].[ics_stg_Symfonia_INIFILE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_INIFILE] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_INIFILE] PRIMARY KEY CLUSTERED  ([klucz], [plik], [sekcja])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZP] on [psa].[ics_stg_Symfonia_ZP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_KR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KR] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_KR] on [psa].[ics_stg_Symfonia_KR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_KR] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ZZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZZ] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ZZ] on [psa].[ics_stg_Symfonia_ZZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZZ] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_IP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_IP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_IP] on [psa].[ics_stg_Symfonia_IP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_IP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_IP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_IT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_IT] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_IT] on [psa].[ics_stg_Symfonia_IT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_IT] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_IT] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_KH]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KH] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_KH] on [psa].[ics_stg_Symfonia_KH]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KH] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_KH] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_KP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_KP] on [psa].[ics_stg_Symfonia_KP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_KP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_LOCAL_LOG]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_LOCAL_LOG] ALTER COLUMN [id] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Symfonia_LOCAL_LOG] ALTER COLUMN [term] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_LOCAL_LOG] on [psa].[ics_stg_Symfonia_LOCAL_LOG]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_LOCAL_LOG] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_LOCAL_LOG] PRIMARY KEY CLUSTERED  ([id], [term])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_LOG_BASE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_LOG_BASE] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_LOG_BASE] on [psa].[ics_stg_Symfonia_LOG_BASE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_LOG_BASE] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_LOG_BASE] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_NT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_NT] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_NT] on [psa].[ics_stg_Symfonia_NT]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_NT] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_NT] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_PO]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PO] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_PO] on [psa].[ics_stg_Symfonia_PO]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PO] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PO] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_MG]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_MG] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_MG] on [psa].[ics_stg_Symfonia_MG]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_MG] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_MG] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_MZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_MZ] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_MZ] on [psa].[ics_stg_Symfonia_MZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_MZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_MZ] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RE] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RE] on [psa].[ics_stg_Symfonia_RE]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RE] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RE] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_OP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_OP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_OP] on [psa].[ics_stg_Symfonia_OP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_OP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_OP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_PN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PN] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_PN] on [psa].[ics_stg_Symfonia_PN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PN] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RLKS]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RLKS] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RLKS] on [psa].[ics_stg_Symfonia_RLKS]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RLKS] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RLKS] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RN] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RN] on [psa].[ics_stg_Symfonia_RN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RN] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_PR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PR] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_PR] on [psa].[ics_stg_Symfonia_PR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PR] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia__KonwersjaIdToCore]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia__KonwersjaIdToCore] ALTER COLUMN [coreId] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Symfonia__KonwersjaIdToCore] ALTER COLUMN [hmfID] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Symfonia__KonwersjaIdToCore] ALTER COLUMN [objId] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia__KonwersjaIdToCore] on [psa].[ics_stg_Symfonia__KonwersjaIdToCore]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia__KonwersjaIdToCore] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia__KonwersjaIdToCore] PRIMARY KEY CLUSTERED  ([coreId], [hmfID], [objId])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_PW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PW] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_PW] on [psa].[ics_stg_Symfonia_PW]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PW] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PW] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaKh]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaKh] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia__MigracjaDodatkowePolaKh] on [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaKh]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaKh] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia__MigracjaDodatkowePolaKh] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RO]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RO] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RO] on [psa].[ics_stg_Symfonia_RO]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RO] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RO] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaTw]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaTw] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia__MigracjaDodatkowePolaTw] on [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaTw]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia__MigracjaDodatkowePolaTw] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia__MigracjaDodatkowePolaTw] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_ROPN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ROPN] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_ROPN] on [psa].[ics_stg_Symfonia_ROPN]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ROPN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ROPN] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_AcInfo]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AcInfo] ALTER COLUMN [Ac_Name] [varchar] (15) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_AcInfo] on [psa].[ics_stg_Symfonia_AcInfo]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AcInfo] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_AcInfo] PRIMARY KEY CLUSTERED  ([Ac_Name])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RP] on [psa].[ics_stg_Symfonia_RP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RV]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RV] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RV] on [psa].[ics_stg_Symfonia_RV]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RV] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RV] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_AD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AD] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_AD] on [psa].[ics_stg_Symfonia_AD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AD] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_AD] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_RZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RZ] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_RZ] on [psa].[ics_stg_Symfonia_RZ]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RZ] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_SD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SD] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_SD] on [psa].[ics_stg_Symfonia_SD]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SD] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_SD] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_AU]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AU] ALTER COLUMN [id] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AU] ALTER COLUMN [o_seed] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_AU] on [psa].[ics_stg_Symfonia_AU]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AU] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_AU] PRIMARY KEY CLUSTERED  ([id], [o_seed])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_SK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SK] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_SK] on [psa].[ics_stg_Symfonia_SK]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SK] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_SK] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_CP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CP] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_CP] on [psa].[ics_stg_Symfonia_CP]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_CP] PRIMARY KEY CLUSTERED  ([id])
GO
PRINT N'Altering [psa].[ics_stg_Symfonia_SM]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SM] ALTER COLUMN [id] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Symfonia_SM] on [psa].[ics_stg_Symfonia_SM]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SM] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_SM] PRIMARY KEY CLUSTERED  ([id])
GO
