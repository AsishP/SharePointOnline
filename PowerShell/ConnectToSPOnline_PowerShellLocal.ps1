## Posted by Asish Padhy - Jan 2018
# Replace all references with <..> with your values in the below code

## Connecting SharePoint Online with the encrypted password while running locally

$encryptedpassPath = '<FilePath>\<Filename>.SecureString.txt'
$keyPath = '<FilePath>\<Filename>.Key.txt'

# Connect to SP Online using Key Pass
function ConnectToSPOnline {
 param (
    [Parameter(Mandatory=$true,HelpMessage='Please specify method name')][ValidateNotNullOrEmpty()][String]$siteURL
  )
try{
    $msgstart = "Connect to SP Online " + $siteURL
    Write-Host $msgstart  -ForegroundColor Cyan
    
    $keyString = Get-Content $keyPath
    $encryptedSecureString = Get-Content $encryptedpassPath
    $secureKey = ConvertTo-SecureString -String $keyString -AsPlainText -Force
    $secureString = ConvertTo-SecureString -String $encryptedSecureString -SecureKey $secureKey
    $cred = New-Object System.Management.Automation.PSCredential('UserName', $secureString)
    $pass = $cred.GetNetworkCredential().Password
    $secPass = ConvertTo-SecureString -String $pass -AsPlainText -Force

    $SPCredential = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $secPass
    Connect-PnPOnline -Url $siteURL -Credentials $SPCredential
    $msgend = "Connected to" + $siteURL + "sucessfully"
    Write-Host $msgend -ForegroundColor Cyan
    }
 catch
 {
   $ErrorMessage = $_.Exception.Message
   addToLogEntry "ConnectToSPOnline" "Error" $ErrorMessage
 }
}

ConnectToSPOnline -siteURL "<siteurl>"