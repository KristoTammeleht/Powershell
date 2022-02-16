cls
(Get-WmiObject -Class Win32_Processor).caption
[system.net.dns]::GetHostname()
Get-CimInstance -ClassName CIM_OperatingSystem
Get-NetAdapter | Select-Object -Property name

(Get-NetIPAddress -AddressFamily IPV4 ).caption
Get-WmiObject win32_physicalmemory 
(Get-WmiObject win32_VideoController).caption
$env:UserName
