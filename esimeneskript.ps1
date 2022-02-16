#kristo tammeleht
#13.01.22 
#
#puhastab ekraanil olevat texti
cls

Write-Host
Write-Host "õpime skriptima powershellis"
$kuupäev = Get-Date -Format ´dd.mm.yyyy´
Write-Host "tänane kuupäev on $kuupäev!"

Write-Host "aasta lõpuni on jäänud " (New-TimeSpan 2022-12-31).Days "päeva"