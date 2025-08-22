CREATE TABLE US_superstore (
  OrderID TEXT,
  OrderDate DATE,
  ShipDate DATE,
  ShipMode TEXT,
  CustomerID TEXT,
  CustomerName TEXT,
  Segment TEXT,
  Country TEXT,
  City TEXT,
  State TEXT,
  PostalCode TEXT,
  Region TEXT,
  ProductID TEXT,
  Category TEXT,
  SubCategory TEXT,
  ProductName TEXT,
  Sales NUMERIC,
  Quantity INTEGER,
  Discount NUMERIC,
  Profit NUMERIC
);

COPY US_superstore
FROM 'C:\tmp\US Superstore data.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- KPIs

SELECT
    ROUND(SUM(sales),2 )AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_revenue,
    ROUND(SUM(Profit) / SUM(Sales),2) * 100  AS Profit_margin,
    SUM(Quantity) AS Total_quantity_sold,
    COUNT(DISTINCT OrderID) AS Total_orders_recieved,
    COUNT(DISTINCT CustomerID) AS Total_customers,
    COUNT(OrderID) / COUNT(DISTINCT CustomerID) AS  Orders_per_Customer
FROM US_superstore;

 SELECT 
    COUNT(*) AS loss_or_no_profit_orders
FROM us_superstore
WHERE profit <= 0;



--1. Which Categories Have the Highest Total Sales?

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM 
    US_superstore
GROUP BY 
    Category
ORDER BY 
    total_sales DESC;

--2. Which Customers Made More Than 3 Orders

SELECT
    CustomerID,
    CustomerName,
   COUNT(orderid) AS Total_Orders,
   SUM(Sales) AS Total_Sales
FROM US_superstore
GROUP BY CustomerName, CustomerID
HAVING COUNT(orderid) > 3
ORDER BY Total_Orders DESC;

--3. Which Region Generates the Highest Average Profit per Order?

SELECT
    region,
    ROUND(AVG(Profit),2) AS Avg_profit
FROM US_superstore 
GROUP BY region
ORDER BY Avg_profit DESC;

--4.  Orders with Negative or Zero Profit?

SELECT
    OrderID,
    ProductName,
    SUM(Profit) AS negative_profit
FROM US_superstore
WHERE profit < 0
GROUP BY OrderID, ProductName
ORDER BY negative_profit;

--5. What Are Monthly Sales Trends?

SELECT 
    TO_CHAR(ShipDate, 'Month') AS Monthlysales,
    SUM(sales) AS Total_sales
FROM US_superstore
GROUP BY Monthlysales
ORDER BY Monthlysales DESC

--6. What Percent of Sales Come From Each Category?

SELECT
    Category,
    ROUND(
        (SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM US_superstore)),
        2
    ) AS percent_of_sales
FROM US_superstore
GROUP BY Category
ORDER BY percent_of_sales DESC;

--7. Which Sub-Category Gives the Highest Profit Margin?
SELECT 
    SubCategory,
    SUM(profit) as Totalprofit
FROM US_superstore
GROUP BY SubCategory
ORDER BY Totalprofit DESC
LIMIT 10

--8. Segment product and customers as ‘High Value’ or ‘Low Value’ Based on Sales

SELECT
    ProductName,
    SUM(Sales) AS total_sales,
    CASE 
        WHEN SUM(Sales) > 5000 THEN 'High Value Product'
        ELSE 'Low Value Product'
    END AS product_segment
FROM US_superstore
GROUP BY ProductName
ORDER BY total_sales DESC;


-- customers
SELECT
  customername,
    SUM(Sales) AS total_sales,
    CASE 
        WHEN SUM(Sales) > 5000 THEN 'High Value'
        ELSE 'Low Value'
    END AS product_segment
FROM US_superstore
GROUP BY customername
ORDER BY total_sales DESC;


--9.  Year-to-Year Sales Comparison (2014–2017)

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS year,
    SUM(Sales) AS total_sales
FROM US_superstore
WHERE EXTRACT(YEAR FROM OrderDate) = 2014
GROUP BY EXTRACT(YEAR FROM OrderDate)

UNION

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS year,
    SUM(Sales) AS total_sales
FROM US_superstore
WHERE EXTRACT(YEAR FROM OrderDate) = 2015
GROUP BY EXTRACT(YEAR FROM OrderDate)

UNION

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS year,
    SUM(Sales) AS total_sales
FROM US_superstore
WHERE EXTRACT(YEAR FROM OrderDate) = 2016
GROUP BY EXTRACT(YEAR FROM OrderDate)

UNION

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS year,
    SUM(Sales) AS total_sales
FROM US_superstore
WHERE EXTRACT(YEAR FROM OrderDate) = 2017
GROUP BY EXTRACT(YEAR FROM OrderDate)

ORDER BY year DESC;

--10. Top 10 Cities with the highest sales
SELECT
    City,
    SUM(sales) as Total_sales
FROM us_superstore
GROUP BY City
ORDER BY Total_sales DESC
LIMIT 10
