# Consumer-Goods-Ad-Hoc-Insights
## Project Overview and Problem Statement
Atliq Hardware (imaginary company) is one of the leading computer hardware producers in India and well expanded in other countries too, specializes in selling computers and accessories.

The management noticed that they did not get enough insights to make quick and smart data-informed decisions. However, Tony Sharma (Data Analytics Director ) wants to expand their data analytics team by adding several junior data analysts. So he decided to conduct a SQL challenge which will help him understand both tech and soft skills

Now the company wants insights for 10 ad hoc / business requests.

This project is part of the data analytics boot camp at codebasics.

## Data Structure/ Data Modeling and Tools
The 'gdb023' (atliq_hardware_db) database was provided to me to work on and it includes six main tables:

dim_customer: contains customer-related data
dim_product: contains product-related data
fact_gross_price: contains gross price information for each product
fact_manufacturing_cost: contains the cost incurred in the production of each product
fact_pre_invoice_deductions: contains pre-invoice deductions information for each product
fact_sales_monthly: contains monthly sales data for each product.
Here is the Data Model that I have created in Power BI for the Visualization part -

![Screenshot (176)](https://github.com/user-attachments/assets/301cf61b-71cc-41d9-bd1c-0bc0c0a81b42)

Tools used -

I used My SQL to answer the questions
and Power BI for visualization

## 10 Ad-Hoc Requests and Answers:
### 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
![Screenshot (164)](https://github.com/user-attachments/assets/ebba7303-55d3-48ad-8c4e-e9e4affc5a9f)

### 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, unique_products_2020, unique_products_2021, percentage_chg

![Screenshot (165)](https://github.com/user-attachments/assets/843f3f6d-d46e-4788-93a1-e84bc8a388f2)

### 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, segment product_count

![Screenshot (167)](https://github.com/user-attachments/assets/68b96f75-6169-4699-92c0-5fee83687aab)

### 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020, product_count_2021, difference

![Screenshot (168)](https://github.com/user-attachments/assets/7547bcfd-7451-4a65-896f-6af6b6f001a4)

### 5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, product_code, product, manufacturing_cost
![Screenshot (169)](https://github.com/user-attachments/assets/ba6639a8-6825-4bd1-a52b-4c583b60742a)

### 6. Generate a report that contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields, customer_code, customer, average_discount_percentage

![Screenshot (171)](https://github.com/user-attachments/assets/8692a537-4bd2-4d08-9914-798c9e2571fb)

### 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and make strategic decisions. The final report contains these columns: Month, Year, Gross sales Amount

![Screenshot (177)](https://github.com/user-attachments/assets/feb1f1dc-7f0c-487d-8b00-fb22e6dee986)

![Screenshot (178)](https://github.com/user-attachments/assets/4e4afd54-2683-4f5c-ba5b-ab76db8c838d)

### 8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, --> Quarter, total_sold_quantity

![Screenshot (173)](https://github.com/user-attachments/assets/f88600c5-970b-4d71-9240-33113028b6a7)

### 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields --> channel, gross_sales_mln, percentage

![Screenshot (174)](https://github.com/user-attachments/assets/6dfa1bcd-4304-4b5a-99bd-c0dea6adaae6)
### 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields, division, product_code

![Screenshot (175)](https://github.com/user-attachments/assets/86aba00c-1a03-49b3-8507-144f462c9437)


Note-

[ad-hoc-requests.pdf](https://github.com/madhu1297/Consumer-Goods-Ad-Hoc-Insights/blob/main/ad-hoc-requests.pdf) In this file, you will find all the Questions

[AD_HOC_REQUEST.sql](https://github.com/madhu1297/Consumer-Goods-Ad-Hoc-Insights/blob/main/AD_HOC_REQUEST.sql) In this file you will find all the Answers.

