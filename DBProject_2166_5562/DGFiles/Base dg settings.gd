
[General]
Version=1

[Preferences]
Username=
Password=2650
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=BASE
Count=400

[Record]
Name=BASE_ID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=LOCATION
Type=VARCHAR2
Size=1000
Data=City 
Master=

[Record]
Name=DESCRIPTION
Type=VARCHAR2
Size=1000
Data=Components.Description
Master=

