CREATE TABLE employees(
    emp_id INT(6) NOT NULL,
    employee_type VARCHAR(25),
    department_id INT(2) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(25) CONSTRAINT emp_last_name_nn  NOT NULL,
    gender VARCHAR(1),
    email VARCHAR(25) CONSTRAINT emp_email_uq UNIQUE(email)

    PRIMARY KEY(emp_id, department_id),
    FOREIGN KEY(department_id) REFERENCES dept(department_id)
);


INSERT INTO employees VALUES
    (823657, 'Receptionist', 01, 'Billy', 'Joel', 'M', 'apple2@gmail.com'),
    (763901, 'Physician', 02, 'Jane', 'Doe', 'F', 'superman@aol.com'),
    (618093, 'Nurse', 04, 'Jackie', 'Smith', 'F', 'js12@gmail.com'),
    (123456, 'Physician', 03, 'Abe', 'Lincoln', 'M', 'alincoln@vcu.edu'),
    (654321, 'Receptionist', 01, 'Jake', 'Peralta', 'M', 'jake@gmail.com');


CREATE TABLE dept(
    department_id INT(2),
    department_name VARCHAR(30),

    PRIMARY KEY(department_id)
);

INSERT INTO dept VALUES
    (01, 'Administration'),
    (02, 'Cardiology'),
    (03, 'Primary Care'),
    (04, 'Pediatrics'),
    (05, 'Nephrology');

CREATE TABLE physician(
    emp_id INT(6) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(25) CONSTRAINT emp_last_name_nn  NOT NULL,
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
    last_name VARCHAR(25) CONSTRAINT emp_last_name_nn  NOT NULL PRIMARY KEY,
    department_name VARCHAR(30),

    PRIMARY KEY(last_name),
	FOREIGN KEY(department_name) REFERENCES dept(department_name),
    FOREIGN KEY(first_name) REFERENCES employees(first_name),
    FOREIGN KEY(last_name) REFERENCES employees(last_name)
);

INSERT INTO nurse VALUES
    ('Jackie', 'Smith', 'Pediatrics');

CREATE TABLE patients( 
    patient_id INT(6) NOT NULL,
    patient_name VARCHAR(50) DEFAULT NULL,
    d_o_b DATE,
    gender VARCHAR(1),
    complaint VARCHAR(50),
    room_no INT(3),
    emp_id INT(6) NOT NULL,
    med_id INT(2) NOT NULL,
    tests_id INT(2),


    PRIMARY KEY(patient_id, patient_name),
	FOREIGN KEY(room_no) REFERENCES room(room_no),
    FOREIGN KEY(emp_id) REFERENCES physician(emp_id),
    FOREIGN KEY(med_id) REFERENCES medication(med_id),
    FOREIGN KEY(tests_id) REFERENCES tests(tests_id),
);

INSERT INTO patients VALUES
    (173293, 'Mahir', STR_TO_DATE('06-01-1990', '%d-%m-%Y'), 'M', 'High Blood Pressure', 201, 763901, 53),
    (128312, 'Tracy', STR_TO_DATE('07-26-1970', '%d-%m-%Y'), 'F', 'Dizziness', 202, 763901, 22),
    (672081, 'Stephanie', STR_TO_DATE('08-01-2006', '%d-%m-%Y'), 'F', 'Skin Rash', 205, 123456, 21),
    (219903, 'Nathaniel', STR_TO_DATE('08-13-2000', '%d-%m-%Y'), 'M', 'Allergies', 206, 123456, 32);


CREATE TABLE appointments(
    appt_id INT(5),
    dates DATE,
    status_update VARCHAR(11),

    PRIMARY KEY(appt_id)
);

INSERT INTO appointments VALUES
    (23612, STR_TO_DATE('06-01-2020', '%d-%m-%Y'), 'Completed'),
    (26789, STR_TO_DATE('07-26-2020', '%d-%m-%Y'), 'Ongoing'),
    (01296, STR_TO_DATE('08-01-2020', '%d-%m-%Y'), 'Delayed'),
    (13530, STR_TO_DATE('08-13-2020', '%d-%m-%Y'), 'Unconfirmed');


CREATE TABLE receptionist(
    appt_id INT(5) PRIMARY KEY,
    last_name VARCHAR(25) CONSTRAINT emp_last_name_nn  NOT NULL,
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


CREATE TABLE medication(
    med_id INT(2),
    quantity INT(3),
    prescription VARCHAR(50),

    PRIMARY KEY(med_id)
);

INSERT INTO medication VALUES
    (53, 100, 'Metroprolol'),
    (22, 25, 'Ibuprofen'),
    (21, 100, 'Hydrocortisone'),
    (21, 5, 'Cetirizine');


CREATE TABLE medicalRecord(
    record_id INT(5),
    pre_existing_cond VARCHAR(50),
    accessed_date DATE,

    PRIMARY KEY(record_id)
);


INSERT INTO medicalRecord VALUES
    (02345, 'Diabetes', STR_TO_DATE('05-03-2020', '%d-%m-%Y')),
    (02567, 'ADHD', STR_TO_DATE('07-24-2020', '%d-%m-%Y')),
    (02982, 'Depression', STR_TO_DATE('07-29-2020', '%d-%m-%Y')),
    (02334, 'High Blood Pressure', STR_TO_DATE('08-02-2020', '%d-%m-%Y'));




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


CREATE TABLE room(
    room_no INT(3) NOT NULL,
    department_name VARCHAR(30),
    num_beds INT(1),
    room_status VARCHAR(10),

    PRIMARY KEY(room_no),
    FOREIGN KEY(department_name) REFERENCES dept(department_name)

);


INSERT INTO room VALUES
    (201, 'Cardiology', 2, 'Available'),
    (202, 'Primary Care', 1, 'Occupied'),
    (205, 'Pediatrics', 1, 'Occupied'),
    (206, 'Primary Care', 1, 'Available');



CREATE TABLE inventory(
    masks_quantity INT(3),
    gloves_quantity INT(23),

    PRIMARY KEY(masks_quantity, gloves_quantity)
);

INSERT INTO inventory VALUES
    (53, 23);