-- 1. Select all volunteers who joined within a date range, along with their role names.
SELECT V.name, V.join_date, P.role_name
FROM Volunteers V
JOIN Position P ON V.role_ID = P.role_ID
WHERE V.join_date BETWEEN TO_DATE('&start_date', 'YYYY-MM-DD') AND TO_DATE('&end_date', 'YYYY-MM-DD')
ORDER BY V.join_date;

-- 2. Select all shifts at a specific base with a specific role type signed up.
SELECT S.shift_ID, S.start_date_time, S.end_date_time, B.location, V.name
FROM Shifts S
JOIN Base B ON S.base_ID = B.base_ID
JOIN signed_up SU ON S.shift_ID = SU.Shift_ID
JOIN Volunteers V ON SU.Volunteer_ID = V.volunteer_ID
JOIN Position P ON V.role_ID = P.role_ID
WHERE B.base_ID = &base_id AND P.role_name = '&role_name'
ORDER BY S.start_date_time;

-- 3. Count the number of volunteers for each role within a specific date range.
SELECT P.role_name, COUNT(V.volunteer_ID) AS volunteer_count
FROM Position P
JOIN Volunteers V ON P.role_ID = V.role_ID
WHERE V.join_date BETWEEN TO_DATE('&start_date', 'YYYY-MM-DD') AND TO_DATE('&end_date', 'YYYY-MM-DD')
GROUP BY P.role_name
ORDER BY volunteer_count DESC;

-- 4. Find volunteers with a specific gear type signed up for shifts within a date range.
SELECT V.name, G.armor_type, G.gun_type, S.start_date_time, S.end_date_time
FROM Volunteers V
JOIN Gear G ON V.gear_ID = G.gear_ID
JOIN signed_up SU ON V.volunteer_ID = SU.Volunteer_ID
JOIN Shifts S ON SU.Shift_ID = S.shift_ID
WHERE G.armor_type = &armor_type AND S.start_date_time BETWEEN TO_DATE('&start_date', 'YYYY-MM-DD') AND TO_DATE('&end_date', 'YYYY-MM-DD')
ORDER BY V.name;
