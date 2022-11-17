/* inserting values into table*/

desc nkp.category;
INSERT INTO nkp.category VALUES (1, 'Frozen Food', 'Frozen Food: Halfed cooked');
INSERT INTO nkp.category VALUES (2, 'Rice', 'White rice, Basmati rice, Brown rice');
INSERT INTO nkp.category VALUES (3, 'Breakfast', 'Bread, Cereals');

/* creating sequence for product id*/

CREATE SEQUENCE productID 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

desc nkp.product;

INSERT INTO nkp.product VALUES (productID.nextval, 'Whole Wheat Bread', 4,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 0 , 'Britania' , 3);
INSERT INTO nkp.product VALUES (productID.nextval, 'Margherita Pizza', 9.99,  to_date('2022-11-12', 'yyyy-mm-dd'), to_date('2022-12-12', 'yyyy-mm-dd'), 0 , 'Amys' , 1);
INSERT INTO nkp.product VALUES (productID.nextval, 'Nutella', 6,  to_date('2022-10-12', 'yyyy-mm-dd'), to_date('2024-12-12', 'yyyy-mm-dd'), 0 , 'Cadbury' , 3);
INSERT INTO nkp.product VALUES (productID.nextval, 'Sonamasoori', 4,  to_date('2021-10-12', 'yyyy-mm-dd'), to_date('2023-12-12', 'yyyy-mm-dd'), 0 , 'Royal' , 2);

update nkp.product set product_price=22 where product_id=4;
update nkp.category set category_description='Ice Creams,Frozen Pizza,Nuggets' where category_name='Frozen Food';

select * from nkp.product;

commit;