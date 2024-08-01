use casestudies;
create table crunchbase_companies (
permalink varchar(50),
name varchar(30),
homepage_url varchar(40),
category_code varchar(20),
funding_total_usd int,
status varchar(10),
country_code varchar(10),
state_code varchar(10),
region varchar(20),
city varchar(20),
funding_rounds int,
founded_at date,
founded_month date,
founded_quarter	varchar(15),
founded_year int,
first_funding_at date,	
last_funding_at	date,
last_milestone_at date,
id int,
primary key(id)
);

select * from crunchbase_companies;

# Find the top 5 countries(country code) with the highest number of operating companies. Ensure the country code is not null
select country_code, count(status) as num_operating_companies from crunchbase_companies where status='operating' and country_code!= "" group by 1 order by 2 desc limit 5;

# How many companies have no country code available in the dataset
select count(id) as total from crunchbase_companies where country_code="";

# Find the number of companies starting with letter ‘g’ founded in France(FRA) and still operational(status = operating)
select count(id) as total from crunchbase_companies where name like 'g%' and country_code='FRA' and status='operating'; 

# How many advertising, founded after 2003, are acquired?
select count(name) as total from crunchbase_companies where category_code='advertising' and founded_year>2003 and status='acquired';

# Calculate the average funding_total_usd per company for the companies founded in the software, education, and analytics category
select category_code, avg(funding_total_usd) as avg_funding from crunchbase_companies where category_code IN('software','education','analytics') group by 1;

# Find the city having more than 50 closed companies. Return the city and number of companies closed
select city, count(name) as num_companies from crunchbase_companies where status='closed' and city!="" group by 1 having count(name)>50;

# Find the number of bio-tech companies who are founded after 2000 and either have more than 1Mn funding or have ipo and secured more than 1 round of funding
  select count(name) as num_companies from crunchbase_companies where category_code='biotech' and founded_year>2000 and (funding_total_usd>1000000 or (funding_rounds>1 and status='ipo'));

# Find number of all acquired companies founded between 1980 and 2005 and founded in the city ending with the word ‘city’. Return the city name and number of acquired companies 
select city, count(name) as num_acquired_company from crunchbase_companies where status='acquired' and founded_year between 1980 and 2005 and city like '%city' group by 1;

# Find the number of ‘hardware’ companies founded outside ‘USA’ and did not take any funding. Return the country code and number of hardware companies in descending order.
select country_code, count(name) as num_hardware_companies from crunchbase_companies where category_code='hardware' and funding_total_usd="" and country_code!='USA' group by 1 order by 2 desc;

# Find the 5 most popular company category(category with highest companies) across the city Singapore, Shanghai, and Bangalore. Return category code and number of companies
select category_code, count(name) as num_companies from crunchbase_companies where city IN('Singapore','Shanghai','Bangalore') group by 1 order by 2 desc limit 5;

 
