CREATE SCHEMA [privy]
AUTHORIZATION [dbo]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [privy] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [privy] TO [BusinessAnalystsPROD]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [EtlDevelopersDEV]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [privy] TO [EtlDevelopersPROD]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [IcsDataFeeders]
GO
