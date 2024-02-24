/*********************
** Table Structures **
*********************/

--Creation of transactions table (Raw data)
create or replace table Transactions(
  client_id varchar(30),
  client_name varchar(50),
  client_lastname varchar(50),
  email varchar(50),
  store_id varchar(30),
  store_name varchar(50),
  location varchar(50),
  product_id varchar(50),
  product_name varchar(50),
  category varchar(50),
  brand varchar(50),
  address_id varchar(30),
  street varchar(50),
  city varchar(50),
  state varchar(50),
  zip_code varchar(30),
  transaction_id varchar(30),
  quantity_of_items_sold varchar(30),
  unit_price varchar(30),
  discount varchar(30)
);

--Creation of client dimension table 
create table Client(
    client_id integer,
    client_name varchar(50),
    client_lastname varchar(50),
    email varchar(50)
);

--Creation of store dimension table
create table Store(
    store_id integer,
    store_name varchar(50),
    location varchar(50)
);

--Creation of product dimension table
create table Product(
    product_id integer,
    product_name varchar(50),
    category varchar(50),
    brand varchar(50)
);

--Creation of address dimension table
create table Address(
    address_id integer,
    street varchar(50),
    city varchar(50),
    state varchar(50),
    zip_code integer
);

--Creation of sales fact table
create table Sales(
  transaction_id integer,
  quantity_of_items_sold integer,
  unit_price float,
  discount float,
  client_id integer,
  store_id integer,
  product_id integer,
  address_id integer
);
