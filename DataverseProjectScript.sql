begin
        EXECUTE IMMEDIATE 'drop table orderlist';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table delivery';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table orders';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table customer';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table product_stock';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table product';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table category';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table supplier';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table store';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

BEGIN
        EXECUTE IMMEDIATE 'drop table admin';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/
BEGIN
        EXECUTE IMMEDIATE 'drop sequence category_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence order_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence stock_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/
BEGIN
        EXECUTE IMMEDIATE 'drop sequence product_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/




BEGIN
        EXECUTE IMMEDIATE 'drop view supplier_product_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view total_productstock_quantity';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view product_category';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view customer_order_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view supplier_store_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/
BEGIN
        EXECUTE IMMEDIATE 'drop view stock_update';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/
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

grant all on admin to sahithi,nikhitha, rithvik;
grant all on category to sahithi,nikhitha, rithvik;
grant all on customer to sahithi,nikhitha, rithvik;
grant all on delivery to sahithi,nikhitha, rithvik;
grant all on orderlist to sahithi,nikhitha, rithvik;
grant all on orders to sahithi,nikhitha, rithvik;
grant all on product to sahithi,nikhitha, rithvik;
grant all on product_stock to sahithi,nikhitha, rithvik;
grant all on store to sahithi,nikhitha, rithvik;
grant all on supplier to sahithi,nikhitha, rithvik;
CREATE OR REPLACE TRIGGER stock_trigger
 AFTER INSERT OR UPDATE ON product_stock 
 FOR EACH ROW
 BEGIN
   UPDATE product SET available_quantity = (available_quantity + :new.supplied_quantity) WHERE product_id = :new.product_id;          
 END;
/

CREATE OR REPLACE TRIGGER order_trigger
 AFTER INSERT OR UPDATE ON orderlist
 FOR EACH ROW
 BEGIN
   UPDATE product SET available_quantity = (available_quantity - :new.quantity) WHERE product_id = :new.product_id;          
 END;
/

CREATE INDEX product_stock_index ON product_stock (product_id);
INSERT INTO admin VALUES ('Admin','Nkp3324database');
INSERT INTO admin VALUES ('Sahithi','S1DmddDatabase');
INSERT INTO admin VALUES ('Nikhitha','N1DmddDatabase');
INSERT INTO admin VALUES ('Rithvik','R1DmddDatabase');
INSERT INTO admin VALUES ('Anouksha','A1DmddDatabase');
INSERT INTO admin VALUES ('Supplier','S1DmddDatabase');
INSERT INTO admin VALUES ('Customer','C1DmddDatabase');
INSERT INTO admin VALUES ('Manager','M1DmddDatabase');
INSERT INTO store VALUES (1, 8573353414, 'fenway_store@gmail.com','#1 fenway boston MA 02119', 'Fenway');
INSERT INTO store VALUES (2, 8573353415, 'roxbury_store@gmail.com','22 roxbury boston MA 03119', 'Roxbury');
INSERT INTO store VALUES (3, 8573353416, 'south_end_store@gmail.com','#34 south end boston MA 04119', 'South End');
INSERT INTO Store VALUES (4, 8573353417, 'riverway_store@gmail.com', '#888 riverway boston MA 05119' ,'Riverway');
INSERT INTO Store VALUES (5, 8573353418, 'cambridge_store@gmail.com', '#616 cambridge boston MA 06119' ,'Cambridge');
INSERT INTO Store VALUES (6, 8573353419, 'longwood_store@gmail.com', '#777 longwood boston MA 07119' ,'Longwood');
INSERT INTO supplier VALUES (1, 'PATEL', 1357924680, 'Fenway', 'patel@gmail.com');
INSERT INTO supplier VALUES (2, 'John', 2468013579, 'Roxbury', 'john@gmail.com');
INSERT INTO supplier VALUES (3, 'richard', 1122334455, 'Cambridge', 'richard@gmail.com');
INSERT INTO supplier VALUES (4, 'kalyan', 1235478962, 'Allston', 'kalyan@gmail.com');
INSERT INTO supplier VALUES (5, 'Aaren', 1122674355, 'Dedham', 'aaren@gmail.com');
INSERT INTO supplier VALUES (6, 'Catherine', 1897604320, 'Nedham', 'catherine@gmail.com');
INSERT INTO supplier VALUES (7, 'Lakshman', 1129044455, 'Waltham', 'lakshman@gmail.com');
INSERT INTO supplier VALUES (8, 'Sia', 1122906545, 'Everett', 'sia@gmail.com');
INSERT INTO supplier VALUES (9, 'Reena', 1122434905, 'Oak Grove', 'reena@gmail.com');
INSERT INTO supplier VALUES (10, 'Mike', 1122336895, 'Forest Hills', 'mike@gmail.com');
CREATE SEQUENCE category_id
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;
INSERT INTO category VALUES (category_id.nextval, 'Frozen Food', 'Frozen Food: Halfed cooked');
INSERT INTO category VALUES (category_id.nextval, 'Rice', 'White rice, Basmati rice, Brown rice');
INSERT INTO category VALUES (category_id.nextval, 'Breakfast', 'Bread, Cereals');
INSERT INTO category VALUES (category_id.nextval, 'Meat', 'Chicken, Fish, Beef, Pork, Turkey');
INSERT INTO category VALUES (category_id.nextval, 'Snacks', 'Chips, Biscuits, Chocolates');
INSERT INTO category VALUES (category_id.nextval, 'Beverages', 'Sodas, Sparkling water, flavoured water, vitamin water');
INSERT INTO category VALUES (category_id.nextval, 'Liqour', 'Whiskey, Gin, Rum, Vodka, Cocktails,Wine, Champagne');
INSERT INTO category VALUES (category_id.nextval, 'Dairy', 'Milk, Paneer, cheese, butter, yogurt');
INSERT INTO category VALUES (category_id.nextval, 'Pet food', 'Dog, cat, fish');
INSERT INTO category VALUES (category_id.nextval, 'Sanitary Products', 'Napkins, Tampons');
INSERT INTO category VALUES (category_id.nextval, 'Beauty', 'Lip care, Body care, Fragrance');
CREATE SEQUENCE product_id
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

INSERT INTO product VALUES (product_id.nextval, 'Whole Wheat Bread', 4,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 0 , 'Britania' , 3);
INSERT INTO product VALUES (product_id.nextval, 'Margherita Pizza', 9.99,  to_date('2022-11-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 0 , 'Amys' , 1);
INSERT INTO product VALUES (product_id.nextval, 'Nutella', 6,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 0 , 'Cadbury' , 3);
INSERT INTO product VALUES (product_id.nextval, 'Sonamasoori', 4,  to_date('2021-10-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 0 , 'Royal' , 2);
INSERT INTO product VALUES (product_id.nextval, 
'Chicken', 5,  to_date('2022-11-28', 'yyyy-mm-dd'), to_date('2022-12-02', 'yyyy-mm-dd'), 150 , 'GG' , 4);
INSERT INTO product VALUES (product_id.nextval, 
'Dog Dry Food', 22,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 20 , 'Pedigree' , 9);
INSERT INTO product VALUES (product_id.nextval, 
'Body Lotion', 10,  to_date('2022-09-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 90 , 'Aveeno' , 11);
INSERT INTO product VALUES (product_id.nextval,
'Chips', 4,  to_date('2022-12-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 75 , 'Britania' , 5);
INSERT INTO product VALUES (product_id.nextval, 
'Coke', 4,  to_date('2020-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 57 , 'Coco Cola' , 6);
INSERT INTO product VALUES (product_id.nextval, 
'Butter', 4,  to_date('2022-09-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 30 , 'Amul' , 8);
CREATE SEQUENCE stock_id
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 1, 1);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-16', 'yyyy-mm-dd'), 2, 1, 2);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 100, to_date('2022-11-16', 'yyyy-mm-dd'), 1,2, 3);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 50, to_date('2022-11-16', 'yyyy-mm-dd'), 2, 1, 4);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 25, to_date('2022-12-15', 'yyyy-mm-dd'), 2, 2, 5);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 35, to_date('2022-12-01', 'yyyy-mm-dd'), 2, 1, 6);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 12, to_date('2022-12-06', 'yyyy-mm-dd'), 3, 10, 7);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-12-15', 'yyyy-mm-dd'), 3, 8, 8);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 15, to_date('2022-11-15', 'yyyy-mm-dd'), 4, 4, 9);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 34, to_date('2022-12-15', 'yyyy-mm-dd'), 4, 7, 10);
INSERT INTO CUSTOMER VALUES (1, 'Sai', '#1 roxbury boston MA' , 8574454512);
INSERT INTO CUSTOMER VALUES (2, 'Ram', '#2 fenway boston MA' , 8574454513);
INSERT INTO CUSTOMER VALUES (3, 'Akhil', '#3 riverway boston MA' , 8574454514);
INSERT INTO CUSTOMER VALUES (4, 'Arya', '#4 cambridge boston MA' , 8574454515);
INSERT INTO CUSTOMER VALUES (5, 'Tilak', '#5 south end boston MA' , 8574454516);
INSERT INTO customer VALUES (6, 'Sitaram', '#8 riverway boston MA ' ,'8574454517');
INSERT INTO customer VALUES (7, 'Santosh', '#6 fenway boston MA ' ,'8574454518');
INSERT INTO customer VALUES (8, 'Rithvik', '#4 roxbury boston MA ' ,'8574454519');
INSERT INTO customer VALUES (9, 'Priya', '#6 south-end boston MA' ,'8574454520');
INSERT INTO customer VALUES (10, 'Manavi', '#7 cambridge boston MA ' ,'8574454521');
INSERT INTO customer VALUES (11, 'Vamsi', '#88 riverway boston MA ' ,'8574454522');
INSERT INTO customer VALUES (12, 'Balaji', '#66 fenway boston MA ' ,'8574454523');
INSERT INTO customer VALUES (13, 'Sandeep', '#44 roxbury boston MA ' ,'8574454524');
INSERT INTO customer VALUES (14, 'Naman', '#66 south-end boston MA' ,'8574454525');
INSERT INTO customer VALUES (15, 'Bipin', '#77 cambridge boston MA' ,'8574454526');
INSERT INTO customer VALUES (16, 'Rahul', '#81 riverway boston MA ' ,'8574454527');
INSERT INTO customer VALUES (17, 'Anish', '#61 fenway boston MA ' ,'8574454528');
INSERT INTO customer VALUES (18, 'Venky', '#41 roxbury boston MA ' ,'8574454529');
INSERT INTO customer VALUES (19, 'Monish', '#61 south-end boston MA' ,'8574454530');
INSERT INTO customer VALUES (20, 'Sita', '#71 cambridge boston MA' ,'8574454531');
CREATE SEQUENCE ORDER_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-01', 'yyyy-mm-dd'), 1);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-02', 'yyyy-mm-dd'), 2);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-05', 'yyyy-mm-dd'), 1);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-07', 'yyyy-mm-dd'), 3);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-09', 'yyyy-mm-dd'), 4);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-10', 'yyyy-mm-dd'), 2);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-11', 'yyyy-mm-dd'), 5);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-15', 'yyyy-mm-dd'), 4);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-16', 'yyyy-mm-dd'), 3);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-20', 'yyyy-mm-dd'), 5);

INSERT INTO ORDERLIST VALUES (1, 1, 1, 3);
INSERT INTO ORDERLIST VALUES (2, 2, 3, 2);
INSERT INTO ORDERLIST VALUES (3, 3, 1, 7);
INSERT INTO ORDERLIST VALUES (4,4,8,5);
INSERT INTO ORDERLIST VALUES (5,5,4,6);
INSERT INTO ORDERLIST VALUES (6,6,2,10);
INSERT INTO ORDERLIST VALUES (7,7,5,4);
INSERT INTO ORDERLIST VALUES (8,8,4,5);
INSERT INTO ORDERLIST VALUES (9,9,9,6);
INSERT INTO ORDERLIST VALUES (10,10,7,8);

INSERT INTO DELIVERY VALUES (1, to_date('2022-11-1', 'yyyy-mm-dd'), 1);
INSERT INTO DELIVERY VALUES (2, to_date('2022-11-3', 'yyyy-mm-dd'), 2);
  INSERT INTO DELIVERY VALUES (3, to_date('2022-11-5', 'yyyy-mm-dd'), 3);
  INSERT INTO DELIVERY VALUES (4, to_date('2022-11-6', 'yyyy-mm-dd'), 4);
  INSERT INTO DELIVERY VALUES (5, to_date('2022-11-13', 'yyyy-mm-dd'), 5);
  INSERT INTO DELIVERY VALUES (6, to_date('2022-11-14', 'yyyy-mm-dd'), 6);
  INSERT INTO DELIVERY VALUES (7, to_date('2022-11-15', 'yyyy-mm-dd'), 7);
  INSERT INTO DELIVERY VALUES (8, to_date('2022-11-15', 'yyyy-mm-dd'), 8);
  INSERT INTO DELIVERY VALUES (9, to_date('2022-11-15', 'yyyy-mm-dd'), 9);
  INSERT INTO DELIVERY VALUES (10, to_date('2022-11-16', 'yyyy-mm-dd'), 10);
  CREATE VIEW Supplier_Product_details AS 
SELECT s.Supplier_Name, s.Supplier_ContactNumber, s.Supplier_Address, s.Supplier_email, p.Product_Name, p.Product_Price 
FROM Product p INNER JOIN Product_Stock ps ON ps.Product_ID = p.Product_ID INNER JOIN Supplier s ON s.Supplier_ID = ps.Supplier_ID;
CREATE VIEW total_productstock_quantity AS 
SELECT p.Product_Name, p.Product_Price, p.Manufacture_Date, p.Expiry_Date, 
p.Available_Quantity, ps.Supplied_Quantity FROM Product p INNER JOIN  Product_Stock ps ON p.Product_ID = ps.Product_ID;
CREATE VIEW Product_Category AS 
SELECT p.Product_Name, p.Product_Price, p.Manufacture_Date, p.Expiry_Date ,
c.Category_Name, c.Category_Description FROM Product p INNER JOIN  Category c ON p.Category_ID = c.Category_ID;
CREATE VIEW Customer_Order_details AS 
SELECT c.Customer_Name, o.Order_Date, o.Order_ID, ol.Product_ID, ol.quantity 
FROM customer c INNER JOIN Orders o ON c.Customer_ID = o.Customer_ID INNER JOIN orderlist ol ON o.Order_ID = ol.Order_ID;
CREATE VIEW Supplier_Store_details AS 
SELECT s.Supplier_Name, s.Supplier_ContactNumber, s.Supplier_Address, s.Supplier_email, st.Store_ContactNumber, 
st.Store_Email FROM Store st, Supplier s, Product_Stock ps WHERE (ps.Store_ID = st.Store_ID) 
AND (ps.Supplier_ID = s.Supplier_ID);
Create view stock_update as 
select p.Product_Id, p.Product_Name,p.Available_quantity,ps.Supplied_Quantity 
From Product p Inner Join Product_Stock ps On p.Product_Id = ps.Product_Id;
grant select on supplier_product_details to nikhitha,sahithi,rithvik,manager;
grant select on total_productstock_quantity to rithvik,sahithi,nikhitha,manager;
grant select on Product_Category to rithvik,sahithi,nikhitha,manager;
grant select on Customer_Order_details to rithvik,sahithi,nikhitha,manager;
grant select on Supplier_Store_details  to rithvik,sahithi,nikhitha,manager;
grant select on stock_update  to rithvik,sahithi,nikhitha,manager;
commit;



