commit;

create role Supplier identified by "Supplier123";
create role Customer identified by "Customer123";
create role Manager identified by "Manager123";

commit;

CREATE OR REPLACE TRIGGER stock_trigger
 AFTER INSERT OR UPDATE ON anouksha.product_stock 
 FOR EACH ROW
 BEGIN
   UPDATE anouksha.product SET available_quantity = (available_quantity + :new.supplied_quantity) WHERE product_id = :new.product_id;          
 END;
/

CREATE OR REPLACE TRIGGER order_trigger
 AFTER INSERT OR UPDATE ON anouksha.orderlist
 FOR EACH ROW
 BEGIN
   UPDATE anouksha.product SET available_quantity = (available_quantity - :new.quantity) WHERE product_id = :new.product_id;          
 END;
/

commit;