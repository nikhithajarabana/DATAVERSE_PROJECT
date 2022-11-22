CREATE VIEW Supplier_Store AS 
SELECT s.Supplier_Name, s.Supplier_ContactNumber, s.Supplier_Address, s.Supplier_email, st.Store_ContactNumber, 
st.Store_Email FROM anouksha.Store st, anouksha.Supplier s, anouksha.Product_Stock ps WHERE (ps.Store_ID = st.Store_ID) 
AND (ps.Supplier_ID = s.Supplier_ID);

SELECT s.Supplier_Name, s.Supplier_ContactNumber, s.Supplier_Address, s.Supplier_email, st.Store_ContactNumber, 
st.Store_Email FROM anouksha.Store st, anouksha.Supplier s, anouksha.Product_Stock ps WHERE (ps.Store_ID = st.Store_ID) 
AND (ps.Supplier_ID = s.Supplier_ID);

select * from Supplier_Store;

CREATE VIEW Customer_Order AS 
SELECT c.Customer_Name, o.Order_Date, o.Order_ID, ol.Product_ID, ol.quantity 
FROM anouksha.customer c INNER JOIN anouksha.Orders o ON c.Customer_ID = o.Customer_ID INNER JOIN anouksha.orderlist ol ON o.Order_ID = ol.Order_ID;

SELECT c.Customer_Name, o.Order_Date, o.Order_ID, ol.Product_ID, ol.quantity 
FROM anouksha.customer c INNER JOIN anouksha.Orders o ON c.Customer_ID = o.Customer_ID INNER JOIN anouksha.OrderList ol ON o.Order_ID = ol.Order_ID;

select * from customer_order;
