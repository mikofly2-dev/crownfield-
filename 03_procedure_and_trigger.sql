USE crownfield_eye_demo;
DROP PROCEDURE IF EXISTS get_patient_appointments;
DELIMITER $$
CREATE PROCEDURE get_patient_appointments(IN p_patient_id INT)
BEGIN
 SELECT a.appointment_id,a.appointment_date,a.appointment_time,c.clinician_name FROM appointment a JOIN clinician c ON c.clinician_id=a.clinician_id WHERE a.patient_id=p_patient_id ORDER BY a.appointment_date,a.appointment_time;
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS trg_follow_up_due_insert;
DROP TRIGGER IF EXISTS trg_follow_up_due_update;
DELIMITER $$
CREATE TRIGGER trg_follow_up_due_insert BEFORE INSERT ON follow_up_plan FOR EACH ROW
BEGIN
 DECLARE d DATE;
 SELECT appointment_date INTO d FROM appointment WHERE appointment_id=NEW.appointment_id;
 IF NEW.due_date < d THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Follow-up due date cannot precede appointment'; END IF;
END$$
CREATE TRIGGER trg_follow_up_due_update BEFORE UPDATE ON follow_up_plan FOR EACH ROW
BEGIN
 DECLARE d DATE;
 SELECT appointment_date INTO d FROM appointment WHERE appointment_id=NEW.appointment_id;
 IF NEW.due_date < d THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Follow-up due date cannot precede appointment'; END IF;
END$$
DELIMITER ;
-- MySQL CHECK cannot reference another table; these triggers enforce the date rule.
