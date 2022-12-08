CREATE OR REPLACE FUNCTION CustomerReturn(Cust_Name IN Varchar2) RETURN Number IS 
    c_id number(10);
BEGIN 
 select Customer_ID into c_id FROM anouksha.customer WHERE Customer_Name= Cust_Name;
  return c_id;
END;
/

select CustomerReturn('Priya') from dual;
commit;
CREATE OR REPLACE FUNCTION ProductReturn(Pro_Name IN varchar2) RETURN NUMBER IS 
    p_id number(10);
BEGIN 
 select Product_ID into p_id FROM product WHERE Product_Name= Pro_Name;
  return p_id;
END;
/

select ProductReturn('Whole Wheat Bread') from dual;
commit;
grant execute on productreturn to nikhitha,anouksha,rithvik,manager;
grant execute on customerreturn to nikhitha,anouksha,rithvik,manager;
commit;



