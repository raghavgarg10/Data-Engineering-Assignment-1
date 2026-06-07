/************************************************************************************************************
    ASSIGNMENT - 3
    Objective - Use Subqueries, CTEs, and Window Functions to analyze sales data from the Superstore dataset. 

************************************************************************************************************/

-- ==========================================================
-- STEP 1: SELECT DATABASE
-- ==========================================================

USE superstore_db;

-- ==========================================================
-- STEP 2: CREATE RAW TABLE
-- Import the Superstore dataset into a table
-- ==========================================================

CREATE TABLE superstore_raw (
    row_id VARCHAR(20),
    order_id VARCHAR(50),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales VARCHAR(30),
    quantity VARCHAR(20),
    discount VARCHAR(20),
    profit VARCHAR(30)
);

-- ==========================================================
-- STEP 3: IMPORT SUPERSTORE DATA FROM CSV
-- ==========================================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample - Superstore.csv'
INTO TABLE superstore_raw
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- VERIFY IMPORT

SELECT COUNT(*) AS Total_Records
FROM superstore_raw;

-- ==========================================================
-- STEP 4: CREATE CUSTOMERS TABLE
-- ==========================================================

CREATE TABLE customers(
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);

-- INSERT CUSTOMER DATA

INSERT INTO customers
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
FROM superstore_raw;

-- Verify customer Data
SELECT * FROM customers LIMIT 5;

-- ==========================================================
-- STEP 5: CREATE PRODUCTS TABLE
-- ==========================================================

CREATE TABLE products (
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255)
);

-- INSERT PRODUCT DATA

INSERT INTO products
SELECT DISTINCT
    product_id,
    category,
    sub_category,
    product_name
FROM superstore_raw;

-- Verify product Data
SELECT * FROM products LIMIT 10;

-- ==========================================================
-- STEP 6: CREATE ORDERS TABLE
-- -- Maintain order related information
-- ==========================================================

CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    quantity INT,
    sales VARCHAR(30),
    discount VARCHAR(20),
    profit VARCHAR(30)
);

-- INSERT ORDER DATA

INSERT INTO orders
SELECT DISTINCT
    order_id,
    customer_id,
    product_id,
    order_date,
    ship_date,
    ship_mode,
    quantity,
    sales,
    discount,
    profit
FROM superstore_raw;

-- Verify order records
SELECT * FROM orders LIMIT 10;

-- Display all tables

SHOW TABLES;

-- =====================================================================
-- QUERY 1: Find orders with sales greater than average sales (SUBQUERY)
-- =====================================================================

SELECT * FROM orders
WHERE CAST(sales AS DECIMAL(10,2)) >
(
    SELECT AVG(CAST(sales AS DECIMAL(10,2)))
    FROM orders
);

-- ==============================================================
-- QUERY 2: Find highest sales order for each customer (SUBQUERY)
-- ==============================================================

SELECT * FROM orders o
WHERE CAST(o.sales AS DECIMAL(10,2)) =
(
    SELECT MAX(CAST(i.sales AS DECIMAL(10,2)))
    FROM orders i
    WHERE i.customer_id = o.customer_id
);

-- ========================================================
-- QUERY 3: Calculate total sales for each customer (CTE)
-- ========================================================

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales;

-- =======================================================================
-- QUERY 4: Find customers with above-average total sales( CTE + SUBQUERY)
-- =======================================================================

WITH customer_sales AS (
    SELECT 
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- ===============================================================
-- QUERY 5: Rank customers based on total sales (WINDOW FUNCTION)
-- ===============================================================

SELECT
    customer_id,
    SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(CAST(sales AS DECIMAL(10,2))) DESC
    ) AS sales_rank
FROM orders
GROUP BY customer_id;

-- ==========================================================================================
-- QUERY 6: Assign row numbers to orders within each customer (WINDOW FUNCTION + PARTITION BY
-- ==========================================================================================

SELECT *,
ROW_NUMBER() OVER
(
    PARTITION BY customer_id
    ORDER BY CAST(sales AS DECIMAL(10,2)) DESC
) AS row_num
FROM orders;

-- =======================================================================
-- QUERY 7: Display Top 3 customers based on total sales (WINDOW FUNCTION)
-- =======================================================================

SELECT *
FROM (
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales,
        RANK() OVER (
            ORDER BY SUM(CAST(sales AS DECIMAL(10,2))) DESC
        ) AS sales_rank
    FROM orders
    GROUP BY customer_id
) t
WHERE sales_rank <= 3;

-- ==========================================================================
-- FINAL COMBINED QUERY
-- Display Customer Name, Total Sales and Rank (JOIN + CTE + WINDOW FUNCTION)
-- ==========================================================================

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER (
        ORDER BY cs.total_sales DESC
    ) AS sales_rank
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id;
    
-- ======================================
-- MINI PROJECT: CUSTOMER SALES INSIGHTS
-- ======================================

-- ----------------------
-- 1. Top 5 Customers
-- ----------------------

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT * FROM (
    SELECT *,
           RANK() OVER (ORDER BY total_sales DESC) AS rnk
    FROM customer_sales
) t
WHERE rnk <= 5;

-- ----------------------
-- 2. Bottom 5 Customers
-- ----------------------

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT * FROM (
    SELECT *,
           RANK() OVER (ORDER BY total_sales ASC) AS rnk
    FROM customer_sales
) t
WHERE rnk <= 5;

-- ------------------------------------
-- 3. Customers Who Made Only One Order
-- -------------------------------------

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = 1;

-- -------------------------------------
-- 4. Customers With Above Average Sales
-- -------------------------------------

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- ------------------------------------
-- 5. Highest Order Value Per Customer
-- ------------------------------------
SELECT
    customer_id,
    MAX(CAST(sales AS DECIMAL(10,2))) AS highest_order
FROM orders
GROUP BY customer_id;