select
		Format(s.date,'yyyy-MM') as Year_Month,
		s.customer_id,
		s.store_id,
		c.name,
		c.gender,
		c.customer_type,
		p.product_name,
		p.category,
		SUM(CASE WHEN s.quantity > 0 THEN s.quantity ELSE 0 END) AS gross_quantity,
		SUM(CASE WHEN s.quantity < 0 THEN ABS(s.quantity) ELSE 0 END) AS return_quantity,
		SUM(s.quantity) AS net_quantity,
		SUM(CASE WHEN s.quantity > 0 THEN s.quantity*s.price ELSE 0 END) AS gross_sales,
		SUM(CASE WHEN s.quantity < 0 THEN ABS(s.quantity*s.price) ELSE 0 END) AS return_sales,
		SUM(s.quantity*s.price) AS net_sales
from fact_sales as s
left join dim_customer as c on s.customer_id = c.customer_id
left join dim_products as p on s.product_id = p.product_id
group by s.customer_id,s.store_id,c.name,c.gender,c.customer_type,p.product_name,p.category, Format(s.date,'yyyy-MM')
order by Year_Month;






