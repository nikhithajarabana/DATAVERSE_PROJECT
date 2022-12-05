Create view stock_update as 
select p.Product_Id, p.Product_Name,p.Available_quantity,ps.Supplied_Quantity 
From Product p Inner Join Product_Stock ps On p.Product_Id = ps.Product_Id;
