
[General]
Version=1

[Preferences]
Username=
Password=2786
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=SIGNED_UP
Count=400

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=SQL(SELECT * FROM (SELECT VOLUNTEER_ID FROM VOLUNTEERS ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

[Record]
Name=SHIFT_ID
Type=NUMBER
Size=
Data=SQL(SELECT * FROM (SELECT SHIFT_ID FROM SHIFTS ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

