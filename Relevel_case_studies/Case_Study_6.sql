use casestudies;
select * from city_populations;

# Write a query to return all the records where the city population is more than average population of dataset
select * 
from city_populations 
where population_estimate_2012 > (select avg(population_estimate_2012) from city_populations);

# Write a query to return all the records where the city population is more than the most populated city of Texas(TX) state
select * 
from city_populations 
where population_estimate_2012 > (select max(population_estimate_2012) from city_populations where state='TX');

# Find the number of cities where population is more than the average population of Illinois(IL) state
select count(id) as num_cities 
from city_populations
where population_estimate_2012 > (select avg(population_estimate_2012) from city_populations where state='IL');

# Write a query to add the additional column - percentage_population(city population/total population of dataset)
select * , 
round((population_estimate_2012*100)/(select sum(population_estimate_2012) from city_populations),2) as percentage_population
from city_populations;

# Write a query to add the additional column - percentage_population_state(city population/total population of the state)
select a.*, round(100.0 * population_estimate_2012/state_population,2) as percentage_population
from city_populations a
left join(select state, sum(population_estimate_2012) as state_population from city_populations group by state) b
on a.state = b.state 
order by a.state;

# Write a query to add the additional column - population density. The column logic is:
/* ● Population more than average - High
● Population less than or equal to average - Low  */
select *, 
case when population_estimate_2012 > (select avg(population_estimate_2012) from city_populations) then "High"
	 when population_estimate_2012 <= (select avg(population_estimate_2012) from city_populations) then "Low"
     end as population_density
from city_populations;

/* Write a query to add an additional column - num_cities. Each row in the dataset should tell the
number of cities in the dataset */
select *,
count(city) over(partition by state) as num_cities
from city_populations;

/* Write a query to add an additional column - total_population. Each row in the dataset should tell the
total population of the state */
select *,
sum(population_estimate_2012) over(partition by state) as total_population
from city_populations;

# Write a query to return the rows where population is more than the average population of the state

# METHOD 1
select * from
(select *,
avg(population_estimate_2012) over(partition by state) as avg_population_state
from city_populations) sub
where population_estimate_2012 > sub.avg_population_state;

# METHOD 2
with cte as (
select *,
avg(population_estimate_2012) over(partition by state) as avg_population_state
from city_populations)
select * from cte where population_estimate_2012 > avg_population_state;

# Write a query to calculate the cumulative sum of population. Arrange the data in ascending order of the population
select *,
sum(population_estimate_2012) over(order by population_estimate_2012) as cum_population
from city_populations;

/* Write a query to add a column rolling_avg. Each row in the dataset includes the average population
for the two rows above and two rows below(including current row */
select *,
avg(population_estimate_2012) over(order by population_estimate_2012 rows between 2 preceding and 2 following) as rolling_avg
from city_populations;

/* Write a query to rank the cities in California(CA) state in terms of population. City with the highest
population is given rank 1. Use both rank and dense_rank function */
select *,
rank() over(order by population_estimate_2012 desc) as rank_population,
dense_rank() over(order by population_estimate_2012 desc) as dense_rank_population
from city_populations
where state='CA';

# Write a query to find the top 2 most populated cities per state

# Method 1
select * from
(select *,
row_number() over(partition by state order by population_estimate_2012 desc) as population_rank
from city_populations) sub
where sub.population_rank<=2;

# Method 2
with cte as (
select *,
row_number() over(partition by state order by population_estimate_2012 desc) as population_rank
from city_populations)
select * from cte where population_rank <= 2;

/* Write a query to add a column - perc_pop. Each row in this column should represent the percentage
of population a city contributes in that state */
select *,
population_estimate_2012*100/sum(population_estimate_2012) over(partition by state) as perc_pop
from city_populations;

# Write a query to find the cities which lie in the top 10 decile in terms of population
select *,
ntile(10) over(order by population_estimate_2012 desc) as top_populated_cities
from city_populations;

/* Write a query to arrange the cities in the descending order of population and add a column
calculating difference in population from a row below (in the dataset) */
select *,
population_estimate_2012 - lead(population_estimate_2012) over(order by population_estimate_2012 desc) as req_diff
from city_populations;

# Write a query to return the state, first city and last city (in terms of id number) in the state
select distinct state, 
first_value(id) over(partition by state) as first_city,
last_value(id) over(partition by state) as last_city
from city_populations;























































































