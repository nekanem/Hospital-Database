/*
REM reference file for this is homework.sql in week 6 folder at the bottom

REM added barebones boilerplate and changed some attributes, to clean it up a bit.

After finishing up the basics by tomorrow, we should implement, views, triggers, and procedure by saturday
THINGS TO POLISH: 
We might Need to to add existing attributes from one table to another as like foreign key or smth like that so it can be accessed
I think we need a department table

**THINGS TO ADD: VIEWS, STORED PROCEDURES, AND 20 QUERIES
 */

CREATE TABLE employees
(
    emp_id NUMBER(6) NOT NULL,
    employee_type VARCHAR(25),
    department_id NUMBER(2) NOT NULL,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) CONSTRAINT emp_last_name_nn  NOT NULL,
    gender VARCHAR2(1),
    email VARCHAR2(25) CONSTRAINT emp_email_uq UNIQUE(email)

    /*REM SYNTAX FOR FOREIGN AND PRIMARY KEYS, CHANGE IT AS FIT */
    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO employees VALUES
    (823657, 'Receptionist', 01, 'Billy', 'Joel', 'M', 'apple2@gmail.com'),
    (763901, 'Physician', 02, 'Jane', 'Doe', 'F', 'superman@aol.com'),
    (618093, 'Nurse', 03, 'Jackie', 'Smith', 'F', 'js12@gmail.com'),
    (123456, 'Physician', 02, 'Abe', 'Lincoln', 'M', 'alincoln@vcu.edu');



CREATE TABLE physician(
    pcp_id NUMBER(6) NOT NULL PRIMARY KEY,
    department_name VARCHAR2(30),


    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO physician VALUES
    (042069, 'Cardiology'),
    (069420, 'Primary Care');



CREATE TABLE nurse(
    department_name VARCHAR2(30)

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO nurse VALUES
    ('Pediatrics');

CREATE TABLE patients( 
    patient_id NUMBER(6) NOT NULL,
    patient_name VARCHAR(50),
    d_o_b DATE,
    gender VARCHAR2(1),
    complaint VARCHAR(50),
    room_no NUMBER(3),
    pcp_id NUMBER(6) NOT NULL,
    med_id NUMBER(2) NOT NULL,


    PRIMARY KEY(patient_id, patient_name, d_o_b, complaint, gender),
	FOREIGN KEY(room_no) REFERENCES room(room_no),
    FOREIGN KEY(pcp_id) REFERENCES physician(pcp_id),
    FOREIGN KEY(med_id) REFERENCES medication(med_id),
);

INSERT INTO patients VALUES
    (173293, 'Mahir', STR_TO_DATE('6-01-1990', '%d-%m-%Y'), 'M', 'High Blood Pressure', 201, 042069, 53),
    (173293, 'Tracy', STR_TO_DATE('7-26-1970', '%d-%m-%Y'), 'F', 'Dizziness', 202, 069420, 22),
    (173293, 'Stephanie', STR_TO_DATE('8-01-2006', '%d-%m-%Y'), 'F', 'Skin Rash', 205, 069420, 21),
    (173293, 'Nathaniel', STR_TO_DATE('8-13-2000', '%d-%m-%Y'), 'M', 'Allergies', 206, 042069, 32);



CREATE TABLE receptionist(
    appt_id NUMBER(5),

    --PRIMARY KEY(),
	-- FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO receptionist VALUES
    (23612),
    (26789),
    (01296),
    (13530);



CREATE TABLE appointments(
    date DATE,
    appt_id NUMBER(5),
    status_update VARCHAR2(11)

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO appointments VALUES
    (STR_TO_DATE('6-01-2020', '%d-%m-%Y'), 23612, 'Completed'),
    (STR_TO_DATE('7-26-2020', '%d-%m-%Y'), 26789, 'Ongoing'),
    (STR_TO_DATE('8-01-2020', '%d-%m-%Y'), 01296, 'Delayed'),
    (STR_TO_DATE('8-13-2020', '%d-%m-%Y'), 13530, 'Unconfirmed');



CREATE TABLE medication(
    med_id NUMBER(2),
    quantity NUMBER(3),
    prescription VARCHAR2(50)

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO medication VALUES
    (53, 100, 'Metroprolol'),
    (22, 25, 'Ibuprofen'),
    (21, 100, 'Hydrocortisone'),
    (21, 5, 'Cetirizine');



CREATE TABLE medicalRecord(
    record_id NUMBER(5),
    pre_existing_cond VARCHAR2(50),
    accessed_date DATE

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO medicalRecord VALUES
    (02345, 'Diabetes', STR_TO_DATE('5-03-2020', '%d-%m-%Y')),
    (02567, 'ADHD', STR_TO_DATE('7-24-2020', '%d-%m-%Y')),
    (02982, 'Depression', STR_TO_DATE('7-29-2020', '%d-%m-%Y')),
    (02334, 'High Blood Pressure', STR_TO_DATE('8-02-2020', '%d-%m-%Y'));




CREATE TABLE tests(
    tests_id NUMBER(2),
    test_name VARCHAR2(50)

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO tests VALUES
    (20, 'Echo Cardiogram'),
    (21, 'CT Scan'),
    (22, 'Diagnostic Tests'),
    (30, 'Blood Count Lab Test');


CREATE TABLE room(
    room_no NUMBER(3),
    dept_name VARCHAR2(50),
    num_beds NUMBER(1),
    room_status VARCHAR2(10)

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO room VALUES
    (201, 'Cardiology', 2, 'Available'),
    (202, 'Primary Care', 1, 'Occupied'),
    (205, 'Pediatrics', 1, 'Occupied'),
    (206, 'Primary Care', 1, 'Available');



CREATE TABLE inventory(
    masks_quantity NUMBER(3),
    gloves_quantity NUMBER(23)

    -- PRIMARY KEY (),
	-- FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO inventory VALUES
    (53, 23);