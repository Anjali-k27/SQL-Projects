# SQL Capstone Project to Simulate real interview questions

## Question 1
**Sample Data**  
Table: `sales`  
| sale_id | rep_id | sale_amount | sale_date  |
|---------|--------|-------------|------------|
| 1       | 101    | 5000.00     | 2025-01-15 |
| 2       | 102    | 3000.00     | 2025-01-20 |
| 3       | 101    | 2000.00     | 2025-02-10 |
| 4       | 103    | 4000.00     | 2025-02-15 |
| 5       | 102    | 6000.00     | 2025-01-25 |

**Question**  
Write a query to find the top 2 sales reps in terms of total sales amount for each month.

---

## Question 2
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary | hire_date  |
|--------|----------|---------|--------|------------|
| 1      | Alice    | 10      | 60000  | 2023-05-01 |
| 2      | Bob      | 10      | 65000  | 2022-03-15 |
| 3      | Charlie  | 20      | 70000  | 2024-01-10 |
| 4      | David    | 20      | 62000  | 2023-07-20 |

**Question**  
Write a query to find employees who earn more than the average salary of their department.

---

## Question 3
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers who placed orders in consecutive months.

---

## Question 4
**Sample Data**  
Table: `products`  
| product_id | product_name | category | price |
|------------|--------------|----------|-------|
| 1          | Laptop       | Tech     | 1000  |
| 2          | Phone        | Tech     | 600   |
| 3          | Shirt        | Apparel  | 30    |
| 4          | Jacket       | Apparel  | 80    |

**Question**  
Write a query to find the top 1 product by price in each category.

---

## Question 5
**Sample Data**  
Table: `transactions`  
| trans_id | account_id | trans_date | amount | type |
|----------|------------|------------|--------|------|
| 1        | 301        | 2025-01-05 | 500    | D    |
| 2        | 301        | 2025-01-06 | 200    | W    |
| 3        | 302        | 2025-01-07 | 300    | D    |
| 4        | 301        | 2025-01-08 | 100    | W    |

**Question**  
Write a query to calculate the running balance for each account after each transaction (D = Deposit, W = Withdrawal).

---

## Question 6
**Sample Data**  
Table: `students`  
| student_id | course_id | grade |
|------------|-----------|-------|
| 1          | 101       | 85    |
| 1          | 102       | 90    |
| 2          | 101       | 78    |
| 2          | 103       | 92    |

**Question**  
Write a query to find students who have an average grade above 85 across all their courses.

---

## Question 7
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | manager_id |
|--------|----------|------------|
| 1      | Alice    | NULL       |
| 2      | Bob      | 1          |
| 3      | Charlie  | 1          |
| 4      | David    | 2          |

**Question**  
Write a query to list each employee and their manager’s name (self-join).

---

## Question 8
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-01-15 | NULL   |
| 3        | 202        | 2025-02-20 | 200    |
| 4        | 203        | 2025-03-05 | NULL   |

**Question**  
Write a query to replace NULL amounts with the average amount of non-NULL orders.

---

## Question 9
**Sample Data**  
Table: `logs`  
| log_id | action | log_time            |
|--------|--------|---------------------|
| 1      | Login  | 2025-01-10 08:00:00 |
| 2      | Logout | 2025-01-10 08:30:00 |
| 3      | Login  | 2025-01-10 09:00:00 |
| 4      | Logout | 2025-01-10 09:45:00 |

**Question**  
Write a query to calculate the total session time (from Login to Logout) for each session.

---

## Question 10
**Sample Data**  
Table: `inventory`  
| product_id | warehouse_id | quantity |
|------------|--------------|----------|
| 1          | 1001         | 50       |
| 1          | 1002         | 30       |
| 2          | 1001         | 20       |
| 2          | 1003         | 40       |

**Question**  
Write a query to find products that are stored in multiple warehouses.

---

## Question 11
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary | hire_date  |
|--------|----------|---------|--------|------------|
| 1      | Alice    | 10      | 60000  | 2023-05-01 |
| 2      | Bob      | 10      | 60000  | 2022-03-15 |
| 3      | Charlie  | 20      | 70000  | 2024-01-10 |
| 4      | David    | 20      | 70000  | 2023-07-20 |

**Question**  
Write a query to find employees with the same salary within the same department.

---

## Question 12
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | status |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | Shipped|
| 2        | 201        | 2025-02-15 | Pending|
| 3        | 202        | 2025-01-20 | Shipped|
| 4        | 203        | 2025-03-05 | Pending|

**Question**  
Write a query to find customers who have both ‘Shipped’ and ‘Pending’ orders.

---

## Question 13
**Sample Data**  
Table: `calls`  
| call_id | caller_id | receiver_id | call_duration |
|---------|-----------|-------------|---------------|
| 1       | 401       | 402         | 300           |
| 2       | 402       | 401         | 200           |
| 3       | 401       | 403         | 500           |
| 4       | 403       | 402         | 100           |

**Question**  
Write a query to calculate the total call duration between each pair of users (ignoring who initiated the call).

---

## Question 14
**Sample Data**  
Table: `projects`  
| project_id | emp_id | start_date | end_date   |
|------------|--------|------------|------------|
| 1          | 501    | 2025-01-01 | 2025-03-01 |
| 2          | 501    | 2025-02-15 | 2025-04-15 |
| 3          | 502    | 2025-01-10 | 2025-02-10 |
| 4          | 502    | 2025-03-01 | NULL       |

**Question**  
Write a query to find employees who worked on overlapping projects.

---

## Question 15
**Sample Data**  
Table: `sales`  
| sale_id | product_id | sale_date  | quantity |
|---------|------------|------------|----------|
| 1       | 601        | 2025-01-05 | 10       |
| 2       | 601        | 2025-01-06 | 5        |
| 3       | 602        | 2025-01-07 | 8        |
| 4       | 601        | 2025-01-08 | 12       |

**Question**  
Write a query to calculate the cumulative quantity sold for each product over time.

---

## Question 16
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | 20      | 62000  |

**Question**  
Write a query to find the second highest salary in each department.

---

## Question 17
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find the first order date and amount for each customer.

---

## Question 18
**Sample Data**  
Table: `attendance`  
| emp_id | log_date   | status |
|--------|------------|--------|
| 1      | 2025-01-01 | Present|
| 1      | 2025-01-02 | Absent |
| 1      | 2025-01-03 | Present|
| 2      | 2025-01-01 | Present|

**Question**  
Write a query to find employees with at least two consecutive absent days.

---

## Question 19
**Sample Data**  
Table: `products`  
| product_id | product_name | price | launch_date |
|------------|--------------|-------|-------------|
| 1          | Laptop       | 1000  | 2024-06-01  |
| 2          | Phone        | 600   | 2024-07-01  |
| 3          | Tablet       | 800   | 2024-08-01  |
| 4          | Smartwatch   | 300   | 2024-09-01  |

**Question**  
Write a query to find products launched in the last 6 months from today (2025-05-16).

---

## Question 20
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find the average order amount per customer, excluding their highest order.

---

## Question 21
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary | hire_date  |
|--------|----------|---------|--------|------------|
| 1      | Alice    | 10      | 60000  | 2023-05-01 |
| 2      | Bob      | 10      | 65000  | 2022-03-15 |
| 3      | Charlie  | 20      | 70000  | 2024-01-10 |
| 4      | David    | 20      | 62000  | 2023-07-20 |

**Question**  
Write a query to find the longest-serving employee in each department.

---

## Question 22
**Sample Data**  
Table: `sales`  
| sale_id | product_id | sale_date  | quantity |
|---------|------------|------------|----------|
| 1       | 601        | 2025-01-05 | 10       |
| 2       | 601        | 2025-01-06 | 0        |
| 3       | 602        | 2025-01-07 | 8        |
| 4       | 601        | 2025-01-08 | 12       |

**Question**  
Write a query to find days with zero sales for each product.

---

## Question 23
**Sample Data**  
Table: `users`  
| user_id | signup_date | last_login  |
|---------|-------------|-------------|
| 1       | 2024-01-01  | 2025-01-01  |
| 2       | 2024-02-01  | 2024-06-01  |
| 3       | 2024-03-01  | 2025-02-01  |
| 4       | 2024-04-01  | 2024-05-01  |

**Question**  
Write a query to find users who haven’t logged in for the last 6 months from today (2025-05-16).

---

## Question 24
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers whose total order amount exceeds the average total order amount across all customers.

---

## Question 25
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | NULL    | 62000  |
Table: `departments`  
| dept_id | dept_name |
|---------|-----------|
| 10      | HR        |
| 20      | IT        |
| 30      | Finance   |

**Question**  
Write a query to find departments with no employees and employees with no department.

---

## Question 26
**Sample Data**  
Table: `sales`  
| sale_id | rep_id | sale_amount | sale_date  |
|---------|--------|-------------|------------|
| 1       | 101    | 5000.00     | 2025-01-15 |
| 2       | 102    | 3000.00     | 2025-01-20 |
| 3       | 101    | 2000.00     | 2025-02-10 |
| 4       | 103    | 4000.00     | 2025-02-15 |

**Question**  
Write a query to find sales reps with no sales in a specific month (e.g., February 2025).

---

## Question 27
**Sample Data**  
Table: `products`  
| product_id | product_name | price |
|------------|--------------|-------|
| 1          | Laptop       | 1000  |
| 2          | Phone        | 600   |
| 3          | Tablet       | NULL  |
| 4          | Smartwatch   | 300   |

**Question**  
Write a query to update NULL prices to the average price of non-NULL products.

---

## Question 28
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find the month with the highest total order amount.

---

## Question 29
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary | hire_date  |
|--------|----------|---------|--------|------------|
| 1      | Alice    | 10      | 60000  | 2023-05-01 |
| 2      | Bob      | 10      | 65000  | 2022-03-15 |
| 3      | Charlie  | 20      | 70000  | 2024-01-10 |
| 4      | David    | 20      | 62000  | 2023-07-20 |

**Question**  
Write a query to find employees hired in the last 12 months from today (2025-05-16).

---

## Question 30
**Sample Data**  
Table: `transactions`  
| trans_id | account_id | trans_date | amount |
|---------|------------|------------|--------|
| 1       | 301        | 2025-01-05 | 500    |
| 2       | 301        | 2025-01-06 | -200   |
| 3       | 302        | 2025-01-07 | 300    |
| 4       | 301        | 2025-01-08 | -100   |

**Question**  
Write a query to find accounts with negative balance after all transactions.

---

## Question 31
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers who placed orders in all months of a specific year (e.g., 2025).

---

## Question 32
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | 20      | 62000  |

**Question**  
Write a query to find the department with the highest average salary.

---

## Question 33
**Sample Data**  
Table: `sales`  
| sale_id | rep_id | sale_amount | sale_date  |
|---------|--------|-------------|------------|
| 1       | 101    | 5000.00     | 2025-01-15 |
| 2       | 102    | 3000.00     | 2025-01-20 |
| 3       | 101    | 2000.00     | 2025-02-10 |
| 4       | 103    | 4000.00     | 2025-02-15 |

**Question**  
Write a query to find sales reps whose total sales amount increased from January to February 2025.

---

## Question 34
**Sample Data**  
Table: `products`  
| product_id | product_name | category | price |
|------------|--------------|----------|-------|
| 1          | Laptop       | Tech     | 1000  |
| 2          | Phone        | Tech     | 600   |
| 3          | Shirt        | Apparel  | 30    |
| 4          | Jacket       | Apparel  | 80    |

**Question**  
Write a query to find the percentage contribution of each product’s price to its category’s total price.

---

## Question 35
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers whose order amounts are consistently increasing over time.

---

## Question 36
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | 20      | 62000  |

**Question**  
Write a query to find employees whose salary is within 10% of the highest salary in their department.

---

## Question 37
**Sample Data**  
Table: `sales`  
| sale_id | product_id | sale_date  | quantity |
|---------|------------|------------|----------|
| 1       | 601        | 2025-01-05 | 10       |
| 2       | 601        | 2025-01-06 | 5        |
| 3       | 602        | 2025-01-07 | 8        |
| 4       | 601        | 2025-01-08 | 12       |

**Question**  
Write a query to find the moving average of sales quantity for each product over the last 3 sales.

---

## Question 38
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers who placed orders on the same day as their their first order.

---

## Question 39
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary | hire_date  |
|--------|----------|---------|--------|------------|
| 1      | Alice    | 10      | 60000  | 2023-05-01 |
| 2      | Bob      | 10      | 65000  | 2022-03-15 |
| 3      | Charlie  | 20      | 70000  | 2024-01-10 |
| 4      | David    | 20      | 62000  | 2023-07-20 |

**Question**  
Write a query to find employees who were hired on the same date as another employee.

---

## Question 40
**Sample Data**  
Table: `sales`  
| sale_id | rep_id | sale_amount | sale_date  |
|---------|--------|-------------|------------|
| 1       | 101    | 5000.00     | 2025-01-15 |
| 2       | 102    | 3000.00     | 2025-01-20 |
| 3       | 101    | 2000.00     | 2025-02-10 |
| 4       | 103    | 4000.00     | 2025-02-15 |

**Question**  
Write a query to find the top sales rep by total sales amount for each year.

---

## Question 41
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find the average time gap between consecutive orders for each customer.

---

## Question 42
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | 20      | 62000  |

**Question**  
Write a query to find the median salary for each department.

---

## Question 43
**Sample Data**  
Table: `sales`  
| sale_id | product_id | sale_date  | quantity |
|---------|------------|------------|----------|
| 1       | 601        | 2025-01-05 | 10       |
| 2       | 601        | 2025-01-06 | 5        |
| 3       | 602        | 2025-01-07 | 8        |
| 4       | 601        | 2025-01-08 | 12       |

**Question**  
Write a query to find products with sales on all days in a given week (e.g., week of 2025-01-05).

---

## Question 44
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers whose total order amount doubled from one month to the next.

---

## Question 45
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | 20      | 62000  |

**Question**  
Write a query to rank employees by salary within each department without gaps in ranking.

---

## Question 46
**Sample Data**  
Table: `sales`  
| sale_id | rep_id | sale_amount | sale_date  |
|---------|--------|-------------|------------|
| 1       | 101    | 5000.00     | 2025-01-15 |
| 2       | 102    | 3000.00     | 2025-01-20 |
| 3       | 101    | 2000.00     | 2025-02-10 |
| 4       | 103    | 4000.00     | 2025-02-15 |

**Question**  
Write a query to find sales reps with sales in the top 25% of total sales amount for each month.

---

## Question 47
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find the longest gap between consecutive orders for each customer.

---

## Question 48
**Sample Data**  
Table: `employees`  
| emp_id | emp_name | dept_id | salary |
|--------|----------|---------|--------|
| 1      | Alice    | 10      | 60000  |
| 2      | Bob      | 10      | 65000  |
| 3      | Charlie  | 20      | 70000  |
| 4      | David    | 20      | 62000  |

**Question**  
Write a query to find employees whose salary is above the 75th percentile of all salaries.

---

## Question 49
**Sample Data**  
Table: `sales`  
| sale_id | product_id | sale_date  | quantity |
|---------|------------|------------|----------|
| 1       | 601        | 2025-01-05 | 10       |
| 2       | 601        | 2025-01-06 | 5        |
| 3       | 602        | 2025-01-07 | 8        |
| 4       | 601        | 2025-01-08 | 12       |

**Question**  
Write a query to find products with no sales on a specific date (e.g., 2025-01-07).

---

## Question 50
**Sample Data**  
Table: `orders`  
| order_id | customer_id | order_date | amount |
|----------|------------|------------|--------|
| 1        | 201        | 2025-01-10 | 100    |
| 2        | 201        | 2025-02-15 | 150    |
| 3        | 202        | 2025-01-20 | 200    |
| 4        | 203        | 2025-03-05 | 300    |

**Question**  
Write a query to find customers whose first and last orders have amounts differing by more than 100.
