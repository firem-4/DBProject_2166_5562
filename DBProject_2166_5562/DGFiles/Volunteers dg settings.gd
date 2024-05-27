
[General]
Version=1

[Preferences]
Username=
Password=2378
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=VOLUNTEERS
Count=400

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=JOIN_DATE
Type=DATE
Size=
Data=Random(01/01/2023, 01/01/2024)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=100
Data=FirstName + LastName
Master=

[Record]
Name=ROLE_ID
Type=NUMBER
Size=
Data=SQL(SELECT * FROM (SELECT Role_id FROM Position ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

[Record]
Name=GEAR_ID
Type=NUMBER
Size=
Data=SQL(SELECT * FROM (SELECT GEAR_ID FROM GEAR ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1))
Master=

[Record]
Name=PHONE_NUMBER
Type=NUMBER
Size=
Data=SQL(SELECT * FROM (SELECT PHONE_NUMBER FROM PERSONAL_INFO ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

