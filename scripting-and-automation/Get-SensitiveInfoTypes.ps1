#
# ACT Script Purpose
#
# Answers:
#   • What Sensitive Information Types (SITs) exist?
#   • Which Sensitive Information Types are built-in or custom?
#   • Which Sensitive Information Types are available for use in DLP policies?
#
<#
.SYNOPSIS
    Inventories Microsoft Purview Sensitive Information Types (SITs).

.DESCRIPTION
    Retrieves Microsoft Purview Sensitive Information Types (SITs) from the
    connected tenant and returns a structured inventory of their configuration.
    This script helps administrators understand which Sensitive Information
    Types are available for use in Data Loss Prevention (DLP) policies.

.NOTES
    Author  : ACT Security Toolkit
    Requires: ExchangeOnlineManagement

.LINK
    https://github.com/BarDownAndCelly/ACT-Security-Toolkit

.VERSION
    1.0.0

.EXAMPLE
    ./Get-SensitiveInformationTypes.ps1 -Verbose
#>

#Requires -Version 7.4

[CmdletBinding()]
param(
    [switch]$PassThru
)

Set-StrictMode -Version Latest

#region Version History

<#
Version    Date        Author                Notes
-------    ----------  --------------------  -----------------------------------------
1.0.0      2026-07-15  ACT Security Toolkit  Initial release.
#>

#endregion

#region Execution Requirements

<#
This script requires:

• PowerShell 7.4 or later

• ExchangeOnlineManagement module

• An active Microsoft Purview PowerShell session
  (Connect-IPPSSession)

• Permissions to view Microsoft Purview Sensitive Information Types (SITs)

This script is read-only and does not modify tenant
configuration.
#>

#endregion

#region Private Functions

#region Private Functions

function Get-SensitiveInformationTypeInventory {

    <#
    .SYNOPSIS
        Retrieves Microsoft Purview Sensitive Information Types.

    .DESCRIPTION
        Queries Microsoft Purview for Sensitive Information Types (SITs)
        and returns a standardized collection of PSCustomObjects
        representing each type.

    .OUTPUTS
        System.Management.Automation.PSCustomObject[]
    #>

    $SensitiveInformationTypes = @(Get-DlpSensitiveInformationType -ErrorAction Stop)

    foreach ($SensitiveInformationType in $SensitiveInformationTypes) {

        [PSCustomObject]@{
            Name          = $SensitiveInformationType.Name
            LocalizedName = $SensitiveInformationType.LocalizedName
            Publisher     = $SensitiveInformationType.Publisher
            BuiltIn       = $SensitiveInformationType.IsOutOfBox
            Classifier    = $SensitiveInformationType.Classifier
            Type          = $SensitiveInformationType.Type

            Confidence    = $SensitiveInformationType.RecommendedConfidenceLevel
            Capability    = $SensitiveInformationType.Capability
            State         = $SensitiveInformationType.State

            Description   = $SensitiveInformationType.Description
            RulePackage   = $SensitiveInformationType.DlpSensitiveInformationTypeRuleCollection

            LastModified  = $SensitiveInformationType.LastModifiedTime
        }

    }

}

#endregion

#region Main

Write-Host "Microsoft Purview Sensitive Information Type Inventory" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host

try {

    $SensitiveInformationTypes = @(Get-SensitiveInformationTypeInventory)

    $BuiltInCount = ($SensitiveInformationTypes | Where-Object BuiltIn).Count
    $CustomCount  = ($SensitiveInformationTypes | Where-Object { -not $_.BuiltIn }).Count

    $EntityCount      = ($SensitiveInformationTypes | Where-Object Type -eq 'Entity').Count
    $CredentialCount  = ($SensitiveInformationTypes | Where-Object Type -eq 'Credential').Count
    $FingerprintCount = ($SensitiveInformationTypes | Where-Object Type -eq 'Fingerprint').Count

    Write-Host "Sensitive Information Types Found : $($SensitiveInformationTypes.Count)"
    Write-Host

    Write-Host "Summary" -ForegroundColor Yellow
    Write-Host "-------"
    Write-Host "Built-in SITs     : $BuiltInCount"
    Write-Host "Custom SITs       : $CustomCount"
    Write-Host
    Write-Host "Entity Types      : $EntityCount"
    Write-Host "Credential Types  : $CredentialCount"
    Write-Host "Fingerprint Types : $FingerprintCount"
    Write-Host

    Write-Host "Legend" -ForegroundColor Yellow
    Write-Host "------"
    Write-Host "Entity       - Structured data detectors (SSNs, credit cards, IBANs, etc.)"
    Write-Host "Credential   - Usernames, passwords, API keys, and authentication secrets"
    Write-Host "Fingerprint  - Registered organization documents for exact or near-exact matching"
    Write-Host

    if ($PassThru) {

        return [PSCustomObject]@{
            Script                    = $MyInvocation.MyCommand.Name
            Generated                 = Get-Date
            SensitiveInformationTypes = $SensitiveInformationTypes

            Summary = [PSCustomObject]@{
                TotalSensitiveInformationTypes = $SensitiveInformationTypes.Count
                BuiltInSITs                    = $BuiltInCount
                CustomSITs                     = $CustomCount
                EntityTypes                    = $EntityCount
                CredentialTypes                = $CredentialCount
                FingerprintTypes               = $FingerprintCount
            }
        }

    }

}
catch {
    throw
}

#endregion