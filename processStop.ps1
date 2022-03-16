########Stop and start services on remote host

####step1 Get services on a remote host

$servicename = Read-Host "Service name (takes wildcard)"
$computername1 = Read-Host "Enter Computername"
$services = Get-service -ComputerName $computername1 -Name $servicename


#########Step2 Stop service
Start-Service -InputObject $services -Verbose



##############computer last logon

$computername = Read-Host ("Enter the computer name")
Get-ADComputer $computername -Properties * | select lastlogondate | ft


