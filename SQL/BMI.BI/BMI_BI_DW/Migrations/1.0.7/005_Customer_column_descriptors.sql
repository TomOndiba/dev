-- <Migration ID="9f04b045-71fb-47aa-a80e-e692b1271ff9" />
GO

PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A Customer is any legal entity to or through whom Icopal sells products - including direct sales (e.g. construction company or contractor) or indirect (e.g. specifying architect)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The category that is directly associated with a customer in the source system of record. "Base" in this context implies direct association but is no indication of actual level of the named category in any hierarchy.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryBaseLevel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the top level node in the customer category hierarchy.  Will typically always be the generic ultimate parent: "Icopal Customer Groups"', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel1 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel2 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel3'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel3 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel4'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel4 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel5'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel5 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel6'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel6 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel7'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel7 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel8'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific surrogate key that uniquely identifies an Icopal customer', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Business-friendly name for a customer, is not guaranteed unique even within a single source system', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Alternate operational number or code used to uniquely identify a customer within the source business.  May or may not be the same as NativeCustomerKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reference to the unique identifier for a customer type as identified within the source system of record indicated by DataSourceKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerTypeId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of a customer type used to classify customers within a given source system indicated by DataSourceKey.  Meaning and range of values will vary between sources.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerTypeName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier for a customer record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'NativeCustomerKey'
GO
