-- ============================================
-- PART 2: Number Functions
-- Name: Alex 
-- Date: 4/20/2026
-- ============================================

set search_path = nairobi_academy;
show search_path;

--Question 1
-- Show result_id, marks and apply CEIL, ROUND and FLOOR to the marks divided by 10. Name the columns accordingly
select 
result_id,
marks,
ceil(marks/10.0) as marks_using_ceil,
round(marks/10.0,2) as marks_using_round,
floor(marks/10.0) as marks_using_floor
from exam_results;

 
--Question 2
--get total no of results using count(), AVG to 2 Decimal Places, Highest mark, Lowest Mark and total amarks added together
select * from exam_results;
select
count(result_id), round(avg(marks),2), max(marks), min(marks), sum(marks)
from exam_results;

--Question 3 
-- Apply a 10% increment to all marks, shoq the result_id, 
select * from exam_results;
select
result_id, marks as original_mark, round(marks * 1.1) as boosted_mark
from exam_results;
