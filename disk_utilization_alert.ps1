# Set the email parameters
$computerName = [Environment]::MachineName
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$emailFrom = "maayan12scomputersalerts@gmail.com"
$emailTo = "maayan12scomputersalerts@gmail.com"
$emailUsername = "maayan12scomputersalerts@gmail.com"
$emailPassword = "alwicjdyyxwxnepz"

# Set the threshold value for disk utilization in percentage
$threshold = 100

# Set the duration for which the disk utilization should be checked in minutes
$duration = 60

# Get the current disk utilization percentage
function Get-DiskUtilization {
    (Get-Counter '\PhysicalDisk(_Total)\% Idle Time').CounterSamples[0].CookedValue | ForEach-Object { '{0:F2}%' -f (100 - $_) }
}

# Check if disk utilization is at the threshold value for the specified duration
$elapsedTime = 0
while ($elapsedTime -lt $duration) {
    if (Get-DiskUtilization -ge "$threshold%") {
        Start-Sleep -Seconds 60
        $elapsedTime += 1
    }
    else {
        $elapsedTime = 0
        Start-Sleep -Seconds 60
    }
}

# Send email alert if disk utilization is at 100% for more than an hour
if ($elapsedTime -eq $duration) {
    $mailMessage = New-Object System.Net.Mail.MailMessage
    $mailMessage.From = $emailFrom
    $mailMessage.To.Add($emailTo)
    $mailMessage.Subject = "Disk Utilization Alert"
    $mailMessage.Body = "$computerName reports: Disk utilization is at 100% for more than an hour."
    $smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtp.EnableSsl = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($emailUsername, $emailPassword)
    $smtp.Send($mailMessage)
    
}