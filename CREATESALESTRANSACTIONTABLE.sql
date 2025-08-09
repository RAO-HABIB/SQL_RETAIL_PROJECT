CREATE TABLE SalesTransactions (
    Transaction_ID INT PRIMARY KEY,   -- Auto-incrementing unique ID
    Sales_Time TIME NOT NULL,                       -- Only time
    Sales_Date DATE NOT NULL,                       -- Only date
    Customer_ID INT NOT NULL,                       -- Customer identifier
    Gender VARCHAR(15),                             -- Male/Female/Other
    Age INT,                                        -- Customer age
    Category VARCHAR(15),                           -- Product category
    Quantity INT NOT NULL,                          -- Number of units sold
    Price_Per_Unit FLOAT NOT NULL,          -- Price per item
    COGS FLOAT NOT NULL,                    -- Cost of goods sold
    Total_Sales FLOAT 
);
	