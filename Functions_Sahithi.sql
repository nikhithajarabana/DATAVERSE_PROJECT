
CREATE OR REPLACE FUNCTION CustomerReturn RETURN NUMBER IS 
    c_id number := 0;
BEGIN 
 select Customer_ID into c_id FROM anouksha.customer WHERE Customer_Name='Priya';
  return c_id;
END;
/

select CustomerReturn from dual;

CREATE OR REPLACE FUNCTION ProductReturn RETURN NUMBER IS 
    p_id number := 0;
BEGIN 
 select Product_ID into p_id FROM anouksha.product WHERE Product_Name='Whole Wheat Bread';
  return p_id;
END;
/

select ProductReturn from dual;




