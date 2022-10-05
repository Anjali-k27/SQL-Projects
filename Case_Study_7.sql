select * from sat_scores;

# Write a query to add column - avg_sat_writing. Each row in this column should include average marks in the writing section of the student per school
select *, 
avg(sat_writing) over(partition by school) as avg_sat_writing 
from sat_scores;

# In the above question, add an additional column - count_per_school. Each row of this column should include number of students per school
select *, 
avg(sat_writing) over(partition by school) as avg_sat_writing,
count(student_id) over(partition by school) as count_per_school
from sat_scores;

# In the above question, add two additional columns - max_per_teacher and min_per_teacher. Each row of this column should include maximum and minimum marks in maths per teacher respectively
select *, 
avg(sat_writing) over(partition by school) as avg_sat_writing,
count(student_id) over(partition by school) as count_per_school,
max(sat_math) over(partition by teacher) as max_per_teacher,
min(sat_math) over(partition by teacher) as min_per_teacher
from sat_scores;

/* For the dataset, write a query to add the two columns cum_hrs_studied and total_hrs_studied. Each
row in cum_hrs_studied should display the cumulative sum of hours studied per school. Each row in
the total_hrs_studied will display total hours studied per school. Order the data in the ascending
order of student id  */
select *, 
sum(hrs_studied) over(partition by school order by student_id) as cum_hrs_studied,
sum(hrs_studied) over(partition by school order by student_id rows between unbounded preceding and unbounded following) as total_hrs_studied
from sat_scores;

/* For the dataset, write a query to add column sub_hrs_studied and total_hrs_studied. Each row in
sub_hrs_studied should display the sum of hrs_studied for a row above, a row below, and current
row per school. Order the data in the ascending order of student id  */
select *,
sum(hrs_studied) over(partition by school order by student_id rows between unbounded preceding and unbounded following) as total_hrs_studied,
sum(hrs_studied) over(partition by school order by student_id rows between 1 preceding and 1 following) as sub_hrs_studied
from sat_scores;

/* Write a query to rank the students per school on the basis of scores in verbal. Use both rank and
dense_rank function. Students with the highest marks should get rank 1.
**Note: see if there is difference in ranking provided by both the functions */
select *,
rank() over(partition by school order by sat_verbal desc) as rank_verbal,
dense_rank() over(partition by school order by sat_verbal desc) as d_rank_verbal
from sat_scores;

/* Write a query to rank the students per school on the basis of scores in writing. Use both rank and
dense_rank function. Student with the highest marks should get rank 1.
**Note: see if there is difference in ranking provided by both the functions for teacher = ‘Spellman’   */
select *,
rank() over(partition by school order by sat_writing desc) as rank_writing,
dense_rank() over(partition by school order by sat_writing desc) as d_rank_writing
from sat_scores
where teacher='Spellman';

# Write a query to find the top 5 students per teacher who spent maximum hours studying
select * from 
(select *,
rank() over(partition by teacher order by hrs_studied desc) as rank_hr_studied
from sat_scores) sub
where sub.rank_hr_studied<=5;

# Write a query to find the worst 5 students per school who got minimum marks in sat_math
select * from 
(select *,
row_number() over(partition by school order by sat_math) as sat_math_ranking
from sat_scores) sub
where sub.sat_math_ranking<=5;

# Write a query to divide the dataset into quartile on the basis of marks in sat_verbal
select *,
ntile(4) over(order by sat_verbal) as quartile
from sat_scores;

/* For ‘Petersville HS’ school, write a query to arrange the students in the ascending order of hours
studied. Also, add a column to find the difference in hours studied from the student above(in the
row). Exclude the cases where hrs_studied is null */
select * from 
(select student_id, hrs_studied,
hrs_studied-lag(hrs_studied) over(order by hrs_studied) as diff_hr_studied
from sat_scores
where school='Petersville HS') sub
where sub.hrs_studied!="";

/* For ‘Washington HS’ school, write a query to arrange the students in the descending order of
sat_math. Also, add a column to find the difference in sat_math from the student below(in the row) */
select *,
 sat_math-lead(sat_math) over(order by sat_math desc) as diff_sat_math
from sat_scores
where school='Washington HS';

/* Write a query to return 4 columns - student_id, school, sat_writing, difference in sat_writing and
average marks scored in sat_writing in the school */
select student_id, school, sat_writing, 
sat_writing-avg(sat_writing) over(partition by school) as req_diff
from sat_scores;

/* Write a query to return 4 columns - student_id, teacher, sat_verbal, difference in sat_verbal and
minimum marks scored in sat_verbal per teacher */
select student_id, teacher, sat_verbal,
sat_verbal-min(sat_verbal) over(partition by teacher) as req_diff
from sat_scores;

/* Write a query to return the student_id and school who are in bottom 20 in each of sat_verbal,
sat_writing, and sat_math for their school */

# METHOD 1
select student_id, school from 
(select *, 
row_number() over(partition by school order by sat_verbal) as verbal_rank,
row_number() over(partition by school order by sat_writing) as writing_rank,
row_number() over(partition by school order by sat_math) as math_rank
from sat_scores) sub
where sub.verbal_rank<=20 and sub.writing_rank<=20 and sub.math_rank<=20;

# METHOD - 2
with data as (
select *, 
row_number() over(partition by school order by sat_verbal) as verbal_rank,
row_number() over(partition by school order by sat_writing) as writing_rank,
row_number() over(partition by school order by sat_math) as math_rank
from sat_scores)
select student_id, school 
from data 
where verbal_rank<=20 and writing_rank<=20 and math_rank<=20;

# Write a query to find the student_id for the highest mark and lowest mark per teacher for sat_writing
select distinct teacher, 
first_value(student_id) over(partition by teacher order by sat_writing desc rows between unbounded preceding and unbounded following) as highest_marks_student,
last_value(student_id) over(partition by teacher order by sat_writing desc rows between unbounded preceding and unbounded following) as lowest_marks_student
from sat_scores;











































































































