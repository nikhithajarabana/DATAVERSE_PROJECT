 CREATE VIEW Product_Quantity AS 
 SELECT p.Product_Name, p.Product_Price, p.Manufacture_Date, p.Expiry_Date, 
 p.Available_Quantity, ps.Supplied_Quantity FROM anouksha.Product p INNER JOIN  anouksha.Product_Stock ps ON p.Product_ID = ps.Product_ID;
 select * from product_quantity;