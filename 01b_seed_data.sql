-- Source Appendix 1 cases retained in first 5 appointments; 12 additional synthetic appointments follow.
USE crownfield_eye_demo;
INSERT INTO specialty (specialty_name) VALUES
('Glaucoma'),
('Retina'),
('Cornea'),
('Paediatric Ophthalmology'),
('Neuro-Ophthalmology'),
('Oculoplastics'),
('Cataract'),
('Uveitis'),
('Low Vision'),
('General Ophthalmology');
INSERT INTO clinic (clinic_name) VALUES
('City Road'),
('Bedford'),
('Croydon'),
('Southend'),
('Barking'),
('Walthamstow'),
('Romford'),
('Ilford'),
('Stratford'),
('Basildon');
INSERT INTO clinician (clinician_name, specialty_id) VALUES
('Dr Maya Shah', 1),
('Dr Leo Grant', 2),
('Dr Priya Nair', 3),
('Dr Example Clinician 04', 4),
('Dr Example Clinician 05', 5),
('Dr Example Clinician 06', 6),
('Dr Example Clinician 07', 7),
('Dr Example Clinician 08', 8),
('Dr Example Clinician 09', 9),
('Dr Example Clinician 10', 10),
('Dr Example Clinician 11', 1),
('Dr Example Clinician 12', 2);
INSERT INTO patient (patient_code, patient_name, postcode) VALUES
('OP001', 'Amina Yusuf', 'NE1 4AB'),
('OP002', 'Daniel Reed', 'N16 7QP'),
('OP003', 'Sofia Bennett', 'E8 2LD'),
('OP004', 'Michael Okoro', 'SE6 3RT'),
('SYN001', 'Synthetic Patient 01', 'AB2 2CD'),
('SYN002', 'Synthetic Patient 02', 'AB3 3CD'),
('SYN003', 'Synthetic Patient 03', 'AB4 4CD'),
('SYN004', 'Synthetic Patient 04', 'AB5 5CD'),
('SYN005', 'Synthetic Patient 05', 'AB6 6CD'),
('SYN006', 'Synthetic Patient 06', 'AB7 7CD'),
('SYN007', 'Synthetic Patient 07', 'AB8 8CD'),
('SYN008', 'Synthetic Patient 08', 'AB9 1CD'),
('SYN009', 'Synthetic Patient 09', 'AB1 2CD'),
('SYN010', 'Synthetic Patient 10', 'AB2 3CD'),
('SYN011', 'Synthetic Patient 11', 'AB3 4CD'),
('SYN012', 'Synthetic Patient 12', 'AB4 5CD');
INSERT INTO diagnosis (diagnosis_name) VALUES
('Ocular hypertension'),
('Diabetic macular oedema'),
('Glaucoma suspect'),
('Keratoconus'),
('Dry eye'),
('Cataract'),
('Blepharitis'),
('Retinal vein occlusion'),
('Uveitis'),
('Myopia'),
('Conjunctivitis'),
('Posterior vitreous detachment');
INSERT INTO medicine (medicine_name) VALUES
('Latanoprost'),
('Timolol'),
('Aflibercept'),
('Sodium chloride drops'),
('Artificial tears'),
('Olopatadine'),
('Brimonidine'),
('Dorzolamide'),
('Acetazolamide'),
('Cyclopentolate'),
('Prednisolone eye drops'),
('Lubricating gel');
INSERT INTO appointment (patient_id, clinician_id, clinic_id, appointment_date, appointment_time, notes) VALUES
(1, 1, 1, '2026-10-05', '09:00:00', 'Review IOP'),
(2, 2, 1, '2026-10-05', '09:30:00', 'OCT before review'),
(1, 1, 2, '2026-11-16', '10:15:00', 'Visual field test'),
(3, 1, 1, '2026-10-06', '11:00:00', 'Monitor'),
(4, 3, 3, '2026-10-07', '14:00:00', 'Corneal topography'),
(5, 4, 4, '2026-11-03', '08:00:00', 'Fictional routine visit 1'),
(6, 5, 5, '2026-11-04', '09:00:00', 'Fictional routine visit 2'),
(7, 6, 6, '2026-11-05', '10:00:00', 'Fictional routine visit 3'),
(8, 7, 7, '2026-11-06', '11:00:00', 'Fictional routine visit 4'),
(9, 8, 8, '2026-11-07', '12:00:00', 'Fictional routine visit 5'),
(10, 9, 9, '2026-11-08', '13:00:00', 'Fictional routine visit 6'),
(11, 10, 10, '2026-11-09', '14:00:00', 'Fictional routine visit 7'),
(12, 11, 1, '2026-11-10', '15:00:00', 'Fictional routine visit 8'),
(13, 12, 2, '2026-11-11', '08:00:00', 'Fictional routine visit 9'),
(14, 1, 3, '2026-11-12', '09:00:00', 'Fictional routine visit 10'),
(15, 2, 4, '2026-11-13', '10:00:00', 'Fictional routine visit 11'),
(16, 3, 5, '2026-11-14', '11:00:00', 'Fictional routine visit 12');
INSERT INTO appointment_diagnosis (appointment_id, diagnosis_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 4),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 1),
(14, 2),
(15, 3),
(16, 4),
(17, 5);
INSERT INTO prescription (appointment_id) VALUES
(1),
(2),
(3),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17);
INSERT INTO prescription_item (prescription_id, medicine_id, dosage, route, frequency, duration) VALUES
(1, 1, '1 drop', 'Ophthalmic', 'Nightly', '6 weeks'),
(1, 2, '1 drop', 'Ophthalmic', 'Twice daily', '6 weeks'),
(2, 3, 'As directed', 'Intravitreal', 'Once', '1 day'),
(3, 1, '1 drop', 'Ophthalmic', 'Nightly', '12 weeks'),
(4, 4, '1 drop', 'Ophthalmic', 'Daily', '8 weeks'),
(5, 9, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(6, 10, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(7, 11, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(8, 12, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(9, 1, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(10, 2, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(11, 3, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(12, 4, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(13, 5, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(14, 6, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(15, 7, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks'),
(16, 8, '1 drop', 'Ophthalmic', 'Once daily', '4 weeks');
INSERT INTO follow_up_plan (appointment_id, follow_up_duration, due_date, priority, status) VALUES
(1, '6 weeks', '2026-11-16', 'High', 'Pending'),
(2, '4 weeks', '2026-11-02', 'Urgent', 'Booked'),
(3, '12 weeks', '2027-02-08', 'Routine', 'Pending'),
(4, '26 weeks', '2027-04-06', 'Routine', 'Pending'),
(5, '8 weeks', '2026-12-02', 'Routine', 'Pending'),
(6, '4 weeks', '2026-12-01', 'Routine', 'Pending'),
(7, '4 weeks', '2026-12-02', 'Routine', 'Pending'),
(8, '4 weeks', '2026-12-03', 'Routine', 'Pending'),
(9, '4 weeks', '2026-12-04', 'Routine', 'Pending'),
(10, '4 weeks', '2026-12-05', 'Routine', 'Pending'),
(11, '4 weeks', '2026-12-06', 'Routine', 'Pending'),
(12, '4 weeks', '2026-12-07', 'Routine', 'Pending'),
(13, '4 weeks', '2026-12-08', 'Routine', 'Pending'),
(14, '4 weeks', '2026-12-09', 'Routine', 'Pending'),
(15, '4 weeks', '2026-12-10', 'Routine', 'Pending');

-- Row count evidence; run and screenshot after successful import.
SELECT 'specialty' AS table_name, COUNT(*) AS row_count FROM specialty;
SELECT 'clinic' AS table_name, COUNT(*) AS row_count FROM clinic;
SELECT 'clinician' AS table_name, COUNT(*) AS row_count FROM clinician;
SELECT 'patient' AS table_name, COUNT(*) AS row_count FROM patient;
SELECT 'diagnosis' AS table_name, COUNT(*) AS row_count FROM diagnosis;
SELECT 'medicine' AS table_name, COUNT(*) AS row_count FROM medicine;
SELECT 'appointment' AS table_name, COUNT(*) AS row_count FROM appointment;
SELECT 'appointment_diagnosis' AS table_name, COUNT(*) AS row_count FROM appointment_diagnosis;
SELECT 'prescription' AS table_name, COUNT(*) AS row_count FROM prescription;
SELECT 'prescription_item' AS table_name, COUNT(*) AS row_count FROM prescription_item;
SELECT 'follow_up_plan' AS table_name, COUNT(*) AS row_count FROM follow_up_plan;
