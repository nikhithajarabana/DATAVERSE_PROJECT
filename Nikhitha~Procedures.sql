CREATE OR REPLACE PROCEDURE Add_Customer IS
    Customer_num number(10);
    name varchar2(20);
    address varchar2(50);
    contact number(10);
BEGIN
        Customer_num := 24;	
        name := 'Lalitha';
        address := '49 Needam Boston MA';
        contact := 8576938961;
        INSERT INTO anouksha.customer (Customer_ID, Customer_Name,Address,Contact_Number) VALUES (Customer_num, name, address, contact);
       DBMS_OUTPUT.PUT_LINE ('New Customer inserted');
END;
/
BEGIN
Add_Customer();

END;
/
CREATE OR REPLACE PROCEDURE Add_Product IS
    product_num number(10);
    name varchar2(20);
    price number(10);
    manu_date date;
    expiry_date date;
    availability number(10);
    brand varchar2(20);
    category_num number(10);
BEGIN
        Product_num := 14;	
        name := 'CatDoo';	
        price := 20;
        manu_date := to_date('2022-12-12','yyyy-mm-dd');
        expiry_date := to_date('2025-12-12','yyyy-mm-dd') ;
        availability := 40;
        brand := 'Pedigree';
        category_num := 9;
        INSERT INTO anouksha.product (product_ID, Product_Name,Product_Price,Manufacture_Date,Expiry_Date, Available_Quantity, Brand_Name, Category_Id)
        VALUES (product_num, name,price,manu_date,expiry_date,availability,brand,category_num);
       DBMS_OUTPUT.PUT_LINE ('New Product inserted');
END;
/
BEGIN
Add_Product();
END;
/
commit;

grant execute on add_customer to rithvik,sahithi,anouksha;
grant execute on add_product to rithvik,sahithi,anouksha;
commit;


