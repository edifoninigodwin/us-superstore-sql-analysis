# US Superstore Sales Data Analysis



This project focuses on analyzing the US Superstore dataset using SQL.  
The goal is to uncover customer behavior, sales performance, profit patterns, and regional differences that can help improve business strategies.

The dataset contains order details, including sales, profit, discounts, customer information, and product categories. With SQL queries, we can answer business questions and generate insights around customer segmentation, product performance, and sales trends.

---

## Purpose of the Project

The main objective of this project is to perform **SQL-based data analysis** on the US Superstore dataset to answer important business questions, such as:

- Identify customer purchasing patterns  
- Evaluate sales and profit performance across regions and categories  
- Detect negative profit scenarios  
- Classify customers and products into segments for better targeting 

---

## About the Data

The dataset represents retail sales transactions from a Superstore in the US. Below are the main fields:

| Column       | Description                          | Data Type    |
|--------------|--------------------------------------|--------------|
| OrderID      | Unique ID of the order               | TEXT         |
| OrderDate    | Date when the order was placed       | DATE         |
| ShipDate     | Date when the order was shipped      | DATE         |
| ShipMode     | Shipping method used                 | TEXT         |
| CustomerID   | Unique customer identifier           | TEXT         |
| CustomerName | Name of the customer                 | TEXT         |
| Segment      | Market segment (Consumer, Corporate) | TEXT         |
| Country      | Country of the order (US)            | TEXT         |
| City         | City of the customer                 | TEXT         |
| State        | State of the customer                | TEXT         |
| PostalCode   | Postal code of the customer          | TEXT         |
| Region       | Region (West, East, etc.)            | TEXT         |
| ProductID    | Unique product identifier            | TEXT         |
| Category     | Product category                     | TEXT         |
| SubCategory  | Product sub-category                 | TEXT         |
| ProductName  | Name of the product                  | TEXT         |
| Sales        | Total sales amount                   | NUMERIC      |
| Quantity     | Quantity sold                        | INTEGER      |
| Discount     | Discount applied                     | NUMERIC      |
| Profit       | Profit earned                        | NUMERIC      |

---

## Key Analyses Performed

1. **Sales & Profit KPIs**  
   - Total Sales  
   - Total Revenue  
   - Profit Margin  
   - Orders per Customer  

2. **Product & Category Insights**  
   - Top categories and sub-categories by sales & profit  
   - High-value vs. low-value products  

3. **Customer Insights**  
   - High-value vs. low-value customers  
   - Customers with multiple repeat orders  

4. **Regional & City Analysis**  
   - Regions generating the highest average profit  
   - Top 10 cities with the most sales  

5. **Profitability**  
   - Orders with negative or zero profit  
   - Discount impact on profitability  

6. **Time-Based Trends**  
   - Monthly sales trends  
   - Year-over-year sales growth (2014–2017)  

---

## Approach Used

1. **Database Creation**  
   - Created a SQL database and loaded the dataset using `COPY`.  

2. **Data Cleaning**  
   - Verified missing values and ensured consistency across fields.  

3. **Exploratory Data Analysis (EDA)**  
   - Wrote SQL queries to answer key business questions.  
 

---

## Business Questions to Answer

1. Which customers place the most orders?
2. Which regions bring in the highest average sales?
3. Are there orders that generate losses, and why?
4. Which product categories are most profitable?
5. How do sales compare across years (2014–2017)?
6. How can we classify customers into segments (high vs low value)? 

---


