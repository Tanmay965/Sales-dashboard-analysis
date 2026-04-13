CREATE DATABASE sales_project_final;

use sales_project_final;

#Create Table Structure
CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    ship_date DATE,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales FLOAT,
    quantity INT,
    profit FLOAT
);

SELECT * FROM orders LIMIT 10;

SELECT * FROM superstore_data LIMIT 10;

#Total Sales & Profit
SELECT 
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore_data;

#Region-wise Sales
SELECT 
    Region,
    SUM(Sales) AS total_sales
FROM superstore_data
GROUP BY Region;

#Category-wise Profit
SELECT 
    Category,
    SUM(Profit) AS total_profit
FROM superstore_data
GROUP BY Category;

#Region-wise Sales (Sorted)
SELECT 
    Region,
    SUM(Sales) AS total_sales
FROM superstore_data
GROUP BY Region
ORDER BY total_sales DESC;

#Monthly Sales Trend
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%Y-%m-%d'), '%Y-%m') AS month,
    SUM(Sales) AS total_sales
FROM superstore_data
GROUP BY month
ORDER BY month;

#Top 10 Products by Sales
SELECT 
    `Product Name`,
    SUM(Sales) AS total_sales
FROM superstore_data
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

#Loss-Making Products
SELECT 
    `Product Name`,
    SUM(Profit) AS total_profit
FROM superstore_data
GROUP BY `Product Name`
HAVING total_profit < 0
ORDER BY total_profit;

SELECT * FROM superstore_data;