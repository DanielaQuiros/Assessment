/*******************************************************
** Store procedure to load the client dimension table **
*******************************************************/


create or replace procedure sp_load_client()
returns string
language SQL
as
$$
begin
    insert into Client
    select distinct client_id,
           client_name, 
           client_lastname,
           email
    from unique_transactions;
    return 'SUCCESS';
end;
$$;
