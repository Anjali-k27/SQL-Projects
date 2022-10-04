create database CaseStudies;
use CaseStudies;

create table oscar_nominees (
year year,
category varchar(50),
nominee varchar(30),
movie varchar(30),
winner bool,
id int not null,
primary key(id)
);


# Write a query to display all the records in the table tutorial.oscar_nominees
SELECT * FROM oscar_nominees;

# Write a query to find the distinct values in the ‘year’ column
select distinct year from oscar_nominees;

# Write a query to filter the records from year 1999 to year 2006
select * from oscar_nominees where year between 1999 and 2006;

# Write a query to filter the records for either year 1991 or 1998
select * from oscar_nominees where year=1991 or year=1998;

# Write a query to return the winner movie name for the year of 1997
select movie from oscar_nominees where year=1997 and winner='true';

# Write a query to return the winner in the ‘actor in a leading role’ and ‘actress in a leading role’ category for the year of 1994,1980, and 2008
select * from oscar_nominees where (category='actor in a leading role' or category='actress in a leading role') and year IN(1994,1980,2008) and winner='true';

# Write a query to return the name of the movie starting from letter ‘a’
select movie from oscar_nominees where movie like 'a%';

# Write a query to return the name of movies containing the word ‘the’
select movie from oscar_nominees where movie like '%the%';

# Write a query to return all the records where the nominee name starts with “c” and ends with “r”
select * from oscar_nominees where nominee like 'c%r';

# Write a query to return all the records where the movie was released in 2005 and movie name does not start with ‘a’ and ‘c’ and nominee was a winner
select * from oscar_nominees where year=2005 and (movie not like 'a%' and movie not like 'c%') and winner='true';

# Write a query to return the name of nominees who got more nominations than ‘Akim Tamiroff’. Solve this using CTE
with cte as (select nominee, count(*) as num_nominations from oscar_nominees group by 1)
select nominee from cte where num_nominations>(select num_nominations from cte where nominee='Akim Tamiroff');

# Write a query to find the nominee name with the second highest number of oscar wins. Solve using subquery.
with oscar_wins as 
(select nominee, count(*) as num_oscar_wins from oscar_nominees where winner='True' group by 1 order by 2 desc) 
select nominee, num_oscar_wins
from oscar_wins 
where num_oscar_wins = (select max(num_oscar_wins) from oscar_wins where num_oscar_wins<(select max(num_oscar_wins) from oscar_wins));

# Write a query to create three columns per nominee
/* 1. Number of wins
2. Number of loss
3. Total nomination  */
select nominee, 
sum(case when winner='true' then 1 else 0 end) as num_wins,
sum(case when winner='false' then 1 else 0 end) as num_loss,
count(*) as total_nominations
from oscar_nominees 
group by 1
order by 4 desc;

# Write a query to create two columns
/* ● Win_rate: Number of wins/total wins
● Loss_rate: Number of loss/total wins   */
select movie, 
100*sum(case when winner='true' then 1 else 0 end)/count(*) as win_rate,
100*sum(case when winner='false' then 1 else 0 end)/count(*) as loss_rate
from oscar_nominees
group by 1;

# Write a query to return all the records of the nominees who have lost but won at least once
select * 
from oscar_nominees 
where nominee in(select distinct nominee from oscar_nominees where winner= 'true') and winner = 'false';

# Write a query to find the nominees who are nominated for both ‘actor in a leading role’ and ‘actor in supporting role’
select distinct nominee from oscar_nominees 
where nominee in(select nominee from oscar_nominees where category='actor in a leading role') 
and category='actor in a supporting role';

# Write a query to find the movie which won more than average number of wins per winning movie
with cte as (select movie, count(*) as num_wins from oscar_nominees where winner='true' group by 1)
select movie from cte where num_wins>(select avg(num_wins) from cte);

# Write a query to return the year which have more winners than year 1970
with cte as (select year, count(*) as num_wins from oscar_nominees where winner='true' group by 1)
select year from cte where num_wins > (select num_wins from cte where year=1970);

# Write a query to return all the movies which have won oscars both in the actor and actress category
select distinct movie
from oscar_nominees 
where (winner='true' and category like '%actor%')
and movie in(select movie from oscar_nominees where category like '%actress%' and winner='true');

# Write a query to return the movie name which did not win a single oscar
with cte as
(select movie, 
sum(case when winner='true' then 1 else 0 end) as num_wins,
sum(case when winner='false' then 1 else 0 end) as num_loss
from oscar_nominees
group by 1)
select distinct movie from cte where num_wins=0;

# METHOD 2 for above query
select distinct movie 
from oscar_nominees 
where winner='false' and movie not in(select distinct movie from oscar_nominees where winner='true');





















