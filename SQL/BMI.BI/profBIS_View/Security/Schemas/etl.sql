CREATE SCHEMA [etl]
    AUTHORIZATION [dbo];










GO
GRANT SELECT
    ON SCHEMA::[etl] TO [EtlReaders];


GO
GRANT SELECT
    ON SCHEMA::[etl] TO [EtlDevelopers];


GO
GRANT EXECUTE
    ON SCHEMA::[etl] TO [EtlReaders];


GO
GRANT EXECUTE
    ON SCHEMA::[etl] TO [EtlDevelopers];

