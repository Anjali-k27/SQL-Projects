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




