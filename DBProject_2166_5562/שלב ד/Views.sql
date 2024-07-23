CREATE OR REPLACE VIEW SOLDIER_VIEW AS
SELECT id, first_name, last_name, rank, birthdate, phone_number
FROM SOLDIER;

SELECT id, first_name, last_name, rank, birthdate, phone_number
FROM SOLDIER_VIEW
WHERE rank = 'Turai';

SELECT id, first_name, last_name, birthdate, phone_number
FROM SOLDIER_VIEW
WHERE birthdate < TO_DATE('1990-01-01', 'YYYY-MM-DD');

CREATE OR REPLACE VIEW PERSONAL_INFO_VIEW AS
SELECT phone_number, address, email
FROM PERSONAL_INFO;

SELECT phone_number, address, email
FROM PERSONAL_INFO_VIEW
WHERE phone_number = '555-1234';

SELECT phone_number, address, email
FROM PERSONAL_INFO_VIEW
WHERE address LIKE '%תל אביב%';




--additional views


CREATE OR REPLACE VIEW SOLDIER_PERSONAL_INFO AS
SELECT s.id, s.first_name, s.last_name, s.rank, s.birthdate, p.address, p.phone_number, p.email
FROM SOLDIER s
LEFT JOIN PERSONAL_INFO p ON s.phone_number = p.phone_number;

SELECT id, first_name, last_name, rank, birthdate, address, phone_number, email
FROM SOLDIER_PERSONAL_INFO
WHERE rank = 'Turai';

SELECT id, first_name, last_name, birthdate, address, phone_number, email
FROM SOLDIER_PERSONAL_INFO
WHERE birthdate > TO_DATE('1999-01-01', 'YYYY-MM-DD');


CREATE OR REPLACE VIEW PERSONAL_INFO_SOLDIER AS
SELECT p.phone_number, p.address, p.email, s.id, s.first_name, s.last_name, s.rank, s.birthdate
FROM PERSONAL_INFO p
LEFT JOIN SOLDIER s ON p.phone_number = s.phone_number;

SELECT phone_number, address, email, id, first_name, last_name, rank, birthdate
FROM PERSONAL_INFO_SOLDIER
WHERE phone_number = '555-7890';

SELECT phone_number, address, email, id, first_name, last_name, rank, birthdate
FROM PERSONAL_INFO_SOLDIER
WHERE address LIKE '%7890 Spruce Street%';


