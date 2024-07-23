ALTER TABLE SOLDIER
ADD phone_number VARCHAR2(20);

DECLARE
  CURSOR c_soldiers IS
    SELECT id FROM SOLDIER;
  v_phone PERSONAL_INFO.phone_number%TYPE;
BEGIN
  FOR r_soldier IN c_soldiers LOOP
    SELECT phone_number
    INTO v_phone
    FROM (SELECT phone_number FROM PERSONAL_INFO ORDER BY DBMS_RANDOM.VALUE)
    WHERE ROWNUM = 1;

    UPDATE SOLDIER
    SET phone_number = v_phone
    WHERE id = r_soldier.id;
  END LOOP;
END;