#Here are the commands used to complete the Email Address Assignment.
#Don't run them all at one time, you will need to selectively run them

New-ADOrganizationalUnit -name Student -path "DC=ITNET, DC=pri"
Get-ADOrganizationalUnit -Filter *
Get-ADUser -Filter {name -like "Test*"} -Properties EmailAddress | Export-Csv "C:\users.csv"
Get-Content C:\users.csv 
Import-Csv C:\users2.csv | Out-GridView

import-csv C:\users2.csv | ForEach-Object {
$username = $_.name
$EmailAddress = $_.EmailAddress
#Write-Host $username, $EmaiAddress
Get-ADUser -Filter {name -eq $username} | Set-ADUser -EmailAddress $EmailAddress
}