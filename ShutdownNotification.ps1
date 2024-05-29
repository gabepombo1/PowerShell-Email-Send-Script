#Device name
$device_name = "Device"

# Password for email account to send from (the password is not included in this obviously)
$pwd_1 = ''
$pwd_2 ConvertTo-SecureString $pwd_1 -AsPlainText -Force

# Email account to send email from
$sendmb = "sender@placeholder.com"

# Email Account to receive email
$receivembx = "sender@placeholder.com, recepient@placeholder.com"

# Body
$body = join($device_name + " is shutting down. (Sent with PowerShell)");

# Email properties
$props = @{

    SMTP_server = "smtp.office365.com"
    From = $sendmbx
    To = $receivembx
    Subject = join($device_name + " Shutdown");
    UseSSL = $true
    port = 587
    Credential = New-Object System.Management.Automation.pscredential($sendmbx, $pwd_2)

}

Send-MailMessage @props $body