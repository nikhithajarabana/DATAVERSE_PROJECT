CREATE OR REPLACE PROCEDURE Add_Customer IS
    Customer_num number(10);
    name varchar2(20);
BEGIN
        Customer_num := 21;	
        name := 'Lisa';	
        INSERT INTO anouksha.customer (Customer_ID, Customer_Name) VALUES (Customer_num, name);
       DBMS_OUTPUT.PUT_LINE ('New Customer inserted');
END;
/


BEGIN
Add_Customer();
END;
/
grant execute on add_customer to anouksha,rithvik,sahithi;
