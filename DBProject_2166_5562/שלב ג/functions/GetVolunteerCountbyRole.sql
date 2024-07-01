CREATE OR REPLACE FUNCTION get_volunteer_count_by_role(p_role_id IN NUMBER) RETURN NUMBER IS
  v_count NUMBER;
  CURSOR volunteer_cursor IS
    SELECT volunteer_ID
    FROM Volunteers
    WHERE role_ID = p_role_id;
  v_volunteer_id Volunteers.volunteer_ID%TYPE;
BEGIN
  v_count := 0;
  OPEN volunteer_cursor;
  LOOP
    FETCH volunteer_cursor INTO v_volunteer_id;
    EXIT WHEN volunteer_cursor%NOTFOUND;
    v_count := v_count + 1;
  END LOOP;
  CLOSE volunteer_cursor;
  
  RETURN v_count;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END;