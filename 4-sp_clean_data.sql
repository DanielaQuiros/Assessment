/**********************************************************
** Stored procedure to clean data from invalid characters **
**********************************************************/


create or replace procedure sp_clean_data()
returns string
language SQL
as
$$
begin
    update unique_transactions
    -- Replaces special characters
    set client_name = translate(client_name,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        client_lastname = translate(client_lastname,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        store_name = translate(store_name,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        location = translate(location,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        product_name = translate(product_name,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        category = translate(category,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        brand = translate(brand,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        street = translate(street,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        city = translate(city,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu'),
        state = translate(state,'ÑñÁáÉéÍíÓóÚú','NnAaEeIiOoUu');
return 'SUCCESS';
end;
$$;
