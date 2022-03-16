$user = Read-Host "Enter Username of the user"

Get-ADUser $user


$usergrps = Get-ADPrincipalGroupMembership $user | select name
##Wite-Host ($usergrps)



foreach ($groups in $usergrps)
{
    Write-Host $groups.name
    if ($groups.name -eq "Domain Users"){Write-Host "Not Deleted from Domain Users group"}
    else{
            Remove-ADPrincipalGroupMembership $user -MemberOf $groups.name;
            Write-Host "Deleted"
        
    }



}