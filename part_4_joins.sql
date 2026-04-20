-- ============================================
-- PART 4: SQL JOINS
-- Name: Alex 
-- Date: 4/20/2026
-- ============================================

set search_path = city_hospital;

--Question 1
-- Use INNER JOIN to show appointment with the patients,doctors fullname, appointment date and diagnosis

select * from appointments;
select * from departments;
select * from doctors;
select * from patients;
select * from prescriptions;

select p.full_name as patients_full_name, d.full_name as doctors_full_name, a.appt_date, a.diagnosis 
from appointments a
inner join patients p on a.patient_id = p.patient_id
inner join doctors d on a.doctor_id = d.doctor_id;

--Question 2
-- Use LEFT JOIN to ALL patients an if they have an appointment date and diagnosis
select p.full_name, a.appt_date, a.diagnosis
from patients p
left join appointments a on p.patient_id = a.patient_id;

--Question 3
-- Use  RIGHT JOIN to ALL patients an if they have an appointment date and diagnosis
select d.full_name, a.appt_date, p.full_name
from appointments a
right join doctors d on a.doctor_id = d.doctor_id
left join patients p on a.patient_id = p.patient_id;

--Question 4
-- Use LEFT JOIN and WHERE IS NULL to find all patients who have never had an appointment, show fullname and city
select  p.full_name as patient_full_name, a.appt_date, p.city
from appointments a
right join patients p on a.patient_id = p.patient_id
where appointment_id is null;

select  p.full_name as patient_full_name, a.appt_date, p.city
from patients p
left join appointments a on p.patient_id = a.patient_id
where appointment_id is null;

--Question 5
-- Use INNER JOIN to show each appointment with patient, doctor name, medicine prescribed. show appointment_id, patient_name, doctor_name and medicine_name
select  a.appointment_id, p.full_name as patient_name, d.full_name as doctor_name, pre.medicine_name
from appointments a
inner join patients p on a.patient_id = p.patient_id
inner join doctors d on a.doctor_id = d.doctor_id
inner join prescriptions pre on a.appointment_id = pre.appointment_id;