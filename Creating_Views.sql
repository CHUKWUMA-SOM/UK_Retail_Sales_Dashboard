--Creating viewS
CREATE VIEW vw_Revenue_By_Region AS
SELECT
    StoreLocation,
    SUM(Revenue) AS TotalRevenue
FROM [dbo].[retail_transactions]
GROUP BY StoreLocation;



CREATE VIEW vw_Monthly_Revenue AS
SELECT
    YEAR(TransactionDate) AS TransactionYear,
    MONTH(TransactionDate) AS TransactionMonth,
    SUM(Revenue) AS MonthlyRevenue
FROM[dbo].[retail_transactions]
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)



CREATE VIEW vw_Payment_Methods AS
SELECT
    PaymentMethod,
    COUNT(*) AS TotalTransactions,
    ROUND(SUM(Revenue), 2) AS TotalRevenue
FROM [dbo].[retail_transactions]
GROUP BY PaymentMethod




CREATE VIEW vw_Revenue_By_Category AS
SELECT
    ProductCategory,
    SUM(Revenue) AS TotalRevenue,
    ROUND(AVG(DiscountApplied), 2) AS AvgDiscount
FROM [dbo].[retail_transactions]
GROUP BY ProductCategory


CREATE VIEW vw_Top_Products AS
SELECT TOP 10
    ProductID,
    ProductCategory,
	Quantity,
    SUM(Revenue) AS TotalRevenue
FROM [dbo].[retail_transactions]
GROUP BY ProductID, ProductCategory, Quantity
