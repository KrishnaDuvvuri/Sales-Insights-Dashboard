USE sales_insights_db;

-- 1️⃣ Total Sales, Profit, and Quantity Sold
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales_data;

-- 2️⃣ Total Sales by Region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 3️⃣ Total Profit by Category
SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 4️⃣ Monthly Sales Trend
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;


-- 5️⃣ Top 10 Customers by Sales
SELECT 
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales_data
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;


-- 6️⃣ Sales and Profit by Sub-Category
SELECT 
    `Sub-Category` AS Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


-- 7️⃣ Average Discount by Category
SELECT 
    Category,
    ROUND(AVG(Discount), 3) AS Avg_Discount
FROM sales_data
GROUP BY Category
ORDER BY Avg_Discount DESC;

-- 8️⃣ Region and Segment Wise Sales
SELECT 
    Region,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales_data
GROUP BY Region, Segment
ORDER BY Region, Total_Sales DESC;

-- 9️⃣ State-Wise Profitability
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales_data
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

-- 🔟 Most and Least Profitable Products
(
  SELECT 
      `Sub-Category` AS Product,
      ROUND(SUM(Profit), 2) AS Total_Profit,
      'Most Profitable' AS Type
  FROM sales_data
  GROUP BY `Sub-Category`
  ORDER BY Total_Profit DESC
  LIMIT 5
)
UNION ALL
(
  SELECT 
      `Sub-Category` AS Product,
      ROUND(SUM(Profit), 2) AS Total_Profit,
      'Least Profitable' AS Type
  FROM sales_data
  GROUP BY `Sub-Category`
  ORDER BY Total_Profit ASC
  LIMIT 5
);


DESC sales_data;

SELECT * FROM sales_data;
