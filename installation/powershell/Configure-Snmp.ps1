 Import-Module ActiveDirectory
 $Serverlist = Get-ADComputer -Filter {(Operatingsystem -Like "Windows Server*") -And (Enabled -eq "True") -And (LastLogonDate -gt $cutoffdate)} | foreach { $_.Name }

 foreach ($server in $Serverlist){

 Invoke-Command -ComputerName $server -ScriptBlock {

 $pmanagers = @("a11-guckmon-fe-1.ainsey11.local,10.1.1.50") # ADD YOUR MANAGER(s) in format @("manager1","manager2")
 $CommString = @("ainsey11") # ADD YOUR COMM STRING(s) in format @("Community1","Community2")

 #Import ServerManger Module
 Import-Module ServerManager

 #Check if SNMP-Service is already installed
 $check = Get-WindowsFeature -Name SNMP-Service

 If ($check.Installed -ne "True") {
 #Install/Enable SNMP-Service
 Write-Host "SNMP Service Installing..."
 Get-WindowsFeature -name SNMP* | Add-WindowsFeature -IncludeManagementTools | Out-Null
 }

 $check = Get-WindowsFeature -Name SNMP-Service

 ##Verify Windows Services Are Enabled
 If ($check.Installed -eq "True"){
 Write-Host "Configuring SNMP Services..."
 #Set SNMP Permitted Manager(s) ** WARNING : This will over write current settings **
 reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\PermittedManagers" /v 1 /t REG_SZ /d localhost /f | Out-Null

 #Set SNMP Traps and SNMP Community String(s) - *Read Only*
 Foreach ($String in $CommString){
 reg add ("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\TrapConfiguration\" + $String) /f | Out-Null
 # Set the Default value to be null
 reg delete ("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\TrapConfiguration\" + $String) /ve /f | Out-Null
 reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\ValidCommunities" /v $String /t REG_DWORD /d 4 /f | Out-Null
 $i = 2
 Foreach ($Manager in $PManagers){
 reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\PermittedManagers" /v $i /t REG_SZ /d $manager /f | Out-Null
 reg add ("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\TrapConfiguration\" + $String) /v $i /t REG_SZ /d $manager /f | Out-Null
 $i++
 }
 }
 }
 Else {
 Write-Host "Error: SNMP Services Not Installed"
 }

 }

 }
 
