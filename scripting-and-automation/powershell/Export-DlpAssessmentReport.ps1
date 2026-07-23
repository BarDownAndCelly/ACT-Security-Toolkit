#
# ACT Script Purpose
#
# Answers:
#   • What is the current state of Microsoft Purview Data Loss Prevention?
#   • Which DLP policies, rules, labels, and Sensitive Information Types are configured?
#   • What key observations and recommendations can be made about the environment?
#   • Provides a consolidated Microsoft Purview DLP assessment report.
#

<#
.SYNOPSIS
    Generates a Microsoft Purview Data Loss Prevention (DLP) Assessment Report.

.DESCRIPTION
    Executes the ACT Security Toolkit DLP inventory scripts and consolidates
    their output into a single assessment report.

.NOTES
    Author  : ACT Security Toolkit
    Requires: ExchangeOnlineManagement

.LINK
    https://github.com/BarDownAndCelly/ACT-Security-Toolkit

.VERSION
    1.0.0

.EXAMPLE
    ./Export-DlpAssessmentReport.ps1
#>

#Requires -Version 7.4

[CmdletBinding()]
param(
    [string]$OutputPath = "."
)

Set-StrictMode -Version Latest

#region Version History

<#
Version    Date        Author                Notes
-------    ----------  --------------------  -----------------------------------------
1.0.0      2026-07-16  ACT Security Toolkit  Initial release.
#>

#endregion

#region Execution Requirements

<#
This script requires:

• PowerShell 7.4 or later

• ExchangeOnlineManagement module

• An active Microsoft Purview PowerShell session
  (Connect-IPPSSession)

• The ACT Security Toolkit inventory scripts

• Permissions to read Microsoft Purview configuration

This script is read-only and does not modify tenant configuration.
#>

#endregion

#region Private Functions

function Write-Section {

    param(
        [string]$Title
    )

    @(
        ""
        "# $Title"
        ""
    )

}

#endregion

#region Main

Write-Host "Microsoft Purview DLP Assessment Report" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host

$Assessment = [PSCustomObject]@{

    Generated = Get-Date

    SensitivityLabels = & "$PSScriptRoot/Get-SensitivityLabels.ps1" -PassThru

    LabelPolicies = & "$PSScriptRoot/Get-LabelPolicies.ps1" -PassThru

    SensitiveInformationTypes = & "$PSScriptRoot/Get-SensitiveInfoTypes.ps1" -PassThru

    RulePackages = & "$PSScriptRoot/Get-DlpSensitiveInformationTypeRulePackages.ps1" -PassThru

    DlpPolicies = & "$PSScriptRoot/Get-DlpPolicies.ps1" -PassThru

    DlpRules = & "$PSScriptRoot/Get-DlpRules.ps1" -PassThru

}

$Report = @()

$Report += "# Microsoft Purview DLP Assessment"
$Report += ""
$Report += "**Generated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$Report += ""

$Report += Write-Section "Executive Summary"

$Report += "- Sensitivity Labels: $($Assessment.SensitivityLabels.Summary.TotalLabels)"
$Report += "- Label Policies: $($Assessment.LabelPolicies.Summary.TotalPolicies)"
$Report += "- Sensitive Information Types: $($Assessment.SensitiveInformationTypes.Summary.TotalSensitiveInformationTypes)"
$Report += "- Rule Packages: $($Assessment.RulePackages.Summary.TotalPackages)"
$Report += "- DLP Policies: $($Assessment.DlpPolicies.Summary.TotalPolicies)"
$Report += "- DLP Rules: $($Assessment.DlpRules.Summary.TotalRules)"

$Report += ""

$Report += Write-Section "Key Findings"

$Report += "- Document findings will be added in a future release."
$Report += "- Recommendation engine coming soon."

$Report += ""

$Report += Write-Section "Recommendations"

$Report += "- Review DLP policies quarterly."
$Report += "- Review custom Sensitive Information Types."
$Report += "- Validate third-party rule packages."
$Report += "- Review label publishing assignments."

$OutputFile = Join-Path $OutputPath "Purview-Dlp-Assessment.md"

$Report | Out-File -FilePath $OutputFile -Encoding utf8

Write-Host
Write-Host "Assessment written to:" -ForegroundColor Green
Write-Host $OutputFile -ForegroundColor Green

#endregion