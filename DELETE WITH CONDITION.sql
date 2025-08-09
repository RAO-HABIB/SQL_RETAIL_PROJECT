DELETE  FROM SalesTransaction
WHERE Quantity IS NULL
OR 
Price_Per_Unit IS NULL
;
-- DELTE ROWS WITH THE ANY OF THESE Category ABOVE--
