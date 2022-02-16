cls
#Kristo tammeleht 27.01.22 IT-21

#arvutab ruumala inimese ise antud arvuga
function rad{
    <#
    .SYNOPSIS
        kirjuta raadius
    .DESCRIPTION
        kirjuta oma ringi raadius cm ja see muudab selle pindalaks
    .EXAMPLE
        kirjutad 7 cm se paneb selle ruutu korrutab pi ga ja saad vastuse 
    

    #>

    param
        (
        [Parameter(Mandatory=$true, HelpMessage=’Lisa siia ringi raadius (cm)’)]
        $raadius
        
        )
        
         [Math]::Round([Math]::PI*[Math]::Pow($raadius,2),2)
}
rad

#teeb nime ilma täpi tähtedeta ja suurte algus tähtedega
function nimi{
    <#
    .SYNOPSIS
        kirjuta oma nimi
    .DESCRIPTION
        kirjuta nimi ükskõik mis eesti täpi tähtedega aga see muudab need ära
    .EXAMPLE
        äike = aike
    
    #>
    param
        (
        [Parameter(Mandatory=$true, HelpMessage=’Lisa siia oma täis nimi’)]
        $nim
        
        )
        $nimi = $nim -replace "\s+"," "
        $asend = $nimi.ToLower()
         $asenda = $asend.Replace("ü","u").Replace("õ","o").Replace("ä","a").Replace("ö","o")
         (Get-Culture).TextInfo.ToTitleCase($asenda.ToLower())
}
nimi