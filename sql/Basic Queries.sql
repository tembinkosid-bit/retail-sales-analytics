--Customer Analysis

	--1)Count how many customers exist per customer_type and gender.
	select
		COUNT(customer_id) as Nr_of_Customers,
		customer_type,
		gender
	from dim_customer
	group by customer_type,
			 gender; 

	--2)Identify the top 5 customers by total sales amount.
	select top 5
			c.customer_id,
			c.name,
			SUM(s.quantity*s.price) as total_sales_amnt
	from dim_customer as c
	left join fact_sales as s on c.customer_id= s.customer_id
	group by c.customer_id,
			 c.name
	order by total_sales_amnt desc;

	--3)Find customers who have made returns (negative quantity) and the total value of their returns.
	select 
			c.customer_id,
			c.name,
			SUM(s.quantity*s.price) as total_sales_amnt
	from dim_customer as c
	left join fact_sales as s on c.customer_id= s.customer_id
	where s.quantity < 0
	group by c.customer_id,
			 c.name
	order by total_sales_amnt ;

--Product Analysis

	--1)List the top 10 best-selling products by total quantity sold.
		select top 10
				p.product_id,
				P.product_name,
				SUM(s.quantity) as total_qty
		from dim_products as p
		join fact_sales as s on p.product_id=s.product_id
		group by p.product_id,
				 P.product_name
		order by total_qty;

	--2)Show total revenue per product category.
		select 
				P.category,
				SUM(s.quantity*s.price) as total_sales_amnt
		from dim_products as p
		left join fact_sales as s on p.product_id=s.product_id
		group by p.category
		order by total_sales_amnt;

	--3)Identify products that have never been sold.
		select 
			p.product_id,
			P.product_name,
			SUM(s.quantity) as total_qty
		from dim_products as p
		left join fact_sales as s on p.product_id=s.product_id
		group by p.product_id,
				 P.product_name
		having  SUM(s.quantity*s.price) is null
		order by total_qty;

--Inventory Analysis

	--1)List products that are below reorder level (if you have that data) or have low stock quantity.
	SELECT
    product_id,
    CAST(CAST(COALESCE(stock_quantity, '0') AS FLOAT) AS INT) AS stock_quantity,
    reorder_level
	FROM dim_inventory
	WHERE CAST(CAST(COALESCE(stock_quantity, '0') AS FLOAT) AS INT) < reorder_level;


	--2)Show total stock quantity per supplier.
	SELECT
    supplier_id,
    CAST(SUM(CAST(COALESCE(stock_quantity, '0') AS FLOAT)) AS INT) AS total_stock
	FROM dim_inventory
	GROUP BY supplier_id;

--Sales & Revenue

	--1)Total sales revenue per month for the last 6 months.
	select
		MONTH(date)as month_date,
		SUM(quantity*price) as total_sales_revenue
	from fact_sales
	where date >= DATEADD(MONTH, -6, GETDATE())
	group by MONTH(date) 
	order by MONTH(date) desc;

	--2)Average sales per store.
	select
			store_id,
			avg(quantity*price) as avg_sales
	from fact_sales
	group by store_id

	--3)Highest sales day (date) overall.
	select top 1
			date,
			SUM(quantity*price) as sales
	from fact_sales
	group by date
	order by sales desc

--Joins / Multi-table Analysis

	--1)Show customer name, product name, quantity, and total amount for all sales.
	SELECT
    c.name,
    p.product_name,
    MAX(CAST(CAST(COALESCE(i.stock_quantity, '0') AS FLOAT) AS INT)) AS stock_quantity,
    SUM(s.quantity * s.price) AS total_sales_amt
	FROM dim_customer AS c
	LEFT JOIN fact_sales AS s ON c.customer_id = s.customer_id
	LEFT JOIN dim_products AS p ON s.product_id = p.product_id
	LEFT JOIN dim_inventory AS i ON p.product_id = i.product_id
	GROUP BY c.name, p.product_name;

	--2)Total revenue per store per product category.
	SELECT
    s.store_id,
    p.category,
    SUM(s.quantity * s.price) AS total_revenue
	FROM fact_sales AS s
	LEFT JOIN dim_products AS p ON s.product_id = p.product_id
	GROUP BY s.store_id, p.category
	ORDER BY s.store_id, total_revenue DESC;

	--3)Customers who purchased products from more than 1 category.
	SELECT
    c.name,
    COUNT(DISTINCT p.category) AS num_categories
	FROM dim_customer AS c
	LEFT JOIN fact_sales AS s ON c.customer_id = s.customer_id
	LEFT JOIN dim_products AS p ON s.product_id = p.product_id
	GROUP BY c.name
	HAVING COUNT(DISTINCT p.category) > 1;
