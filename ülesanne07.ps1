#ÜL 7 kristo tammeleht 24.01.22 IT-21
cls
#leiab jetta tähe
$ke = (Get-PSDrive -PSProvider FileSystem).Name
#######################################################################
foreach($ks in $ke){
#leiab ketta ruumi vaba ruumi ja arvutab protsendi
    $g = (Get-Volume -DriveLetter $ks | Measure-Object -Property SizeRemaining -sum).sum /1gb

    $f = (Get-Volume -DriveLetter $ks | Measure-Object -Property Size -sum).sum /1gb

    $p = [Math]::Round(($g/$f*100),2)
#######################################################################
    if ($p -lt 50) {
    Write-Host ""Ketta tähis on:"$ks "Vaba ruumi on:"$p%" "Ketas hakkab täis saama"
}
else {
    Write-Host ""Ketta tähis on:"$ks "Vaba ruumi on:"$p%" "kõik on korras"
}
    "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"
}
#saab domeenis olevate arvutite leidmine
$vw = get-adcomputer -filter {operatingsystem -like '*windows*'} -property * | Select-Object name | select -ExpandProperty name
#######################################################################
foreach($vs in $vw){
    Write-Host "$vs"
    #arvuti nimest leiab 
    $q = (get-wmiobject -ComputerName $vs  -class win32_logicaldisk).deviceid.substring(0,1)
    #######################################################################
foreach($s in $q){

        write-host "võrguketas: $vs"
        #saab domeeni  arvutilt keta suuruse ja vaba ruumi siis arvutab protsendi
        $vv =  (Get-WmiObject -ComputerName $vs -class win32_logicaldisk | where-object {$_.deviceid -like "*$s*"}).freespace


        $v =  (Get-WmiObject -ComputerName $vs -class win32_logicaldisk | where-object {$_.deviceid -like "*$s*"}).size


        $vvv = [Math]::Round(($vv/$v*100),2)

        write-host "võrku ketta maht $vvv%"
#######################################################################
if($vvv -lt 50) {

        write-host "Ruum hakkab tühjaks saama"
        "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"
}
else

{

        write-host "Ruumi on piisavalt"
        "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"
}

    write-host ""
}
    
}