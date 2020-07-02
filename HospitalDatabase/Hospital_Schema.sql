/*
REM reference file for this is homework.sql in week 6 folder at the bottom

REM added barebones boilerplate and changed some attributes, to clean it up a bit.
*/

CREATE TABLE employees
(
    emp_id NUMBER(6),
    employee_type VARCHAR(25),
    department_id NUMBER(2),
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) CONSTRAINT emp_last_name_nn  NOT NULL,
    gender VARCHAR2(1),
    email VARCHAR2(25) CONSTRAINT emp_email_uq UNIQUE(email)

    /*REM SYNTAX FOR FOREIGN AND PRIMARY KEYS, CHANGE IT AS FIT */
    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO employees VALUES
    (),
    (),
    (),
    (),
    (),
    (),
    ();



CREATE TABLE physician(
    pcp_id NUMBER(6),
    department_name VARCHAR2(30),


    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO physician VALUES
    ();



CREATE TABLE nurse(
    department_name VARCHAR2(30)

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO nurse VALUES
    ();

CREATE TABLE patients(
    patient_name VARCHAR(50),
    patient_id NUMBER(6),
    d_o_b DATE,
    gender VARCHAR2(1),
    complaint VARCHAR(50),
    room_no NUMBER(3),
    pcp_id NUMBER(6),
    med_id NUMBER(2),


    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO patients VALUES
    (),
    (),
    (),
    (),
    (),
    (),
    ();



CREATE TABLE receptionist(
    appt_id NUMBER(5),

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO receptionist VALUES
    ();



CREATE TABLE appointments(
    date DATE,
    appt_id NUMBER(5),
    status_update VARCHAR2(11)

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO appointments VALUES
    (),
    (),
    ();



CREATE TABLE medication(
    med_id NUMBER(2),
    quantity NUMBER(3),
    prescription VARCHAR2(50)

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO medication VALUES
    (),
    (),
    ();



CREATE TABLE medicalRecord(
    record_id NUMBER(5),
    pre_existing_cond VARCHAR2(50),
    accessed_date DATE

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO medicalRecord VALUES
    (),
    (),
    ();




CREATE TABLE tests(
    tests_id NUMBER(2),
    test_name VARCHAR2(50)

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO tests VALUES
    (),
    ();


CREATE TABLE room(
    room_no NUMBER(3),
    dept_name VARCHAR2(50),
    num_beds NUMBER(1),
    room_status VARCHAR2(10)

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);


INSERT INTO room VALUES
    (),
    (),
    (),
    ();



CREATE TABLE inventory(
    masks_quantity NUMBER(3),
    gloves_quantity NUMBER(23)

    PRIMARY KEY (),
	FOREIGN KEY () REFERENCES __ ()
);

INSERT INTO inventory VALUES
    (),
    ();