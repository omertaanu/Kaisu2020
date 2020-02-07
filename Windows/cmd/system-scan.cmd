@ECHO OFF
color 0a

break  > system-output.txt

rem 
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
@ECHO Current time is %mydate%:%mytime% >> system-output.txt

rem show user accounts
@ECHO --------------------- >> system-output.txt
@ECHO --- USER ACCOUNTS --- >> system-output.txt
net user >> system-output.txt

rem show network status
@ECHO ------------------------ >> system-output.txt
@ECHO --- IP CONFIGURATION --- >> system-output.txt
ipconfig /all >> system-output.txt

rem record start up folder
@ECHO ----------------------- >> system-output.txt
@ECHO --- START UP FOLDER --- >> system-output.txt
wmic startup list full >> system-output.txt