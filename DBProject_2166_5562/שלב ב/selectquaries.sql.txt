-- 1. Select all volunteers who joined in a specific year, along with their roles and gear information.
SELECT V.name, V.join_date, P.role_name, G.armor_type, G.gun_type
FROM Volunteers V
JOIN Position P ON V.role_ID = P.role_ID
JOIN Gear G ON V.gear_ID = G.gear_ID
WHERE EXTRACT(YEAR FROM V.join_date) = 2024
ORDER BY V.name;

-- 2. Select all volunteers signed up for shifts at a specific base, including shift start and end times.
SELECT V.name, S.start_date_time, S.end_date_time, B.location
FROM Volunteers V
JOIN signed_up SU ON V.volunteer_ID = SU.Volunteer_ID
JOIN Shifts S ON SU.Shift_ID = S.shift_ID
JOIN Base B ON S.base_ID = B.base_ID
WHERE B.base_ID = 1
ORDER BY S.start_date_time;

-- 3. Count the number of volunteers per role, grouped by role name.
SELECT P.role_name, COUNT(V.volunteer_ID) AS volunteer_count
FROM Position P
LEFT JOIN Volunteers V ON P.role_ID = V.role_ID
GROUP BY P.role_name
ORDER BY volunteer_count DESC;

-- 4. Find the total number of shifts each volunteer has signed up for, along with their name.
SELECT V.name, COUNT(SU.Shift_ID) AS total_shifts
FROM Volunteers V
JOIN signed_up SU ON V.volunteer_ID = SU.Volunteer_ID
GROUP BY V.name
ORDER BY total_shifts DESC;
