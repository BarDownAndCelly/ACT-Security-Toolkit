#
# ACT Script Purpose
#
# Answers:
#   • What is the overall Microsoft Purview security posture?
#   • What Microsoft Purview capabilities are currently configured?
#   • What evidence exists to support executive findings?
#

<#
.SYNOPSIS
    Generates an executive security briefing for Microsoft Purview.

.DESCRIPTION
    Connects to Microsoft Purview, collects configuration data,
    and prepares evidence used to generate an executive briefing.

.NOTES
    Author  : ACT Security Toolkit

.VERSION
    2.0.0
#>

#Requires -Version 7.4

[CmdletBinding()]
param(

    [switch]$PassThru

)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

#region Version History

<#

2.0.0

- Rewritten to generate executive briefings
- Inventory collection separated from analysis
- Evidence-based reporting

#>

#endregion

#region Private Functions

function Write-Status {

    param(

        [Parameter(Mandatory)]
        [string]$Message

    )

    Write-Host "[ACT] $Message" -ForegroundColor Cyan

}

function Import-Inventory {

    param(

        [Parameter(Mandatory)]
        [string]$Script

    )

    Write-Status "Collecting $Script..."

    & "$PSScriptRoot\$Script" -PassThru

}

#endregion

#region Initialize

Clear-Host

Write-Host ""
Write-Host "============================================================" -ForegroundColor DarkCyan
Write-Host "               ACT SECURITY TOOLKIT" -ForegroundColor Cyan
Write-Host "             Executive Security Briefing" -ForegroundColor White
Write-Host "============================================================" -ForegroundColor DarkCyan
Write-Host ""

$ExecutiveBriefing = [ordered]@{

    Generated              = Get-Date

    Environment            = $null
    DlpPolicies            = $null
    DlpRules               = $null
    SensitivityLabels      = $null
    LabelPolicies          = $null
    SensitiveInfoTypes     = $null
    RulePackages           = $null

    ExecutiveSummary       = @()
    KeyObservations        = @()
    Findings               = @()
    Recommendations        = @()

}

#endregion

#region Connect

Write-Status "Loading Exchange Online Management..."

Import-Module ExchangeOnlineManagement -ErrorAction Stop

Write-Status "Connecting to Microsoft Purview..."

Connect-IPPSSession -ShowBanner:$false

#endregion

#region Validate Environment

Write-Status "Validating Microsoft Purview cmdlets..."

$RequiredCmdlets = @(
    "Get-DlpCompliancePolicy",
    "Get-DlpComplianceRule",
    "Get-Label",
    "Get-LabelPolicy",
    "Get-DlpSensitiveInformationType",
    "Get-DlpSensitiveInformationTypeRulePackage"
)

foreach ($Cmdlet in $RequiredCmdlets) {

    if (-not (Get-Command $Cmdlet -ErrorAction SilentlyContinue)) {

        throw "Required cmdlet not available: $Cmdlet"

    }

}

#endregion

#region Collect Inventory

Write-Status "Collecting Microsoft Purview inventory..."

$ExecutiveBriefing.Environment =
    Import-Inventory "Get-PurviewEnvironment.ps1"

$ExecutiveBriefing.DlpPolicies =
    Import-Inventory "Get-DlpPolicies.ps1"

$ExecutiveBriefing.DlpRules =
    Import-Inventory "Get-DlpRules.ps1"

$ExecutiveBriefing.SensitivityLabels =
    Import-Inventory "Get-SensitivityLabels.ps1"

$ExecutiveBriefing.LabelPolicies =
    Import-Inventory "Get-LabelPolicies.ps1"

$ExecutiveBriefing.SensitiveInfoTypes =
    Import-Inventory "Get-SensitiveInfoTypes.ps1"

$ExecutiveBriefing.RulePackages =
    Import-Inventory "Get-DlpSensitiveInformationTypeRulePackages.ps1"

Write-Status "Inventory collection completed."

Write-Host ""
Write-Host "===== DEBUG: Returned Objects =====" -ForegroundColor Yellow

$ExecutiveBriefing | Format-List *

#endregion

<#
#region Analyze Inventory

Write-Status "Analyzing Microsoft Purview configuration..."

#
# Executive Summary
#

$ExecutiveBriefing.ExecutiveSummary +=
    "Microsoft Purview configuration data was successfully collected."

$ExecutiveBriefing.ExecutiveSummary +=
    "This briefing reflects the Microsoft Purview configuration present at the time of execution."

#
# Data Loss Prevention
#

if ($ExecutiveBriefing.DlpPolicies.Summary.TotalPolicies -gt 0) {

    $ExecutiveBriefing.KeyObservations +=
        ("{0} Data Loss Prevention policies were identified." -f `
            $ExecutiveBriefing.DlpPolicies.Summary.TotalPolicies)

}

if ($ExecutiveBriefing.DlpRules.Summary.TotalRules -gt 0) {

    $ExecutiveBriefing.KeyObservations +=
        ("{0} Data Loss Prevention rules were identified." -f `
            $ExecutiveBriefing.DlpRules.Summary.TotalRules)

}

#
# Sensitivity Labels
#

if ($ExecutiveBriefing.SensitivityLabels.Summary.TotalLabels -gt 0) {

    $ExecutiveBriefing.KeyObservations +=
        ("{0} Sensitivity Labels were identified." -f `
            $ExecutiveBriefing.SensitivityLabels.Summary.TotalLabels)

}

#
# Label Policies
#

if ($ExecutiveBriefing.LabelPolicies.Summary.TotalPolicies -gt 0) {

    $ExecutiveBriefing.KeyObservations +=
        ("{0} Label Publishing Policies were identified." -f `
            $ExecutiveBriefing.LabelPolicies.Summary.TotalPolicies)

}

#
# Sensitive Information Types
#

if ($ExecutiveBriefing.SensitiveInfoTypes.Summary.TotalSensitiveInformationTypes -gt 0) {

    $ExecutiveBriefing.KeyObservations +=
        ("{0} Sensitive Information Types are available." -f `
            $ExecutiveBriefing.SensitiveInfoTypes.Summary.TotalSensitiveInformationTypes)

}

if ($ExecutiveBriefing.SensitiveInfoTypes.Summary.CustomSensitiveInformationTypes -gt 0) {

    $ExecutiveBriefing.Findings +=
        ("{0} custom Sensitive Information Types were identified." -f `
            $ExecutiveBriefing.SensitiveInfoTypes.Summary.CustomSensitiveInformationTypes)

}

#
# Rule Packages
#

if ($ExecutiveBriefing.RulePackages.Summary.TotalRulePackages -gt 0) {

    $ExecutiveBriefing.KeyObservations +=
        ("{0} Sensitive Information Type Rule Packages were identified." -f `
            $ExecutiveBriefing.RulePackages.Summary.TotalRulePackages)

}

#endregion
#>

#region Recommendations

$ExecutiveBriefing.Recommendations +=
    "Review Data Loss Prevention policies periodically to confirm they align with current business requirements."

$ExecutiveBriefing.Recommendations +=
    "Review published Sensitivity Labels to confirm they continue to support the organization's information classification strategy."

$ExecutiveBriefing.Recommendations +=
    "Review custom Sensitive Information Types to ensure they remain accurate and relevant."

#endregion

#region Executive Briefing

Write-Host ""
Write-Host "============================================================" -ForegroundColor DarkCyan
Write-Host "EXECUTIVE SECURITY BRIEFING" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor DarkCyan
Write-Host ""

Write-Host "Generated:" -ForegroundColor Yellow -NoNewline
Write-Host " $($ExecutiveBriefing.Generated)"
Write-Host ""

#
# Executive Summary
#

Write-Host "EXECUTIVE SUMMARY" -ForegroundColor Green
Write-Host "-----------------"

foreach ($Line in $ExecutiveBriefing.ExecutiveSummary) {

    Write-Host "• $Line"

}

Write-Host ""

#
# Key Observations
#

Write-Host "KEY OBSERVATIONS" -ForegroundColor Green
Write-Host "----------------"

foreach ($Observation in $ExecutiveBriefing.KeyObservations) {

    Write-Host "• $Observation"

}

Write-Host ""

#
# Findings
#

Write-Host "FINDINGS" -ForegroundColor Green
Write-Host "--------"

foreach ($Finding in $ExecutiveBriefing.Findings) {

    Write-Host "• $Finding"

}

Write-Host ""

#
# Recommendations
#

Write-Host "RECOMMENDATIONS" -ForegroundColor Green
Write-Host "---------------"

foreach ($Recommendation in $ExecutiveBriefing.Recommendations) {

    Write-Host "• $Recommendation"

}

Write-Host ""

#endregion

#region Cleanup

Write-Status "Disconnecting Microsoft Purview..."

Disconnect-ExchangeOnline -Confirm:$false

#endregion

#region Return

if ($PassThru) {

    [PSCustomObject]$ExecutiveBriefing

}

#endregion
