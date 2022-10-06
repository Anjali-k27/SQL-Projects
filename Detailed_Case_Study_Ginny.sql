# INTRODUCTION 

/* Ginny is a big fan of Japanese food, so she decided to start a restaurant at the beginning of 2021 that sells his three favorite
foods: sushi, curry, and ramen.
 Ginny's Diner needs your help to stay afloat – the restaurant has collected some fundamental data from their few months of
operation but has no idea how to use it to help them operate the business.  */

# PROBLEM STATEMENT

/* Ginny wants to use the data to answer a few simple questions about his customers, especially about their:
● visiting patterns,
● how much money they’ve spent, and
● which menu items are their favorite.
This deeper connection with her customers will help her deliver a better and more personalized experience for her loyal
customers.
She plans on using these insights to help him decide whether she should expand the existing customer loyalty program.
Additionally, she needs help to generate some essential datasets so her team can quickly inspect the data without needing to
use SQL.

The data set contains the following three tables, which you may refer to in the relationship diagram below to understand the
connection:
● sales
● members
● menu 
*/

# CREATING OUR DATABASE FOR THE CASE STUDY AND ANALYSIS

CREATE database Detailed_Case_Study;

CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');

# QUERY 1

# What is the total amount each customer spent at the restaurant?
with data as (select s.customer_id, s.product_id, m.price
from sales s
left join menu m
on s.product_id=m.product_id)
select customer_id, sum(price) as total_spent from data group by 1;

# QUERY 2

# How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) as num_visit_days
from sales
group by 1;

# QUERY 3

# What was the first item from the menu purchased by each customer?
with data as (
select s.*, m.product_name,
rank() over(partition by s.customer_id order by s.order_date) as ord_Rank
from sales s
left join menu m
on s.product_id=m.product_id)
select customer_id, product_name from data where ord_Rank=1 group by 1,2;

# QUERY 4

# What is the most purchased item on the menu and how many times was it purchased by all customers?
select m.product_name, count(s.product_id) as num_purchase
from sales as s
left join menu as m
on s.product_id=m.product_id
group by 1
order by 2 desc
limit 1;

# QUERY 5

# Which item was the most popular one for each customer?
with data as 
(select customer_id, product_name, order_amount, rank() over(partition by customer_id order by order_amount desc) as ord_rank from 
(select s.customer_id, 
       count(s.product_id) as order_amount, 
       m.product_name 
from sales as s 
left join menu as m 
on s.product_id=m.product_id
group by 1, s.product_id
order by 3 desc) as a) 
select customer_id, product_name, order_amount from data where ord_rank=1;

# QUERY 6

/* Which item was purchased first by the customer after they became a member?
Note: Assumption to consider is Customer's join date does not mean that customer ordered on that date. */
with cte as (select * from (select s.*, m.join_date, me.product_name from sales as s
left join members as m
on s.customer_id=m.customer_id
left join menu as me
on s.product_id=me.product_id) as a
where join_date is not null)
select customer_id, product_name, min(order_date) as first_purchase from cte where order_date>join_date group by 1;

# QUERY 7

# Which item was purchased right before the customer became a member?
select customer_id, product_name, order_date from (
with cte as 
(select * from (select s.*, m.join_date, me.product_name
from sales as s
left join members as m
on s.customer_id=m.customer_id
join menu as me
on s.product_id=me.product_id) as a
where join_date is not null and order_date<join_date)
select *, rank() over(partition by customer_id order by order_date desc) as ord_rank from cte) as b
where ord_rank=1;

# QUERY 8

# What is the total number of items and amount spent for each member before they became a member?
with cte as 
(select s.* , m.product_name, m.price, me.join_date
from sales as s
left join menu as m
on s.product_id=m.product_id
join members as me
on s.customer_id=me.customer_id)
select customer_id, product_name, count(distinct product_name) as num_of_items, sum(price) as total_spent
from cte
where join_date>order_date
group by 1;

# QUERY 9

# If each customers’ $1 spent equates to 10 points and sushi has a 2x points multiplier — how many points would each customer have?
select customer_id, sum(points_earned) as total_points from (
select s.customer_id,
case 
	when m.product_name='sushi' then 20*m.price else 10*m.price
    end as points_earned
from sales as s
left join menu as m
on s.product_id=m.product_id) sub
group by 1;

# QUERY 10

/* In the first week after a customer joins the program, (including their join date) they earn 2x points on all items; not just sushi —
how many points do customer A and B have at the end of Jan21?
Note :here you can use a concept of interval function which returns the index of the argument that is more than the first
argument meaning It returns 0 if 1st number is less than the 2nd number and 1 if 1st number is less than the 3rd number and so
on or -1 if 1st number is null */
with cte as (select s.*, m.product_name, m.price, me.join_date,
case 
	when s.order_date between me.join_date and date_add(me.join_date, interval 6 day) then 20*m.price
	when m.product_name='sushi' then 20*m.price 
    else 10*m.price
    end as point_earned
from sales as s
left join menu as m
on s.product_id=m.product_id
inner join members as me
on s.customer_id=me.customer_id
)
select customer_id, sum(point_earned) as total_points
from cte
where order_date<='2021-01-31'
group by 1;

















