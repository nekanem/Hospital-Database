CREATE TABLE dept(
    department_id INT(2),
    department_name VARCHAR(30),

    PRIMARY KEY(department_id, department_name)
);

INSERT INTO dept VALUES
    (01, 'Administration'),
    (02, 'Cardiology'),
    (03, 'Primary Care'),
    (04, 'Pediatrics'),
    (05, 'Nephrology');
    
CREATE TABLE employees(
    emp_id INT(6) NOT NULL,
    employee_type VARCHAR(25),
    department_id INT(2) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    gender VARCHAR(1),
    email VARCHAR(25),

    PRIMARY KEY(emp_id, department_id, first_name, last_name),
    FOREIGN KEY(department_id) REFERENCES dept(department_id)
);


INSERT INTO employees VALUES
    (823657, 'Receptionist', 01, 'Billy', 'Joel', 'M', 'apple2@gmail.com'),
    (763901, 'Physician', 02, 'Jane', 'Doe', 'F', 'superman@aol.com'),
    (618093, 'Nurse', 04, 'Jackie', 'Smith', 'F', 'js12@gmail.com'),
    (123456, 'Physician', 03, 'Abe', 'Lincoln', 'M', 'alincoln@vcu.edu'),
    (654321, 'Receptionist', 01, 'Jake', 'Peralta', 'M', 'jake@gmail.com');




CREATE TABLE physician(
    emp_id INT(6),
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    department_name VARCHAR(30),

    PRIMARY KEY(emp_id, last_name),
    FOREIGN KEY(emp_id) REFERENCES dept(emp_id),
    FOREIGN KEY(department_name) REFERENCES dept(department_name),
    FOREIGN KEY(first_name) REFERENCES employees(first_name),
    FOREIGN KEY(last_name) REFERENCES employees(last_name)

);


INSERT INTO physician VALUES
    (763901, 'Jane', 'Doe', 'Cardiology'),
    (123456, 'Abe', 'Lincoln', 'Primary Care');



CREATE TABLE nurse(
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    department_name VARCHAR(30),

    PRIMARY KEY(last_name),
	FOREIGN KEY(department_name) REFERENCES dept(department_name),
    FOREIGN KEY(first_name) REFERENCES employees(first_name),
    FOREIGN KEY(last_name) REFERENCES employees(last_name)
);

INSERT INTO nurse VALUES
    ('Jackie', 'Smith', 'Pediatrics');
    

CREATE TABLE room(
    room_no INT(3) NOT NULL,
    department_name VARCHAR(30),
    num_beds INT(1),
    room_status VARCHAR(10),

    PRIMARY KEY(room_no),
    FOREIGN KEY (department_name) REFERENCES dept(department_name)

);


INSERT INTO room VALUES
    (201, 'Cardiology', 2, 'Available'),
    (202, 'Primary Care', 1, 'Occupied'),
    (205, 'Pediatrics', 1, 'Occupied'),
    (206, 'Primary Care', 1, 'Available');
    

CREATE TABLE medication(
    med_id INT(2),
    quantity INT(3),
    prescription VARCHAR(50),
    
    PRIMARY KEY (med_id)

);

INSERT INTO medication VALUES
    (53, 100, 'Metroprolol'),
    (22, 25, 'Ibuprofen'),
    (21, 100, 'Hydrocortisone'),
    (32, 50, 'Cetirizine');
    

CREATE TABLE tests(
    tests_id INT(2),
    test_name VARCHAR(50),

    PRIMARY KEY(tests_id)
);

INSERT INTO tests VALUES
    (20, 'Echo Cardiogram'),
    (21, 'CT Scan'),
    (22, 'Diagnostic Tests'),
    (30, 'Blood Count Lab Test');



CREATE TABLE patients( 
    patient_id INT(6) NOT NULL,
    patient_name VARCHAR(50) DEFAULT NULL,
    d_o_b DATE,
    gender VARCHAR(1),
    complaint VARCHAR(50),
    room_no INT(3),
    emp_id INT(6) NOT NULL,
    med_id INT(2),
    tests_id INT(2),


    PRIMARY KEY(patient_id, patient_name),
	FOREIGN KEY(room_no) REFERENCES room(room_no),
    FOREIGN KEY(emp_id) REFERENCES physician(emp_id),
    FOREIGN KEY(med_id) REFERENCES medication(med_id),
    FOREIGN KEY(tests_id) REFERENCES tests(tests_id)
);

INSERT INTO patients VALUES
    (173293, 'Mahir', '06-01-1990', 'M', 'High Blood Pressure', 201, 763901, 53,20),
    (128312, 'Tracy', '07-26-1970', 'F', 'Dizziness', 202, 763901, 22, 21),
    (672081, 'Stephanie', '08-01-2006', 'F', 'Skin Rash', 205, 123456, 21, 22),
    (219903, 'Nathaniel', '08-13-2000', 'M', 'Allergies', 206, 123456, 32, 30);


CREATE TABLE appointments(
    appt_id INT(5),
    dates DATE,
    status_update VARCHAR(11),

    PRIMARY KEY(appt_id)
);

INSERT INTO appointments VALUES
    (23612, '06-01-2020', 'Completed'),
    (26789, '07-26-2020', 'Ongoing'),
    (01296, '08-01-2020', 'Delayed'),
    (13530, '08-13-2020', 'Unconfirmed');


CREATE TABLE receptionist(
    appt_id INT(5) PRIMARY KEY,
    last_name VARCHAR(25) NOT NULL,
    department_name VARCHAR(30),

	FOREIGN KEY(appt_id) REFERENCES appointments(appt_id),
    FOREIGN KEY(department_name) REFERENCES dept(department_name),
    FOREIGN KEY(last_name) REFERENCES employees(last_name)
);

INSERT INTO receptionist VALUES
    (23612, 'Joel', 'Administration'),
    (26789, 'Peralta', 'Administration'),
    (01296, 'Joel', 'Administration'),
    (13530, 'Peralta', 'Administration');



CREATE TABLE medicalRecord(
    record_id INT(5),
    pre_existing_cond VARCHAR(50),
    accessed_date DATE,

    PRIMARY KEY(record_id)
);


INSERT INTO medicalRecord VALUES
    (02345, 'Diabetes', '05-03-2020'),
    (02567, 'ADHD', '07-24-2020'),
    (02982, 'Depression', '07-29-2020'),
    (02334, 'High Blood Pressure', '08-02-2020');



CREATE TABLE inventory(
    masks_quantity INT(3),
    gloves_quantity INT(23),

    PRIMARY KEY(masks_quantity, gloves_quantity)
);

INSERT INTO inventory VALUES
    (53, 23);
    
    
select * from appointments;