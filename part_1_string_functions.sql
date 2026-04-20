-- ============================================
-- PART 1: String Functions
-- Name: Alex 
-- Date: 4/20/2026
-- ============================================

set search_path = nairobi_academy;
show search_path;

--Q1. --- DISPLAY EACH STUDENTS FULL NAME IN UPPERCASE AND CITY IN LOWERCASE, NAME THE COLUMNS, upper_name and lower_city
select * from students;
select upper(concat(first_name, ' ', last_name)) as upper_name, lower(city) as lower_city from students;

--Q2. --- DISPLAY EACH STUDENTS FIRSTNAME AND LENGTH ON THE FIRSTNAME, ORDER THE RESULTS FROM SHORTEST TO LONGEST
select  first_name,length(first_name) as name_length  from students order by name_length;

--Q3. --- SHOW EACH SUBJECTS NAME AND A SHORT VERSION(FIRST 4 CHARS= short_name) AND SHOW THE FULL SUBJECT NAME LENGTH -->
select
subject_name,
substring(subject_name,1,4) as short_name,
length(subject_name) as full_length
from subjects
order by full_length desc;

--Q4. --- USE CONCAT TO SHOW A DETAILED SENTENCE
select * from students;
select
CONCAT(first_name,' ',  last_name, ' is in ',class, ' and comes from ',city )  as student_summary
from students;