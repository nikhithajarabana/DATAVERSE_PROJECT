/* INSERTING SAMPLE DATA INTO TABLES*/

INSERT INTO NKP.Store VALUES (1, 1234567890, 'STORE1@STORE.COM','123 ABC 02115', 'BOSTON');
INSERT INTO NKP.Store VALUES (2, 2468024680, 'STORE2@STORE.COM','123 ABC 33613', 'FLORIDA');
INSERT INTO NKP.Store VALUES (3, 1357913579, 'STORE3@STORE.COM','123 ABC 10001', 'NEWYORK');

DESC NKP.SUPPLIER;

INSERT INTO nkp.supplier VALUES (1, 'PATEL', 1357924680, 'PATEL STREET', 'patel@gmail.com');
INSERT INTO nkp.supplier VALUES (2, 'GG', 2468013579, 'TARGET', 'gg@gmail.com');
INSERT INTO nkp.supplier VALUES (3, 'AMUL', 1122334455, 'AMUL PARLOUR', 'amul@gmail.com');

select * from nkp.supplier;
rollback;

CREATE SEQUENCE stock_ID 
START WITH 1 
INCREMENT BY 1 
MINVALUE 1
MAXVALUE 10000
NOCYCLE ;

desc nkp.product_stock;
INSERT INTO nkp.Product_Stock VALUES (stock_ID.nextval, 10, to_date('2022-11-16', 'yyyy-mm-dd'), 1, 1, 1);
INSERT INTO nkp.Product_Stock VALUES (stock_ID.nextval, 30, to_date('2022-11-16', 'yyyy-mm-dd'), 2, 1, 2);
INSERT INTO nkp.Product_Stock VALUES (stock_ID.nextval, 100, to_date('2022-11-16', 'yyyy-mm-dd'), 1,2, 3);
INSERT INTO nkp.Product_Stock VALUES (stock_ID.nextval, 50, to_date('2022-11-16', 'yyyy-mm-dd'), 2, 1, 2);

commit;

CREATE OR REPLACE TRIGGER Stock_Trigger
 AFTER INSERT OR UPDATE ON nkp.Product_Stock 
 FOR EACH ROW
 BEGIN
   UPDATE nkp.Product SET AVAILABLEQUANTITY = (AVAILABLEQUANTITY + :new.Supplied_Quantity) WHERE Product_ID = :new.Product_ID;          
 END;
