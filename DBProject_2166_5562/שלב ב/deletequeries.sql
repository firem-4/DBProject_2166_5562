-- 1. Delete all volunteers who have not signed up for any shifts.
DELETE FROM Volunteers
WHERE volunteer_ID NOT IN (SELECT Volunteer_ID FROM signed_up);

-- 2. Delete all shifts that have no volunteers signed up.
DELETE FROM Shifts
WHERE shift_ID NOT IN (SELECT Shift_ID FROM signed_up);