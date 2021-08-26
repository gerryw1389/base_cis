# Installs MS Laps

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\fix_install_laps.log'

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


# Installs LAPS

If (Test-Path 'C:\ProgramData\PuppetLabs\scripts\puppet\laps.msi')
{
    $Command = "msiexec.exe" 
    $Arguments = @("/q", "/i C:\ProgramData\PuppetLabs\scripts\puppet\laps.msi")
    Start-Process -FilePath $Command -ArgumentList $Arguments -Wait

    Write-Output "$date : MS Laps has been installed" | 
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