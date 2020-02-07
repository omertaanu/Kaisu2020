@ECHO OFF
color 0a
echo Ping Scan Started
break  > ping-output.txt
for /L %%i in (1,1,254) do ping -a -w 30 -n 1 192.168.1.%%i | find "Reply" >> ping-output.txt
pause