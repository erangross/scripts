$rootDir = "C:\path\to\your\root\directory"  # replace with your root directory path
$years = "2016", "2017", "2018"

Get-ChildItem -Path $rootDir -Recurse -Directory | ForEach-Object {
    foreach ($year in $years) {
        if ($_.Name -match $year) {
            Remove-Item -Path $_.FullName -Recurse -Force
            break
        }
    }
}