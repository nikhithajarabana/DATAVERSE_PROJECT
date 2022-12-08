create or replace procedure LOWSTOCK is


Product_ID number(38);
Product_Name varchar2(20);
Product_Price number(38);
available_quantity number(38);
brand_name varchar2(20);
cursor nextItem is
select product.Product_ID, Product.Product_Name,Product.Available_Quantity, Product.Brand_Name
from anouksha.product
where Product.available_quantity < 5;
 
begin
open nextItem;
fetch nextItem into Product_ID, Product_Name, Available_Quantity, Brand_Name;
if nextItem%notfound then
dbms_output.put_line('No items in need of reordering.');
else
dbms_output.put_line('*********************');
dbms_output.put_line('++Inventory Report++');
dbms_output.put_line('*********************');
dbms_output.put_line('Product ID-Product Name--Quantity--Brand Name');
loop
dbms_output.put_line(Product_ID||'---'||Product_Name||'----'||Available_Quantity||'---'||Brand_Name);
fetch nextItem into Product_ID, Product_Name, Available_Quantity, Brand_Name;
if nextItem%notfound then
dbms_output.put_line('************END REPORT*************');
exit when nextItem%notfound;
end if;
end loop;
end if;
 
end LOWSTOCK;
/
SET SERVEROUTPUT ON;
EXEC LOWSTOCK;

