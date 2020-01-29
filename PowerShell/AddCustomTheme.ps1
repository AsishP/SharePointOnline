#### --------------------------------------------------
#### Apply a custom theme to SharePoint Online Tenant.
#### For the add operation, get the themepalette from below
#### Fabric theme editor - https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/index.html
#### --------------------------------------------------

param(
[Object]$themepalette = $null,
[Parameter(Mandatory=$true,HelpMessage='Please provide theme name')][ValidateNotNullOrEmpty()][String]$themeName,
[Boolean]$isInverted = $false,
[Parameter(Mandatory=$true,HelpMessage='Operation - Add, Remove, Get')][ValidateSet('Add','Remove', 'Get')][String]$Operation
)

Write-Host "Started $Operation for $themeName"
if($Operation -eq "Add")
{
   try
   {
        if($themepalette -eq $null)
        {
            throw "Theme Palette is required for Add Operation"
        }
        Add-SPOTheme -Identity $themeName -Palette $themepalette -IsInverted $false
   }
   catch
   {
     Write-Host $_.Exception.Message -ForegroundColor Red
   }
}
elseif ($Operation -eq "Remove")
{
    Remove-SPOTheme -Identity $themeName
}
elseif ($Operation -eq "Get")
{
    Get-SPOTheme -Name $themeName
}