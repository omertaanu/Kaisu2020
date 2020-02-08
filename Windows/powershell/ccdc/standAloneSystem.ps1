reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Poli cies\Explorer" /v DisallowRun /t REG_DWORD /d "00000001" /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Poli cies\Explorer\DisallowRun" /v badfile.exe /t REG_SZ /d <BAD FILE NAME>.exe /f
reg add "HKLM\SYSTEM\Cu rrentCont ro lSet\Cont ro l \ Terminal Server" /f /v fDenyTSConnections /t REG_DWORD /d 1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ /v lmcompatibilitylevel /t REG_DWORD /d 5 /f 
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymous /t REG_DWORD /d 1 /f 
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymoussam /t REG_DWORD /d 1 /f 
reg add HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parame ters /v DisabledComponents /t REG_DWORD /d 255 /f 
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f
reg add "HKCU\Control Panel \Accessibility\ ToggleKeys" /v Flags /t REG_SZ Id 58 /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f 
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI /f /v ShowTabletKeyboard /t REG_DWORD /d 0
reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\ Parameters /f /v AutoShareWks /t REG_DWORD /d 0 
