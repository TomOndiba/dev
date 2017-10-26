--!
--! adventureworks-roles.sql
--!
do
$$
declare
	v_user_name varchar(50) := 'tom-manville';
begin
	if exists (select 1 from pg_roles where rolname = 'tom-manville') then
		--!
		--! Revoke any permissions
		--!
		raise notice 'Revoking permissions for Role: "%"...', 'tom-manville'; 
		revoke select on all tables in schema public from "tom-manville";
		revoke select on all tables in schema humanresources from "tom-manville";
		revoke select on all tables in schema person from "tom-manville";
		revoke select on all tables in schema production from "tom-manville";
		revoke select on all tables in schema purchasing from "tom-manville";
		revoke select on all tables in schema sales from "tom-manville";
		--!
		revoke usage on schema public from "tom-manville";
		alter default privileges in schema public revoke select on tables from "tom-manville";
		--!
		revoke usage on schema humanresources from "tom-manville";
		alter default privileges in schema humanresources revoke select on tables from "tom-manville";
		alter default privileges in schema humanresources revoke execute on functions from "tom-manville";
		--!
		revoke usage on schema person from "tom-manville";
		alter default privileges in schema person revoke select on tables from "tom-manville";
		alter default privileges in schema person revoke execute on functions from "tom-manville";
		--!
		revoke usage on schema production from "tom-manville";
		alter default privileges in schema production revoke select on tables from "tom-manville";
		alter default privileges in schema production revoke execute on functions from "tom-manville";
		--!
		revoke usage on schema purchasing from "tom-manville";
		alter default privileges in schema purchasing revoke select on tables from "tom-manville";
		alter default privileges in schema purchasing revoke execute on functions from "tom-manville";
		--!
		revoke usage on schema sales from "tom-manville";
		alter default privileges in schema sales revoke select on tables from "tom-manville";
		alter default privileges in schema sales revoke execute on functions from "tom-manville";
		--!
		--! Revoke database access
		--!
		--reassign owned by "tom-manville" TO postgres;
		--drop owned by "tom-manville"
		revoke connect on database adventureworks from "tom-manville";
		--!
		--! Remove login
		--!
		drop user if exists "tom-manville";
	else
		raise notice 'Role: "%" not found', 'tom-manville'; 
	end if;
	--!
	--! (Re)Create Login
	--!
	create role "tom-manville" login password 'My Name 15 Tom!';
	--!
	--! (Re)Grant database access
	--!
	grant connect on database adventureworks to "tom-manville";
	--!
	--! (Re)Grant schema privileges
	--!
	grant usage on schema public to "tom-manville";
	grant select on all tables in schema public to "tom-manville";
	--!	
	grant usage on schema humanresources to "tom-manville";
	grant select on table humanresources.department to "tom-manville";
	grant select on table humanresources.employee to "tom-manville";
	grant select on table humanresources.employeedepartmenthistory to "tom-manville";
	grant select on table humanresources.employeepayhistory to "tom-manville";
	grant select on table humanresources.jobcandidate to "tom-manville";
	grant select on table humanresources.shift to "tom-manville";
	grant select on table humanresources.vemployee to "tom-manville";
	grant select on table humanresources.vemployeedepartment to "tom-manville";
	grant select on table humanresources.vemployeedepartmenthistory to "tom-manville";
	grant select on table humanresources.vjobcandidate to "tom-manville";
	grant select on table humanresources.vjobcandidateeducation to "tom-manville";
	grant select on table humanresources.vjobcandidateemployment to "tom-manville";
	alter default privileges in schema humanresources grant select on tables to "tom-manville";
	alter default privileges in schema humanresources grant execute on functions to "tom-manville";
	--!	
	grant usage on schema person to "tom-manville";
	grant select on table person.vstateprovincecountryregion to "tom-manville";
	grant select on table person.address to "tom-manville";
	grant select on table person.addresstype to "tom-manville";
	grant select on table person.businessentity to "tom-manville";
	grant select on table person.businessentityaddress to "tom-manville";
	grant select on table person.businessentitycontact to "tom-manville";
	grant select on table person.contacttype to "tom-manville";
	grant select on table person.countryregion to "tom-manville";
	grant select on table person.emailaddress to "tom-manville";
	grant select on table person.password to "tom-manville";
	grant select on table person.person to "tom-manville";
	grant select on table person.personphone to "tom-manville";
	grant select on table person.phonenumbertype to "tom-manville";
	grant select on table person.stateprovince to "tom-manville";
	grant select on table person.vadditionalcontactinfo to "tom-manville";
	alter default privileges in schema person grant select on tables to "tom-manville";
	alter default privileges in schema person grant execute on functions to "tom-manville";
	--!		
	grant usage on schema production to "tom-manville";
	grant select on table production.vproductanddescription to "tom-manville";
	grant select on table production.billofmaterials to "tom-manville";
	grant select on table production.culture to "tom-manville";
	grant select on table production.document to "tom-manville";
	grant select on table production.illustration to "tom-manville";
	grant select on table production.location to "tom-manville";
	grant select on table production.product to "tom-manville";
	grant select on table production.productcategory to "tom-manville";
	grant select on table production.productcosthistory to "tom-manville";
	grant select on table production.productdescription to "tom-manville";
	grant select on table production.productdocument to "tom-manville";
	grant select on table production.productinventory to "tom-manville";
	grant select on table production.productlistpricehistory to "tom-manville";
	grant select on table production.productmodel to "tom-manville";
	grant select on table production.productmodelillustration to "tom-manville";
	grant select on table production.productmodelproductdescriptionculture to "tom-manville";
	grant select on table production.productphoto to "tom-manville";
	grant select on table production.productproductphoto to "tom-manville";
	grant select on table production.productreview to "tom-manville";
	grant select on table production.productsubcategory to "tom-manville";
	grant select on table production.scrapreason to "tom-manville";
	grant select on table production.transactionhistory to "tom-manville";
	grant select on table production.transactionhistoryarchive to "tom-manville";
	grant select on table production.unitmeasure to "tom-manville";
	grant select on table production.workorder to "tom-manville";
	grant select on table production.workorderrouting to "tom-manville";
	grant select on table production.vproductmodelcatalogdescription to "tom-manville";
	grant select on table production.vproductmodelinstructions to "tom-manville";
	alter default privileges in schema production grant select on tables to "tom-manville";
	alter default privileges in schema production grant execute on functions to "tom-manville";
	--!		
	grant usage on schema purchasing to "tom-manville";
	grant select on table purchasing.productvendor to "tom-manville";
	grant select on table purchasing.purchaseorderdetail to "tom-manville";
	grant select on table purchasing.purchaseorderheader to "tom-manville";
	grant select on table purchasing.shipmethod to "tom-manville";
	grant select on table purchasing.vendor to "tom-manville";
	grant select on table purchasing.vvendorwithaddresses to "tom-manville";
	grant select on table purchasing.vvendorwithcontacts to "tom-manville";
	grant select on all tables in schema purchasing to "tom-manville";
	alter default privileges in schema purchasing grant select on tables to "tom-manville";
	alter default privileges in schema purchasing grant execute on functions to "tom-manville";
	--!		
	grant usage on schema sales to "tom-manville";
	grant select on table sales.countryregioncurrency to "tom-manville";
	grant select on table sales.creditcard to "tom-manville";
	grant select on table sales.currency to "tom-manville";
	grant select on table sales.currencyrate to "tom-manville";
	grant select on table sales.customer to "tom-manville";
	grant select on table sales.personcreditcard to "tom-manville";
	grant select on table sales.salesorderdetail to "tom-manville";
	grant select on table sales.salesorderheader to "tom-manville";
	grant select on table sales.salesorderheadersalesreason to "tom-manville";
	grant select on table sales.salesperson to "tom-manville";
	grant select on table sales.salespersonquotahistory to "tom-manville";
	grant select on table sales.salesreason to "tom-manville";
	grant select on table sales.salestaxrate to "tom-manville";
	grant select on table sales.salesterritory to "tom-manville";
	grant select on table sales.salesterritoryhistory to "tom-manville";
	grant select on table sales.shoppingcartitem to "tom-manville";
	grant select on table sales.specialoffer to "tom-manville";
	grant select on table sales.specialofferproduct to "tom-manville";
	grant select on table sales.store to "tom-manville";
	grant select on table sales.vindividualcustomer to "tom-manville";
	grant select on table sales.vpersondemographics to "tom-manville";
	grant select on table sales.vsalesperson to "tom-manville";
	grant select on table sales.vsalespersonsalesbyfiscalyears to "tom-manville";
	grant select on table sales.vsalespersonsalesbyfiscalyearsdata to "tom-manville";
	grant select on table sales.vstorewithaddresses to "tom-manville";
	grant select on table sales.vstorewithcontacts to "tom-manville";
	grant select on table sales.vstorewithdemographics to "tom-manville";
	alter default privileges in schema sales grant select on tables to "tom-manville";	
	alter default privileges in schema sales grant execute on functions to "tom-manville";
end
$$;
