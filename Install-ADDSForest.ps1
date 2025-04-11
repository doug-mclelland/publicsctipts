param (
    [string]$DomainName,
    [string]$SafeModePassword
)

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Import-Module ADDSDeployment

$secureString = ConvertTo-SecureString $SafeModePassword -AsPlainText -Force

Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $secureString `
    -InstallDns `
    -Force



