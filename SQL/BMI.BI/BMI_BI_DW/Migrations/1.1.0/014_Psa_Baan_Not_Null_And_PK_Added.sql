-- <Migration ID="0991d5cb-197d-483c-8fda-83f863a18f04" />
GO

PRINT N'Altering [psa].[ics_stg_baan_ttdpur041610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur041610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur041610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur041610] on [psa].[ics_stg_baan_ttdpur041610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur041610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur041610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur042610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur042610] ALTER COLUMN [t_ckor] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur042610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur042610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur042610] on [psa].[ics_stg_baan_ttdpur042610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur042610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur042610] PRIMARY KEY CLUSTERED  ([t_ckor], [t_orno], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur081610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur081610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur081610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur081610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur081610] on [psa].[ics_stg_baan_ttdpur081610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur081610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur081610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_item], [t_orno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur045610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur045610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur045610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur045610] ALTER COLUMN [t_srnb] [tinyint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur045610] on [psa].[ics_stg_baan_ttdpur045610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur045610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur045610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono], [t_srnb])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur046610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur046610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur046610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur046610] ALTER COLUMN [t_srnb] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur046610] ALTER COLUMN [t_srni] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur046610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur046610] on [psa].[ics_stg_baan_ttdpur046610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur046610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur046610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono], [t_srnb], [t_srni], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur082610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur082610] ALTER COLUMN [t_cpgp] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur082610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur082610] on [psa].[ics_stg_baan_ttdpur082610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur082610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur082610] PRIMARY KEY CLUSTERED  ([t_cpgp], [t_orno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur302610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur302610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur302610] ALTER COLUMN [t_ddta] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur302610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur302610] on [psa].[ics_stg_baan_ttdpur302610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur302610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur302610] PRIMARY KEY CLUSTERED  ([t_cono], [t_ddta], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur047610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur047610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur047610] ALTER COLUMN [t_ponb] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur047610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur047610] on [psa].[ics_stg_baan_ttdpur047610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur047610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur047610] PRIMARY KEY CLUSTERED  ([t_orno], [t_ponb], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur050610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur050610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur050610] ALTER COLUMN [t_trdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur050610] ALTER COLUMN [t_trtm] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur050610] on [psa].[ics_stg_baan_ttdpur050610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur050610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur050610] PRIMARY KEY CLUSTERED  ([t_orno], [t_trdt], [t_trtm])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur051610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ALTER COLUMN [t_ckor] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ALTER COLUMN [t_sern] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ALTER COLUMN [t_trdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ALTER COLUMN [t_trtm] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur051610] on [psa].[ics_stg_baan_ttdpur051610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur051610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur051610] PRIMARY KEY CLUSTERED  ([t_ckor], [t_orno], [t_pono], [t_sern], [t_trdt], [t_trtm])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur061610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur061610] ALTER COLUMN [t_citg] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur061610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur061610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur061610] ALTER COLUMN [t_year] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur061610] on [psa].[ics_stg_baan_ttdpur061610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur061610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur061610] PRIMARY KEY CLUSTERED  ([t_citg], [t_item], [t_suno], [t_year])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur080610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur080610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur080610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur080610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur080610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur080610] on [psa].[ics_stg_baan_ttdpur080610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur080610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur080610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_item], [t_orno], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur300610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur300610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur300610] on [psa].[ics_stg_baan_ttdpur300610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur300610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur300610] PRIMARY KEY CLUSTERED  ([t_cono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur301610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur301610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur301610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur301610] on [psa].[ics_stg_baan_ttdpur301610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur301610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur301610] PRIMARY KEY CLUSTERED  ([t_cono], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur303610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur303610] ALTER COLUMN [t_ckor] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur303610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur303610] on [psa].[ics_stg_baan_ttdpur303610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur303610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur303610] PRIMARY KEY CLUSTERED  ([t_ckor], [t_cono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur305610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur305610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur305610] ALTER COLUMN [t_trdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur305610] ALTER COLUMN [t_trtm] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur305610] on [psa].[ics_stg_baan_ttdpur305610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur305610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur305610] PRIMARY KEY CLUSTERED  ([t_cono], [t_trdt], [t_trtm])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur306610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ALTER COLUMN [t_comp] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ALTER COLUMN [t_sern] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ALTER COLUMN [t_trdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ALTER COLUMN [t_trtm] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur306610] on [psa].[ics_stg_baan_ttdpur306610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur306610] PRIMARY KEY CLUSTERED  ([t_comp], [t_cono], [t_pono], [t_sern], [t_trdt], [t_trtm])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur310610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur310610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur310610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur310610] ALTER COLUMN [t_upid] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur310610] on [psa].[ics_stg_baan_ttdpur310610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur310610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur310610] PRIMARY KEY CLUSTERED  ([t_cono], [t_pono], [t_upid])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur332610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur332610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur332610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur332610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur332610] ALTER COLUMN [t_qanp] [float] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur332610] ALTER COLUMN [t_stdt] [datetime] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur332610] on [psa].[ics_stg_baan_ttdpur332610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur332610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur332610] PRIMARY KEY CLUSTERED  ([t_cono], [t_dile], [t_pono], [t_qanp], [t_stdt])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur333610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ALTER COLUMN [t_qanp] [float] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ALTER COLUMN [t_stdt] [datetime] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur333610] on [psa].[ics_stg_baan_ttdpur333610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur333610] PRIMARY KEY CLUSTERED  ([t_cono], [t_dile], [t_pono], [t_qanp], [t_stdt])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur335610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur335610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur335610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur335610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur335610] on [psa].[ics_stg_baan_ttdpur335610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur335610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur335610] PRIMARY KEY CLUSTERED  ([t_cono], [t_dile], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur336610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur336610] ALTER COLUMN [t_cono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur336610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur336610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur336610] on [psa].[ics_stg_baan_ttdpur336610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur336610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur336610] PRIMARY KEY CLUSTERED  ([t_cono], [t_dile], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur400610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur400610] ALTER COLUMN [t_dino] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur400610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur400610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur400610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur400610] on [psa].[ics_stg_baan_ttdpur400610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur400610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur400610] PRIMARY KEY CLUSTERED  ([t_dino], [t_orno], [t_pono], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur000610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur000610] ALTER COLUMN [t_sern] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur000610] on [psa].[ics_stg_baan_ttdpur000610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur000610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur000610] PRIMARY KEY CLUSTERED  ([t_sern])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur401610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ALTER COLUMN [t_dino] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ALTER COLUMN [t_sera] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ALTER COLUMN [t_serb] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur401610] on [psa].[ics_stg_baan_ttdpur401610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur401610] PRIMARY KEY CLUSTERED  ([t_dino], [t_orno], [t_pono], [t_sera], [t_serb], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur001610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur001610] ALTER COLUMN [t_qono] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur001610] on [psa].[ics_stg_baan_ttdpur001610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur001610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur001610] PRIMARY KEY CLUSTERED  ([t_qono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur703610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur703610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur703610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur703610] on [psa].[ics_stg_baan_ttdpur703610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur703610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur703610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur020610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur020610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur020610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur020610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur020610] on [psa].[ics_stg_baan_ttdpur020610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur020610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur020610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_item], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur704610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur704610] ALTER COLUMN [t_date] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur704610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur704610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur704610] ALTER COLUMN [t_time] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur704610] on [psa].[ics_stg_baan_ttdpur704610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur704610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur704610] PRIMARY KEY CLUSTERED  ([t_date], [t_orno], [t_pono], [t_time])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur002610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur002610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur002610] ALTER COLUMN [t_qono] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur002610] on [psa].[ics_stg_baan_ttdpur002610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur002610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur002610] PRIMARY KEY CLUSTERED  ([t_pono], [t_qono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur010610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur010610] ALTER COLUMN [t_qono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur010610] ALTER COLUMN [t_trdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur010610] ALTER COLUMN [t_trtm] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur010610] on [psa].[ics_stg_baan_ttdpur010610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur010610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur010610] PRIMARY KEY CLUSTERED  ([t_qono], [t_trdt], [t_trtm])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur021610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur021610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur021610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur021610] on [psa].[ics_stg_baan_ttdpur021610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur021610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur021610] PRIMARY KEY CLUSTERED  ([t_item], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur011610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ALTER COLUMN [t_qono] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ALTER COLUMN [t_sern] [smallint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ALTER COLUMN [t_trdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ALTER COLUMN [t_trtm] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur011610] on [psa].[ics_stg_baan_ttdpur011610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur011610] PRIMARY KEY CLUSTERED  ([t_pono], [t_qono], [t_sern], [t_trdt], [t_trtm])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur027610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur027610] ALTER COLUMN [t_cplp] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur027610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur027610] on [psa].[ics_stg_baan_ttdpur027610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur027610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur027610] PRIMARY KEY CLUSTERED  ([t_cplp], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur036610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur036610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur036610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur036610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur036610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur036610] on [psa].[ics_stg_baan_ttdpur036610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur036610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur036610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_dile], [t_item], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur037610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur037610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur037610] ALTER COLUMN [t_cplp] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur037610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur037610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur037610] on [psa].[ics_stg_baan_ttdpur037610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur037610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur037610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_cplp], [t_dile], [t_item])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur028610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur028610] ALTER COLUMN [t_ccos] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur028610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur028610] on [psa].[ics_stg_baan_ttdpur028610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur028610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur028610] PRIMARY KEY CLUSTERED  ([t_ccos], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur030610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ALTER COLUMN [t_qanp] [float] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ALTER COLUMN [t_stdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur030610] on [psa].[ics_stg_baan_ttdpur030610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur030610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur030610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_dile], [t_item], [t_qanp], [t_stdt], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur031610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur031610] ALTER COLUMN [t_cpgp] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur031610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur031610] ALTER COLUMN [t_qanp] [float] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur031610] ALTER COLUMN [t_stdt] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur031610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur031610] on [psa].[ics_stg_baan_ttdpur031610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur031610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur031610] PRIMARY KEY CLUSTERED  ([t_cpgp], [t_dile], [t_qanp], [t_stdt], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur043610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur043610] ALTER COLUMN [t_logn] [varchar] (16) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur043610] on [psa].[ics_stg_baan_ttdpur043610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur043610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur043610] PRIMARY KEY CLUSTERED  ([t_logn])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur032610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ALTER COLUMN [t_cntr] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ALTER COLUMN [t_cplp] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ALTER COLUMN [t_item] [varchar] (16) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ALTER COLUMN [t_qanp] [float] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ALTER COLUMN [t_stdt] [datetime] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur032610] on [psa].[ics_stg_baan_ttdpur032610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur032610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur032610] PRIMARY KEY CLUSTERED  ([t_cntr], [t_cplp], [t_dile], [t_item], [t_qanp], [t_stdt])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur033610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur033610] ALTER COLUMN [t_cpgp] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur033610] ALTER COLUMN [t_cplp] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur033610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur033610] ALTER COLUMN [t_qanp] [float] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur033610] ALTER COLUMN [t_stdt] [datetime] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur033610] on [psa].[ics_stg_baan_ttdpur033610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur033610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur033610] PRIMARY KEY CLUSTERED  ([t_cpgp], [t_cplp], [t_dile], [t_qanp], [t_stdt])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur034610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur034610] ALTER COLUMN [t_cpgp] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur034610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur034610] ALTER COLUMN [t_suno] [varchar] (6) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur034610] on [psa].[ics_stg_baan_ttdpur034610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur034610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur034610] PRIMARY KEY CLUSTERED  ([t_cpgp], [t_dile], [t_suno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur048610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur048610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur048610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur048610] on [psa].[ics_stg_baan_ttdpur048610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur048610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur048610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur035610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur035610] ALTER COLUMN [t_cpgp] [varchar] (6) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur035610] ALTER COLUMN [t_cplp] [varchar] (3) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur035610] ALTER COLUMN [t_dile] [tinyint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur035610] on [psa].[ics_stg_baan_ttdpur035610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur035610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur035610] PRIMARY KEY CLUSTERED  ([t_cpgp], [t_cplp], [t_dile])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur040610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur040610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur040610] on [psa].[ics_stg_baan_ttdpur040610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur040610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur040610] PRIMARY KEY CLUSTERED  ([t_orno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur053610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur053610] ALTER COLUMN [t_cosn] [varchar] (8) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur053610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur053610] on [psa].[ics_stg_baan_ttdpur053610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur053610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur053610] PRIMARY KEY CLUSTERED  ([t_cosn], [t_orno])
GO
PRINT N'Altering [psa].[ics_stg_baan_ttdpur054610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur054610] ALTER COLUMN [t_orno] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur054610] ALTER COLUMN [t_pono] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_baan_ttdpur054610] on [psa].[ics_stg_baan_ttdpur054610]'
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur054610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur054610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono])
GO
