
[General]
Version=1

[Preferences]
Username=
Password=2534
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=SHIFTS
Count=400

[Record]
Name=SHIFT_ID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=START_DATE_TIME
Type=DATE
Size=
Data=Random(01/01/2023, 01/01/2024)
Master=

[Record]
Name=END_DATE_TIME
Type=DATE
Size=
Data=Random(01/01/2023, 01/01/2024)
Master=

[Record]
Name=BASE_ID
Type=NUMBER
Size=
Data=SQL(SELECT * FROM (SELECT BASE_ID FROM BASE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

