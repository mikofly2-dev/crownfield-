USE crownfield_eye_demo;
-- Synthetic authentication demo: HASHING by MySQL SHA2 is NOT an adequate standalone
-- password storage scheme (unsalted/fast). Do NOT use it for real credentials.
-- Demonstrate protection using AES_ENCRYPT on a completely fictional sensitive note.
-- Key material is a literal ONLY for a disposable teaching demo; real key management
-- must be external with non-hard-coded secrets and encryption in transit.
CREATE TABLE IF NOT EXISTS protected_demo (
 demo_id INT PRIMARY KEY AUTO_INCREMENT,
 encrypted_note VARBINARY(1024) NOT NULL
) ENGINE=InnoDB;
INSERT INTO protected_demo(encrypted_note)
VALUES (AES_ENCRYPT('Fictional example: follow-up telephone instruction','CLASSROOM_ONLY_CHANGE_ME'));
SELECT demo_id, HEX(encrypted_note) AS ciphertext_hex FROM protected_demo;
SELECT demo_id, CAST(AES_DECRYPT(encrypted_note,'CLASSROOM_ONLY_CHANGE_ME') AS CHAR) AS decrypted_demo FROM protected_demo;
