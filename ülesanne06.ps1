cls
$nimi = "Kristo Tammeleht" 
$email = "tammeleht5kristo5@gmail.com"
${kuu päev} = Get-Date
Write-Host "$nimi"
Write-Host "$email"
Write-Host "${kuu päev}"
"*****************************************"
$emailid = Get-Content -path C:\POWERSHELL\emailid.txt 
$es = $emailid.split("*,*") |Select-Object -first 1 
$vi = $emailid.split("*,*") |Select-Object -last 1 
$emailid += ",$email "
$masiiv = $emailid.Split("*,*")
$masiiv

$kogus = ($emailid.split("*,*") | Measure-Object).count 
Write-Host "emaile on $kogus"
Write-Host "esimene email on $es"
Write-Host "viimane email on $vi"
"*****************************************"
$masiiv[0,-1]