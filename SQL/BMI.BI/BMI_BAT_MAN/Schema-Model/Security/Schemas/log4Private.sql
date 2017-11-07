CREATE SCHEMA [log4Private]
AUTHORIZATION [dbo]
GO
GRANT REFERENCES ON SCHEMA:: [log4Private] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [log4Private] TO [BatchManagers]
GO
