Write-Host "Computer Name: $(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty Name)"
Write-Host "Serial Number: $(Get-WmiObject -Class Win32_BIOS | Select-Object -ExpandProperty SerialNumber)"
Write-Host "Computer Model: $(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty Model)"
Write-Host "CPU Name: $(Get-WmiObject -Class Win32_Processor | Select-Object -ExpandProperty Name)"
Get-PhysicalDisk | ForEach-Object {
    switch ($_.MediaType) {
        "HDD" { Write-Host "Disk Type: HDD" }
        "SSD" { Write-Host "Disk Type: SSD" }
        "SCM" { Write-Host "Disk Type: SCM" }
        default { 
            if ($_.CanPool -eq $true) {
                Write-Host "Disk Type: Removable"
            }
            else {
                Write-Host "Disk Type: Unspecified"
            }
        }
    }

    if ($_.MediaType -ne "Unspecified" -and $_.CanPool -ne $true) {
        Write-Host "Disk Drive Size: $([math]::Round((Get-WmiObject -Class Win32_DiskDrive | Select-Object -First 1 -ExpandProperty Size)/1GB, 2)) GB"
    }
}



Write-Host "Operating System: $(Get-WmiObject -Class Win32_OperatingSystem | Select-Object -ExpandProperty Caption)"