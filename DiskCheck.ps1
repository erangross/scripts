Get-PhysicalDisk | ForEach-Object {
    switch ($_.MediaType) {
        "HDD" { Write-Host "Disk Type: HDD" }
        "SSD" { Write-Host "Disk Type: SSD" }
        "SCM" { Write-Host "Disk Type: SCM" }
        default { Write-Host "Disk Type: Unspecified" }
    }
}
