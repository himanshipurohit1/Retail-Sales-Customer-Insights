--Question 1: Which region generates the most revenue?
select region from sales where sales = (select max(sales) from sales);

--Question 2: Who are our most valuable customers?
select customer_name , sum(sales) as total_sales from sales group by customer_name order by total_sales desc limit 10; 

--Question 3: Which product category drives the most sales
select category , sum(sales) as most_sales from sales group by category order by most_sales desc limit 1;


--Question 4: Which specific product types sell the most?
select sub_category , sum(sales) as most_sales from sales group by sub_category order by most_sales desc limit 1;


--Question 5: What is the average shipping delay?
select avg(ship_days) from sales;


--Question 6: Which shipping mode is fastest on average?
select ship_mode, avg(ship_days) from sales group by ship_mode order by avg(ship_days) limit 1 ;


--Question 7: Which customer segment brings the most revenue?
select segment, sum(sales) as total_sales from sales group by  segment order by total_sales desc limit 1;


--Question 8: Which states contribute the most sales?
select state, sum(sales) as total_sales from sales group by  state order by total_sales desc limit 5;


--Question 9: Which cities generate the most revenue?
select city, sum(sales) as total_sales from sales group by  city order by total_sales desc limit 5;


--Question 10: How are sales changing month over month?
SELECT year , month, SUM(Sales) AS TotalSales FROM sales GROUP BY year, month ORDER BY year, month;


--Question 11: How many customers place multiple orders?

with tab_1 as(
select customer_name, count(order_id)  from sales group by customer_name having count(order_id)> 1)
select count(*) from tab_1;

--Question 12: What is the average revenue per order?

with tab_1 as(
select order_id , sum(sales) as total_sales from sales group by order_id)
select avg(total_sales) from tab_1;

--Question 13: Are we acquiring new customers or relying on repeat ones?

with new_cust as(
select customer_id, min(year) as Year from sales group by customer_id)
select Year, count(*) from new_cust group by year order by year;

--Question 14: What % of total sales comes from each category?

select category, sum(sales) as category_sales, (sum(sales) *100.00/(select sum(sales) from sales)) as percentage_sales
from sales group by category;


--Question 15: Are shipping times getting worse or better over time?
select avg(ship_days) , year from sales group by year order by year;