## Posted by Asish Padhy - Jan 2018
# Replace all references with <..> with your values in the below code

## Encrypting the password using PowerShell and create Secure String and Key file

# Set up our SecureString.

$secureString = ConvertTo-SecureString -String "<Enter your password here>" -AsPlainText -Force

# Demonstrating how to securely generate a new, random 32-byte AES key.

$rng = [System.Security.Cryptography.RNGCryptoServiceProvider]::Create()
$key = New-Object byte[](32)

$rng.GetBytes($key)

# Now, you can use this key when calling ConvertTo-SecureString and ConvertFrom-SecureString

$encryptedSecureString = ConvertFrom-SecureString -SecureString $secureString -Key $key

# So long as you use the same bytes as your key later, you can decrypt the value back into a SecureString object.

$newSecureString = ConvertTo-SecureString -String $encryptedSecureString -Key $key

# The SecureKey parameter uses a SecureString to represent the same array of bytes as a Unicode string.  
# Set up our SecureString version of the AES key.

$keyString = [System.Text.Encoding]::Unicode.GetString($key)
$secureKey = ConvertTo-SecureString -String $keyString -AsPlainText -Force

# Use the SecureKey to encrypt our $secureString

$encryptedSecureString = ConvertFrom-SecureString -SecureString $secureString -SecureKey $secureKey

# Save both the encrypted string and key to disk. Provide the path where your script will look for the password

$encryptedSecureString | Out-File -FilePath "<FilePath>\<Filename>.SecureString.txt"
$keyString | Out-File -FilePath "<FilePath>\<Filename>.Key.txt"

# Display the encrypted secure string:

Write-Host "Encrypted secure string: $encryptedSecureString"