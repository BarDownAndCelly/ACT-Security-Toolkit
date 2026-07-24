#
# ACT Script Purpose
#
# Answers:
#   • Which Sensitive Information Type rule packages are installed?
#   • Which rule packages are built-in or custom?
#   • Who published each rule package?
#   • Which rule package versions are deployed?
#
[CmdletBinding()]
param(

    [switch]$PassThru

)

#region Private Functions

function Get-DlpSensitiveInformationTypeRulePackageInventory {

    <#
    .SYNOPSIS
        Retrieves Microsoft Purview Sensitive Information Type Rule Packages.

    .DESCRIPTION
        Queries Microsoft Purview for Sensitive Information Type Rule Packages
        and returns a standardized collection of PSCustomObjects
        representing each package.

    .OUTPUTS
        System.Management.Automation.PSCustomObject[]
    #>

    $Packages = @(Get-DlpSensitiveInformationTypeRulePackage -ErrorAction Stop)

    foreach ($Package in $Packages) {

        [PSCustomObject]@{
            Name                 = $Package.Name
            RuleCollectionName   = $Package.RuleCollectionName
            Publisher            = $Package.Publisher
            Version              = $Package.Version

            Exportable           = $Package.IsExportable
            Encrypted            = $Package.IsEncrypted
            FingerprintPackage   = $Package.IsFingerprintRuleCollection
            AIPowered            = $Package.IsAIPoweredRuleCollection

            PackageSize          = $Package.rulePackSize

            Created              = $Package.CreationTimeUtc
            Modified             = $Package.ModificationTimeUtc

            Description          = $Package.Description
        }

    }

}

#endregion

#region Main

Write-Host "Microsoft Purview Sensitive Information Type Rule Package Inventory" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host

try {

    $Packages = @(Get-DlpSensitiveInformationTypeRulePackageInventory)

    $MicrosoftCount = @(
        $Packages | Where-Object {
            $_.Publisher -like "Microsoft*"
        }
    ).Count

    $CustomCount = $Packages.Count - $MicrosoftCount

    $AICount = @(
        $Packages | Where-Object AIPowered
    ).Count

    $FingerprintCount = @(
        $Packages | Where-Object FingerprintPackage
    ).Count

    $EncryptedCount = @(
        $Packages | Where-Object Encrypted
    ).Count

    $ExportableCount = @(
        $Packages | Where-Object Exportable
    ).Count

    Write-Host "Rule Packages Found : $($Packages.Count)"
    Write-Host

    Write-Host "Summary" -ForegroundColor Yellow
    Write-Host "-------"
    Write-Host "Microsoft Packages  : $MicrosoftCount"
    Write-Host "Custom Packages     : $CustomCount"
    Write-Host
    Write-Host "AI Packages         : $AICount"
    Write-Host "Fingerprint Packages: $FingerprintCount"
    Write-Host "Encrypted Packages  : $EncryptedCount"
    Write-Host "Exportable Packages : $ExportableCount"
    Write-Host

    Write-Host "Legend" -ForegroundColor Yellow
    Write-Host "------"
    Write-Host "AI Package          - Contains AI-powered classifiers."
    Write-Host "Fingerprint Package - Contains document fingerprint definitions."
    Write-Host "Exportable          - Can be exported or backed up."
    Write-Host "Encrypted           - Rule package is encrypted."
    Write-Host

    foreach ($Package in $Packages) {

        Write-Host "------------------------------------------------------------"
        Write-Host "Package Name         : $($Package.RuleCollectionName)"
        Write-Host "Publisher            : $($Package.Publisher)"
        Write-Host "Version              : $($Package.Version)"
        Write-Host

        Write-Host "AI Package           : $(if($Package.AIPowered){'Yes'}else{'No'})"
        Write-Host "Fingerprint Package  : $(if($Package.FingerprintPackage){'Yes'}else{'No'})"
        Write-Host "Exportable           : $(if($Package.Exportable){'Yes'}else{'No'})"
        Write-Host "Encrypted            : $(if($Package.Encrypted){'Yes'}else{'No'})"
        Write-Host

        if ($Package.Created) {
    Write-Host "Created              : $($Package.Created.ToString('yyyy-MM-dd HH:mm:ss'))"
}
else {
    Write-Host "Created              : N/A"
}

if ($Package.Modified) {
    Write-Host "Modified             : $($Package.Modified.ToString('yyyy-MM-dd HH:mm:ss'))"
}
else {
    Write-Host "Modified             : N/A"
}

        if (![string]::IsNullOrWhiteSpace($Package.Description)) {
            Write-Host
            Write-Host "Description"
            Write-Host "-----------"
            Write-Host $Package.Description
        }

        Write-Host

    }

    if ($PassThru) {

        return [PSCustomObject]@{
            Script    = $MyInvocation.MyCommand.Name
            Generated = Get-Date
            Packages  = $Packages

            Summary = [PSCustomObject]@{
                TotalPackages         = $Packages.Count
                MicrosoftPackages     = $MicrosoftCount
                CustomPackages        = $CustomCount
                AIPackages            = $AICount
                FingerprintPackages   = $FingerprintCount
                ExportablePackages    = $ExportableCount
                EncryptedPackages     = $EncryptedCount
            }
        }

    }

}
catch {
    throw
}

#endregion