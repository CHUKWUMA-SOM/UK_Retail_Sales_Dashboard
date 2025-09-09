--Monthly Sales Trends
SELECT
  TransactionYear,
  TransactionMonth,
  SUM(Revenue) AS MonthlyRevenue
FROM  [dbo].[retail_transactions]
GROUP BY TransactionYear, TransactionMonth
ORDER BY TransactionYear, TransactionMonth;

-- Revenue by product category
SELECT
    ProductCategory,
    SUM(Revenue) AS CategoryRevenue
FROM [dbo].[retail_transactions]
GROUP BY ProductCategory
ORDER BY CategoryRevenue DESC;

--Top 10 Products by Revenue
SELECT TOP 10
  ProductID,
  SUM(Revenue) AS TotalRevenue
FROM [dbo].[retail_transactions]
GROUP BY ProductID
ORDER BY TotalRevenue DESC;

--Revenue by store location
SELECT
  StoreLocation,
  SUM(Revenue) AS RegionRevenue
FROM [dbo].[retail_transactions]
GROUP BY StoreLocation
ORDER BY RegionRevenue DESC;

--Popular payment methods
SELECT
  PaymentMethod,
  COUNT(*) AS TransactionCount
FROM [dbo].[retail_transactions]
GROUP BY PaymentMethod
ORDER BY TransactionCount DESC;

--Average Discount Impact
SELECT
  AVG(DiscountApplied) AS AvgDiscountPct,
  AVG(TotalAmount) AS AvgSpend
FROM [dbo].[retail_transactions];

--Percentage of Total Reve nue by ProductCategory and Payment Method
SELECT 
    ProductCategory,
    SUM(Revenue) AS Revenue_By_ProductCategory,
    ROUND(
        (SUM(Revenue) * 100.0) / SUM(SUM(Revenue)) OVER(), 
        2
    ) AS Percentage_of_Total_Revenue
FROM [dbo].[retail_transactions]
GROUP BY ProductCategory
ORDER BY Revenue_By_ProductCategory DESC;


SELECT 
    PaymentMethod,
    SUM(Revenue) AS Revenue_By_PaymentMethod,
    ROUND(
        (SUM(Revenue) * 100.0) / SUM(SUM(Revenue)) OVER(), 
        2
    ) AS Percentage_of_Total_Revenue
FROM [dbo].[retail_transactions]
GROUP BY PaymentMethod
ORDER BY Revenue_By_PaymentMethod DESC;


