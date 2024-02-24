/*****************************************
** Store procedure to fill nulll values **
*****************************************/


create or replace procedure sp_fill_null_values()
    returns string
        language SQL
as
$$
begin
  -- Fills the empty client names  
  update unique_transactions 
    set client_name = c.client_name 
    from (
        -- Gets all distinct names of the clients
        select distinct client_name, client_id
        from unique_transactions
        where client_name is not null
    ) as c
    where unique_transactions.client_id = c.client_id and unique_transactions.client_name is null;

    -- Fills the empty store names
    update unique_transactions 
    set store_name = c.store_name
    from (
        -- Gets all distinct names of the stores
        select distinct store_name, store_id
        from unique_transactions
        where store_name is not null
    ) as c
    where unique_transactions.store_id = c.store_id and unique_transactions.store_name is null;

    -- Fills the empty product names
    update unique_transactions 
    set product_name = c.product_name
    from (
        -- Gets all distinct names of products
        select distinct product_name, product_id
        from unique_transactions
        where product_name is not null
    ) as c
    where unique_transactions.product_id = c.product_id and unique_transactions.product_name is null;
    
return 'SUCCESS';
end;
$$;
