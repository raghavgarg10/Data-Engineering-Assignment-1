CREATE DATABASE superstore_db;
USE superstore_db;

-- =========================================
-- SECTION 1: DATA EXPLORATION
-- =========================================

-- Q1. View first 10 records 
SELECT * FROM superstore LIMIT 10;

-- Q2. Count total number of rows
SELECT COUNT(*) AS Total_Rows
FROM superstore;

-- Q3. View table structure
DESC superstore;

-- Q4. View distinct product categories
SELECT DISTINCT Category
FROM superstore;

-- =========================================
-- SECTION 2: FILTERING DATA
-- =========================================

-- Q5. Orders from West Region
SELECT *
FROM superstore
WHERE Region = 'West';

-- Q6. Technology category products
SELECT *
FROM superstore
WHERE Category = 'Technology';

-- Q7. Orders with sales greater than 1000
SELECT *
FROM superstore
WHERE Sales > 1000;

-- Q8. Orders placed in year 2017
SELECT *
FROM superstore
WHERE STR_TO_DATE(`Order Date`, '%m/%d/%Y')
BETWEEN '2017-01-01' AND '2017-12-31';

-- =========================================
-- SECTION 3: AGGREGATION ANALYSIS
-- =========================================

-- Q9. Total Sales by Category
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;

-- Q10.Average Sales by Category
SELECT Category,
       AVG(Sales) AS Average_Sales
FROM superstore
GROUP BY Category;

-- Q11.Total Quantity by Category
SELECT Category,
       SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY Category;

-- =========================================
-- SECTION 4 : SORT AND LIMIT RESULTS
-- =========================================

-- Q12. Top 10 Products by Sales
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q13. Top 5 Categories by Sales
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 5;

-- =========================================
-- SECTION 5: BUSINESS USE CASES
-- =========================================

-- Q14. Monthly Sales Trend
SELECT
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month_No,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Month_No
ORDER BY Month_No;

-- Q15. Top 10 Customers by Sales
SELECT `Customer Name`,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q16. Find Duplicate Order IDs
SELECT `Order ID`,
       COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1;

-- =========================================
-- SECTION 6: DATA VALIDATION
-- =========================================

-- Q17. Verify Total Row Count
SELECT COUNT(*) AS Total_Rows
FROM superstore;

-- Q18. Check Missing Sales Values
SELECT *
FROM superstore
WHERE Sales IS NULL;