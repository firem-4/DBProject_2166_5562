BEGIN
  -- קריאה לפרוצדורה לשיוך מתנדב למשמרת
  assign_volunteer_to_shift(1, 1);
  
  -- קריאה לפונקציה לקבלת מספר המשמרות עבור המתנדב
  DECLARE
    v_shift_count NUMBER;
  BEGIN
    v_shift_count := get_total_shifts_for_volunteer(1);
    DBMS_OUTPUT.PUT_LINE('Total shifts for volunteer 1: ' || v_shift_count);
  END;
END;
/
