DROP TABLE ANOUKSHA.ORDERLIST;

Create table ORDERLIST (Orderlist_id int primary key, Order_id int, Product_id int, quantity int,
CONSTRAINT FK_OrderList_Orders foreign key(Order_id)references Orders(Order_id), 
CONSTRAINT FK_OrderList_Product  foreign key(Product_id) references Product(Product_id));
commit;

INSERT INTO ANOUKSHA.ORDERLIST VALUES (1, 12, 1, 3);
INSERT INTO ANOUKSHA.ORDERLIST VALUES (2, 15, 1, 2);
INSERT INTO ANOUKSHA.ORDERLIST VALUES (3, 18, 1, 10);

commit;