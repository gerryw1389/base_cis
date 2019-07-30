:: Run this to reset Local Policies and Group Policies to default. Reboot afterwards.
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
RD /S /Q "%WinDir%\System32\GroupPolicy"
gpupdate /force