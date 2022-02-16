cls
$protsessor = Get-WmiObject Win32_Processor |Select-Object -Property name | select -ExpandProperty name 
$net = Get-NetAdapter | Select-Object -Property name | select -ExpandProperty name
$sysn = [system.net.dns]::GetHostname()
$ip = Get-WmiObject Win32_networkadapterconfiguration | Select-Object -Property IPAddress | select -ExpandProperty IPAddress
$gpu = Get-WmiObject win32_VideoController |Select-Object -Property name | select -ExpandProperty name
$ram = (Get-WmiObject win32_physicalmemory | Measure-Object -Property capacity -sum).sum /1gb
$sys = (Get-WmiObject -class Win32_OperatingSystem).Caption

Write-Host "Süsteemi nimi on *$env:UserName*."
Write-Host "Protsessorid on *$protsessor*."
Write-Host "Wifi adapter on *$net*."
Write-Host "Hosti nimi on*$sysn*."
Write-Host "IP on *$ip*."
Write-Host "Rami on *$ram*GB."
Write-Host "Op süsteem on *$sys*."
Write-Host "Gpu on *$gpu*."
