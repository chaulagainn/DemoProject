#####Isci Target
New-IscsiServerTarget -TargetName StorageforFS01  ## create target
###create v-disks
New-IscsiVirtualDisk -Path c:\iscsi\quorum.vhdx -size 1gb
New-IscsiVirtualDisk -Path c:\iscsi\data1.vhdx -size 2gb
New-IscsiVirtualDisk -Path c:\iscsi\data2.vhdx -size 4gb
##add disks to target mapping
Add-IscsiVirtualDiskTargetMapping -TargetName StorageforFS01 -Path c:\iscsi\quorum.vhdx
Add-IscsiVirtualDiskTargetMapping -TargetName StorageforFS01 -Path c:\iscsi\data1.vhdx
Add-IscsiVirtualDiskTargetMapping -TargetName StorageforFS01 -Path c:\iscsi\data2.vhdx

##get IQN of the initiators
$svr2_targetName = Invoke-Command -computername lon-svr2 {(Get-WmiObject -Namespace root\wmi -Class MSiSCSIInitiator_MethodClass).iSCSINodeName} 
$svr3_targetName = Invoke-Command -computername lon-svr3 {(Get-WmiObject -Namespace root\wmi -Class MSiSCSIInitiator_MethodClass).iSCSINodeName} 


##set targets to only be initiated by the specified initiatorts
Set-IscsiServerTarget -TargetName StorageforFS01 -InitiatorIds "IQN:$svr2_targetName", "IQN:$svr3_targetName"



