USE hospital;

delimiter //

GO
CREATE PROCEDURE updatePatient(IN id_patient INT(6), IN their_complaint VARCHAR(50))
AS
BEGIN
UPDATE patients
SET complaint = their_complaint
WHERE patient_id = id_patient;
END //

delimiter;

CALL updatePatient(173293, 'Low Blood Pressure');
