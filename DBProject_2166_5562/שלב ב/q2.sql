SELECT 
    v.volunteer_ID, 
    v.name, 
    g.armor_type, 
    g.gun_type
FROM 
    Volunteers v
JOIN 
    Gear g ON v.gear_ID = g.gear_ID
ORDER BY 
    v.name ASC;
