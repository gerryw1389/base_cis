# Fix to disable the built-in Guest account

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\fix_disable_guest.log'

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
$guest =  $all | Where-Object { $_.sid -like "*-501" }
$split = ( $($guest.caption) -split "\\")[-1]
$user = [adsi]"WinNT://localhost/$split"
$user.UserFlags
$user.UserFlags = $user.UserFlags.Value -bor 2
$user.CommitChanges()

$disabled_user = Get-WMIObject Win32_UserAccount -Filter "Name='$split'"
If ( $($disabled_user.disabled) -eq $true)
{
    Write-Output "$date : User guest has been disabled" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Exit 0
}
Else
{
    Write-Error "Error disabling user Guest"
    Write-Output "$date : Error disabling user Guest" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Exit 1
}