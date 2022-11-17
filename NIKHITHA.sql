create table Admin (Admin_UserName varchar(20) primary key, Admin_Password varchar(30) );
create table Store (Store_ID INT primary key, StoreContactNumber INT, Store_Email varchar(30), Store_Address varchar(30), Store_Location varchar(100) );
create table Supplier (Supplier_ID int primary key, Supplier_Name varchar(20), Supplier_Phone int, Supplier_Address varchar(30), Supplier_Email varchar(20) );
create table Category (Category_ID int primary key, Category_Name varchar(20), Category_Description varchar(100) );
create table Product (Product_ID int primary key, Product_Name varchar(20), Product_Price int, Manufacture_Date DATE, Expiry_Date DATE,  Available_Quantity int, Brand_Name varchar(20), Category_ID int, 
CONSTRAINT FK_Product_Category
 foreign key(Category_ID) references Category(Category_ID)  );
 create table Product_Stock (Stock_ID int primary key, Supplied_Quantity int, Date_of_Stock Date, Store_ID int,  Supplier_ID int, Product_ID int,  CONSTRAINT FK_ProductStock_Store foreign key(Store_ID) references Store(Store_ID),  
 CONSTRAINT FK_ProductStock_Supplier foreign key(Supplier_ID) references Supplier(Supplier_ID), 
CONSTRAINT FK_ProductStock_Product  foreign key(Product_ID) references Product(Product_ID)
);
create table Customer (Customer_ID int primary key, Customer_Name varchar(20), Address varchar(100), ContactNumber int );
create table Orders (Order_ID INT primary key, Order_Date Date, Customer_ID int,
 CONSTRAINT FK_Order_Customer foreign key(Customer_ID) references Customer(Customer_ID) );
 create table OrderList (OrderList_ID int primary key, Order_ID int, Product_ID int, quantity int, 
  CONSTRAINT FK_OrderList_Order   foreign key(Order_ID) references Orders(Order_ID), 
  CONSTRAINT FK_OrderList_Product  foreign key(Product_ID) references Product(Product_ID) );
  create table Delivery (Delivery_ID int primary key, Delivery_Date DATE, Order_ID int, 
 CONSTRAINT FK_Delivery_Order foreign key(Order_ID) references Orders(Order_ID) );
 GRANT ALL ON SUPPLIER TO ANOUKSHA;
 select * from product_stock;


