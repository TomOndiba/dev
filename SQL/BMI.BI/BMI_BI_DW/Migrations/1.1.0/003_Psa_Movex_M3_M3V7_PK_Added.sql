-- <Migration ID="a0551cce-5f20-454c-9d62-0ce0469a910e" />
GO

PRINT N'Altering [psa].[ics_stg_m3v7_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ALTER COLUMN [EPDIVI] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ALTER COLUMN [EPJRNO] [decimal] (7, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ALTER COLUMN [EPJSNO] [decimal] (7, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ALTER COLUMN [EPYEA4] [decimal] (4, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3v7_FPLEDG_] on [psa].[ics_stg_m3v7_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ADD CONSTRAINT [PK_psa_ics_stg_m3v7_FPLEDG_] PRIMARY KEY CLUSTERED  ([EPDIVI], [EPYEA4], [EPJRNO], [EPJSNO])
GO
PRINT N'Altering [psa].[ics_stg_m3v7_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ALTER COLUMN [ICPNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ALTER COLUMN [ICPNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ALTER COLUMN [ICPNLX] [decimal] (5, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ALTER COLUMN [ICPUNO] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ALTER COLUMN [ICREPN] [decimal] (10, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ALTER COLUMN [ICSUDO] [nvarchar] (255) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3v7_MPLIND] on [psa].[ics_stg_m3v7_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_m3v7_MPLIND] PRIMARY KEY CLUSTERED  ([ICPUNO], [ICPNLI], [ICPNLS], [ICPNLX], [ICSUDO], [ICREPN])
GO
PRINT N'Altering [psa].[ics_stg_m3v7_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ALTER COLUMN [IBFACI] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ALTER COLUMN [IBPNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ALTER COLUMN [IBPNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ALTER COLUMN [IBPUNO] [nvarchar] (255) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3v7_MPLINE] on [psa].[ics_stg_m3v7_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ADD CONSTRAINT [PK_psa_ics_stg_m3v7_MPLINE] PRIMARY KEY CLUSTERED  ([IBFACI], [IBPUNO], [IBPNLI], [IBPNLS])
GO
PRINT N'Altering [psa].[ics_stg_movex_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ALTER COLUMN [F5PNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ALTER COLUMN [F5PNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ALTER COLUMN [F5PUNO] [nvarchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ALTER COLUMN [F5RELP] [decimal] (1, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ALTER COLUMN [F5REPN] [decimal] (10, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ALTER COLUMN [F5SINO] [nvarchar] (24) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_movex_FGINLI] on [psa].[ics_stg_movex_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ADD CONSTRAINT [PK_psa_ics_stg_movex_FGINLI] PRIMARY KEY CLUSTERED  ([F5SINO], [F5PUNO], [F5PNLI], [F5PNLS], [F5REPN], [F5RELP])
GO
PRINT N'Altering [psa].[ics_stg_movex_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ALTER COLUMN [EPDIVI] [nvarchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ALTER COLUMN [EPJRNO] [decimal] (7, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ALTER COLUMN [EPJSNO] [decimal] (7, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ALTER COLUMN [EPYEA4] [decimal] (4, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_movex_FPLEDG] on [psa].[ics_stg_movex_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ADD CONSTRAINT [PK_psa_ics_stg_movex_FPLEDG] PRIMARY KEY CLUSTERED  ([EPDIVI], [EPYEA4], [EPJRNO], [EPJSNO])
GO
PRINT N'Altering [psa].[ics_stg_movex_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ALTER COLUMN [ICPNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ALTER COLUMN [ICPNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ALTER COLUMN [ICPNLX] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ALTER COLUMN [ICPUNO] [nvarchar] (7) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ALTER COLUMN [ICREPN] [decimal] (10, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ALTER COLUMN [ICSUDO] [nvarchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_movex_MPLIND] on [psa].[ics_stg_movex_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_movex_MPLIND] PRIMARY KEY CLUSTERED  ([ICPUNO], [ICPNLI], [ICPNLS], [ICPNLX], [ICSUDO], [ICREPN])
GO
PRINT N'Altering [psa].[ics_stg_movex_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ALTER COLUMN [IBCONO] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ALTER COLUMN [IBPNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ALTER COLUMN [IBPNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ALTER COLUMN [IBPUNO] [nvarchar] (7) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_movex_MPLINE] on [psa].[ics_stg_movex_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ADD CONSTRAINT [PK_psa_ics_stg_movex_MPLINE] PRIMARY KEY CLUSTERED  ([IBCONO], [IBPUNO], [IBPNLI], [IBPNLS])
GO
PRINT N'Altering [psa].[ics_stg_m3_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ALTER COLUMN [F5PNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ALTER COLUMN [F5RELP] [decimal] (1, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ALTER COLUMN [F5REPN] [decimal] (10, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ALTER COLUMN [F5PUNO] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ALTER COLUMN [F5SINO] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ALTER COLUMN [F5PNLS] [decimal] (3, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3_FGINLI] on [psa].[ics_stg_m3_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ADD CONSTRAINT [PK_psa_ics_stg_m3_FGINLI] PRIMARY KEY CLUSTERED  ([F5SINO], [F5PUNO], [F5PNLI], [F5PNLS], [F5REPN], [F5RELP])
GO
PRINT N'Altering [psa].[ics_stg_m3_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ALTER COLUMN [EPDIVI] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ALTER COLUMN [EPJRNO] [decimal] (7, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ALTER COLUMN [EPJSNO] [decimal] (7, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ALTER COLUMN [EPYEA4] [decimal] (4, 0) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3_FPLEDG] on [psa].[ics_stg_m3_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ADD CONSTRAINT [PK_psa_ics_stg_m3_FPLEDG] PRIMARY KEY CLUSTERED  ([EPDIVI], [EPYEA4], [EPJRNO], [EPJSNO])
GO
PRINT N'Altering [psa].[ics_stg_m3_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ALTER COLUMN [IBACLI] [decimal] (1, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ALTER COLUMN [IBFACI] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ALTER COLUMN [IBPNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ALTER COLUMN [IBPNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ALTER COLUMN [IBPUNO] [nvarchar] (255) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3_MPLINE] on [psa].[ics_stg_m3_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ADD CONSTRAINT [PK_psa_ics_stg_m3_MPLINE] PRIMARY KEY CLUSTERED  ([IBFACI], [IBPUNO], [IBPNLI], [IBPNLS])
GO
PRINT N'Altering [psa].[ics_stg_m3_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ALTER COLUMN [ICPNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ALTER COLUMN [ICPNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ALTER COLUMN [ICPNLX] [decimal] (5, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ALTER COLUMN [ICPUNO] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ALTER COLUMN [ICREPN] [decimal] (10, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ALTER COLUMN [ICSUDO] [nvarchar] (255) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3_MPLIND] on [psa].[ics_stg_m3_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_m3_MPLIND] PRIMARY KEY CLUSTERED  ([ICPUNO], [ICPNLI], [ICPNLS], [ICPNLX], [ICSUDO], [ICREPN])
GO
PRINT N'Altering [psa].[ics_stg_m3v7_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5CONO] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5PNLI] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5PNLS] [decimal] (3, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5PUNO] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5REPN] [decimal] (10, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5SINO] [nvarchar] (255) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ALTER COLUMN [F5SUNO] [nvarchar] (255) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_m3v7_FGINLI] on [psa].[ics_stg_m3v7_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ADD CONSTRAINT [PK_psa_ics_stg_m3v7_FGINLI] PRIMARY KEY CLUSTERED  ([F5CONO], [F5SUNO], [F5SINO], [F5PUNO], [F5PNLI], [F5PNLS], [F5REPN])
GO
