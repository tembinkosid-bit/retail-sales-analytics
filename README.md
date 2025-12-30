Retail Sales Analytics Project
Overview

This project demonstrates a Retail Sales Analytics solution using SQL and Power BI. It covers sales, customer, product, and inventory data to provide actionable business insights. The solution includes:

Fact table: fact_sales – transactional sales data, including returns and net sales calculations.

Dimension tables:

dim_customers – customer demographics and type.

dim_products – product details and categories.

dim_inventory – stock levels and supplier information.

Power BI report: Interactive dashboards with sales, revenue, and inventory insights.

Objectives

Analyze customer behavior by type, gender, and purchase patterns.

Identify top-performing products and product categories.

Track inventory levels and low-stock items.

Evaluate sales performance by store and month.

Support business decisions with actionable visualizations.

Project Structure
retail-sales-analytics-powerbi/
│
├─ data/                   # Optional sample CSVs (anonymized)
├─ SQL/                    # SQL scripts to create and load tables
├─ reports/                # Power BI .pbix file
├─ documentation/          # Screenshots, dashboards, and notes
└─ README.md

Key Features

Customer Analysis

Number of customers per type and gender

Top 5 customers by total sales

Customers with returns and total return value

Product Analysis

Top-selling products by quantity

Revenue by product category

Unsold products identification

Inventory Analysis

Products below reorder level or low stock

Stock quantity per supplier

Sales & Revenue

Total sales revenue per month

Average sales per store

Highest sales day analysis

Multi-Table Analysis

Combined insights across customers, products, and stores

Net and gross sales calculation with returns

DAX Measures (Power BI)

Gross Sales

SUMX(Fact_Sales, Fact_Sales[Quantity] * Fact_Sales[Price])


Return Sales

SUMX(Fact_Sales, IF(Fact_Sales[Quantity] < 0, ABS(Fact_Sales[Quantity] * Fact_Sales[Price]), 0))


Net Sales

SUMX(Fact_Sales, Fact_Sales[Quantity] * Fact_Sales[Price])


Monthly Net Sales

CALCULATE([Net Sales], VALUES(Dim_Date[Year-Month]))

Tools & Technologies

Database: SQL Server

ETL / Data Cleaning: Python (Pandas)

Analytics & Visualization: Power BI Desktop

Version Control: Git & GitHub

Usage

Load SQL scripts from SQL/ folder to recreate the database and tables.

Open reports/ Power BI file and connect to your SQL database.

Refresh data to see updated visuals and metrics.

Explore dashboards and filters for insights on customers, products, inventory, and sales.

Author

Tembinkosi Vikani Dube
LinkedIn 
 | GitHub
