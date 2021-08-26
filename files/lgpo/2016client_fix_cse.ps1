# Uses LGPO to install Client Side Extensions (CSE's)

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\fix_2016client_cse.log'

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
$Arguments = @("/v", "/e mitigation", "/e audit", "/e zone")
Start-Process -FilePath $Command -ArgumentList $Arguments -Wait

Write-Output "$date : LGPO has been ran to install client side extensions" | 
Out-File -FilePath $log -Encoding ascii -Append
Write-Output "####################" | 
Out-File -FilePath $log -Encoding ascii -Append

Exit 0