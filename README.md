
---

# Retail Sales Analytics

  <img width="751" height="485" alt="retail-sales-analytics" src="https://github.com/user-attachments/assets/838639b2-e50e-44c1-989d-9420df4c515e" />


 
**Project Overview**
This project demonstrates retail sales analytics using SQL, Python, and Power BI. It includes data cleaning, transformation, analysis, and visualization of sales, customer, product, and inventory data to generate actionable business insights.

**Dataset**

* `fact_sales.csv` – Contains sales transactions, including quantity, price, customer, product, and store details.
* `dim_customers.csv` – Customer dimension with demographics and customer type.
* `dim_products.csv` – Product dimension with product details and categories.
* `dim_inventory.csv` – Inventory dimension with stock levels and supplier information.

**Technologies & Tools**

* **SQL Server** – Database creation, ETL, and querying.
* **Python** – Data cleaning, preparation, and staged CSV exports using Pandas.
* **Power BI** – Reporting, dashboards, and visual analytics.

**Key Analyses Performed**

1. Customer analysis: count per type/gender, top customers, and return patterns.
2. Product analysis: top-selling products, revenue per category, and unsold items.
3. Inventory analysis: stock levels and supplier-wise quantities.
4. Sales & revenue: monthly totals, average per store, highest sales days.
5. Multi-table analysis: customer-product-sales joins for detailed insights.

**Project Structure**

```
retail-sales-analytics/
│
├─ data/
│   ├─ raw/          # Original CSV files
│   ├─ staged/       # Cleaned and prepared CSVs
│   └─ processed/    # CSVs ready for SQL or Power BI
│
├─ sql/              # SQL scripts for table creation and queries
├─ python/           # Python scripts for data cleaning and ETL
└─ README.md         # Project overview and instructions
```

**How to Use**

1. Load CSV files into SQL Server or use Python scripts to clean and stage the data.
2. Run SQL queries for analysis or connect tables to Power BI for visual dashboards.
3. Explore dashboards to gain insights into sales, customers, products, and inventory trends.

**Author**
Tembinkosi Vikani Dube – Data Analytics & Engineering

**Links**

* [LinkedIn](https://www.linkedin.com/in/tembinkosi-vikani-dube)
* [GitHub Portfolio](https://github.com/tembinkosid-bit/retail-inventory-analytics)

---

