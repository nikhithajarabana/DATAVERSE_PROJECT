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

GRANT SELECT ON  ANOUKSHA.ORDERLIST  TO  Supplier;
GRANT SELECT, INSERT, UPDATE ON ANOUKSHA.DELIVERY TO SUPPLIER;
commit;