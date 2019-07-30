# Test if guest account is renamed

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\test_rename_guest.log'

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


# Installs EMET

If (Test-Path 'C:\ProgramData\PuppetLabs\scripts\puppet\emet.msi')
{
    $Command = "msiexec.exe" 
    $Arguments = @("/i C:\ProgramData\PuppetLabs\scripts\puppet\emet.msi", "/quiet", "ALLUSERS=1", "/passive", "/norestart", "/log C:\ProgramData\PuppetLabs\scripts\puppet\emet_install.log")
    Start-Process -FilePath $Command -ArgumentList $Arguments
    
    Write-Output "$date : EMET has been installed" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append

    Exit 0
}
Else
{
    Write-Error "Unable to locate MSI for install"
    Write-Output "$date : Unable to locate MSI for install" | 
    Out-File -FilePath $log -Encoding ascii -Append
    Write-Output "####################" | 
    Out-File -FilePath $log -Encoding ascii -Append
    
    Exit 1
}