create view order_details as 
select o.order_id,ol.product_id,ol.quantity from orders o inner join orderlist ol on o.order_id = ol.order_id;
select * from order_details;
create view product_quantity_details as
select p.product_id,p.product_name, p.available_quantity, ps.supplied_quantity, ol.quantity as customer_ordered_quantity from product p inner join product_stock ps on p.product_id = ps.product_id 
inner join orderlist ol on ps.product_id = ol.product_id; 
select * from product_quantity_details;
grant select on order_details to sahithi,nikhitha,rithvik,anouksha,manager;
grant select on product_quantity_details to sahithi,nikhitha,rithvik,anouksha,manager;
