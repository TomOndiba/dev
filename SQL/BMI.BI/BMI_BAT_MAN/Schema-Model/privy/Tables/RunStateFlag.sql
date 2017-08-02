CREATE TABLE [privy].[RunStateFlag]
(
[FlagBit] [int] NOT NULL,
[FlagName] [varchar] (50) NOT NULL
)
GO
ALTER TABLE [privy].[RunStateFlag] ADD CONSTRAINT [CK_RunStateFlag_FlagRange] CHECK (([FlagBit]=(4096) OR [FlagBit]=(2048) OR [FlagBit]=(1024) OR [FlagBit]=(512) OR [FlagBit]=(256) OR [FlagBit]=(128) OR [FlagBit]=(64) OR [FlagBit]=(32) OR [FlagBit]=(16) OR [FlagBit]=(8) OR [FlagBit]=(4) OR [FlagBit]=(2) OR [FlagBit]=(1) OR [FlagBit]=(0)))
GO
ALTER TABLE [privy].[RunStateFlag] ADD CONSTRAINT [PK_RunStateFlag] PRIMARY KEY CLUSTERED  ([FlagBit])
GO
ALTER TABLE [privy].[RunStateFlag] ADD CONSTRAINT [AK_RunStateFlag_Name] UNIQUE NONCLUSTERED  ([FlagName])
GO
