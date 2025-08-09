-- How Many Sales We Have ? --
SELECT  COUNT (*) AS Total_Sales FROM SalesTransaction ;

-- How many Unique Customers we Have DISTINCT WILL BE USED  --
SELECT  COUNT (DISTINCT Customer_ID) AS Total_Sales FROM SalesTransaction ;
-- How many Unique Categories we Have --
SELECT  COUNT (DISTINCT Category) AS Total_Sales FROM SalesTransaction ;

--To Check Distinct Categroy name or customer id or any other resut --
SELECT  DISTINCT Category FROM SalesTransaction ;

SELECT  DISTINCT Customer_ID FROM SalesTransaction ;

