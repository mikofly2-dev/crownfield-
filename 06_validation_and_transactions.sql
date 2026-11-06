USE crownfield_eye_demo;
-- Controlled UPDATE with COMMIT. Reversible demonstration on a synthetic patient.
START TRANSACTION;
SELECT patient_id,postcode FROM patient WHERE patient_code='SYN001';
UPDATE patient SET postcode='AB1 9ZZ' WHERE patient_code='SYN001';
SELECT patient_id,postcode FROM patient WHERE patient_code='SYN001';
COMMIT;
-- Controlled DELETE: use a temporary synthetic appointment with NO dependent records.
START TRANSACTION;
INSERT INTO appointment(patient_id,clinician_id,clinic_id,appointment_date,appointment_time,notes)
VALUES(16,12,10,'2027-03-25','17:40:00','DELETE test only');
SET @temp_appt_id=LAST_INSERT_ID();
SELECT * FROM appointment WHERE appointment_id=@temp_appt_id;
DELETE FROM appointment WHERE appointment_id=@temp_appt_id;
SELECT COUNT(*) AS should_be_zero FROM appointment WHERE appointment_id=@temp_appt_id;
COMMIT;
-- ROLLBACK leaves the stored postcode unchanged.
START TRANSACTION;
UPDATE patient SET postcode='ZZ9 9ZZ' WHERE patient_code='SYN002';
SELECT postcode AS inside_transaction FROM patient WHERE patient_code='SYN002';
ROLLBACK;
SELECT postcode AS after_rollback FROM patient WHERE patient_code='SYN002';
-- Constraint failure tests. Run EACH line separately, EXPECT errors; do not run as one batch.
-- Duplicate patient code (expected ERROR 1062):
-- INSERT INTO patient(patient_code,patient_name,postcode) VALUES('OP001','Duplicate Fiction','A1 1AA');
-- Orphan appointment (expected ERROR 1452):
-- INSERT INTO appointment(patient_id,clinician_id,clinic_id,appointment_date,appointment_time) VALUES(999999,1,1,'2027-01-01','09:00:00');
-- Invalid follow-up status (expected CHECK error 3819):
-- UPDATE follow_up_plan SET status='Unknown' WHERE follow_up_id=1;
-- Earlier follow-up date (expected SIGNAL error 1644):
-- UPDATE follow_up_plan SET due_date='2020-01-01' WHERE follow_up_id=1;
-- Follow-up 1:1 unique check (expected ERROR 1062):
-- INSERT INTO follow_up_plan(appointment_id,follow_up_duration,due_date) VALUES(1,'4 weeks','2027-01-20');
-- Inspect DDL and constraints in Workbench and screenshot:
SHOW CREATE TABLE patient;
SHOW CREATE TABLE follow_up_plan;
SELECT CONSTRAINT_NAME,TABLE_NAME,CONSTRAINT_TYPE FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA=DATABASE() ORDER BY TABLE_NAME,CONSTRAINT_NAME;
