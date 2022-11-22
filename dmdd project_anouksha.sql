create table admin (username varchar(20) primary key, password varchar(30));

create table store (store_id INT primary key, store_contactnumber INT, store_email varchar(30), store_address varchar(30), store_location varchar(100) );

create table supplier (supplier_id int primary key, supplier_name varchar(20), supplier_contactnumber int, supplier_address varchar(30), supplier_email varchar(20));

create table category (category_id int primary key, category_name varchar(20), category_description varchar(100));

create table product (product_id int primary key, product_name varchar(20), product_price int, manufacture_date DATE, expiry_date DATE,  available_quantity int, brand_name varchar(20), category_id int,
CONSTRAINT FK_product_category foreign key(category_id) references category(category_id));

create table product_stock (stock_id int primary key, supplied_quantity int, date_of_stock Date, store_id int,  supplier_id int, product_id int,  CONSTRAINT FK_productstock_store foreign key(store_id) references Store(store_id),  
CONSTRAINT FK_productstock_supplier foreign key(supplier_id) references supplier(supplier_id), CONSTRAINT FK_productstock_product  foreign key(product_id) references product(product_id));

create table customer (customer_id int primary key, customer_name varchar(20), address varchar(100), contact_number int);

create table orders (order_id INT primary key, order_date Date, customer_id int,CONSTRAINT FK_order_customer foreign key(customer_id) references customer(customer_id));

create table orderList (orderList_id int primary key, order_id int, product_id int, quantity int, CONSTRAINT FK_orderlist_order foreign key(order_id) 
references orders(order_id),CONSTRAINT FK_orderlist_product foreign key(product_id) references product(product_id));

create table delivery (delivery_id int primary key, delivery_date DATE, order_id int, CONSTRAINT FK_delivery_order foreign key(order_id) references orders(order_id));

commit;