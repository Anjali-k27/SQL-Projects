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


# Write a query to display all the records in the table oscar_nominees
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



