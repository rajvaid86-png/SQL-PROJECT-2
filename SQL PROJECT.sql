use SQL_Project2;

select * from customers where state='Uttar Pradesh';

select product_name, price from products order by price desc limit 10;

select * from orders where year(order_date)='2025';

select gender,count(gender) from customers group by gender;

select distinct category from products;


SELECT c.state, round((o.total_price),0) AS total_revenue
FROM orders ord
INNER JOIN order_details o ON ord.order_id = o.order_id
INNER JOIN customers c ON ord.customer_id = c.customer_id
GROUP BY c.state;

select customers.first_name, customers.last_name, sum(order_details.total_price) as total_spending
from customers
inner join orders
on customers.customer_id = orders.customer_id
inner join order_details
on orders.order_id = order_details.order_id
group by customers.first_name, customers.last_name
order by total_spending desc
limit 5;


select p.product_name, ord.quantity as large_quantity from products p
inner join order_details ord
on p.product_id = ord.product_id
order by large_quantity desc
limit 1;

select payment_method, count(payment_method) as total_no_of_payments
from orders
group by payment_method;

select * from customers
left join orders
on customers.customer_id = orders.customer_id
where orders.order_id is null;

select c.state, avg(datediff(delivery_date,order_date)) as average_time from orders o
inner join customers c
on c.customer_id = o.customer_id
group by state;

select p.product_name, count(r.return_id) as total_return
from products p inner join order_details ord on
p.product_id = ord.product_id
inner join returns r on
ord.order_detail_id = r.order_detail_id
group by p.product_name
order by total_return
limit 10;

select o.order_id, ord.discount_percent
from order_details ord inner join orders o
on o.order_id = ord.order_id
where discount_percent>20;

select c.first_name, count(p.category) total_category
from customers c inner join orders o
on c.customer_id = o.customer_id
inner join order_details ord
on ord.order_id= o.order_id
inner join products p
on p.product_id = ord.product_id
group by c.customer_id
having total_category;

select date_format(order_date,'%y-%m') as months,
	sum(total_price)as total_revenue,
	count(o.order_id)as total_orders,
    avg(total_price)as avg_order_value
from orders o inner join order_details ord
on ord.order_id = o.order_id
group by date_format(order_date,'%y-%m') 
order by months;  
