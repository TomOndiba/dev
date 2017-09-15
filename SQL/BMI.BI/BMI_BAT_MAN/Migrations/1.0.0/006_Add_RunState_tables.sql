-- <Migration ID="23e6c836-e097-43df-b89d-f01f11175c38" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [privy]
AUTHORIZATION [dbo]
GO
PRINT N'Creating [privy].[RunStateFlag]'
GO
CREATE TABLE [privy].[RunStateFlag]
(
[FlagBit] [int] NOT NULL,
[FlagName] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_RunStateFlag] on [privy].[RunStateFlag]'
GO
ALTER TABLE [privy].[RunStateFlag] ADD CONSTRAINT [PK_RunStateFlag] PRIMARY KEY CLUSTERED  ([FlagBit])
GO
PRINT N'Adding constraints to [privy].[RunStateFlag]'
GO
ALTER TABLE [privy].[RunStateFlag] ADD CONSTRAINT [AK_RunStateFlag_Name] UNIQUE NONCLUSTERED  ([FlagName])
GO
PRINT N'Creating [privy].[RunState]'
GO
CREATE TABLE [privy].[RunState]
(
[RunStateId] [int] NOT NULL,
[RunStateName] [varchar] (50) NOT NULL,
[IsEtlClosingState] [char] (1) NOT NULL CONSTRAINT [DF_RunState_IsEtlClosingState] DEFAULT ('N'),
[Narrative] [varchar] (500) NOT NULL,
[FlagBit] [int] NOT NULL CONSTRAINT [DF_RunState_FlagBit] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_RunState] on [privy].[RunState]'
GO
ALTER TABLE [privy].[RunState] ADD CONSTRAINT [PK_RunState] PRIMARY KEY CLUSTERED  ([RunStateId])
GO
PRINT N'Adding constraints to [privy].[RunState]'
GO
ALTER TABLE [privy].[RunState] ADD CONSTRAINT [AK_RunState_RunStateName] UNIQUE NONCLUSTERED  ([RunStateName])
GO
PRINT N'Adding constraints to [privy].[RunStateFlag]'
GO
ALTER TABLE [privy].[RunStateFlag] ADD CONSTRAINT [CK_RunStateFlag_FlagRange] CHECK (([FlagBit]=(4096) OR [FlagBit]=(2048) OR [FlagBit]=(1024) OR [FlagBit]=(512) OR [FlagBit]=(256) OR [FlagBit]=(128) OR [FlagBit]=(64) OR [FlagBit]=(32) OR [FlagBit]=(16) OR [FlagBit]=(8) OR [FlagBit]=(4) OR [FlagBit]=(2) OR [FlagBit]=(1) OR [FlagBit]=(0)))
GO
PRINT N'Adding constraints to [privy].[RunState]'
GO
ALTER TABLE [privy].[RunState] ADD CONSTRAINT [CK_RunState_IsEtlClosingState] CHECK (([IsEtlClosingState]='Y' OR [IsEtlClosingState]='N'))
GO
PRINT N'Adding foreign keys to [privy].[RunState]'
GO
ALTER TABLE [privy].[RunState] ADD CONSTRAINT [FK_RunState_RunStateFlag] FOREIGN KEY ([FlagBit]) REFERENCES [privy].[RunStateFlag] ([FlagBit])
GO
