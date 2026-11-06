USE crownfield_eye_demo;
-- Q1: Which clinicians have at least two appointments?
SELECT c.clinician_name, COUNT(*) AS appointment_count FROM clinician c JOIN appointment a ON a.clinician_id=c.clinician_id GROUP BY c.clinician_id,c.clinician_name HAVING COUNT(*) >= 2 ORDER BY appointment_count DESC;
-- Q2: Which patients attended which clinician at which clinic? Three+ table INNER JOIN.
SELECT p.patient_code,p.patient_name,c.clinician_name,cl.clinic_name,a.appointment_date FROM appointment a INNER JOIN patient p ON p.patient_id=a.patient_id INNER JOIN clinician c ON c.clinician_id=a.clinician_id INNER JOIN clinic cl ON cl.clinic_id=a.clinic_id ORDER BY a.appointment_id;
-- Q3: Which appointments have no follow-up plan? LEFT JOIN.
SELECT a.appointment_id,p.patient_name FROM appointment a JOIN patient p ON p.patient_id=a.patient_id LEFT JOIN follow_up_plan f ON f.appointment_id=a.appointment_id WHERE f.follow_up_id IS NULL;
-- Q4: Which patients have attended more than one appointment? Correlated subquery.
SELECT p.patient_code,p.patient_name FROM patient p WHERE (SELECT COUNT(*) FROM appointment a WHERE a.patient_id=p.patient_id)>1;
-- Q5: Stored procedure: parameterized patient appointment lookup. Created in script 03.
CALL get_patient_appointments(1);
-- Q6: Trigger validation. Created in script 03; invoke test from 06_validation_and_transactions.sql.
SELECT TRIGGER_NAME,EVENT_MANIPULATION,EVENT_OBJECT_TABLE FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA=DATABASE();
