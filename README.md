# Crownfield Eye Hospital — individual SQL teaching pack

**Fictional patient records only. Not for production healthcare use.** Student: **[replace with your name and ID]**. This is a runnable **proposed** solution, not evidence of work already executed or independently authored by the student.

## Setup
Use MySQL 8.4 (or 8.0.16+ supporting enforced CHECK), MySQL Workbench and a **local disposable development server**. Ensure your MySQL account can create schemas, tables, roles and triggers. Back up any existing work first: `01_schema.sql` intentionally drops and recreates `crownfield_eye_demo`.

Run each file in **this order** using MySQL Workbench:

1. `01_schema.sql` — create 11 clinical tables, foreign keys, UNIQUE and CHECK constraints.
2. `01b_seed_data.sql` — five Appendix 1 appointment cases (fictional assessment data) plus twelve additional coherent synthetic appointment cases, and 10+ rows in each table.
3. `03_procedure_and_trigger.sql` — install a parameterized stored procedure and the due-date validation triggers.
4. `02_individual_queries.sql` — six required individual features (the last two invoke/inspect the procedure/trigger).
5. `04_security.sql` — four roles (requires administrative privileges; intentionally no patient role access to all patients' records).
6. `05_protection_demo.sql` — AES encryption demonstration with a classroom-only key, never use this key in production.
7. `06_validation_and_transactions.sql` — controlled UPDATE / DELETE, COMMIT / ROLLBACK and schema inspection. Run commented failure cases ONE AT A TIME after uncommenting.

## Design decisions
- `patient.patient_code` is UNIQUE NOT NULL: external codes cannot repeat.
- `follow_up_plan.appointment_id` is UNIQUE NOT NULL: appointment **0..1** follow-up; a follow-up belongs to exactly one appointment. This is the chosen interpretation of “may generate a follow-up plan.”
- An appointment has 0..N diagnoses, 0..N prescriptions; a prescription has 1..N items as a **business process rule**, not fully enforceable by this simple schema (empty new prescriptions are temporarily allowed by schema).
- `appointment_diagnosis` is a composite-key junction table.
- `prescription_item` is a medicine junction with its own ID to allow repeated items; the medicine may appear across many prescriptions.
- The due-date triggers reject dates prior to the appointment on follow-up INSERT and UPDATE. Changing an appointment date later could invalidate a follow-up; a production version would also validate appointment-date updates.
- The fictional patient role gets **no table permissions**; actual patient-specific reads need application authentication and per-patient authorization, not blanket table SELECT.
- The original dataset has no prescribed dosage values; dosage, frequency and duration in the teaching seed are invented and have **no clinical validity**.

## Submission evidence to capture yourself
- Draw.io corrected Crow's Foot ERD and normalization workbook.
- Full-screen MySQL Workbench output: `SHOW CREATE TABLE`, row counts, constraints and six queries.
- Expected constraint failures, controlled UPDATE/DELETE, COMMIT / ROLLBACK, encryption proof and role grants.
- Your own contributions, personal SQL edits/understanding, annotated screenshots, GitHub URL, narrated 8–10-minute recording.

**Do not claim tests passed until you have run them.** Never upload a real database password, personal patient data, or identifiable health records.
