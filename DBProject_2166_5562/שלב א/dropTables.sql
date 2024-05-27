-- Drop the 'signed_up' table first because it has foreign key references to 'Volunteers' and 'Shifts'
drop TABLE signed_up;

-- Drop the 'Shifts' table next because it has a foreign key reference to 'Base'
drop TABLE Shifts;

-- Drop the 'Volunteers' table next because it has foreign key references to 'Roles', 'Gear', and 'Personal_info'
drop TABLE Volunteers;

-- Drop the 'Roles' table next because it is referenced by 'Volunteers'
drop TABLE Position;

-- Drop the 'Gear' table next because it is referenced by 'Volunteers'
drop TABLE Gear;

-- Drop the 'Personal_info' table next because it is referenced by 'Volunteers'
drop TABLE Personal_info;

-- Drop the 'Base' table last because it is referenced by 'Shifts'
drop TABLE Base;
