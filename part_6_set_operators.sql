-- ============================================
-- PART 6: Set Operators
-- Name: Alex 
-- Date: 4/20/2026
-- ============================================

set search_path = city_hospital;
set search_path = nairobi_academy;

select * from students;

--Q1. USE UNION TO QUERY ALL UNIQUE CITIES FROM THE PATIENTS AND STUDENTS TABLE
select city, 'student_city' as location_type from nairobi_academy.students 
union
select city, 'patient_city' as location_type from city_hospital.patients 
order by city asc;

--Q2. USE UNION ALL QUERY TO COMBINE ALL STUDENTS AND PATIENTS FULLNAMES, ADD A SECOND COLUMN THAT CATEGORISES AS STUDENT OR PATIENT
select first_name, 'Student' as source from nairobi_academy.students 
union all
select full_name, 'Patient' as sourcee from city_hospital.patients 
order by source;

--Q3. USE INTERSECT TO FIND ALL CITIES IN STUDENTS AND PATIENTS TABLE
select city from nairobi_academy.students 
intersect
select city from city_hospital.patients 
order by city;

--Q4. USE UNION ALL TO COMBINE STUDENT NAME AND PATIENT & DOCTOR FULLNAME, ORDER THE RESULT BY SOURCE_LABEL AND NAME  
select  
concat(first_name, ' ', last_name) as name, 'Student' as source_label from nairobi_academy.students
union all
select full_name as name, 'Patient' as source_label from city_hospital.patients
union all
select 
 full_name as name, 'Doctor' as source_label from city_hospital.doctors
order by source_label, name asc;





