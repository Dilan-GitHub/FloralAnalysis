-- Inventory Aanlysis

-- Total Units Sold Across Stores
SELECT
    Store,
    SUM(Mums_Sold) AS TotalUnitsSold
FROM HBMums
GROUP BY Store 
ORDER BY TotalUnitsSold DESC;

-- Total Units Sold by City

SELECT 
    City, 
    SUM(Mums_Sold) AS TotalUnitsSold
FROM 
    HBMums
GROUP BY 
    City 
ORDER BY 
    TotalUnitsSold DESC;

-- Sales Rate by Tier

SELECT Store_Tier,
        SUM(Mums_Sold) AS TotalUnitsSold,
        SUM(Mums_Ordered) AS TotalUnits,
        CAST(SUM(Mums_Sold) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS SalesRate
FROM 
    HBMums
GROUP BY 
    Store_Tier 
ORDER BY 
    SalesRate DESC;

-- Calculate Shrinkage Rate Across Stores

SELECT Store,
        SUM(Mums_Shrink) AS TotalShrinkage,
        SUM(Mums_Ordered) AS TotalUnits,
        CAST(SUM(Mums_Shrink) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS ShrinkageRate
FROM 
    HBMums 
GROUP BY Store  
ORDER BY ShrinkageRate DESC;

-- Calculate Shrinkage Rate Across Tiers

SELECT Store_Tier,
       SUM(Mums_Shrink) AS TotalShrinkage,
       SUM(Mums_Ordered) AS TotalUnits,
       CAST(SUM(Mums_Shrink) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS ShrinkageRate
FROM HBMums
GROUP BY Store_Tier
ORDER BY ShrinkageRate DESC;

-- Calculate Shrinkage Rate Across Cities

SELECT City,
       SUM(Mums_Shrink) AS TotalShrinkage,
       SUM(Mums_Ordered) AS TotalUnits,
       CAST(SUM(Mums_Shrink) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS ShrinkageRate
FROM HBMums
GROUP BY City
ORDER BY ShrinkageRate DESC;

-- By Store

SELECT Store,
       SUM(Mums_Sold) AS TotalUnitsSold,
       SUM(Mums_Shrink) AS TotalShrinkage,
       SUM(Mums_Ordered) AS TotalUnits,
       CAST(SUM(Mums_Sold) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS SalesRate,
       CAST(SUM(Mums_Shrink) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS ShrinkageRate
FROM HBMums
GROUP BY Store
ORDER BY ShrinkageRate DESC;

-- By Tier

SELECT Store_Tier,
       SUM(Mums_Sold) AS TotalUnitsSold,
       SUM(Mums_Shrink) AS TotalShrinkage,
       SUM(Mums_Ordered) AS TotalUnits,
       CAST(SUM(Mums_Sold) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS SalesRate,
       CAST(SUM(Mums_Shrink) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS ShrinkageRate
FROM HBMums
GROUP BY Store_Tier
ORDER BY ShrinkageRate DESC;

-- Financial Analysis

-- Profitability

-- Total Profit Across Stores

SELECT Store,
        SUM(Mums_Profit) AS TotalProfit
FROM 
    HBMums
GROUP BY
    Store 
ORDER BY 
    TotalProfit DESC;

-- Total Profit Across Cities

SELECT 
    City,
    SUM(Mums_Profit) AS TotalProfit 
FROM 
    HBMums
GROUP BY
    City 
ORDER BY 
    TotalProfit DESC;

-- Total Profit Across Tiers

SELECT 
    Store_Tier,
    SUM(Mums_Profit) AS TotalProfit 
FROM 
    HBMums
GROUP BY 
    Store_Tier 
ORDER BY 
    Store_Tier ASC;

-- Profit Margins 

-- By Store 

SELECT Store,
        SUM(Mums_Profit) AS TotalProfit,
        AVG((Mums_Price - Mums_Cost) / Mums_Price * 100) AS AverageProfitMargin
FROM 
    HBMums
GROUP BY 
    Store 
ORDER BY 
    AverageProfitMargin DESC;

--  By City 

SELECT 
    City,
    SUM(Mums_Profit) AS TotalProfit,
    AVG((Mums_Price - Mums_Cost) / Mums_Price * 100) AS AverageProfitMargin
FROM   
    HBMums
GROUP BY 
    City 
ORDER BY 
    AverageProfitMargin DESC;

-- By Tier 

SELECT 
    Store_Tier,
    SUM(Mums_Profit) AS TotalProfit,
    AVG((Mums_Price - Mums_Cost) / Mums_Price * 100) AS AverageProfitMargin
FROM   
    HBMums
GROUP BY 
    Store_Tier 
ORDER BY 
    AverageProfitMargin DESC;

-- Shrinkage Cost Impact

-- Total Shrinkage Cost by Store

SELECT
    Store,
    SUM(Mums_Shrink_Amount) AS TotalShrinkageCost
FROM 
    HBMums
GROUP BY 
    Store 
ORDER BY 
    TotalShrinkageCost DESC;

-- Total Shrinkage Cost by City

SELECT
    City,
    SUM(Mums_Shrink_Amount) AS TotalShrinkageCost
FROM 
    HBMums
GROUP BY 
    City 
ORDER BY 
    TotalShrinkageCost DESC;

-- Total Shrinkage Cost by Tier

SELECT
    Store_Tier,
    SUM(Mums_Shrink_Amount) AS TotalShrinkageCost
FROM 
    HBMums
GROUP BY 
    Store_Tier 
ORDER BY 
    TotalShrinkageCost DESC;

-- Tier-Based Analysis

-- Average Sales by Store Tier

SELECT
    AVG(Mums_Sold) AS AverageUnitsSold
FROM 
    HBMums 
GROUP BY 
    Store_Tier 
ORDER BY 
    AverageUnitsSold DESC;

-- Average Shrinkage by Store Tier

SELECT
    AVG(Mums_Shrink) AS AverageShrinkageUnits
FROM 
    HBMums 
GROUP BY 
    Store_Tier 
ORDER BY 
    AverageShrinkageUnits DESC;

-- Average Profit by Store Tier

SELECT 
    Store_Tier,
    AVG(Mums_Profit) AS AverageProfit
FROM 
    HBMums
GROUP BY 
    Store_Tier
ORDER BY 
    AverageProfit DESC;

-- Comprehensive Analysis by Tier

SELECT 
    Store_Tier,
       AVG(Mums_Sold) AS AverageUnitsSold,
       AVG(Mums_Shrink) AS AverageShrinkageUnits,
       AVG(Mums_Profit) AS AverageProfit
FROM 
    HBMums
GROUP BY 
    Store_Tier
ORDER BY 
    AverageProfit DESC;


-- Geographic Analysis

-- Sales Rate by City

SELECT City,
       SUM(Mums_Sold) AS TotalUnitsSold,
       SUM(Mums_Ordered) AS TotalUnits,
       CAST(SUM(Mums_Sold) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS SalesRate
FROM HBMums
GROUP BY City
ORDER BY SalesRate DESC;

-- Shrinkage Rate by City

SELECT City,
       SUM(Mums_Shrink) AS TotalShrinkage,
       SUM(Mums_Ordered) AS TotalUnits,
       CAST(SUM(Mums_Shrink) * 100.0 / SUM(Mums_Ordered) AS DECIMAL(10, 2)) AS ShrinkageRate
FROM HBMums
GROUP BY City
ORDER BY ShrinkageRate DESC;