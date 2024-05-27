CREATE TABLE Position
(
  role_ID INT NOT NULL,
  role_name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  PRIMARY KEY (role_ID)
);

CREATE TABLE Base
(
  base_ID INT NOT NULL,
  location VARCHAR(1000) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  PRIMARY KEY (base_ID)
);

CREATE TABLE Gear
(
  armor_type INT NOT NULL,
  gun_type INT NOT NULL,
  gear_ID INT NOT NULL,
  PRIMARY KEY (gear_ID)
);

CREATE TABLE Personal_info
(
  address VARCHAR(1000) NOT NULL,
  phone_number INT NOT NULL,
  email VARCHAR(500) NOT NULL,
  PRIMARY KEY (phone_number)
);

CREATE TABLE Volunteers
(
  volunteer_ID INT NOT NULL,
  join_date DATE NOT NULL,
  name VARCHAR(100) NOT NULL,
  role_ID INT NOT NULL,
  gear_ID INT NOT NULL,
  phone_number INT NOT NULL,
  PRIMARY KEY (volunteer_ID),
  FOREIGN KEY (role_ID) REFERENCES Roles(role_ID),
  FOREIGN KEY (gear_ID) REFERENCES Gear(gear_ID),
  FOREIGN KEY (phone_number) REFERENCES Personal_info(phone_number)
);

CREATE TABLE Shifts
(
  shift_ID INT NOT NULL,
  start_date_time DATE NOT NULL,
  end_date_time DATE NOT NULL,
  base_ID INT NOT NULL,
  PRIMARY KEY (shift_ID),
  FOREIGN KEY (base_ID) REFERENCES Base(base_ID)
);

CREATE TABLE signed_up
(
  Volunteer_ID INT NOT NULL,
  Shift_ID INT NOT NULL,
  PRIMARY KEY (Volunteer_ID, Shift_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(volunteer_ID),
  FOREIGN KEY (Shift_ID) REFERENCES Shifts(shift_ID)
);