SELECT 
    b.base_ID, 
    b.location, 
    COUNT(v.volunteer_ID) AS volunteer_count
FROM 
    Base b
JOIN 
    Shifts s ON b.base_ID = s.base_ID
JOIN 
    signed_up su ON s.shift_ID = su.Shift_ID
JOIN 
    Volunteers v ON su.Volunteer_ID = v.volunteer_ID
GROUP BY 
    b.base_ID, b.location
ORDER BY 
    volunteer_count DESC;
