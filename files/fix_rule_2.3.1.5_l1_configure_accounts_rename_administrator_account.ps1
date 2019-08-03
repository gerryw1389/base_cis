# Fix to rename built-in Administrator account

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\fix_rename_administrator.log'

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
Write-Output "####################" | Out-File -FilePath $log -Encoding ascii -Append
Write-Output "$date : Script started" | Out-File -FilePath $log -Encoding ascii -Append

$newName = 'd_admin'
$user = Get-WMIObject Win32_UserAccount -Filter "Name='Administrator'"
$result = $user.Rename($newName)

If ( $($result.ReturnValue) -eq 0)
{
    Write-Output "$date : Administrator account renamed to $newname" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    
    Exit 0
}
Else
{
    Write-Error "Error renaming account Administrator"
    Write-Output "$date : Error renaming account Administrator" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    
    Exit 1
}