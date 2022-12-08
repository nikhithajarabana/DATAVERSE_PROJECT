create or replace package InventoryPackage
AS 
procedure Add_Customer(Customer_Id Number,Customer_Name varchar2,Address varchar2,Contact_Number number);
procedure Add_Product(Product_Id Number,Product_Name varchar2,Product_Price number,Manufacture_Date date,Expiry_Date date,Available_Quantity number,Brand_Name varchar2,Category_Id number);
procedure Add_Category(Category_Id Number,Category_Name Varchar2,Category_Description Varchar2);
procedure LOWSTOCK(Product_ID varchar2, Product_Name varchar2, Available_Quantity number, Brand_Name varchar2);
END;
/