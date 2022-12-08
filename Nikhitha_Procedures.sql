
CREATE OR REPLACE PROCEDURE Add_category(
	   Category_Id IN Category.Category_Id%TYPE,
	   Category_Name IN Category.Category_Name%TYPE,
	   Cat_Description IN Category.Category_Description%TYPE)
IS
BEGIN

  INSERT INTO anouksha.category (Category_Id,Category_Name,Category_Description)
  VALUES (Category_Id, Category_Name,Cat_Description);
  COMMIT;

END;
/

Exec Add_Category(13,'Hair Products','Hair Care');
grant execute on add_category to sahithi,rithvik,anouksha,manager;



CREATE OR REPLACE PROCEDURE Add_Customer(
	   Cust_Id IN Customer.Customer_Id%TYPE,
	   Cust_Name IN Customer.Customer_Name%TYPE,
	   Address IN Customer.Address%TYPE,
       Cont_Num IN Customer.Contact_Number%TYPE)
IS
BEGIN

  INSERT INTO anouksha.Customer (Customer_Id,Customer_Name,Address,Contact_Number)
  VALUES (Cust_Id, Cust_Name,Address,Cont_Num);
  COMMIT;

END;
/
exec add_customer(453,'Nikhitha','Fenway street Boston MA',3452341238);
grant execute on add_Customer to sahithi,rithvik,anouksha,manager;
select * from anouksha.product;


CREATE OR REPLACE PROCEDURE Add_Product(
	   Pro_Id IN Product.Product_Id%TYPE,
	   Pro_Name IN Product.Product_Name%TYPE,
	   Price IN Product.Product_Price%TYPE,
       Manu_Date IN Product.Manufacture_Date%TYPE,
       Exp_Date IN Product.Expiry_Date%TYPE,
       Avail_Quant IN Product.Available_Quantity%TYPE,
       Brand IN Product.Brand_Name%TYPE,
       Cat_Id IN Product.Category_Id%TYPE)
IS
BEGIN

  INSERT INTO anouksha.Product (Product_Id,Product_Name,Product_Price,Manufacture_Date,Expiry_Date,Available_Quantity,Brand_Name,Category_Id)
  VALUES (Pro_Id,Pro_Name,Price,Manu_Date,Exp_Date,Avail_Quant,Brand,Cat_Id);
  COMMIT;

END;
/

EXEC add_product(123,'Shampoo',12,to_date('2022-12-12','yyyy-mm-dd'),to_date('2025-12-12','yyyy-mm-dd'),34,'Head and shoulders',13);
grant execute on add_product to sahithi,rithvik,anouksha,manager;
