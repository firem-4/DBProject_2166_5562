SELECT 
    v.volunteer_ID, 
    v.name, 
    s.shift_ID, 
    s.start_date_time, 
    s.end_date_time, 
    b.location
FROM 
    Volunteers v
JOIN 
    signed_up su ON v.volunteer_ID = su.Volunteer_ID
JOIN 
    Shifts s ON su.Shift_ID = s.shift_ID
JOIN 
    Base b ON s.base_ID = b.base_ID
ORDER BY 
    s.start_date_time DESC;
