#kristo tammeleht 16.02.22
cls

$OU =  "OU=KASUTAJAD,DC=TAMMELEHT,DC=LOCAL"
$ADkasutajad = Get-ADUser -filter * -SearchBase $OU -Properties distinguishedname, LastLogon | Select distingushedname , SamAccountName, @{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}}
foreach($kasutaja in $ADkasutajad){

$kas =$kasutaja.SamAccountName
$kuupaev = Get-Date
$login = $kasutaja.lastlogon
$path = $kasutaja.distinguishedname
$vahe =  (New-TimeSpan -start $login -end $kuupaev).days

if ($vahe -gt 365){
 Move-ADObject -Identity $path -TargetPath "OU=Endisedtootajad,DC=TAMMELHT,DC=LOCAL"
 Disable-ADAccount -Identity $kas
}
else {
Write-Host("$kas autentispäeva tagasi $vahe")
}
}