netsh advfirewall set currentprofile firewallpolicy blockinboundalways,allowoutbound 
netsh advfirewall set publicprofile state on 
netsh advfirewall set privateprofile state on
netsh advfirewall set domainprofile state on
netsh advfirewall set allprofile state on
netsh advfirewall set allprof ile state off
