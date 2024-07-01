prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by yairb on יום שני 01 יולי 2024
set feedback off
set define off

prompt Creating BASE...
create table BASE
(
  base_id     NUMBER not null,
  location    VARCHAR2(1000) not null,
  description VARCHAR2(1000) not null
)
;
alter table BASE
  add primary key (BASE_ID);

prompt Creating GEAR...
create table GEAR
(
  armor_type NUMBER not null,
  gun_type   NUMBER not null,
  gear_id    NUMBER not null
)
;
alter table GEAR
  add primary key (GEAR_ID);
alter table GEAR
  add constraint CHK_GEAR_TYPE
  check (armor_type BETWEEN 1 AND 5);

prompt Creating PERSONAL_INFO...
create table PERSONAL_INFO
(
  address      VARCHAR2(1000) not null,
  phone_number VARCHAR2(20) not null,
  email        VARCHAR2(500) not null
)
;
alter table PERSONAL_INFO
  add primary key (PHONE_NUMBER);

prompt Creating POSITION...
create table POSITION
(
  role_id     NUMBER not null,
  role_name   VARCHAR2(100) not null,
  description VARCHAR2(1000) not null
)
;
alter table POSITION
  add primary key (ROLE_ID);

prompt Creating SHIFTS...
create table SHIFTS
(
  shift_id        NUMBER not null,
  start_date_time DATE not null,
  end_date_time   DATE not null,
  base_id         NUMBER not null
)
;
alter table SHIFTS
  add primary key (SHIFT_ID);
alter table SHIFTS
  add foreign key (BASE_ID)
  references BASE (BASE_ID);
alter table SHIFTS
  add constraint CHK_SHIFT_TIMES
  check (end_date_time > start_date_time);

prompt Creating VOLUNTEERS...
create table VOLUNTEERS
(
  volunteer_id NUMBER not null,
  join_date    DATE default SYSDATE not null,
  name         VARCHAR2(100) not null,
  role_id      NUMBER not null,
  gear_id      NUMBER not null,
  phone_number VARCHAR2(20) not null
)
;
alter table VOLUNTEERS
  add primary key (VOLUNTEER_ID);
alter table VOLUNTEERS
  add foreign key (ROLE_ID)
  references POSITION (ROLE_ID);
alter table VOLUNTEERS
  add foreign key (GEAR_ID)
  references GEAR (GEAR_ID);
alter table VOLUNTEERS
  add foreign key (PHONE_NUMBER)
  references PERSONAL_INFO (PHONE_NUMBER);

prompt Creating SIGNED_UP...
create table SIGNED_UP
(
  volunteer_id NUMBER not null,
  shift_id     NUMBER not null
)
;
alter table SIGNED_UP
  add primary key (VOLUNTEER_ID, SHIFT_ID);
alter table SIGNED_UP
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEERS (VOLUNTEER_ID);
alter table SIGNED_UP
  add foreign key (SHIFT_ID)
  references SHIFTS (SHIFT_ID);

prompt Loading BASE...
insert into BASE (base_id, location, description)
values (1, 'Alpha Base', 'Updated description for Alpha Base.');
insert into BASE (base_id, location, description)
values (2, 'Bravo Base', 'Secondary base located in the eastern sector.');
commit;
prompt 2 records loaded
prompt Loading GEAR...
insert into GEAR (armor_type, gun_type, gear_id)
values (1, 1, 1);
insert into GEAR (armor_type, gun_type, gear_id)
values (2, 2, 2);
insert into GEAR (armor_type, gun_type, gear_id)
values (3, 3, 3);
commit;
prompt 3 records loaded
prompt Loading PERSONAL_INFO...
insert into PERSONAL_INFO (address, phone_number, email)
values ('1234 Elm Street', '555-1234', 'john.doe@example.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5678 Oak Avenue', '555-5678', 'jane.smith@example.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9101 Pine Lane', '555-9101', 'alice.johnson@example.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7890 Spruce Street', '555-7890', 'frank.green@example.com');
commit;
prompt 4 records loaded
prompt Loading POSITION...
insert into POSITION (role_id, role_name, description)
values (1, 'Leader', 'Responsible for overall coordination and strategy.');
insert into POSITION (role_id, role_name, description)
values (2, 'Medic', 'Provides medical support and first aid.');
insert into POSITION (role_id, role_name, description)
values (3, 'Engineer', 'Responsible for maintenance and technical support.');
commit;
prompt 3 records loaded
prompt Loading SHIFTS...
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (1, to_date('01-06-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-06-2024 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (2, to_date('01-06-2024 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-06-2024', 'dd-mm-yyyy'), 2);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (3, to_date('02-06-2024', 'dd-mm-yyyy'), to_date('02-06-2024 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), 1);
commit;
prompt 3 records loaded
prompt Loading VOLUNTEERS...
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (1, to_date('01-01-2024', 'dd-mm-yyyy'), 'John Doe', 3, 1, '555-1234');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (2, to_date('15-02-2024', 'dd-mm-yyyy'), 'Jane Smith', 2, 2, '555-5678');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (3, to_date('10-03-2024', 'dd-mm-yyyy'), 'Alice Johnson', 3, 3, '555-9101');
commit;
prompt 3 records loaded
prompt Loading SIGNED_UP...
insert into SIGNED_UP (volunteer_id, shift_id)
values (1, 1);
insert into SIGNED_UP (volunteer_id, shift_id)
values (2, 2);
insert into SIGNED_UP (volunteer_id, shift_id)
values (3, 3);
commit;
prompt 3 records loaded

set feedback on
set define on
prompt Done
