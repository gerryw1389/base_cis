# Creates registry paths so puppet doesn't complain

# Notepad++ notes:
# In regex mode, execute the following
# Replace end of line: Find: $ / Replace <whatever>
# Remove everything after last \ in a line: Find: \\(?:.(?!\\))+$ / Replace:  | Out-Null

New-PSDrive HKU -PSProvider Registry -Root HKEY_USERS | Out-Null

If ( -not (Test-Path 'HKU:\.DEFAULT\Software'))
{
    New-Item 'HKU:\.DEFAULT' -name 'Software'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Microsoft'))
{
    New-Item 'HKU:\.DEFAULT\Software' -name 'Microsoft'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Microsoft\Windows'))
{
    New-Item 'HKU:\.DEFAULT\Software\Microsoft' -name 'Windows'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion'))
{
    New-Item 'HKU:\.DEFAULT\Software\Microsoft\Windows' -name 'CurrentVersion'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies'))
{
    New-Item 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion' -name 'Policies'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments'))
{
    New-Item 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies' -name 'Attachments'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'))
{
    New-Item 'HKU:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies' -name 'Explorer'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies'))
{
    New-Item 'HKU:\.DEFAULT\Software' -name 'Policies'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies' -name 'Microsoft'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft' -name 'Windows'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\CloudContent'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows' -name 'CloudContent'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\Control Panel'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows' -name 'Control Panel'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\Control Panel\Desktop'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\Control Panel' -name 'Desktop'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\CurrentVersion'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows' -name 'CurrentVersion'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\CurrentVersion' -name 'PushNotifications'| Out-Null
}
If ( -not (Test-Path 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows\Installer'))
{
    New-Item 'HKU:\.DEFAULT\Software\Policies\Microsoft\Windows' -name 'Installer'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies'))
{
    New-Item 'HKLM:\Software' -name 'Policies'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft'))
{
    New-Item 'HKLM:\Software\Policies' -name 'Microsoft'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft' -name 'Windows'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\CloudContent'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft' -name 'CloudContent'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\EMET'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'EMET'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\EMET\SysSettings'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\EMET' -name 'SysSettings'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'NetworkProvider'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'))
{
    New-Item 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -name 'Winlogon'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies'))
{
    New-Item 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion' -name 'Policies'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'))
{
    New-Item 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies' -name 'Explorer'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'))
{
    New-Item 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies' -name 'System'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit'))
{
    New-Item 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -name 'Audit'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'Internet Explorer'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer' -name 'Feeds'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Internet Explorer' -name 'PhishingFilter'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'Power'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Power' -name 'PowerSettings'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings' -name '0e796bdb-100d-47d6-a2d5-f7d2daa51f51'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'Windows Defender'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -name 'Real-Time Protection'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -name 'Scan'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -name 'MpEngine'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -name 'Spynet'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'Windows NT'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT' -name 'Printers'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT' -name 'DNSClient'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT' -name 'Rpc'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT' -name 'Terminal Services'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'WindowsFirewall' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall' -name 'DomainProfile' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -name 'Logging' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall' -name 'PrivateProfile' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall' -name 'PublicProfile' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -name 'Logging' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -name 'Logging' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Control Panel' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel' -name 'Desktop' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'CredUI' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'CredentialsDelegation' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Explorer' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Group Policy' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy' -name '{35378EAC-683F-11D2-A89A-00C04FBBCFA2}' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Installer' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Network Connections' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'OneDrive' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Personalization' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Powershell'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Powershell' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Powershell\ScriptBlockLogging'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Powershell' -name 'ScriptBlockLogging' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Powershell\Transcription'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Powershell' -name 'Transcription' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'System' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'WcmSvc' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc' -name 'GroupPolicy' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'WinRM' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM' -name 'Service' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Windows Error Reporting' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -name 'Consent' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Windows Search' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'WindowsUpdate' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -name 'AU' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet'))
{
    New-Item 'HKLM:\SYSTEM' -name 'CurrentControlSet' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet' -name 'Control' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control' -name 'Lsa' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft Services'))
{
    New-Item 'HKLM:\SOFTWARE\Policies' -name 'Microsoft Services' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft Services\AdmPwd'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft Services' -name 'AdmPwd' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control' -name 'Print' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Print' -name 'Providers' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers' -name 'LanMan Print Services' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services' -name 'Servers' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control' -name 'SecurityProviders' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders' -name 'WDigest' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control' -name 'Session Manager' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -name 'kernel' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Policies'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet' -name 'Policies' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Policies' -name 'EarlyLaunch' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet' -name 'Services' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'Eventlog' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Application'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog' -name 'Application' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog' -name 'Security' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'LanManServer' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'NTDS' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'NetBT' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'Netlogon' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'Tcpip6' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'Tcpip' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\mrxsmb10'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Services' -name 'mrxsmb10' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI'))
{
    New-Item 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies' -name 'CredUI' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System'))
{
    New-Item 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies' -name 'System' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos'))
{
    New-Item 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -name 'Kerberos' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters'))
{
    New-Item 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\EMET\Defaults'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\EMET' -name 'Defaults'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\EventLog'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows' -name 'EventLog'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows\EventLog' -name 'Application'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows\EventLog' -name 'Security'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows\EventLog' -name 'Setup'| Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\EventLog\System'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows\EventLog' -name 'System'| Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\SubSystems'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control\Session Manager' -name 'SubSystems'| Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Memory Management'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control\Session Manager' -name 'Memory Management'| Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM' -name 'Client' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -name 'MSV1_0' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\pku2u'))
{
    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -name 'pku2u' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control' -name 'SecurePipeServers' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers' -name 'Winreg' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg' -name 'AllowedExactPaths' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg' -name 'AllowedPaths' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LDAP'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Services' -name 'LDAP' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Services' -name 'LanmanWorkstation' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation' -name 'Parameters' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Setup'))
{
    New-Item 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion' -name 'Setup' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole'))
{
    New-Item 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Setup' -name 'RecoveryConsole' | Out-Null
}
If ( -not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy'))
{
    New-Item 'HKLM:\System\CurrentControlSet\Control\Lsa' -name 'FIPSAlgorithmPolicy' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\Safer'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows' -name 'Safer' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft\Windows\Safer' -name 'CodeIdentifiers' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'Biometrics' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics' -name 'FacialFeatures' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'Windows Defender Security Center' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center' -name 'App and Browser protection' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -name 'Windows Defender Exploit Guard' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard' -name 'ASR' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard' -name 'Network Protection' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR' -name 'Rules' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT' -name 'MitigationOptions' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft' -name 'WindowsInkWorkspace' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'CloudContent' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'Connect' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'LanmanWorkstation' | Out-Null
}
If ( -not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds'))
{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -name 'PreviewBuilds' | Out-Null
}
If ( -not (Test-Path 'HKLM:\Software\Policies\Microsoft\InputPersonalization'))
{
    New-Item 'HKLM:\Software\Policies\Microsoft' -name 'InputPersonalization' | Out-Null
}

# Used so that it at least runs one time, see the check
New-Item -ItemType File -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\initialregpaths.txt' -Value (Get-Date) | Out-Null