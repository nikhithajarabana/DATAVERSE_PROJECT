select * from all_tables where owner ='NKP';
SELECT * FROM NKP.STORE;
INSERT INTO NKP.Store VALUES (1, 044567892, 'Store1@gmail.com', '#1 fenway boston MA' ,'Fenway');
INSERT INTO NKP.Store VALUES (2, 044567882, 'Store2@gmail.com', '#22 roxbury boston MA' ,'Roxbury');
INSERT INTO NKP.Store VALUES (3, 044567872, 'Store3@gmail.com', '#34 south end boston MA' ,'South End');
INSERT INTO NKP.Store VALUES (4, 044567862, 'Store4@gmail.com', '#888 riverway boston MA' ,'Riverway');
INSERT INTO NKP.Store VALUES (5, 044567855, 'Store5@gmail.com', '#616 cambridge boston MA' ,'Cambridge');
SELECT * FROM NKP.STORE;

select * from NKP.supplier;
INSERT INTO NKP.Supplier VALUES (1, 'supplier 1', 044555857, '#666 fenway boston MA' , 'Supplier1@gmail.com');
INSERT INTO NKP.Supplier VALUES (2, 'supplier 2', 044555678, '#414 roxbury boston MA' , 'Supplier2@gmail.com');
INSERT INTO NKP.Supplier VALUES (3, 'supplier 3', 044555776, '#666 south-end boston MA' , 'Supplier3@gmail.com');
INSERT INTO NKP.Supplier VALUES (4, 'supplier 4', 044555112, '#86 riverway boston MA' , 'Supplier4@gmail.com');
INSERT INTO NKP.Supplier VALUES (5, 'supplier 5', 044555344, '#7 cambridge boston MA' , 'Supplier5@gmail.com');

select * from NKP.category;
select * from NKP.product;

SELECT * FROM NKP.customer;
INSERT INTO NKP.CUSTOMER VALUES (1, 'customer 1', '#1 roxbury boston MA' , 8573353412);
INSERT INTO NKP.CUSTOMER VALUES (2, 'customer 2', '#2 fenway boston MA' , 8573333316);
INSERT INTO NKP.CUSTOMER VALUES (3, 'customer 3', '#3 riverway boston MA' , 8573353514);
INSERT INTO NKP.CUSTOMER VALUES (4, 'customer 4', '#4 cambridge boston MA' , 8573355417);
INSERT INTO NKP.CUSTOMER VALUES (5, 'customer 5', '#5 south end boston MA' , 8573357616);

select * from NKP.orders;
INSERT INTO NKP.orders VALUES (1, to_date('2022-11-01', 'yyyy-mm-dd'), 1);
INSERT INTO NKP.orders VALUES (2, to_date('2022-11-02', 'yyyy-mm-dd'), 2);
INSERT INTO NKP.orders VALUES (3, to_date('2022-11-05', 'yyyy-mm-dd'), 1);
INSERT INTO NKP.orders VALUES (4, to_date('2022-11-07', 'yyyy-mm-dd'), 3);
INSERT INTO NKP.orders VALUES (5, to_date('2022-11-09', 'yyyy-mm-dd'), 4);
INSERT INTO NKP.orders VALUES (6, to_date('2022-11-10', 'yyyy-mm-dd'), 2);
INSERT INTO NKP.orders VALUES (7, to_date('2022-11-11', 'yyyy-mm-dd'), 5);
INSERT INTO NKP.orders VALUES (8, to_date('2022-11-15', 'yyyy-mm-dd'), 4);
INSERT INTO NKP.orders VALUES (9, to_date('2022-11-16', 'yyyy-mm-dd'), 3);
INSERT INTO NKP.orders VALUES (10, to_date('2022-11-20', 'yyyy-mm-dd'), 5);

COMMIT;
