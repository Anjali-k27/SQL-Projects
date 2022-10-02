use casestudies;
create table kag_conversion_data(
ad_id int,
xyz_campaign_id int,
fb_campaign_id int,
age int,
gender varchar(2),
interest int,
impressions int,
clicks int,
spent float,
total_conversion int,
approved_conversion int
);
select * from kag_conversion_data;

# Write a query to count the total number of records in the kag_conversion_data dataset
select count(ad_id) as total_records from kag_conversion_data;

# Write a query to count the distinct number of fb_campaign_id
select count(distinct fb_campaign_id) as total_fb_campaign_id from kag_conversion_data;

# Write a query to find the maximum spent, average interest, minimum impressions for ad_id
select max(spent) as max_spent, avg(interest) as average_interest, min(impressions) as min_impressions from kag_conversion_data;

# Write a query to create an additional column spent per impressions(spent/impressions)
select *, (spent/impressions) as spent_per_impressions from kag_conversion_data;

# Write a query to count the ad_campaign for each age group
select age, count(ad_id) as num_campaign from kag_conversion_data group by age;

# Write a query to calculate the average spent on ads for each gender category
select gender, round(avg(spent),2) as avg_spent from kag_conversion_data group by gender; 

# Write a query to find the total approved conversion per xyz campaign id. Arrange the total conversion in descending order
select xyz_campaign_id, sum(approved_conversion) as total_approved_conversion from kag_conversion_data group by 1 order by 2 desc;

# Write a query to show the fb_campaign_id and total interest per fb_campaign_id. Only show the campaign which has more than 300 interests 
select fb_campaign_id, sum(interest) as total_interest from kag_conversion_data group by 1 having sum(interest)>300;

# Write a query to find the age and gender segment with maximum impression to interest ratio. Return three columns - age, gender, impression_to_interest
select age, gender, sum(impressions)/sum(interest) as max_imp_per_interest from kag_conversion_data group by 1,2 order by 3 desc limit 1;

# Write a query to find the top 2 xyz_campaign_id and gender segment with the maximum total_unapproved_conversion (total_conversion - approved_conversion)
select xyz_campaign_id, gender, (sum(total_conversion)-sum(approved_conversion)) as total_unapproved_conversion from kag_conversion_data group by 1, 2 order by 3 desc limit 2;
 