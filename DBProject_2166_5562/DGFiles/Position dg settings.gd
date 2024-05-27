
[General]
Version=1

[Preferences]
Username=
Password=2117
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=POSITION
Count=400

[Record]
Name=ROLE_ID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=ROLE_NAME
Type=VARCHAR2
Size=100
Data=Elements.Name
Master=

[Record]
Name=DESCRIPTION
Type=VARCHAR2
Size=1000
Data=Components.Description
Master=

