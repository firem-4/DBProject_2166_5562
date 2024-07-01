CREATE OR REPLACE FUNCTION get_total_shifts_for_volunteer(p_volunteer_id IN NUMBER) RETURN NUMBER IS
  v_shift_count NUMBER := 0;
  CURSOR shift_cursor IS
    SELECT Shift_ID
    FROM signed_up
    WHERE Volunteer_ID = p_volunteer_id;
  v_shift_id signed_up.Shift_ID%TYPE;
BEGIN
  OPEN shift_cursor;
  LOOP
    FETCH shift_cursor INTO v_shift_id;
    EXIT WHEN shift_cursor%NOTFOUND;
    v_shift_count := v_shift_count + 1;
  END LOOP;
  CLOSE shift_cursor;
  
  RETURN v_shift_count;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;