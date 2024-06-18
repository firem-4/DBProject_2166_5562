CREATE TABLE Position
(
  role_ID NUMBER NOT NULL,
  role_name VARCHAR2(100) NOT NULL,
  description VARCHAR2(1000) NOT NULL,
  PRIMARY KEY (role_ID)
);

CREATE TABLE Base
(
  base_ID NUMBER NOT NULL,
  location VARCHAR2(1000) NOT NULL,
  description VARCHAR2(1000) NOT NULL,
  PRIMARY KEY (base_ID)
);

CREATE TABLE Gear
(
  armor_type NUMBER NOT NULL,
  gun_type NUMBER NOT NULL,
  gear_ID NUMBER NOT NULL,
  PRIMARY KEY (gear_ID)
);

CREATE TABLE Personal_info
(
  address VARCHAR2(1000) NOT NULL,
  phone_number VARCHAR2(20) NOT NULL,
  email VARCHAR2(500) NOT NULL,
  PRIMARY KEY (phone_number)
);

CREATE TABLE Volunteers
(
  volunteer_ID NUMBER NOT NULL,
  join_date DATE NOT NULL,
  name VARCHAR2(100) NOT NULL,
  role_ID NUMBER NOT NULL,
  gear_ID NUMBER NOT NULL,
  phone_number VARCHAR2(20) NOT NULL,
  PRIMARY KEY (volunteer_ID),
  FOREIGN KEY (role_ID) REFERENCES Position(role_ID),
  FOREIGN KEY (gear_ID) REFERENCES Gear(gear_ID),
  FOREIGN KEY (phone_number) REFERENCES Personal_info(phone_number)
);

CREATE TABLE Shifts
(
  shift_ID NUMBER NOT NULL,
  start_date_time DATE NOT NULL,
  end_date_time DATE NOT NULL,
  base_ID NUMBER NOT NULL,
  PRIMARY KEY (shift_ID),
  FOREIGN KEY (base_ID) REFERENCES Base(base_ID)
);

CREATE TABLE signed_up
(
  Volunteer_ID NUMBER NOT NULL,
  Shift_ID NUMBER NOT NULL,
  PRIMARY KEY (Volunteer_ID, Shift_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(volunteer_ID),
  FOREIGN KEY (Shift_ID) REFERENCES Shifts(shift_ID)
);