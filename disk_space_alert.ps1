$computerName = [Environment]::MachineName
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$emailFrom = "maayan12scomputersalerts@gmail.com"
$emailTo = "maayan12scomputersalerts@gmail.com"
$emailUsername = "maayan12scomputersalerts@gmail.com"
$emailPassword = "alwicjdyyxwxnepz"

$disks = Get-WmiObject Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3} | Select-Object DeviceID, @{Name='FreeSpaceGB'; Expression={"{0:N2}" -f ($_.FreeSpace/1GB)}}

foreach ($disk in $disks) {
  if ($disk.FreeSpaceGB -lt 10) {
    $mailMessage = New-Object System.Net.Mail.MailMessage
    $mailMessage.From = $emailFrom
    $mailMessage.To.Add($emailTo)
    $mailMessage.Subject = "Low Disk Space Alert"
    $mailMessage.Body = "$computerName reports that the following drive has less than 10GB of free space: $($disk.DeviceID), $($disk.FreeSpaceGB)GB remaining."

    $smtp = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtp.EnableSsl = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($emailUsername, $emailPassword)
    $smtp.Send($mailMessage)
  }
}
