# kristo tammeleht 28.01.2022 IT-21

#lisab user.cvs faili
$users = Import-Csv C:\POWERSHELL\users.csv



"***************************************"
forEach ($user in $users) {


    #täisnimi
    $fname =  $user."first_name"
    $lname =  $user."last_name"
    $fullnim = $fname + " " + $lname
    $nuser = (Get-Culture).TextInfo.ToTitleCase($fullnim.ToLower())
    write-host "Täis nimi: " $nuser
    #username
    $fn =   $user."first_name"
    $nfn =  $fn.Substring(0,1)
    $ln =   $user."last_name"
    $lUsername =$nfn + " " + $ln
    $fuser = $lUsername.ToLower()
    Write-Host "username: " $fuser.Remove(1,1)
    #gmail
    $nemail =   $user."email"
    $nemail
    #password
    $ip =  $user."ip_address"
    $nip = $ip.Substring(0,2)
    $tln =  $user."last_name"
    $ntln = $tln.Substring(0,3)
    $pass = $ntln  + $nip
    $pass
    "-------------"


}
"***************************************"