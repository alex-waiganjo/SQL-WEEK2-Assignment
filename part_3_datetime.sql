-- ============================================
-- PART 3: Date & Time Functions
-- Name: Alex 
-- Date: 4/20/2026
-- ============================================

set search_path = nairobi_academy;
show search_path;

--Question 1
-- Extract Birth year, month, and day fromeach students date_of_birth as 3 separate clumns, show first_name alongside them 
select * from students;

select first_name,
to_char(date_of_birth, 'YYYY') as Birth_Year,
to_char(date_of_birth, 'MM') as Birth_Month,
to_char(date_of_birth, 'Month') as Birth_Month_String,
to_char(date_of_birth, 'DD') as Birth_Day,
to_char(date_of_birth, 'DAY') as Birth_Day_String
from students;

--Question 2
-- Show fullname, date_of_birth, age(years) and order from oldest and youngest
select 
concat(first_name, ' ',last_name) as full_name, date_of_birth,
extract(year from age(date_of_birth)) as Age
from students
order by Age desc;

--Question 3
-- Display the exam Date in this format 'Friday, 15th March 2024'
select * from exam_results;
select 
TO_CHAR(exam_date, 'Day, DDth Month YYYY') 
--TO_CHAR(date_of_birth, 'Day, DDth Month YYYY') AS formatted_date
from exam_results;