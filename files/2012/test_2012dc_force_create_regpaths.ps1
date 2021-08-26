# Checks if registry paths have been created

If (Test-Path 'C:\ProgramData\PuppetLabs\scripts\puppet\initialregpaths.txt')
{
    Exit 0
}
Else
{
    Exit 1
}