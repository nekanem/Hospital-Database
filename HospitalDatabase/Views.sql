CREATE VIEW receptionistNames 
AS
SELECT concat(first_name, ' ', last_name) as Fullname
FROM employees
WHERE employee_type = 'Receptionist';
select * from receptionistNames;

CREATE VIEW glovesAmount
AS
SELECT gloves_quantity
FROM inventory;
select * from glovesAmount;

CREATE VIEW availableTests
AS
SELECT test_name
FROM tests;
select * from availableTests;

CREATE VIEW availableMedication
AS
SELECT prescription
FROM medication;
WHERE quantity > 0;
select * from availableMedication;
