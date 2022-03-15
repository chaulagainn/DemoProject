###Adatum just hired a bunch of interns. In order to manage RBAC roles, management has directed to create a new OU 
## called interns and Assign them Inerns2022 group
Write-Host " So the interns are here"
Write-Host " Creating OU for Interns"


new-adorganizationalUnit -Name "Interns" -Path "DC=adatum, dc=com"
##*************************************************************************************************
Write-Host "************Creating Group****************"

$groupname = Read-Host 'Name of the group you want to create'
$grouptype = Read-host "Select 1 for Gobal Group  2 for Universal Group 3 for local "
$grouptypeString = ""
if ($grouptype -eq 1){$grouptypeString = "Global"}
elseif ($grouptype -eq 2){$grouptypeString = "Universal"}
elseif ($grouptype -eq 3){$grouptypeString = "Domainlocal"}
else {$grouptypeString = "domainlocal"}

new-adgroup -name $groupname  -GroupScope $grouptypeString
##**************************************************************************************************

$disabled = Search-ADAccount -AccountDisabled
foreach ($account in $disabled)
{
   if( ($account.AccountExpirationDate) -lt (Get-Date).AddMonths(6)){"Good to reactivate" + $account.AccountExpirationDate + "$account.name"}
    else{"Cant be activated  $account.AccountExpirationDate $account.name"}
}

##****************************************************************************

$accName = Read-Host "username for account to check if its locked"
$accobj = Get-ADUser -Identity $accName -Properties *
    if ( $accobj.LockedOut -eq $true){Write-host "Account is Locked"}
    else{Write-Host "Account not Locked"}

Write-Host $accobj.ObjectGUID;

##***************************************************************************


$locked = Search-ADAccount -LockedOut
foreach ($account in $locked)
{
    


}

