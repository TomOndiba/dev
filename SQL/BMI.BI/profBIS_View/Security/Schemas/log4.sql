CREATE SCHEMA [log4]
    AUTHORIZATION [dbo];






GO
GRANT SELECT
    ON SCHEMA::[log4] TO [EtlDevelopers];


GO
GRANT EXECUTE
    ON SCHEMA::[log4] TO PUBLIC;


GO
GRANT EXECUTE
    ON SCHEMA::[log4] TO [EtlDevelopers];

