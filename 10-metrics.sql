/**************************
** Metrics from the data **
**************************/

--Sales per store
select store_name, 
       sum(unit_price) 
from sales s
join store t
on s.store_id = t.store_id
group by store_name;

--Quantity of products sold
select product_name,
       brand,
       category,
       sum(quantity_of_items_sold),
from sales s
join product p
on s.product_id = p.product_id
group by product_name,brand,category;

--Items bought per client
select client_name,
    client_lastname,
    email,
    sum(quantity_of_items_sold)
from sales s
join client c
on s.client_id = c.client_id
group by client_name,client_lastname,email;

--Revenue per city
select city,
       sum(unit_price)
from sales s
join address a 
on s.address_id = a.address_id
group by city;

