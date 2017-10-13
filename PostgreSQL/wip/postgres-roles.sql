--!
--! postgres-roles.sql
--!
do
$$
begin
	if not exists (select 1 from pg_roles where rolname = 'gregl') then
		raise notice 'Creating superuser: "%"...', 'gregl'; 
		create role gregl login password 'xzsa21' createdb;
		grant cloudsqlsuperuser to gregl;
	else
		raise notice 'Role: "%" not found', 'gregl'; 
	end if;
end
$$;