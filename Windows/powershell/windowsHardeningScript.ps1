#flush DNS of mal sites
ipconfig /flushdns 

#flusg Netbois cache of host IP
nbtstat -R 
  
#Rules for IPSec over port 80 and 447
netsh ipsec static add filteraction name=Allow action=permit 
netsh ipsec static add filter filterlist=WebFilter srcaddr=Any dstaddr=Any protocol=TCP dstport=80 
netsh ipsec static add filter filterlist=WebFilter srcaddr=Any dstaddr=Any protocol=TCP dstport=443 
netsh ipsec static add rule name=WebAllow policy=MyIPsecPolicy filterlist=WebFilter filteraction=Allow conntype=all activate=yes psk=<PASSWORD>

netsh advfirewall consec add rule name=uIPSEC" endpointl=any endpoint2=any action=requireinrequireout qmsecmethods=default 
#Show IPPSEC rules
netsh ipsec static show policy name=MyIPsecPolicy 

#requires preshared-key to any and all out going request
netsh advfirewall firewall add rule name=uIPSEC_Out" dir=out action=allow enable=yes profile=any localip=any remoteip=any protocol=any interfacetype=any security=authenticate 

#firewall rules for DNS and web browsing
netsh advfirewall firewall add rule name="Allow Outbound Port 5311 dir=out localport=53 protocol=UDP action=allow 
netsh advfirewall firewall add rule name="Allow Outbound Port 8011 dir=out localport=80 protocol=TCP action=allow 


#incase shit hits the fan and firewall rules dont work use to delete the IPsec rules
#netsh advfirewall firewall delete rule name="IPSEC_RULE"


#enable logging for failed and success logins MUST MODIFY
auditpol /set /user:billy /category:"Detailed Tracking" /include /success:enable /failure:enable 

#enable firewall logging
netsh firewall set logging droppedpackets connections = enable

#DisAllow .exe files DO AFTER HARDENING IS COMPLETE!!!!!!
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v DisallowRun /t REG_DWORD /d "00000001" /f 

#disallow Remote Desktop
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /f /v fDenyTSConnections /t REG_DWORD /d 1
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ /v lmcompatibilitylevel /t REG_DWORD /d 5 /f 

#restrict annoymous access
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymous /t REG_DWORD /d 1 /f 

#disallow anonymous enumerations of SAM accounts and shares
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymoussam /t REG_DWORD /d 1 /f 

#disalble IPv6
reg add HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters /v DisabledComponents /t REG_DWORD /d 255 /f 

#Disbale Sticky Keys 
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f

#disable ToggleKeys
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ Id 58 /f

#Disable Filter Keys
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f 

#disable On-Screen Keyboard
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI /f /v ShowTabletKeyboard /t REG_DWORD /d 0

#disable Administrative shares - workstations
reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /f /v AutoShareWks /t REG_DWORD /d 0 

#disable Administrative share - Servers 
reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /f /v AutoShareServer /t REG_DWORD /d 0

#Remove creations of Hashes used to pass-the-hash attacks
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /f /v NoLMHash /t REG_DWORD /d 1 

#disable IE Password Cache 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v DisablePasswordCaching /t REG_DWORD /d 1 /f 

#disable CMD prompt DO LAST
#reg add HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /t REG_DWORD /d 1 /f

#disable Admin creds cache on host when using RDP
reg add HKLM\System\CurrentControlSet\Control\Lsa /v DisableRestrictedAdmin /t REG_DWORD /d 0 /f 

#do not process the run once list
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v DisableLocalMachineRunOnce /t REG_DWORD /d 1 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v DisableLocalMachineRunOnce /t REG_DWORD /d 1 

#require user access control (UAC) permission
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f 






































