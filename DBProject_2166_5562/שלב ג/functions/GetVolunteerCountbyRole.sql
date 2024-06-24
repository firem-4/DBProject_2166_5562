CREATE OR REPLACE FUNCTION get_volunteer_count_by_role(p_role_id IN NUMBER) RETURN NUMBER IS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM Volunteers
  WHERE role_ID = p_role_id;
  
  RETURN v_count;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END;
/
