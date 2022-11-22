CREATE VIEW Product_Category AS 
 SELECT p.Product_Name, p.Product_Price, p.Manufacture_Date, p.Expiry_Date ,
 c.Category_Name, c.Category_Description FROM anouksha.Product p INNER JOIN  anouksha.Category c ON p.Category_ID = c.Category_ID;
 select * from product_category;