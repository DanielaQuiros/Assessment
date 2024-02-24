/*********************************************
** Stored procedure to load sales fact table **
*********************************************/


create or replace procedure sp_load_sales()
returns string
language SQL
as
$$
begin
    insert into Sales
    select transaction_id,
    quantity_of_items_sold,
    unit_price,
    discount,
    client_id,
    store_id,
    product_id,
    address_id
    from unique_transactions;
    return 'SUCCESS';
end;
$$;
