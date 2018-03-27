-- <Migration ID="96e34c50-d4f4-4b27-87e5-a4312fe5405c" />
GO

/****** Object: Table [dbo].[DataSourceTableGroups] Script Date: 27/03/2018 14:23:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DataSourceTableGroups] (
    [ROWID]          INT          IDENTITY (1, 1) NOT NULL,
    [DataSourceKey]  INT          NULL,
    [ERP_System]     VARCHAR (50) NOT NULL,
    [Source_Company] VARCHAR (50) NULL,
    [Source_Country] VARCHAR (3)  NULL,
    [Subject_Area]   VARCHAR (25) NULL,
    [TableFilter]    AS           (((([ERP_System]+'_')+isnull([Source_Company]+'_',''))+isnull([Source_Country],''))+isnull('_'+[Subject_Area],'')) PERSISTED NOT NULL
);


