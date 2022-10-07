# Introduction to Case

/* Ron and his buddies founded Foodie-Fi and began selling monthly and annual
subscriptions, providing clients with unrestricted on-demand access to exclusive cuisine
videos from around the world.
This case study focuses on the use of subscription-style digital data to answer critical
business questions about the customer journey, payments, and business performance. */

/* There are 2 tables in the given schema:
1) Plans
2) Subscriptions

#  Table 'Plans' description

/* There are 5 customer plans:
Trial— Customers sign up for a 7-day free trial and will be automatically enrolled in the pro monthly subscription plan
unless they unsubscribe, downgrade to basic, or upgrade to an annual pro plan during the trial.
Basic plan — Customers have limited access and can only stream their videos with the basic package, which is only
available monthly for $9.90.
Pro plan — Customers on the Pro plan have no watch time limits and can download videos for offline viewing. Pro
plans begin at $19.90 per month or $199 for a yearly subscription.
When clients cancel their Foodie-Fi service, a Churn plan record with a null pricing is created, but their plan continues
until the end of the billing cycle */

# Table 'Subscriptions' description

/* Customer subscriptions display the precise date on which their specific plan id begins.
If a customer downgrades from a pro plan or cancels their subscription — the higher program will remain in place until
the period expires — the start date in the subscriptions table will reflect the date the actual plan changes.
When clients upgrade their account from a basic plan to a pro or annual pro plan, the higher plan becomes active
immediately.
When customers cancel their subscription, they will retain access until the end of their current billing cycle, but the
start date will be the day they opted to quit their service. */

create database capstone_1;
use capstone_1;

# The column name got changed somehow while exporting the data. So, had to alter column name to set it to right name
alter table Subscriptions rename column ï»¿customer_id to customer_id;
alter table plans rename column ï»¿plan_id to plan_id;

# QUERY 1

# How many customers has Foodie-Fi ever had?
select count(distinct customer_id) as num_customers from Subscriptions;

# QUERY 2

# What is the monthly distribution of trial plan start_date values for our dataset? — Use the start of the month as the group by value.
with cte as (select s.* , p.plan_name, p.price, extract(month from s.start_date) as month_num
from subscriptions as s
join plans as p
on s.plan_id=p.plan_id
where plan_name='trial')
select month_num, count(plan_name) as monthly_distribtion 
from cte
group by 1
order by 1;

# QUERY 3

# What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
with cte as 
(select * from
(select s.*, p.plan_name, extract(year from s.start_date) as year from subscriptions as s join plans as p on s.plan_id=p.plan_id) sub
where year>2020)
select plan_id, plan_name, count(customer_id) as req_ans
from cte 
group by 1
order by 1;

# QUERY 4

# What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
with cte as (select count(s.plan_id) as churn_count
from subscriptions as s
left join plans as p
on s.plan_id=p.plan_id
where p.plan_name='churn')
select churn_count,
round((100*churn_count/(select count(distinct customer_id) as total_count from subscriptions)),1) as percent_churn 
from cte;

# QUERY 5

# How many customers have churned straight after their initial free trial? — what percentage is this rounded to the nearest whole number?
# METHOD 1
with cte as 
(select s.customer_id, s.plan_id, p.plan_name,
row_number() over(partition by s.customer_id order by s.plan_id) as req_rank
from subscriptions as s
left join plans as p
on s.plan_id=p.plan_id)
select count(customer_id) as num_customers,
round(100*count(customer_id)/(select count(distinct customer_id) from subscriptions),0) as req_perc
from cte where plan_id=4 and req_rank=2;
 
# MTEHOD 2
with cte as 
(select s.customer_id, s.plan_id, p.plan_name,
lead(s.plan_id) over(partition by s.customer_id order by s.plan_id) as next_plan
from subscriptions as s
left join plans as p
on s.plan_id=p.plan_id)
select count(*) as req_count,
round(100*count(*)/(select count(distinct customer_id) from subscriptions),0) as req_perc
from cte where plan_id=0 and next_plan=4;
 
 
# QUERY 6
 
# What is the number and percentage of customer plans after their initial free trial?
with cte as 
(select customer_id, plan_id, 
lead(plan_id,1) over(partition by customer_id order by plan_id) as next_plan
from subscriptions)
select next_plan, 
count(*) as req_count,
round(100*count(*)/(select count(distinct customer_id) from subscriptions),2) as req_perc
from cte 
where plan_id=0 and next_plan is not null
group by 1
order by 1;
 
# QUERY 7
 
# What is the customer count and percentage breakdown of all 5 plan_name values at 2020–12–31?
 
 # NEED MORE CLARITY ON THIS PROBLEM STATEMENT
 
 # QUERY 8
 
# How many customers have upgraded to an annual plan in 2020?
select count(customer_id) as num_customers
from subscriptions
where plan_id=3
and year(start_date)='2020';

# QUERY 9

# How many days on average does it take a customer to start an annual plan from the day they join Foodie-Fi?
with trial_plan as 
(select customer_id, date(start_date) as trial_date 
from subscriptions 
where plan_id=0),
annual_plan as 
(select customer_id, date(start_date) as annual_date
from subscriptions
where plan_id=3)
select round(avg(datediff(annual_date,trial_date)),0) as avg_days_to_upgrade
from trial_plan as tp
join annual_plan as ap
on tp.customer_id=ap.customer_id;

# QUERY 10

# Can you further breakdown this average value into 30-day periods? (i.e. 0–30 days, 31–60 days etc) 
# NEED TO WORK ON THIS PROBLEM STATEMENT AS LESS CLARITY ON PROBLEM STATEMENT

# QUERY 11

# How many customers downgraded from a pro-monthly to a basic monthly plan in 2020?
with cte as (select s.customer_id, s.plan_id, p.plan_name,
lead(s.plan_id,1) over(partition by s.customer_id order by s.plan_id) as next_plan
from subscriptions as s
left join plans as p
on s.plan_id=p.plan_id
where year(start_date)=2020)
select count(*) as num_customers
from cte
where plan_id=2 and next_plan=1;




 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





















