# CREATE TABLE Position
# (
#   role_ID INT NOT NULL,
#   role_name VARCHAR(100) NOT NULL,
#   description VARCHAR(1000) NOT NULL,
#   PRIMARY KEY (role_ID)
# );

# CREATE TABLE Base
# (
#   base_ID INT NOT NULL,
#   location VARCHAR(1000) NOT NULL,
#   description VARCHAR(1000) NOT NULL,
#   PRIMARY KEY (base_ID)
# );

# CREATE TABLE Gear
# (
#   armor_type INT NOT NULL,
#   gun_type INT NOT NULL,
#   gear_ID INT NOT NULL,
#   PRIMARY KEY (gear_ID)
# );

# CREATE TABLE Personal_info
# (
#   address VARCHAR(1000) NOT NULL,
#   phone_number INT NOT NULL,
#   email VARCHAR(500) NOT NULL,
#   PRIMARY KEY (phone_number)
# );

# CREATE TABLE Volunteers
# (
#   volunteer_ID INT NOT NULL,
#   join_date DATE NOT NULL,
#   name VARCHAR(100) NOT NULL,
#   role_ID INT NOT NULL,
#   gear_ID INT NOT NULL,
#   phone_number INT NOT NULL,
#   PRIMARY KEY (volunteer_ID),
#   FOREIGN KEY (role_ID) REFERENCES Roles(role_ID),
#   FOREIGN KEY (gear_ID) REFERENCES Gear(gear_ID),
#   FOREIGN KEY (phone_number) REFERENCES Personal_info(phone_number)
# );

# CREATE TABLE Shifts
# (
#   shift_ID INT NOT NULL,
#   start_date_time DATE NOT NULL,
#   end_date_time DATE NOT NULL,
#   base_ID INT NOT NULL,
#   PRIMARY KEY (shift_ID),
#   FOREIGN KEY (base_ID) REFERENCES Base(base_ID)
# );

# CREATE TABLE signed_up
# (
#   Volunteer_ID INT NOT NULL,
#   Shift_ID INT NOT NULL,
#   PRIMARY KEY (Volunteer_ID, Shift_ID),
#   FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(volunteer_ID),
#   FOREIGN KEY (Shift_ID) REFERENCES Shifts(shift_ID)
# );

# Generate data for the tables
import random
import datetime
import string
import csv
import random
import datetime
import string
import csv

def random_date():
    start_date = datetime.date(2019, 1, 1)
    end_date = datetime.date(2020, 1, 1)
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    return random_date

def randomCity():
    cities = ["Jerusalem", "Tel Aviv", "Haifa", "Rishon LeZion", "Petah Tikva", "Ashdod", "Netanya", "Beer Sheva", "Holon", "Bnei Brak", "Ramat Gan", "Ashkelon", "Bat Yam", "Beit Shemesh", "Kiryat Gat", "Herzliya", "Kiryat Malachi", "Lod", "Rosh HaAyin", "Ramat HaSharon", "Kiryat Ono", "Kiryat Bialik", "Kiryat Yam", "Kiryat Motzkin", "Kiryat Ata", "Kiryat Shmona", "Kiryat Tivon", "Kiryat Haim", "Kiryat Sharet", "Kiryat Ekron", "Kiryat Arba",]
    return cities[random.randint(0, len(cities) - 1)]
def randomDescription():
    descriptions = ["top quality", "good", "bad", "very bad", "very good", "excellent", "very excellent", "very very excellent", "very very good", "very very bad", "very very very bad", "very very very good", "very very very excellent", "very very very very excellent", "very very very very good", "very very very very bad", "very very very very very bad", "very very very very very good", "very very very very very excellent", "very very very very very very excellent", "very very very very very very good", "very very very very very very bad", "very very very very very very very bad", "very very very very very very very good", "very very very very very very very excellent", "very very very very very very very very excellent", "very very very very very very very very good", "very very very very very very very very bad", "very very very very very very very very very bad", "very very very very very very very very very good", "very very very very very very very very very excellent"]
    return descriptions[random.randint(0, len(descriptions) - 1)]

def randomName():
    names = ["Doctor", "Nurse", "Paramedic", "Driver", "Security", "Manager", "Supervisor", "Volunteer", "Coordinator", "Secretary", "Receptionist", "Guard", "Firefighter", "Police", "Soldier", "Pilot", "Engineer", "Technician", "Electrician", "Mechanic"]
    return names[random.randint(0, len(names) - 1)]


def randomEmail():
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=10)) + "@gmail.com"
#format phone number 053-123-4567
#id will be from 0 too 500
def getPhoneNumberFromId(id):
    return "053-" + str(id).zfill(3) + "-" + str(id).zfill(4)


#generate 500 for each table
def generate_data():
    amount = 500
    with open('Position.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["role_ID", "role_name", "description"])
        for i in range(amount):
            writer.writerow([i, randomName(), randomDescription()])
    with open('Base.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["base_ID", "location", "description"])
        for i in range(amount):
            writer.writerow([i, randomCity(), randomDescription()])

    with open('Gear.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["armor_type", "gun_type", "gear_ID"])
        for i in range(amount):
            writer.writerow([random.randint(0, 100), random.randint(0, 100), i])

    with open('Personal_info.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["address", "phone_number", "email"])
        for i in range(amount):
            with open('Personal_info.csv', 'w', newline='') as file:
                writer = csv.writer(file)
                writer.writerow(["address", "phone_number", "email"])
                for i in range(amount):
                    writer.writerow([randomCity(), getPhoneNumberFromId(i), randomEmail()])

    with open('Volunteers.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["volunteer_ID", "join_date", "name", "role_ID", "gear_ID", "phone_number"])
        for i in range(amount):
            writer.writerow([i, random_date(), randomName(), random.randint(0, 500), random.randint(0, 500), getPhoneNumberFromId(i)])

    with open('Shifts.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["shift_ID", "start_date_time", "end_date_time", "base_ID"])
        for i in range(amount):
            writer.writerow([random.randint(0, 500) , random_date(), random_date(), random.randint(0, 500)])
    
    # signed_up needs to use the same volunteers and shifts
    with open('signed_up.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["Volunteer_ID", "Shift_ID"])
        for i in range(amount):
            writer.writerow([random.randint(0, 500), random.randint(0, 500)])

generate_data()
