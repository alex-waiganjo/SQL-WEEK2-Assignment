-- ============================================
-- PART 5: Window Functions
-- Name: Alex 
-- Date: 4/20/2026
-- ============================================

set search_path to nairobi_academy;
show search_path;

select * from students;
select * from subjects;
select * from exam_results;

--Question 1
-- Write a query using Row_number to assign a unique rank to each exam result, ordered from the highest to lowest. Show result_id, student_id, marks and row_num
select result_id, student_id, marks,row_number() over(order by result_id) as row_num
from exam_results;

--Question 2
-- Write a query using Rank and dense_rank on exam_results ordered by marks descending, show both columns side by side so the difference is visible
select 
 marks,
rank() over(order by  marks desc) as rank,
dense_rank() over(order by marks desc) as dense_rank
from exam_results;

--Question 3
-- Write a query using NTILE to divide all exam results into 3 performace bands(1=top, 2=middle, 3=bottom. Show result_id, marks and band
select 
result_id,
marks,
ntile(3) over(order by marks desc) as performance_bands
from exam_results;

--Question 4
-- Write a query using AVG(OVER(PARTITION BY  student_id) to show each exam result alongside that students's personal average mark. Show student_id, marks, student_avg rounded to 2 decimal placesNTILE to divide all exam results into 3 performace bands(1=top, 2=middle, 3=bottom. Show result_id, marks and band
select 
result_id,
marks,
round(avg(marks) over(partition by student_id),2) as student_avg
from exam_results;

--Question 5
-- Write a query using AVG(OVER(PARTITION BY  student_id) to show each exam result alongside that students's personal average mark. Show student_id, marks, student_avg rounded to 2 decimal placesNTILE to divide all exam results into 3 performace bands(1=top, 2=middle, 3=bottom. Show result_id, marks and band
select 
result_id,
student_id,
marks as current_mark
LAG(marks) OVER(partition by student_id order by result_id) as previous_mark
marks - lag(marks) over(partition by student_id order by result_id ) as improvement
from exam_results;
