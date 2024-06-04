SELECT 
    volunteer_ID, 
    name, 
    join_date
FROM 
    Volunteers
WHERE 
    join_date > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY 
    join_date DESC;
