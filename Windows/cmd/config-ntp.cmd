
rem configurate as Network Time client
w32tm /config /manualpeerlist:"ip address",0x8 /syncfromflags:MANUAL /update

rem display time
w32tm /query /configuration
w32tm /query /status
Time /T