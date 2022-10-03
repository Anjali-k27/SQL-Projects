use casestudies;
create table college_football_players 
(
id int,
primary key(id),
full_school_name varchar(30),
school_name varchar(30)
);
select * FROM college_football_players;

create table college_football_teams(
id int primary key,
school_name varchar(30),
conference varchar(35)
);

select * from college_football_teams;

# Write a query to return player_name, school_name, position, conference from the above dataset
select p.player_name, p.school_name, p.position, t.conference from college_football_players as p join college_football_teams as t on p.school_name=t.school_name;

# Write a query to find the total number of players playing in each conference.Order the output in the descending order of number of players  
select t.conference, count(p.id) as num_players from college_football_players as p join college_football_teams as t on p.school_name=t.school_name group by 1 order by 2 desc;

# Write a query to find the average height of players per division
select t.division,round(avg(p.height),2) as avg_height from college_football_players as p join college_football_teams as t on p.school_name=t.school_name group by 1;

# Write a query to return to the conference where average weight is more than 210. Order the output in the descending order of average weight 
select t.conference, round(avg(p.weight),2) as avg_weight from college_football_players as p join college_football_teams as t on p.school_name=t.school_name group by 1 having avg(p.weight)>210 order by 2 desc;

# Write a query to return to the top 3 conference with the highest BMI (weight/height) ratio
select t.conference, round(703*(sum(p.weight)/sum(power(p.height,2))),2) as BMI from college_football_players as p join college_football_teams as t on p.school_name=t.school_name group by 1 order by 2 desc limit 3;

# BMI formula: 
/* USC Units: BMI = 703 × mass (lbs)/height2 (in) = BMI in kg/m2
SI, Metric Units: BMI =	mass (kg)/height2 (m) = BMI in kg/m2    */












