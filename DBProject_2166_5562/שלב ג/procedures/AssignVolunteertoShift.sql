CREATE OR REPLACE PROCEDURE assign_volunteer_to_shift(p_volunteer_id IN NUMBER, p_shift_id IN NUMBER) IS
  CURSOR check_cursor IS
    SELECT COUNT(*)
    FROM signed_up
    WHERE Volunteer_ID = p_volunteer_id AND Shift_ID = p_shift_id;
  v_count NUMBER;
BEGIN
  OPEN check_cursor;
  FETCH check_cursor INTO v_count;
  CLOSE check_cursor;
  
  IF v_count = 0 THEN
    INSERT INTO signed_up (Volunteer_ID, Shift_ID)
    VALUES (p_volunteer_id, p_shift_id);
    COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Volunteer is already signed up for this shift.');
  END IF;
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Volunteer is already signed up for this shift.');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20003, 'An error occurred: ' || SQLERRM);
END;