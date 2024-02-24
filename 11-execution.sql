/**************************************
** Main execution for the procedures **
**************************************/


--Data cleansing procedures

call sp_deleteduplicates();
call sp_fill_null_values();
call sp_clean_data();

--Dimension tables load

call sp_load_client();
call sp_load_product();
call sp_load_address();
call sp_load_store();

--Fact table load

call sp_load_sales();
