BEGIN
  -- קריאה לפרוצדורה לעדכון תפקיד המתנדב
  update_volunteer_role(1, 2);
  
  -- קריאה לפונקציה לקבלת מספר המתנדבים בתפקיד
  DECLARE
    v_volunteer_count NUMBER;
  BEGIN
    v_volunteer_count := get_volunteer_count_by_role(2);
    DBMS_OUTPUT.PUT_LINE('Total volunteers in role 2: ' || v_volunteer_count);
  END;
END;
/
