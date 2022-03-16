########Stop and start process on remote host

####step1 Get processes on a remote host

Get-Process notepad | get-member


##############computer last logon

$computername = Read-Host ("Enter the computer name")
Get-ADComputer $computername -Properties * | select lastlogondate | ft


