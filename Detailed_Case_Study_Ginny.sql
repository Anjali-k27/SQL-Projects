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

