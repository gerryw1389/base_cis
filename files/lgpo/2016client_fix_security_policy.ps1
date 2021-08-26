# Uses LGPO to import a custom security policy

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\fix_2016client_secpol.log'

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


$Command = "C:\ProgramData\PuppetLabs\scripts\puppet\LGPO.exe" 
$Arguments = @("/s C:\ProgramData\PuppetLabs\scripts\puppet\2016client.inf")
Start-Process -FilePath $Command -ArgumentList $Arguments -Wait

Write-Output "$date : LGPO has been ran to import a custom security policy" | 
Out-File -FilePath $log -Encoding ascii -Append
Write-Output "####################" | 
Out-File -FilePath $log -Encoding ascii -Append

# Used so that it at least runs one time, see the check
New-Item -ItemType File -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\initialsecpol.txt' -Value (Get-Date) -Force | Out-Null

Exit 0