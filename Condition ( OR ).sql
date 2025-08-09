SELECT * FROM SalesTransaction WHERE Quantity IS NULL 
OR 
Price_Per_Unit IS NULL;
-- to check on condition OR ifone of these Coloumn is NULL it will return the Data --