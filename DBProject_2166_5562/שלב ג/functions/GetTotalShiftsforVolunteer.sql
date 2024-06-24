CREATE OR REPLACE FUNCTION get_total_shifts_for_volunteer(p_volunteer_id IN NUMBER) RETURN NUMBER IS
  v_shift_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_shift_count
  FROM signed_up
  WHERE Volunteer_ID = p_volunteer_id;
  
  RETURN v_shift_count;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;
/
