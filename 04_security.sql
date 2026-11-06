-- Execute as local MySQL admin with CREATE ROLE, CREATE USER and GRANT permissions.
-- Demo-only accounts: change passwords locally and do not publish real credentials.
USE crownfield_eye_demo;
CREATE ROLE IF NOT EXISTS 'cf_admin','cf_doctor','cf_receptionist','cf_patient';
GRANT ALL PRIVILEGES ON crownfield_eye_demo.* TO 'cf_admin';
GRANT SELECT ON crownfield_eye_demo.patient TO 'cf_doctor';
GRANT SELECT ON crownfield_eye_demo.appointment TO 'cf_doctor';
GRANT SELECT ON crownfield_eye_demo.diagnosis TO 'cf_doctor';
GRANT SELECT ON crownfield_eye_demo.appointment_diagnosis TO 'cf_doctor';
GRANT SELECT ON crownfield_eye_demo.prescription TO 'cf_doctor';
GRANT SELECT ON crownfield_eye_demo.prescription_item TO 'cf_doctor';
GRANT SELECT ON crownfield_eye_demo.medicine TO 'cf_doctor';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.follow_up_plan TO 'cf_doctor';
GRANT SELECT,INSERT,UPDATE ON crownfield_eye_demo.appointment TO 'cf_receptionist';
GRANT SELECT ON crownfield_eye_demo.clinic TO 'cf_receptionist';
GRANT SELECT ON crownfield_eye_demo.clinician TO 'cf_receptionist';
GRANT SELECT ON crownfield_eye_demo.patient TO 'cf_receptionist';
-- The patient role has intentionally NO direct table access: row-level patient data
-- must be exposed via a separately authenticated, identity-filtered application/API.
-- Do not grant SELECT on the full patient table to a patient role.
SHOW GRANTS FOR 'cf_doctor';
SHOW GRANTS FOR 'cf_receptionist';
SHOW GRANTS FOR 'cf_patient';
