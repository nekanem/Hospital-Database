/* How many doctors speciialize in heart sugery? */
SELECT COUNT(*)
FROM physician
WHERE department_name = 'Cardiology';

/* Display all the apointments schedules for the month? */ 
SELECT appt_id
FROM appointments
WHERE dates > '07-01-2020' AND dates < '07-31-2020';

/* What medications  were prescibed to Nathaniel */ 
SELECT med_id
FROM patients
WHERE patient_name = 'Nathaniel';

/* Display all the email address for doctors at the hospital */
SELECT email
FROM employees
WHERE employee_type = 'Physician';

/* How many masks do we have in inventory */
SELECT masks_quantity
FROM inventory;

/* Display all the patients with last names that start with S in alphabetical order */ 
SELECT patient_name
FROM patients
WHERE patient_name LIKE 'S%'
ORDER BY patient_name;

/* Display all the receptionists' names at the hospital */
SELECT concat(first_name, ' ', last_name) as Fullname
FROM employees
WHERE employee_type = 'Receptionist';

/* How many patients have pre existing conditions */
SELECT COUNT(*)
FROM medicalRecord
WHERE pre_existing_cond IS NOT NULL;

/* How many patients are prescibed Ibuprofen */ 
SELECT COUNT(*)
FROM patients p JOIN medication m ON p.med_id = m.med_id
WHERE prescription = 'Ibuprofen';

/* How many patients were born from 2000 to 2009 */ 
SELECT COUNT(*)
FROM patients
WHERE d_o_b LIKE '%200%';

/* Which doctors are male */ 
SELECT concat(first_name, ' ', last_name) as Fullname
FROM employees
WHERE employee_type = 'Physician' AND gender = 'M';

/* Which is the TestID for the Diagnostic Test */
SELECT tests_id
FROM tests
WHERE test_name = 'Diagnostic Tests';

/* What nurse is available in the Pediatrics Department */
SELECT concat(first_name, ' ', last_name) as Fullname
FROM nurse
WHERE department_name = 'Pediatrics';

/* Display the room no. that is currenlty occupied */
SELECT room_no
FROM room
WHERE room_status = 'Occupied';

/* What medications are currenlty availabe*/
SELECT prescription
FROM medication
WHERE quantity > 0;

/* How many beds are avaible*/
SELECT SUM(num_beds)
FROM room;

/* How many appointments are delayed for August 2020 */
SELECT COUNT(*)
FROM appointments
WHERE status_update = 'Delayed' AND dates LIKE '08%';

/* Display all the physicians dept_id's*/
SELECT DISTINCT department_name
FROM physician;

/* What day does Doe last access her Meical Records */
SELECT MAX(accessed_date)
FROM medicalRecord JOIN patient
WHERE last_name = 'Doe';

/* Display all the employees that are physicians */
SELECT concat(first_name, ' ', last_name) as Fullname
FROM employees
WHERE employee_type = 'Physician';
