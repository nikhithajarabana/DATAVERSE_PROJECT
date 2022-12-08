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
        EXECUTE IMMEDIATE 'drop view stock_update';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view order_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/
BEGIN
        EXECUTE IMMEDIATE 'drop view product_quantity_details';
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
INSERT INTO admin VALUES ('Supplier','Su1DmddDatabase');
INSERT INTO admin VALUES ('Customer','C1DmddDatabase');
INSERT INTO admin VALUES ('Manager','M1DmddDatabase');
INSERT INTO store VALUES (1, 8573353414, 'fenway_store@gmail.com','#1 fenway boston MA 02119', 'Fenway');
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

INSERT INTO product VALUES (product_id.nextval, 'Whole Wheat Bread', 4,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 12 , 'Britania' , 3);
INSERT INTO product VALUES (product_id.nextval, 'Margherita Pizza', 9.99,  to_date('2022-11-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 30 , 'Amys' , 1);
INSERT INTO product VALUES (product_id.nextval, 'Nutella', 6,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 55 , 'Cadbury' , 3);
INSERT INTO product VALUES (product_id.nextval, 'Sonamasoori', 4,  to_date('2021-10-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 100 , 'Royal' , 2);
INSERT INTO product VALUES (product_id.nextval, 
'Chicken', 5,  to_date('2022-11-28', 'yyyy-mm-dd'), to_date('2022-12-02', 'yyyy-mm-dd'), 25 , 'GG' , 4);
INSERT INTO product VALUES (product_id.nextval, 
'Dog Dry Food', 22,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 30 , 'Pedigree' , 9);
INSERT INTO product VALUES (product_id.nextval, 
'Body Lotion', 10,  to_date('2022-09-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 60, 'Aveeno' , 11);
INSERT INTO product VALUES (product_id.nextval,
'Chips', 4,  to_date('2022-12-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 25 , 'Britania' , 5);
INSERT INTO product VALUES (product_id.nextval, 
'Coke', 4,  to_date('2020-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 30 , 'Coco Cola' , 6);
INSERT INTO product VALUES (product_id.nextval, 
'Butter', 4,  to_date('2022-09-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 15 , 'Amul' , 8);
INSERT INTO product VALUES (product_id.nextval, 'Milk Bread', 5,  to_date('2022-10-20', 'yyyy-mm-dd'), to_date('2022-12-22', 'yyyy-mm-dd'), 20 , 'Britania' , 3);
INSERT INTO product VALUES (product_id.nextval, 'Bread Sticks', 4.99,  to_date('2022-11-01', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 25 , 'Kirland' , 1);
INSERT INTO product VALUES (product_id.nextval, 'Chicken Pizza', 13.99,  to_date('2022-12-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 25 , 'Amys' , 1);
INSERT INTO product VALUES (product_id.nextval, 'Brown Rice', 41,  to_date('2021-11-12', 'yyyy-mm-dd'), to_date('2025-12-12', 'yyyy-mm-dd'), 30 , 'Royal' , 2);
INSERT INTO product VALUES (product_id.nextval, 'Basmati Rice', 33,  to_date('2021-10-22', 'yyyy-mm-dd'), to_date('2024-10-12', 'yyyy-mm-dd'), 24 , 'India Gate' , 2);
INSERT INTO product VALUES (product_id.nextval, 'Fish', 11,  to_date('2022-11-20', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 15 , 'Ocean' , 4);
INSERT INTO product VALUES (product_id.nextval, 'Bacon', 8.99,  to_date('2022-11-25', 'yyyy-mm-dd'), to_date('2023-01-25', 'yyyy-mm-dd'), 15 , 'Fresh' , 4);
INSERT INTO product VALUES (product_id.nextval, 'Diet Chips', 9.49,  to_date('2022-10-02', 'yyyy-mm-dd'), to_date('2024-12-22', 'yyyy-mm-dd'), 25 , 'Lays' , 5);
INSERT INTO product VALUES (product_id.nextval, 'Cookies', 4.99,  to_date('2022-12-22', 'yyyy-mm-dd'), to_date('2024-11-02', 'yyyy-mm-dd'), 24 , 'Everyday' , 5);
INSERT INTO product VALUES (product_id.nextval, 'Coke Zero', 3.49,  to_date('2020-10-02', 'yyyy-mm-dd'), to_date('2023-12-18', 'yyyy-mm-dd'), 19 , 'Coco Cola' , 6);
INSERT INTO product VALUES (product_id.nextval, 'Diet Coke', 2.49,  to_date('2020-11-16', 'yyyy-mm-dd'), to_date('2023-12-29', 'yyyy-mm-dd'), 20 , 'Coco Cola' , 6);
INSERT INTO product VALUES (product_id.nextval, 'Bourbon Whiskey', 41,  to_date('2020-11-30', 'yyyy-mm-dd'), to_date('2024-12-22', 'yyyy-mm-dd'), 10 , 'Jim Beam' , 7);
INSERT INTO product VALUES (product_id.nextval, 'Caribbean Rum', 21,  to_date('2020-09-25', 'yyyy-mm-dd'), to_date('2025-02-18', 'yyyy-mm-dd'), 10 , 'Malibu Original' , 7);
INSERT INTO product VALUES (product_id.nextval, 'Vodka', 22.99,  to_date('2020-08-11', 'yyyy-mm-dd'), to_date('2023-06-17', 'yyyy-mm-dd'), 10 , 'Belvedere' , 7);
INSERT INTO product VALUES (product_id.nextval, 'Cheese', 6.67,  to_date('2022-09-19', 'yyyy-mm-dd'), to_date('2023-12-25', 'yyyy-mm-dd'), 10 , 'Amul' , 8);
INSERT INTO product VALUES (product_id.nextval, 'Paneer', 9.89,  to_date('2022-11-22', 'yyyy-mm-dd'), to_date('2023-01-09', 'yyyy-mm-dd'), 15 , 'Jersey' , 8);
INSERT INTO product VALUES (product_id.nextval, 'Cat Dry Food', 25.99,  to_date('2022-09-13', 'yyyy-mm-dd'), to_date('2024-11-12', 'yyyy-mm-dd'), 30 , 'Pedigree' , 9);
INSERT INTO product VALUES (product_id.nextval, 'Dog Wet Food', 23.66,  to_date('2022-11-17', 'yyyy-mm-dd'), to_date('2024-02-11', 'yyyy-mm-dd'), 30 , 'Pedigree' , 9);
INSERT INTO product VALUES (product_id.nextval, 'Sanitary Napkin', 13.66,  to_date('2022-06-11', 'yyyy-mm-dd'), to_date('2025-07-21', 'yyyy-mm-dd'), 30 , 'Stay Free' , 10);
INSERT INTO product VALUES (product_id.nextval, 'Sanitary Pads', 11.55,  to_date('2022-08-21', 'yyyy-mm-dd'), to_date('2026-08-22', 'yyyy-mm-dd'), 30 , 'Always' , 10);
INSERT INTO product VALUES (product_id.nextval, 'Tampons', 16.55,  to_date('2022-10-22', 'yyyy-mm-dd'), to_date('2025-08-28', 'yyyy-mm-dd'), 30 , 'Always' , 10);
INSERT INTO product VALUES (product_id.nextval, 'Hand Lotion', 15.88,  to_date('2022-11-22', 'yyyy-mm-dd'), to_date('2024-11-25', 'yyyy-mm-dd'), 25 , 'Cetaphil' , 11);
INSERT INTO product VALUES (product_id.nextval, 'Moisturizer', 10.55,  to_date('2022-10-30', 'yyyy-mm-dd'), to_date('2024-12-22', 'yyyy-mm-dd'), 25 , 'Cetaphil' , 11);
CREATE SEQUENCE stock_id
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 1, 1);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 1, 2);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 100, to_date('2022-11-16', 'yyyy-mm-dd'), 1,2, 3);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 50, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 1, 4);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 25, to_date('2022-12-15', 'yyyy-mm-dd'), 1, 2, 5);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 35, to_date('2022-12-01', 'yyyy-mm-dd'), 1, 1, 6);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 12, to_date('2022-12-06', 'yyyy-mm-dd'), 1, 10, 7);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-12-15', 'yyyy-mm-dd'), 1, 8, 8);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 15, to_date('2022-11-15', 'yyyy-mm-dd'), 1, 4, 9);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 34, to_date('2022-12-15', 'yyyy-mm-dd'), 1, 7, 10);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-01', 'yyyy-mm-dd'), 1, 1, 11);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 25, to_date('2022-11-02', 'yyyy-mm-dd'), 1, 2, 12);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-03', 'yyyy-mm-dd'), 1, 3, 12);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-11-04', 'yyyy-mm-dd'), 1, 4, 13);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 50, to_date('2022-11-05', 'yyyy-mm-dd'), 1, 5, 14);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-11-06', 'yyyy-mm-dd'), 1, 6, 15);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-07', 'yyyy-mm-dd'), 1, 7, 16);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 20, to_date('2022-11-08', 'yyyy-mm-dd'), 1, 8, 17);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-09', 'yyyy-mm-dd'), 1, 9, 18);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 15, to_date('2022-11-10', 'yyyy-mm-dd'), 1, 10, 19);

INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-11', 'yyyy-mm-dd'), 1, 1, 20);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 20, to_date('2022-11-12', 'yyyy-mm-dd'), 1, 2, 21);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-13', 'yyyy-mm-dd'), 1, 3, 22);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-11-14', 'yyyy-mm-dd'), 1, 4, 23);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 50, to_date('2022-11-15', 'yyyy-mm-dd'), 1, 5, 24);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 6, 25);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-17', 'yyyy-mm-dd'), 1, 7, 26);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 20, to_date('2022-11-18', 'yyyy-mm-dd'), 1, 8, 27);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-19', 'yyyy-mm-dd'), 1, 9, 28);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 15, to_date('2022-11-20', 'yyyy-mm-dd'), 1, 10, 29);

INSERT INTO Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-20', 'yyyy-mm-dd'), 1, 1, 30);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 20, to_date('2022-11-21', 'yyyy-mm-dd'), 1, 2, 31);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-22', 'yyyy-mm-dd'), 1, 3, 32);
INSERT INTO Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-11-23', 'yyyy-mm-dd'), 1, 4, 33);

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
INSERT INTO CUSTOMER VALUES(21,'Abhishek', '#123 roxbury boston MA',8573343419);
INSERT INTO CUSTOMER VALUES(22,'Amith', '#233 fenway boston MA',8573343420);
INSERT INTO CUSTOMER VALUES(23,'Adithi', '#232 cambridge boston MA',8573343421);
INSERT INTO CUSTOMER VALUES(24,'Deeksha', '#12 riverway boston MA',8573343422);
INSERT INTO CUSTOMER VALUES(25,'Deepak', '#456 alphonous boston MA',8573343423);
INSERT INTO CUSTOMER VALUES(26,'Fizal', '#478 south end boston MA',8573343424);
INSERT INTO CUSTOMER VALUES(27,'Harshitha', '#865 fenway boston MA',8573343425);
INSERT INTO CUSTOMER VALUES(28,'Mahima', '#246 roxbury boston MA',8573343426);
INSERT INTO CUSTOMER VALUES(29,'Lohith', '#213 cambridge boston MA',8573343427);
INSERT INTO CUSTOMER VALUES(30,'Nireeksha', '#98 riverway boston MA',8573343428);
INSERT INTO CUSTOMER VALUES(31,'Sameeksha', '#77 alphonous boston MA',8573343429);
INSERT INTO CUSTOMER VALUES(32,'Suraj', '#313 fenway boston MA',8573343430);
INSERT INTO CUSTOMER VALUES(33,'Uma', '#653 roxbury boston MA',8573343431);
CREATE SEQUENCE ORDER_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-01', 'yyyy-mm-dd'), 1);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-02', 'yyyy-mm-dd'), 2);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-05', 'yyyy-mm-dd'), 3);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-07', 'yyyy-mm-dd'), 4);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-09', 'yyyy-mm-dd'), 5);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-10', 'yyyy-mm-dd'), 6);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-11', 'yyyy-mm-dd'), 7);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-15', 'yyyy-mm-dd'), 8);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-16', 'yyyy-mm-dd'), 9);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-20', 'yyyy-mm-dd'), 10);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-03','yyyy-mm-dd'),11);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-04','yyyy-mm-dd'),12);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-06','yyyy-mm-dd'),13);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-08','yyyy-mm-dd'),14);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-12','yyyy-mm-dd'),15);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-13','yyyy-mm-dd'),16);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-14','yyyy-mm-dd'),17);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-17','yyyy-mm-dd'),18);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-21','yyyy-mm-dd'),19);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-23','yyyy-mm-dd'),20);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-26','yyyy-mm-dd'),21);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-30','yyyy-mm-dd'),22);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-18','yyyy-mm-dd'),23);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-27','yyyy-mm-dd'),24);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-27','yyyy-mm-dd'),25);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-12-02','yyyy-mm-dd'),26);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-12-05','yyyy-mm-dd'),27);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-12-08','yyyy-mm-dd'),28);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-12-10','yyyy-mm-dd'),29);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-12-14','yyyy-mm-dd'),30);
INSERT INTO ORDERS VALUES (ORDER_ID.NEXTVAL, to_date('2022-12-14','yyyy-mm-dd'),31);

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
INSERT INTO ORDERLIST VALUES (11,11,12,12);
INSERT INTO ORDERLIST VALUES (12,12,15,22);
INSERT INTO ORDERLIST VALUES (13,13,17,17);
INSERT INTO ORDERLIST VALUES (14,14,16,15);
INSERT INTO ORDERLIST VALUES (15,15,5,14);
INSERT INTO ORDERLIST VALUES (16,16,10,10);
INSERT INTO ORDERLIST VALUES (17,17,12,8);
INSERT INTO ORDERLIST VALUES (18,18,8,13);
INSERT INTO ORDERLIST VALUES (19,19,19,16);
INSERT INTO ORDERLIST VALUES (20,20,10,19);
INSERT INTO ORDERLIST VALUES (21,21,14,6);
INSERT INTO ORDERLIST VALUES (22,22,20,3);
INSERT INTO ORDERLIST VALUES (23,23,13,11);
INSERT INTO ORDERLIST VALUES (24,24,11,14);


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
  INSERT INTO DELIVERY VALUES (11, to_date('2022-11-01', 'yyyy-mm-dd'), 11);
INSERT INTO DELIVERY VALUES (12, to_date('2022-11-02', 'yyyy-mm-dd'), 12);
INSERT INTO DELIVERY VALUES (13, to_date('2022-11-03', 'yyyy-mm-dd'), 13);
INSERT INTO DELIVERY VALUES (14, to_date('2022-11-04', 'yyyy-mm-dd'), 14);
INSERT INTO DELIVERY VALUES (15, to_date('2022-11-05', 'yyyy-mm-dd'), 15);
INSERT INTO DELIVERY VALUES (16, to_date('2022-11-06', 'yyyy-mm-dd'), 16);
INSERT INTO DELIVERY VALUES (17, to_date('2022-11-07', 'yyyy-mm-dd'), 17);
INSERT INTO DELIVERY VALUES (18, to_date('2022-11-08', 'yyyy-mm-dd'), 18);
INSERT INTO DELIVERY VALUES (19, to_date('2022-11-09', 'yyyy-mm-dd'), 19);
INSERT INTO DELIVERY VALUES (20, to_date('2022-11-10', 'yyyy-mm-dd'), 20);

INSERT INTO DELIVERY VALUES (21, to_date('2022-11-11', 'yyyy-mm-dd'), 21);
INSERT INTO DELIVERY VALUES (22, to_date('2022-11-12', 'yyyy-mm-dd'), 22);
INSERT INTO DELIVERY VALUES (23, to_date('2022-11-13', 'yyyy-mm-dd'), 23);
INSERT INTO DELIVERY VALUES (24, to_date('2022-11-14', 'yyyy-mm-dd'), 24);
INSERT INTO DELIVERY VALUES (25, to_date('2022-11-15', 'yyyy-mm-dd'), 25);
INSERT INTO DELIVERY VALUES (26, to_date('2022-11-16', 'yyyy-mm-dd'), 26);
INSERT INTO DELIVERY VALUES (27, to_date('2022-11-17', 'yyyy-mm-dd'), 27);
INSERT INTO DELIVERY VALUES (28, to_date('2022-11-18', 'yyyy-mm-dd'), 28);
INSERT INTO DELIVERY VALUES (29, to_date('2022-11-19', 'yyyy-mm-dd'), 29);
INSERT INTO DELIVERY VALUES (30, to_date('2022-11-20', 'yyyy-mm-dd'), 30);
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

Create view stock_update as 
select p.Product_Id, p.Product_Name,p.Available_quantity,ps.Supplied_Quantity 
From Product p Inner Join Product_Stock ps On p.Product_Id = ps.Product_Id;
create view order_details as 
select o.order_id,ol.product_id,ol.quantity from orders o inner join orderlist ol on o.order_id = ol.order_id;

create view product_quantity_details as
select p.product_id,p.product_name, p.available_quantity, ps.supplied_quantity, ol.quantity as customer_ordered_quantity from product p inner join product_stock ps on p.product_id = ps.product_id 
inner join orderlist ol on ps.product_id = ol.product_id; 

grant select on order_details to sahithi,nikhitha,rithvik,anouksha,manager;
grant select on product_quantity_details to sahithi,nikhitha,rithvik,anouksha,manager;
grant select on supplier_product_details to nikhitha,sahithi,rithvik,manager,supplier;
grant select on total_productstock_quantity to rithvik,sahithi,nikhitha,manager;
grant select on Product_Category to rithvik,sahithi,nikhitha,manager;
grant select on Customer_Order_details to rithvik,sahithi,nikhitha,manager,customer;
grant select on stock_update  to rithvik,sahithi,nikhitha,manager;
commit;
CREATE OR REPLACE PROCEDURE Add_category(
	   Category_Id IN Category.Category_Id%TYPE,
	   Category_Name IN Category.Category_Name%TYPE,
	   Cat_Description IN Category.Category_Description%TYPE)
IS
BEGIN

  INSERT INTO anouksha.category (Category_Id,Category_Name,Category_Description)
  VALUES (Category_Id, Category_Name,Cat_Description);
  COMMIT;

END;
/

Exec Add_Category(13,'Hair Products','Hair Care');
grant execute on add_category to sahithi,rithvik,anouksha;



CREATE OR REPLACE PROCEDURE Add_Customer(
	   Cust_Id IN Customer.Customer_Id%TYPE,
	   Cust_Name IN Customer.Customer_Name%TYPE,
	   Address IN Customer.Address%TYPE,
       Cont_Num IN Customer.Contact_Number%TYPE)
IS
BEGIN

  INSERT INTO anouksha.Customer (Customer_Id,Customer_Name,Address,Contact_Number)
  VALUES (Cust_Id, Cust_Name,Address,Cont_Num);
  COMMIT;

END;
/
exec add_customer(453,'Nikhitha','Fenway street Boston MA',3452341238);
grant execute on add_Customer to sahithi,rithvik,anouksha;
select * from anouksha.product;


CREATE OR REPLACE PROCEDURE Add_Product(
	   Pro_Id IN Product.Product_Id%TYPE,
	   Pro_Name IN Product.Product_Name%TYPE,
	   Price IN Product.Product_Price%TYPE,
       Manu_Date IN Product.Manufacture_Date%TYPE,
       Exp_Date IN Product.Expiry_Date%TYPE,
       Avail_Quant IN Product.Available_Quantity%TYPE,
       Brand IN Product.Brand_Name%TYPE,
       Cat_Id IN Product.Category_Id%TYPE)
IS
BEGIN

  INSERT INTO anouksha.Product (Product_Id,Product_Name,Product_Price,Manufacture_Date,Expiry_Date,Available_Quantity,Brand_Name,Category_Id)
  VALUES (Pro_Id,Pro_Name,Price,Manu_Date,Exp_Date,Avail_Quant,Brand,Cat_Id);
  COMMIT;

END;
/

EXEC add_product(123,'Shampoo',12,to_date('2022-12-12','yyyy-mm-dd'),to_date('2025-12-12','yyyy-mm-dd'),34,'Head and shoulders',13);
grant execute on add_product to sahithi,rithvik,anouksha;
create or replace procedure LOWSTOCK is


Product_ID number(38);
Product_Name varchar2(20);
Product_Price number(38);
available_quantity number(38);
brand_name varchar2(20);
cursor nextItem is
select product.Product_ID, Product.Product_Name,Product.Available_Quantity, Product.Brand_Name
from anouksha.product
where Product.available_quantity < 5;
 
begin
open nextItem;
fetch nextItem into Product_ID, Product_Name, Available_Quantity, Brand_Name;
if nextItem%notfound then
dbms_output.put_line('No items in need of reordering.');
else
dbms_output.put_line('*********************');
dbms_output.put_line('++Inventory Report++');
dbms_output.put_line('*********************');
dbms_output.put_line('Product ID-Product Name--Quantity--Brand Name');
loop
dbms_output.put_line(Product_ID||'---'||Product_Name||'----'||Available_Quantity||'---'||Brand_Name);
fetch nextItem into Product_ID, Product_Name, Available_Quantity, Brand_Name;
if nextItem%notfound then
dbms_output.put_line('************END REPORT*************');
exit when nextItem%notfound;
end if;
end loop;
end if;
 
end LOWSTOCK;
/
SET SERVEROUTPUT ON;
EXEC LOWSTOCK;
grant execute on LOWSTOCK to sahithi,nikhitha,rithvik,anouksha;

CREATE OR REPLACE FUNCTION CustomerReturn(Cust_Name IN Varchar2) RETURN Number IS 
    c_id number(10);
BEGIN 
 select Customer_ID into c_id FROM anouksha.customer WHERE Customer_Name= Cust_Name;
  return c_id;
END;
/

select CustomerReturn('Priya') from dual;


CREATE OR REPLACE FUNCTION ProductReturn(Pro_Name IN varchar2) RETURN NUMBER IS 
    p_id number(10);
BEGIN 
 select Product_ID into p_id FROM product WHERE Product_Name= Pro_Name;
  return p_id;
END;
/

select ProductReturn('Whole Wheat Bread') from dual;
commit;
grant execute on productreturn to nikhitha,sahithi,rithvik;
grant execute on customerreturn to nikhitha,sahithi,rithvik;
commit;



create or replace package InventoryPackage
AS 
procedure Add_Customer(Customer_Id Number,Customer_Name varchar2,Address varchar2,Contact_Number number);
procedure Add_Product(Product_Id Number,Product_Name varchar2,Product_Price number,Manufacture_Date date,Expiry_Date date,Available_Quantity number,Brand_Name varchar2,Category_Id number);
procedure Add_Category(Category_Id Number,Category_Name Varchar2,Category_Description Varchar2);
procedure LOWSTOCK(Product_ID varchar2, Product_Name varchar2, Available_Quantity number, Brand_Name varchar2);
END;
/




COMMIT;
GRANT SELECT ON ANOUKSHA.ADMIN TO MANAGER;
GRANT ALL ON ANOUKSHA.CATEGORY TO MANAGER;
GRANT ALL ON ANOUKSHA.CUSTOMER TO MANAGER;
GRANT SELECT ON ANOUKSHA.DELIVERY TO MANAGER;
GRANT ALL ON ANOUKSHA.ORDERLIST TO MANAGER;
GRANT ALL ON ANOUKSHA.PRODUCT TO MANAGER;
GRANT SELECT ON ANOUKSHA.PRODUCT_STOCK TO MANAGER;
GRANT ALL ON ANOUKSHA.STORE TO MANAGER;
GRANT ALL ON ANOUKSHA.SUPPLIER TO MANAGER;
GRANT SELECT ON ANOUKSHA.ORDERS TO MANAGER;
commit;
GRANT SELECT ON ANOUKSHA.ORDERS TO CUSTOMER;
GRANT SELECT ON ANOUKSHA.PRODUCT TO CUSTOMER;


COMMIT;
grant select on category to customer;



GRANT SELECT ON  ANOUKSHA.ORDERLIST  TO  Supplier;
GRANT SELECT, INSERT, UPDATE ON ANOUKSHA.DELIVERY TO SUPPLIER;
commit;


