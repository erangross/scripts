start "TEST" cmd.exe /k  "wmic computersystem get name & wmic bios get serialnumber & wmic computersystem get Model & wmic cpu get Name &wmic computersystem get totalphysicalmemory & wmic diskdrive get Model & wmic diskdrive get size & wmic os get Caption "

