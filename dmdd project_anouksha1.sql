CREATE VIEW Supplier_Product AS 
SELECT s.Supplier_Name, s.Supplier_ContactNumber, s.Supplier_Address, s.Supplier_email, p.Product_Name, p.Product_Price 
FROM anouksha.Product p INNER JOIN anouksha.Product_Stock ps ON ps.Product_ID = p.Product_ID INNER JOIN anouksha.Supplier s ON s.Supplier_ID = ps.Supplier_ID;

select * from Supplier_Product;
grant all on orderlist to sahithi,rithvik,nikhitha;