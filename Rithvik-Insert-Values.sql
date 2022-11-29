select * from all_tables where owner ='ANOUKSHA';

SELECT * FROM ANOUKSHA.STORE;

UPDATE anouksha.store set  store_contactnumber = '8573353414' WHERE store_id = '1';
UPDATE anouksha.store set  store_contactnumber = '8573353415' WHERE store_id = '2';
UPDATE anouksha.store set  store_contactnumber = '8573353416' WHERE store_id = '3';

UPDATE anouksha.store set  store_email = 'fenway_store@gmail.com' WHERE store_id = '1';
UPDATE anouksha.store set  store_email = 'roxbury_store@gmail.com' WHERE store_id = '2';
UPDATE anouksha.store set  store_email = 'south_end_store@gmail.com' WHERE store_id = '3';

UPDATE anouksha.store set  store_address = '#1 fenway boston MA 02119' WHERE store_id = '1';
UPDATE anouksha.store set  store_address = '#22 roxbury boston MA 03119' WHERE store_id = '2';
UPDATE anouksha.store set  store_address = '#34 south end boston MA 04119' WHERE store_id = '3';

UPDATE anouksha.store set  store_location = 'Fenway' WHERE store_id = '1';
UPDATE anouksha.store set  store_location = 'Roxbury' WHERE store_id = '2';
UPDATE anouksha.store set  store_location = 'South End' WHERE store_id = '3';


INSERT INTO anouksha.Store VALUES (4, 8573353417, 'riverway_store@gmail.com', '#888 riverway boston MA 05119' ,'Riverway');
INSERT INTO anouksha.Store VALUES (5, 8573353418, 'cambridge_store@gmail.com', '#616 cambridge boston MA 06119' ,'Cambridge');
INSERT INTO anouksha.Store VALUES (6, 8573353419, 'longwood_store@gmail.com', '#777 longwood boston MA 07119' ,'Longwood');

SELECT * FROM ANOUKSHA.customer;

UPDATE anouksha.customer set  customer_name = 'Sai' WHERE customer_id = '1';
UPDATE anouksha.customer set  customer_name = 'Ram' WHERE customer_id = '2';
UPDATE anouksha.customer set  customer_name = 'Akhil' WHERE customer_id = '3';
UPDATE anouksha.customer set  customer_name = 'Arya' WHERE customer_id = '4';
UPDATE anouksha.customer set  customer_name = 'Tilak' WHERE customer_id = '5';

UPDATE anouksha.customer set  contact_number = '8574454512' WHERE customer_id = '1';
UPDATE anouksha.customer set  contact_number = '8574454513' WHERE customer_id = '2';
UPDATE anouksha.customer set  contact_number = '8574454514' WHERE customer_id = '3';
UPDATE anouksha.customer set  contact_number = '8574454515' WHERE customer_id = '4';
UPDATE anouksha.customer set  contact_number = '8574454516' WHERE customer_id = '5';

INSERT INTO anouksha.customer VALUES (6, 'Sitaram', '#8 riverway boston MA ' ,'8574454517');
INSERT INTO anouksha.customer VALUES (7, 'Santosh', '#6 fenway boston MA ' ,'8574454518');
INSERT INTO anouksha.customer VALUES (8, 'Rithvik', '#4 roxbury boston MA ' ,'8574454519');
INSERT INTO anouksha.customer VALUES (9, 'Priya', '#6 south-end boston MA' ,'8574454520');
INSERT INTO anouksha.customer VALUES (10, 'Manavi', '#7 cambridge boston MA ' ,'8574454521');
INSERT INTO anouksha.customer VALUES (11, 'Vamsi', '#88 riverway boston MA ' ,'8574454522');
INSERT INTO anouksha.customer VALUES (12, 'Balaji', '#66 fenway boston MA ' ,'8574454523');
INSERT INTO anouksha.customer VALUES (13, 'Sandeep', '#44 roxbury boston MA ' ,'8574454524');
INSERT INTO anouksha.customer VALUES (14, 'Naman', '#66 south-end boston MA' ,'8574454525');
INSERT INTO anouksha.customer VALUES (15, 'Bipin', '#77 cambridge boston MA' ,'8574454526');
INSERT INTO anouksha.customer VALUES (16, 'Rahul', '#81 riverway boston MA ' ,'8574454527');
INSERT INTO anouksha.customer VALUES (17, 'Anish', '#61 fenway boston MA ' ,'8574454528');
INSERT INTO anouksha.customer VALUES (18, 'Venky', '#41 roxbury boston MA ' ,'8574454529');
INSERT INTO anouksha.customer VALUES (19, 'Monish', '#61 south-end boston MA' ,'8574454530');
INSERT INTO anouksha.customer VALUES (20, 'Sita', '#71 cambridge boston MA' ,'8574454531');

SELECT * FROM ANOUKSHA.orders;

INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-22', 'yyyy-mm-dd'), 6);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-23', 'yyyy-mm-dd'), 7);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-26', 'yyyy-mm-dd'), 9);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-24', 'yyyy-mm-dd'), 8);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-27', 'yyyy-mm-dd'), 9);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-28', 'yyyy-mm-dd'), 10);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-21', 'yyyy-mm-dd'), 11);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-18', 'yyyy-mm-dd'), 12);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-16', 'yyyy-mm-dd'), 13);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-29', 'yyyy-mm-dd'), 14);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-12', 'yyyy-mm-dd'), 15);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-02', 'yyyy-mm-dd'), 16);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-05', 'yyyy-mm-dd'), 17);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-10', 'yyyy-mm-dd'), 18);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-15', 'yyyy-mm-dd'), 19);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-26', 'yyyy-mm-dd'), 20);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-11', 'yyyy-mm-dd'), 13);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-06', 'yyyy-mm-dd'), 18);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-07', 'yyyy-mm-dd'), 16);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-09', 'yyyy-mm-dd'), 17);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-30', 'yyyy-mm-dd'), 10);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-29', 'yyyy-mm-dd'), 11);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-21', 'yyyy-mm-dd'), 12);
INSERT INTO ANOUKSHA.orders VALUES (ORDER_ID.NEXTVAL, to_date('2022-11-26', 'yyyy-mm-dd'), 13);

commit;