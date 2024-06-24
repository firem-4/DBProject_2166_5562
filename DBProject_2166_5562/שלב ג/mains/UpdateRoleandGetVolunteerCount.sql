BEGIN
  -- Call the procedure to update the volunteer's role
  update_volunteer_role(1, 2);
  
  -- Call the function to get the volunteer count by role
  DECLARE
    v_volunteer_count NUMBER;
  BEGIN
    v_volunteer_count := get_volunteer_count_by_role(2);
    DBMS_OUTPUT.PUT_LINE('Total volunteers in role 2: ' || v_volunteer_count);
  END;
END;
/
