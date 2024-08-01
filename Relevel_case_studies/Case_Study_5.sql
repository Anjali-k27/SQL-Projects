# Write a query to join the tables: excel_sql_inventory_data and excel_sql_transaction_data
select inventory.*, transaction.transaction_id, transaction.time from excel_sql_inventory_data as inventory join excel_sql_transaction_data as transaction on inventory.product_id=transaction.product_id;

# Find the product which does not sell a single unit
select i.*, t.transaction_id
from excel_sql_inventory_data as i 
left join excel_sql_transaction_data as t 
on i.product_id=t.product_id
where t.transaction_id is null;

# Write a query to find how many units are sold per product. Sort the data in terms of unit sold(descending order)
select i.product_id, i.product_name, count(t.product_id) units_sold
from excel_sql_inventory_data as i
left join excel_sql_transaction_data as t
on i.product_id=t.product_id
group by 1
order by 3 desc;

# Write a query to return product_type and units_sold where product_type is sold more than 50 times
select i.product_type, count(t.transaction_id) as units_sold
from excel_sql_inventory_data as i
left join excel_sql_transaction_data as t
on i.product_id=t.product_id
group by 1
having count(t.transaction_id)>50;

# Write a query to return the total revenue generated
select round(sum(i.price_unit),2) as total_revenue
from excel_sql_inventory_data as i
left join excel_sql_transaction_data as t
on i.product_id=t.product_id
where t.transaction_id!="null";

# Write a query to return the most selling product under product_type = ‘dry goods
select i.product_name, count(t.transaction_id) as units_sold
from excel_sql_inventory_data as i
left join excel_sql_transaction_data as t
on i.product_id=t.product_id
where i.product_type='dry_goods'
group by 1
order by 2 desc
limit 1;

# Write a query to find the difference between inventory and total sales per product_type
select i.product_type, abs(sum(i.current_inventory)-count(t.transaction_id)) as req_diff
from excel_sql_inventory_data as i
left join excel_sql_transaction_data as t
on i.product_id=t.product_id
group by 1
order by 2 desc;

#  Find the product-wise sales for product_type =’dairy’
select i.product_name, round(sum(i.price_unit)*count(t.transaction_id),2) as sales
from excel_sql_inventory_data as i
left join excel_sql_transaction_data as t
on i.product_id=t.product_id
where product_type='dairy'
group by 1
order by 2 desc;
