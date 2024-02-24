/******************************************
** Stored procedure to delete duplicates **
******************************************/


create or replace procedure sp_delete_duplicates()
    returns string
    language SQL
as
$$
begin
    --Inserting unique results in a staging table
    create or replace table unique_transactions as 
    select * from (
        select *,
        row_number() over(partition by client_id,
                                       client_name,
                                       client_lastname, 
                                       email,
                                       store_id,
                                       store_name,
                                       location,
                                       product_id,
                                       product_name,
                                       category,
                                       brand,
                                       address_id,
                                       street,
                                       city,
                                       state,
                                       zip_code,
                                       transaction_id,
                                       quantity_of_items_sold,
                                       unit_price,
                                       discount
        order by client_id) as rn
        from transactions
    )
    where rn = 1; -- Filter first occurrence of each record
    return 'Success';
end;
$$;
