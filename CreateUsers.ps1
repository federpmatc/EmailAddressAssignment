#The following script can be used to create bulk users
#$total should be set to how many users you want to create

#$Path should be set to the location where users should be created
#$DomainName set to your domain

$domainName = "ITNET.pri"
$path = "You figure this out :)"
$total=100 #this controls how many users get created

#The following block of code will get executed 100 times (or whatever the value of $total is set to.
for ($UserIndex=1; $UserIndex -le $total; $UserIndex++)
{
$userID= $UserIndex
$userName = "TestStudent$userID"
Write-Host "Creating user $userName@$domainName.  User $userIndex of $total" 
New-ADUser `
-AccountPassword (ConvertTo-SecureString "Password01" -AsPlainText -Force) `
-Name $userName `
-Enabled $true `
-Path $path `
-SamAccountName $userName `
-UserPrincipalName ($userName + "@" + $domainName)
}

