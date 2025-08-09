
-- DATA ANALYSIS --
-- Q1 to retrieve all records based on "2022-11-05"
SELECT  * FROM SalesTransaction WHERE Sales_Date = '2022-11-05';

--Q2 Retireve all records from ST where catery is clothing and qunatity sold is more than 10 in the month of Nov-2022--
SELECT *
FROM 
SalesTransaction
WHERE 
  Category = 'Clothing'
  AND 
  Quantity >= 4
  AND 
  Sales_Date >= '2022-11-01'
  AND
  Sales_Date < '2022-12-01';
;
-- another approach 
--SELECT *
--FROM SalesTransaction
--WHERE Category = 'Clothing'
--  AND Quantity > 10
--  AND YEAR(Sales_Date) = 2022
--  AND MONTH(Sales_Date) = 11;

--Q3 calculate total sales for each category --
SELECT Category, 
 SUM(Total_Sales) AS net_sales,
 COUNT(*) As Total_orders
 FROM SalesTransaction
 GROUP BY Category;

 --Q4 Find the Average age of the  customers  who purchased  items From  the 'beauty' categroy 
 Select AVG(Age) AS avg_age
 From SalesTransaction
 WHERE Category = 'Beauty'
 ;
 --Q5 find the all transactions where  total_sales  are greater than 1000.
 SELECT * From SalesTransaction WHERE 
 Total_Sales > 1000

  --Q6 find the total number of transactions (transaction-id) made by each gender in each category.
  SELECT Category,
  Gender,COUNT(*) AS total_transactions
  From SalesTransaction 
  GROUP BY Category,Gender
  ORDER BY Category

--Q7 find the total number of transactions (transaction-id) made by each gender in each category.
SELECT 
SalesMonth,
SalesYear,
AvgMonthlySales

FROM  
(
SELECT 
    YEAR(Sales_Date) AS SalesYear,
    MONTH(Sales_Date) AS SalesMonth,
    AVG(Total_Sales) AS AvgMonthlySales,
	RANK () OVER (PARTITION BY YEAR(Sales_Date) ORDER BY AVG(Total_Sales) DESC) as Rank
FROM SalesTransaction 
GROUP BY YEAR(Sales_Date), MONTH(Sales_Date)
) as t1
WHERE Rank = 1

--Q8 find the top 5 customers based on  the highest total sales .

SELECT TOP 5 
Customer_ID,
SUM(Total_Sales) as total_sales
FROM SalesTransaction
GROUP BY Customer_ID
ORDER BY Total_Sales DESC

-- Q9 Find the Unique Customers which purchased the items from Each Category --

SELECT 
Category,
COUNT(DISTINCT Customer_ID) as Unique_Customers
FROM SalesTransaction
GROUP BY Category;

-- Q10 Create each shift and number of orders (Example Morning <=12,Afternoon Between 12 & 17 ,Evening > 17 ) --
 


WITH hourly_sales AS 
(
  SELECT *,
    CASE
      WHEN DATEPART(HOUR, Sales_Time) < 12 THEN 'Morning'
      WHEN DATEPART(HOUR, Sales_Time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
    END AS shift
  FROM SalesTransaction
)
SELECT shift,
       COUNT(*) AS Total_Orders
FROM hourly_sales
GROUP BY shift;


