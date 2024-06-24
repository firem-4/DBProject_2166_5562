CREATE OR REPLACE PROCEDURE assign_volunteer_to_shift(p_volunteer_id IN NUMBER, p_shift_id IN NUMBER) IS
BEGIN
  INSERT INTO signed_up (Volunteer_ID, Shift_ID)
  VALUES (p_volunteer_id, p_shift_id);
  
  COMMIT;
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Volunteer is already signed up for this shift.');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20003, 'An error occurred: ' || SQLERRM);
END;
/
