CREATE OR REPLACE PROCEDURE update_volunteer_role(p_volunteer_id IN NUMBER, p_new_role_id IN NUMBER) IS
BEGIN
  UPDATE Volunteers
  SET role_ID = p_new_role_id
  WHERE volunteer_ID = p_volunteer_id;
  
  COMMIT;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Volunteer not found.');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20004, 'An error occurred: ' || SQLERRM);
END;
/
