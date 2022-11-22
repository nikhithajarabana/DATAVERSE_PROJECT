INSERT INTO anouksha.category VALUES (category_id.nextval, 'Frozen Food', 'Frozen Food: Halfed cooked');
INSERT INTO anouksha.category VALUES (category_id.nextval, 'Rice', 'White rice, Basmati rice, Brown rice');
INSERT INTO anouksha.category VALUES (category_id.nextval, 'Breakfast', 'Bread, Cereals');

INSERT INTO anouksha.product VALUES (product_id.nextval, 'Whole Wheat Bread', 4,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 0 , 'Britania' , 3);
INSERT INTO anouksha.product VALUES (product_id.nextval, 'Margherita Pizza', 9.99,  to_date('2022-11-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 0 , 'Amys' , 1);
INSERT INTO anouksha.product VALUES (product_id.nextval, 'Nutella', 6,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 0 , 'Cadbury' , 3);
INSERT INTO anouksha.product VALUES (product_id.nextval, 'Sonamasoori', 4,  to_date('2021-10-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 0 , 'Royal' , 2);

INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 1, 1);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-16', 'yyyy-mm-dd'), 2, 1, 2);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 100, to_date('2022-11-16', 'yyyy-mm-dd'), 1,2, 3);
INSERT INTO anouksha.Product_Stock VALUES (stock_ID.nextval, 50, to_date('2022-11-16', 'yyyy-mm-dd'), 2, 1, 2);

commit;