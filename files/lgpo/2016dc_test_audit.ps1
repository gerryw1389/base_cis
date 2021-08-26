# Checks the event log for audit changes

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\test_2016dc_audit.log'

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

If (Test-Path -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\initialaudit.txt')
{
    # Audit import has happened at least once so lets see if anything has changed...
    $hour = New-Timespan -Minutes 30
    $Date = (Get-Date) - $hour
    $events = get-eventlog -LogName security -instanceid 4719 -after $date
    If ($($events.count) -gt 0)
    {
        Write-Output "$date : Audit policy has been changed, running correction script" | 
        Out-File -FilePath $log -Encoding ascii -Append
        Write-Output "####################" | 
        Out-File -FilePath $log -Encoding ascii -Append

        Exit 1
    } 
    else
    {
        Write-Output "$date : No changes to audit policies have been detected" | 
        Out-File -FilePath $log -Encoding ascii -Append
        Write-Output "####################" | 
        Out-File -FilePath $log -Encoding ascii -Append

        Exit 0
    }
}
Else
{
    # Should only execute once on first run because the file hasn't been created yet.
    Exit 1
}