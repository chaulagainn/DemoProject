


param(
    [Parameter()]
        [string[]] $ComputerName
        )
        $ComputerName = "lon-cl1", "lon-svr1", "lon-dc1"
        

        foreach ($Computer in $ComputerName) {

            Write-Output `n$Computer

                $IPs = (Invoke-Command -ScriptBlock {Get-NetIPAddress -InterfaceAlias ethernet  -AddressFamily ipv4} -ComputerName $Computer) 
                   foreach ($IP in $IPs) {
                            (Write-Host $IP.IPAddress);
                                }
                                } 
                               