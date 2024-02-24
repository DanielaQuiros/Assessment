/******************************************************
** Store procedure to load the store dimension table **
******************************************************/


create or replace procedure sp_load_store()
returns string
language SQL
as
$$
begin
    insert into Store
    select distinct store_id,
           store_name,
           location
    from unique_transactions;
    return 'SUCCESS';
end;
$$;
