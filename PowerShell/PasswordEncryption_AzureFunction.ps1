$AESKey = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($AESKey)
 
Set-Content C:\Temp\OfficeOnlinePassEncryptKey.key $AESKey

## Run the above code first, then upload the above file to the Function App##

Function Get-EncryptedPassword
{
  param (
    [Parameter(Mandatory=$true,HelpMessage='Please specify the key file path')][ValidateScript({Test-Path $_})][String]$KeyPath,
    [Parameter(Mandatory=$true,HelpMessage='Please specify password in clear text')][ValidateNotNullOrEmpty()][String]$Password
  )
  $secPw = ConvertTo-SecureString -AsPlainText $Password -Force
  $AESKey = Get-content $KeyPath
  $Encryptedpassword = $secPw | ConvertFrom-SecureString -Key $AESKey
  $Encryptedpassword
}

Get-EncryptedPassword -KeyPath C:\Temp\OfficeOnlinePassEncryptKey.key -Password 