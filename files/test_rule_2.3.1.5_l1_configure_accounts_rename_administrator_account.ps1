# Test if administrator account is renamed

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\test_rename_administrator.log'

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

$all = Get-WmiObject win32_useraccount | Select-Object caption,sid
$admin =  $all | Where-Object { $_.sid -like "*-500" }
$split = ( $($admin.caption) -split "\\")[-1]
If ($split -eq 'Administrator')
{
    Write-Output "$date : Account found - Administrator -> running correction script" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Exit 1
}
Else
{
    Write-Output "$date : Account not found - Administrator" |
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Exit 0
}