-- total sales by state
select to_char(date_trunc('month', order_date), 'Month' ) AS month, round(sum(sales),2) as total_sales
from orders 
group by month  
order by total_sales desc;

-- sales by manager
select p.person as manager, round(sum(o.sales),2) as sales
from people p
join orders o
on o.region = p.region
group by manager
order by sales desc

-- Sales by Product category over time
select category, round(sum(sales),2) as sales
from orders
group by category  
order by sales desc

-- Sales and Profit by Customer
select p.person as manager, round(sum(o.sales),2) as sales, round(sum(o.profit),2) as profit
from people p
join orders o
on o.region = p.region
group by p.person
order by sales desc

-- Most Sales by Product Category
select to_char(date_trunc('month', order_date), 'Month' ) AS month, category, round(sum(sales),2) as sales
from orders
group by category, month
order by sales desc 
