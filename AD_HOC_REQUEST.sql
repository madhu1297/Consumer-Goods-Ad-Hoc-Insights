#Q1
SELECT distinct market
 FROM dim_customer 
 WHERE customer =  "Atliq Exclusive" AND region = "APAC";
 
 #Q2
with cte1 AS(
	SELECT 
    fiscal_year,
    count(distinct product_code) as unique_products_2020 
    FROM fact_sales_monthly
    WHERE fiscal_year = 2020
    group by fiscal_year
),
cte2 AS(
	SELECT 
    fiscal_year,
    count(distinct product_code) as unique_products_2021
    FROM fact_sales_monthly
    WHERE fiscal_year = 2021
    group by fiscal_year
)
SELECT 
	unique_products_2020,
    unique_products_2021,
    round((unique_products_2021-unique_products_2020)/unique_products_2020*100,2) AS percentage_chg
    FROM cte1
    CROSS JOIN cte2;
 
 #Q3
SELECT  segment, count(distinct(product_code)) as product_code
from dim_product
group by segment
order by product_code desc;


#Q4
WITH CTE1 AS(
	select p.segment, 
	COUNT(DISTINCT p.product_code) AS product_count_2020
    FROM dim_product p
    JOIN fact_sales_monthly s
    ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2020
    group by p.segment
),
CTE2 AS(
	select p.segment, 
	COUNT(DISTINCT p.product_code) AS product_count_2021
    FROM dim_product p
    JOIN fact_sales_monthly s
    ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2021
    group by p.segment
)
SELECT CTE1.segment,
product_count_2020,
product_count_2021,
(product_count_2021-product_count_2020) AS difference
FROM CTE1
JOIN CTE2 
ON CTE1.segment = CTE2.segment
ORDER BY difference;

# Q5
WITH MAX_COST AS (
SELECT p.product_code,p.product,m.manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
WHERE m.manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)),
MIN_COST AS (
SELECT p.product_code,p.product,m.manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
WHERE m.manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost))
SELECT * FROM MAX_COST
UNION
SELECT * FROM MIN_COST;

#Q6
SELECT 
		DISTINCT(customer_code),
        customer,
        ROUND(AVG(pre_invoice_discount_pct),2)*100 as avg_discount_pct
FROM dim_customer c
JOIN fact_pre_invoice_deductions p
USING (customer_code)
WHERE fiscal_year= 2021
AND market= "India"
GROUP BY customer_code, customer
ORDER BY avg_discount_pct desc
LIMIT 5;

# Q7
SELECT MONTHNAME(s.date) AS month, s.fiscal_year, CONCAT(ROUND(SUM((s.sold_quantity*g.gross_price))/1000000,2)," M") AS gross_sales
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price g
ON s.product_code = g.product_code
WHERE c.customer = "Atliq Exclusive"
GROUP BY  MONTHNAME(s.date), s.fiscal_year
ORDER BY fiscal_year;

#Q8
SELECT 
CASE	
WHEN MONTH(date) IN (9,10,11) THEN "Q1"
WHEN MONTH(date) IN (12,1,2) THEN "Q2"
WHEN MONTH(date) IN (3,4,5) THEN "Q3"
WHEN MONTH(date) IN (6,7,8) THEN "Q4"
END AS quarters,
CONCAT(round(SUM(sold_quantity)/1000000,2), " M") as total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
group by quarters
order by total_sold_quantity DESC;

# Q9
WITH CTE AS (
    SELECT 
        c.channel, 
        ROUND(SUM(g.gross_price * s.sold_quantity) / 1000000, 2) AS gross_sales_mln,
        SUM(SUM(g.gross_price * s.sold_quantity) / 1000000) OVER () AS total_gross_sales_mln
    FROM 
        fact_sales_monthly s
    JOIN 
        dim_customer c
    ON 
        s.customer_code = c.customer_code 
    JOIN 
        fact_gross_price g
    ON 
        s.product_code = g.product_code
    WHERE 
        s.fiscal_year = 2021
    GROUP BY 
        c.channel
)
SELECT 
    channel, 
    gross_sales_mln, 
    CONCAT(ROUND((gross_sales_mln / total_gross_sales_mln) * 100, 2), "%") AS pct
FROM 
    CTE
ORDER BY 
    gross_sales_mln DESC;
    
# 10 
WITH CTE AS(
SELECT p.division, s.product_code, p.product, CONCAT(ROUND(SUM(s.sold_quantity)/1000000,2), " M") as total_sold_quantity,
DENSE_RANK() OVER (PARTITION BY p.division ORDER BY SUM(s.sold_quantity) DESC) AS  rank_order
FROM dim_product p 
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY p.division, s.product_code, p.product)
SELECT * FROM CTE
WHERE rank_order <=3
ORDER BY division, rank_order;