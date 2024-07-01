CREATE OR REPLACE PROCEDURE update_volunteer_role(p_volunteer_id IN NUMBER, p_new_role_id IN NUMBER) IS
  v_old_role_id NUMBER;
BEGIN
  -- Check if volunteer exists
  SELECT role_ID
  INTO v_old_role_id
  FROM Volunteers
  WHERE volunteer_ID = p_volunteer_id;
  
  -- Update role
  UPDATE Volunteers
  SET role_ID = p_new_role_id
  WHERE volunteer_ID = p_volunteer_id;
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Volunteer role updated from ' || v_old_role_id || ' to ' || p_new_role_id);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Volunteer not found.');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20004, 'An error occurred: ' || SQLERRM);
END;