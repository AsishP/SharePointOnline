Function ConnectToOnline
{
 param (
    [Parameter(Mandatory=$true,HelpMessage='Please specify the URL')][String]$SiteURL,
    [Parameter(Mandatory=$true,HelpMessage='Please specify the Admin User Name')][String]$UserName,
    [Parameter(Mandatory=$true,HelpMessage='Please specify the Password')][String]$Pass
  )
  $O365Credential = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $UserName, $(convertto-securestring $Pass -asplaintext -force)
  Connect-PnPOnline -Url $SiteURL -Credentials $O365Credential
} 

ConnectToOnline