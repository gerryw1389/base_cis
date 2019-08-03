# Check the local security policy for changes

$log = 'C:\ProgramData\PuppetLabs\scripts\puppet\logs\test_2016dc_secpol.log'

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


If (Test-Path -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\initialsecpol.txt')
{
    # Secpol import has happened at least once so lets see if anything has changed...
    
    # Delete any previous exports and hashes if they exist
    If (Test-Path 'C:\ProgramData\PuppetLabs\scripts\puppet\secpol.inf')
    {
        Remove-Item -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\secpol.inf' -Force  
    }
    If (Test-Path 'C:\ProgramData\PuppetLabs\scripts\puppet\hash.txt')
    {
        Remove-Item -Path 'C:\ProgramData\PuppetLabs\scripts\puppet\hash.txt' -Force  
    }

    # Perform export and create a hash
    $Command = "C:\Windows\System32\secedit.exe" 
    $Arguments = @("/export", "/cfg C:\ProgramData\PuppetLabs\scripts\puppet\secpol.inf", "/quiet")
    Start-Process -FilePath $Command -ArgumentList $Arguments -Wait
    (Get-FileHash C:\ProgramData\PuppetLabs\scripts\puppet\secpol.inf).hash | Out-File 'C:\ProgramData\PuppetLabs\scripts\puppet\hash.txt'
    $a = Get-Content 'C:\ProgramData\PuppetLabs\scripts\puppet\hash.txt'
    
    # Compare against known good hash from puppet
    $b = Get-Content 'C:\ProgramData\PuppetLabs\scripts\puppet\2016dc-hash.txt'
    $c = $a.compareto($b)
    # Only values are '0' for match and '-1' for not match
    If ($c -eq 0)
    {
        Write-Output "$date : Hashes match, secpol hasn't changed" | 
        Out-File -FilePath $log -Encoding ascii -Append
        Write-Output "####################" | 
        Out-File -FilePath $log -Encoding ascii -Append
        Exit 0
    }
    Else
    {
        Write-Output "$date : Security policy has changed, running correction script" | 
        Out-File -FilePath $log -Encoding ascii -Append
        Write-Output "####################" | 
        Out-File -FilePath $log -Encoding ascii -Append
        Exit 1
    }
}
Else
{
    # Should only execute once on first run because the file hasn't been created yet.
    Exit 1
}