net start AppIDSvc
REG add "HKLM\SYSTEM\CurrentControlSet\services\AppIDSvc" /v Start /t REG_DWORD /d 2 /f 
