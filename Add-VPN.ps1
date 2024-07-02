$ConnectionName=Read-Host "Enter connection name"
$ServerAddress=Read-Host "Enter VPN Server IP"
$L2tpPsk=Read-Host "Enter ipsec pre-shared key"
$DestinationPrefix=Read-Host "Enter destination network"
$DNSSuffix=Read-Host "Enter dns suffix"
$DnsIPAddress=Read-Host "Enter dns server"

Add-VpnConnection -Name "$ConnectionName" `
    -ServerAddress "$ServerAddress" `
    -TunnelType "L2tp" `
    -L2tpPsk "$L2tpPsk" `
    -Force `
    -EncryptionLevel "Required" `
    -AuthenticationMethod MSChapv2 `
    -SplitTunneling `
    -RememberCredential `
    -PassThru

#   -AllUserConnection $true
Add-VpnConnectionRoute -ConnectionName "$ConnectionName" -DestinationPrefix $DestinationPrefix –PassThru

Add-VpnConnectionTriggerDnsConfiguration -ConnectionName $ConnectionName -DnsSuffix $DNSSuffix -DnsIPAddress $DnsIPAddress -PassThru

Read-Host -Prompt "Press Enter to exit"