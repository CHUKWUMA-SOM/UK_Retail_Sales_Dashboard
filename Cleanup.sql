--Remove any negative quantities
DELETE 
FROM [dbo].[retail_transactions]
WHERE Quantity <= 0;

--Check for missing values
UPDATE [dbo].[retail_transactions]
SET PaymentMethod = 'Unknown'
WHERE PaymentMethod IS NULL;

UPDATE [dbo].[retail_transactions]
SET StoreLocation = 'Unknown'
WHERE StoreLocation IS NULL;

UPDATE [dbo].[retail_transactions]
SET DiscountApplied = 0
WHERE DiscountApplied IS NULL;

--Simplyfying the table
ALTER TABLE [dbo].[retail_transactions]
ADD TransactionYear AS YEAR(TransactionDate),
    TransactionMonth AS MONTH(TransactionDate),
    Revenue AS Quantity * Price;



