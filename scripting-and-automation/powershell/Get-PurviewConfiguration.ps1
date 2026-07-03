#
# ACT Script Purpose
#
# Answers:
#
#   • Which Microsoft Purview workloads are configured?
#
#   • Which Microsoft Purview capabilities are currently in use?
#
#   • Which ACT Purview scripts should be executed next?
#

<#
.SYNOPSIS
    Inventories Microsoft Purview configuration for the
    ACT Security Toolkit.

.DESCRIPTION
    This script inventories major Microsoft Purview workloads and
    reports whether they are configured within the connected tenant.

    It is intended to provide security engineers with a high-level
    overview of Microsoft Purview before investigating individual
    workloads such as Data Loss Prevention, Insider Risk Management,
    Sensitivity Labels, and Communication Compliance.

.NOTES
    Author: J Moore
    Project: ACT Security Toolkit

    Use all scripts at your own discretion.

    These scripts are provided to help security professionals build,
    operate, and mature Insider Threat programs. Every environment is
    different. Always understand, test, and validate scripts before
    using them in production.

.LINK
    https://github.com/BarDownAndCelly/ACT-Security-Toolkit

.VERSION
    1.0.0

.EXAMPLE
    ./Get-PurviewConfiguration.ps1 -Verbose
#>

#Requires -Version 7.4

[CmdletBinding()]
param ()

Set-StrictMode -Version Latest

#region Version History

# -------------------------------------------------------------------------
# Version History
#
# Version  Date         Author     Notes
# -------  ----------   --------   -----------------------------------------
# 1.0.0    2026-07-04   J Moore    Initial release.
#
# -------------------------------------------------------------------------

#endregion

#region Execution Requirements

# -------------------------------------------------------------------------
# Required Modules
#
#   ExchangeOnlineManagement
#
# Required Permissions
#
#   Compliance Administrator
#
# Output
#
#   PSCustomObject
#
# Design Principles
#
#   • Read-only by default
#   • Least privilege
#   • Production-quality code
#   • Modular and reusable
#   • Structured PowerShell objects
#   • No automatic dependency installation
#
# Related References
#
#   N/A
#
# -------------------------------------------------------------------------

#endregion

#region Private Functions

function Get-WorkloadCount {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        [string]$Workload,

        [Parameter(Mandatory)]
        [string]$Cmdlet

    )

    Write-Verbose "Checking $Workload..."

    #
    # Verify the cmdlet exists
    #

    if (-not (Get-Command $Cmdlet -ErrorAction SilentlyContinue)) {

        return [PSCustomObject]@{

            Workload = $Workload

            Status = "Unavailable"

            Count = $null

            Notes = "Required cmdlet not available."

        }

    }

    try {

        $Items = & $Cmdlet `
            -WarningAction SilentlyContinue `
            -ErrorAction Stop

        return [PSCustomObject]@{

            Workload = $Workload

            Status = "Available"

            Count = @($Items).Count

            Notes = $null

        }

    }
    catch {

        return [PSCustomObject]@{

            Workload = $Workload

            Status = "Error"

            Count = $null

            Notes = $_.Exception.Message

        }

    }

}

function Show-PurviewConfigurationSummary {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        $Results

    )

    Write-Host ""

    Write-Host "Microsoft Purview Configuration"
    Write-Host "==============================="

    Write-Host ""

    $Results |
        Format-Table Workload, Status, Count -AutoSize

    Write-Host ""

    Write-Host "Recommendations"
    Write-Host "---------------"

    Write-Host "  ✓ Microsoft Purview configuration successfully inventoried."
    Write-Host "  ✓ Continue with workload-specific ACT scripts."

}

#endregion
#region Main

Write-Verbose "Starting Microsoft Purview configuration inventory..."

$Results = @()

$Results += Get-WorkloadCount `
    -Workload "Data Loss Prevention" `
    -Cmdlet "Get-DlpCompliancePolicy"

$Results += Get-WorkloadCount `
    -Workload "Sensitivity Labels" `
    -Cmdlet "Get-Label"

$Results += Get-WorkloadCount `
    -Workload "Label Policies" `
    -Cmdlet "Get-LabelPolicy"

$Results += Get-WorkloadCount `
    -Workload "Retention Policies" `
    -Cmdlet "Get-RetentionCompliancePolicy"

$Results += Get-WorkloadCount `
    -Workload "Retention Labels" `
    -Cmdlet "Get-RetentionComplianceRule"

$Results += Get-WorkloadCount `
    -Workload "Communication Compliance" `
    -Cmdlet "Get-ComplianceCase"

$Results += Get-WorkloadCount `
    -Workload "Insider Risk Management" `
    -Cmdlet "Get-InsiderRiskPolicy"

#
# Adaptive Protection
#
# There is currently no single "Get-AdaptiveProtection..."
# cmdlet. For v1.0 we'll simply detect whether the supporting
# cmdlets are present.
#

$AdaptiveProtection = if (
    Get-Command "Get-AdaptiveProtectionPolicy" -ErrorAction SilentlyContinue
) {
    [PSCustomObject]@{

        Workload = "Adaptive Protection"

        Status = "Available"

        Count = $null

        Notes = "Adaptive Protection cmdlets detected."

    }
}
else {

    [PSCustomObject]@{

        Workload = "Adaptive Protection"

        Status = "Unavailable"

        Count = $null

        Notes = "Adaptive Protection cmdlets not detected."

    }

}

$Results += $AdaptiveProtection

Show-PurviewConfigurationSummary `
    -Results $Results

$Results

#endregion

