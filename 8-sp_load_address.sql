/********************************************************
** Stored procedure to load the address dimension table **
********************************************************/


create or replace procedure sp_load_address()
returns string
language SQL
as
$$
begin
insert into Address
select distinct address_id,
       street,
       city,
       state,
       zip_code
from unique_transactions;
return 'SUCCESS';
end;
$$;
