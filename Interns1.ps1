###Adatum just hired a bunch of interns. In order to manage RBAC roles, management has directed to create a new OU 
## called interns and Assign them Inerns2022 group
Write-Host " So the interns are here"
Write-Host " Creating OU for Interns"


new-adorganizationalUnit -Name "Interns" -Path "DC=adatum, dc=com"

Write-Host "************Creating Group****************"

$groupname = Read-Host 'Name of the group you want to create'
$grouptype = Read-host "Select 1 for Gobal Group  2 for Universal Group 3 for local "
$grouptypeString = ""
if ($grouptype -eq 1){$grouptypeString = "Global"}
elseif ($grouptype -eq 2){$grouptypeString = "Universal"}
elseif ($grouptype -eq 3){$grouptypeString = "Domainlocal"}
else {$grouptypeString = "domainlocal"}

new-adgroup -name $groupname  -GroupScope $grouptypeString
Write-Host "$groupname group of type $grouptypeString has been created"


New-ADUser "Niraj" -Department IT
