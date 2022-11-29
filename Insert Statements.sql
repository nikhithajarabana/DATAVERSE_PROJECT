SELECT * FROM ALL_TABLES WHERE OWNER = 'ANOUKSHA';
INSERT INTO anouksha.supplier VALUES (4, 'Britania', 1235478962, 'Boston', 'britania@gmail.com');
INSERT INTO anouksha.supplier VALUES (5, 'Nescafe', 1122674355, 'Fenway', 'nescafe@gmail.com');
INSERT INTO anouksha.supplier VALUES (6, 'Aquafina', 1897604320, 'Mexico', 'aquafina@gmail.com');
INSERT INTO anouksha.supplier VALUES (7, 'Cookieman', 1129044455, 'california', 'cookiem@gmail.com');
INSERT INTO anouksha.supplier VALUES (8, 'Parle', 1122906545, 'Florida', 'parle@gmail.com');
INSERT INTO anouksha.supplier VALUES (9, 'Tarkari', 1122434905, 'Texas', 'tarkari@gmail.com');
INSERT INTO anouksha.supplier VALUES (10, 'Purology', 1122336895, 'San Fransisco', 'purology@gmail.com');
UPDATE anouksha.supplier
  SET  supplier_contactnumber = '1567534907'
  WHERE supplier_id = '7';
  select * from anouksha.category;
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Meat', 'Chicken, Fish, Beef, Pork, Turkey');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Snacks', 'Chips, Biscuits, Chocolates');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Beverages', 'Sodas, Sparkling water, flavoured water, vitamin water');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Liqour', 'Whiskey, Gin, Rum, Vodka, Cocktails,Wine, Champagne');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Dairy', 'Milk, Paneer, cheese, butter, yogurt');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Pet food', 'Dog, cat, fish');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Sanitary Products', 'Napkins, Tampons');
  INSERT INTO anouksha.category VALUES (category_id.nextval, 'Beauty', 'Lip care, Body care, Fragrance');
  INSERT INTO ANOUKSHA.DELIVERY VALUES (1, to_date('2022-12-1', 'yyyy-mm-dd'), 15);
  INSERT INTO ANOUKSHA.DELIVERY VALUES (3, to_date('2022-12-6', 'yyyy-mm-dd'), 18);
  INSERT INTO ANOUKSHA.DELIVERY VALUES (3, to_date('2022-12-6', 'yyyy-mm-dd'), 18);
 commit;
 select * from anouksha.orderlist;
 select * from anouksha.product_stock;
 select * from anouksha.product;
 select * from product_quantity;
 select * from anouksha.delivery;
 
 
INSERT INTO anouksha.product VALUES (product_id.nextval, 
'Chicken', 5,  to_date('2022-11-28', 'yyyy-mm-dd'), to_date('2022-12-02', 'yyyy-mm-dd'), 150 , 'GG' , 21);
INSERT INTO anouksha.product VALUES (product_id.nextval, 
'Dog Dry Food', 22,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 20 , 'Pedigree' , 26);
INSERT INTO anouksha.product VALUES (product_id.nextval, 
'Body Lotion', 10,  to_date('2022-09-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 90 , 'Aveeno' , 28);
INSERT INTO anouksha.product VALUES (product_id.nextval,
'Chips', 4,  to_date('2022-12-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 75 , 'Britania' , 22);
INSERT INTO anouksha.product VALUES (product_id.nextval, 
'Coke', 4,  to_date('2020-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 57 , 'Coco Cola' , 23);
INSERT INTO anouksha.product VALUES (product_id.nextval, 
'Butter', 4,  to_date('2022-09-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 30 , 'Amul' , 25);
commit;
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 25, to_date('2022-12-15', 'yyyy-mm-dd'), 2, 2, 4);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 35, to_date('2022-12-01', 'yyyy-mm-dd'), 2, 1, 21);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 12, to_date('2022-12-06', 'yyyy-mm-dd'), 3, 10, 23);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 40, to_date('2022-12-15', 'yyyy-mm-dd'), 3, 8, 24);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 15, to_date('2022-11-15', 'yyyy-mm-dd'), 4, 4, 25);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 34, to_date('2022-12-15', 'yyyy-mm-dd'), 4, 7, 26);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 26, to_date('2022-12-15', 'yyyy-mm-dd'), 5, 2, 27);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 25, to_date('2022-12-15', 'yyyy-mm-dd'), 5, 9, 28);
commit;








