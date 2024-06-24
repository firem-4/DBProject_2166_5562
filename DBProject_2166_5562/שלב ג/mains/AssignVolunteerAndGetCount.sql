BEGIN
  -- Call the procedure to assign the volunteer to a shift
  assign_volunteer_to_shift(1, 101);
  
  -- Call the function to get the total shifts for the volunteer
  DECLARE
    v_shift_count NUMBER;
  BEGIN
    v_shift_count := get_total_shifts_for_volunteer(1);
    DBMS_OUTPUT.PUT_LINE('Total shifts for volunteer 1: ' || v_shift_count);
  END;
END;
/
