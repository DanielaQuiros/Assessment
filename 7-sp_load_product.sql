/********************************************************
** Stored procedure to load the product dimension table **
********************************************************/


create or replace procedure sp_load_product()
returns string
language SQL
as
$$
begin

    insert into Product
    select distinct product_id,
           product_name,
           category,
           brand
    from unique_transactions;
    return 'SUCCESS';
end;
$$;
