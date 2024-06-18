-- 1. Update the location description for a specific base.
UPDATE Base
SET description = 'Updated description for Alpha Base.'
WHERE base_ID = 1;

-- 2. Update the role of a specific volunteer.
UPDATE Volunteers
SET role_ID = (SELECT role_ID FROM Position WHERE role_name = 'Engineer')
WHERE volunteer_ID = 1;
