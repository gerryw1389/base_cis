# Tests if CSE Extensions are installed
# {f3ccc681-b74c-4060-9f26-cd84525dca2a} - Audit Policy Configuration
# {2A8FDC61-2347-4C87-92F6-B05EB91A201A} - MitigationOptions - doesn't show up even though LGPO says its installed
# {4CFB60C1-FAA6-47f1-89AA-0B18730C9FD3} - Internet Explorer Zonemapping

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\test_2012dc_cse.log'

If ( -not (Test-Path 'C:\ProgramData\PuppetLabs\scripts\puppet\logs'))
{
    New-Item -ItemType Directory -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\logs' | Out-Null
}
If ( -not (Test-Path $log))
{
    New-Item -ItemType File -Path $log | Out-Null
}
[Double]$Sizemax = 10485760
$Size = (Get-item $log | Measure-Object -Property Length -Sum) 
If ($($Size.Sum -ge $SizeMax))
{
    Get-item $log | Clear-Content
}
Else
{
    # Do nothing
}
$date = $((Get-Date).ToString("yyyy-MM-dd_HH:mm_tt"))
Write-Output "####################" | 
Out-File -FilePath $log -Encoding ascii -Append
Write-Output "$date : Script started" | 
Out-File -FilePath $log -Encoding ascii -Append

$Count = 0
Set-Location -Path HKLM:

If (Test-Path 'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{f3ccc681-b74c-4060-9f26-cd84525dca2a}')
{
    Write-Output "$date : CSE found - Audit Policy Configuration" | 
    Out-File -FilePath $log -Encoding ascii -Append
    $Count = 1
}

If (Test-Path 'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{4CFB60C1-FAA6-47f1-89AA-0B18730C9FD3}')  
{
    Write-Output "$date : CSE found - Internet Explorer Zonemapping" | 
    Out-File -FilePath $log -Encoding ascii -Append
    $Count = 2
}

If ($Count -eq 2)
{
    Write-Output "$date : CSEs detected" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    
    Exit 0
}
Else
{
    Write-Output "$date : One or more CSEs missing, running correction script" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    
    Exit 1
}