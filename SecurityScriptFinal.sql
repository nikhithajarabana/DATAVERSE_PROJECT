create user nikhitha identified by N1DmddDatabase;
create user sahithi identified by S1DmddDatabase;
create user rithvik identified by R1DmddDatabase;
create user anouksha identified by A1DmddDatabase;

grant connect, resource to nikhitha;
grant connect, resource to sahithi;
grant connect, resource to rithvik;
grant connect, resource to anouksha;

grant unlimited tablespace to nikhitha;
grant unlimited tablespace to sahithi;
grant unlimited tablespace to rithvik;
grant unlimited tablespace to anouksha;

create user MANAGER identified by M1DmddDatabase;
grant connect, resource to MANAGER;
create user Customer identified by C1DmddDatabase;
grant connect, resource to CUSTOMER;
create user Supplier identified by Su1DmddDatabase;
grant connect, resource to SUPPLIER;

GRANT SELECT ON ANOUKSHA.ADMIN TO MANAGER;
GRANT ALL ON ANOUKSHA.CATEGORY TO MANAGER;
GRANT ALL ON ANOUKSHA.CUSTOMER TO MANAGER;
GRANT SELECT ON ANOUKSHA.DELIVERY TO MANAGER;
GRANT ALL ON ANOUKSHA.ORDERLIST TO MANAGER;
GRANT ALL ON ANOUKSHA.PRODUCT TO MANAGER;
GRANT SELECT ON ANOUKSHA.PRODUCT_STOCK TO MANAGER;
GRANT ALL ON ANOUKSHA.STORE TO MANAGER;
GRANT ALL ON ANOUKSHA.SUPPLIER TO MANAGER;
GRANT SELECT ON ANOUKSHA.ORDERS TO MANAGER;
commit;
GRANT SELECT ON ANOUKSHA.ORDERS TO CUSTOMER;
GRANT SELECT ON ANOUKSHA.PRODUCT TO CUSTOMER;


COMMIT;
grant select on category to customer;



GRANT SELECT ON  ANOUKSHA.ORDERLIST  TO  Supplier;
GRANT SELECT, INSERT, UPDATE ON ANOUKSHA.DELIVERY TO SUPPLIER;
commit;
grant select on order_details to sahithi,nikhitha,rithvik,anouksha,manager;
grant select on product_quantity_details to sahithi,nikhitha,rithvik,anouksha,manager;
grant select on supplier_product_details to nikhitha,sahithi,rithvik,manager,supplier;
grant select on total_productstock_quantity to rithvik,sahithi,nikhitha,manager;
grant select on Product_Category to rithvik,sahithi,nikhitha,manager;
grant select on Customer_Order_details to rithvik,sahithi,nikhitha,manager,customer;
grant select on Supplier_Store_details  to rithvik,sahithi,nikhitha,manager,supplier;
grant select on stock_update  to rithvik,sahithi,nikhitha,manager;

grant create procedure to nikhitha,sahithi,rithvik,anouksha;
grant execute on add_category to sahithi,rithvik,anouksha;
grant execute on add_Customer to sahithi,rithvik,anouksha;
grant execute on add_customer to anouksha,rithvik,sahithi;
grant execute on LOWSTOCK to sahithi,nikhitha,rithvik,anouksha;
grant execute on productreturn to nikhitha,sahithi,rithvik;
grant execute on customerreturn to nikhitha,sahithi,rithvik;
