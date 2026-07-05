#
# ACT Script Purpose
#
# Answers:
#   • What Microsoft Purview DLP policies exist?
#   • Which locations are protected by each policy?
#   • Are the policies enabled or disabled?
#

<#
.SYNOPSIS
    Inventories Microsoft Purview Data Loss Prevention (DLP) policies.

.DESCRIPTION
    Retrieves Microsoft Purview Data Loss Prevention (DLP) policies from the
    connected tenant and returns a structured inventory of their configuration.
    This script helps administrators understand which DLP policies exist,
    whether they are enabled, and the workloads they protect.

.NOTES
    Author  : ACT Security Toolkit
    Requires: ExchangeOnlineManagement

.LINK
    https://github.com/BarDownAndCelly/ACT-Security-Toolkit

.VERSION
    1.0.0

.EXAMPLE
    ./Get-DlpPolicies.ps1 -Verbose
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
1.0.0      2026-07-05  ACT Security Toolkit  Initial release.
#>

#endregion
#region Execution Requirements

<#
This script requires:

• PowerShell 7.4 or later

• ExchangeOnlineManagement module

• An active Microsoft Purview PowerShell session
  (Connect-IPPSSession)

• Permissions to view Microsoft Purview Data Loss Prevention (DLP) policies

This script is read-only and does not modify tenant configuration.
#>

#endregion
#region Private Functions

function Get-DlpPolicyInventory {

    <#
    .SYNOPSIS
        Retrieves Microsoft Purview DLP policies.

    .DESCRIPTION
        Queries Microsoft Purview for Data Loss Prevention (DLP)
        policies and returns a standardized collection of
        PSCustomObjects representing each policy.

    .OUTPUTS
        System.Management.Automation.PSCustomObject[]
    #>

    $Policies = @(Get-DlpCompliancePolicy -ErrorAction Stop)

    $Inventory = foreach ($Policy in $Policies) {

        [PSCustomObject]@{
            Name        = $Policy.Name
            DisplayName = $Policy.DisplayName
            Enabled     = $Policy.Enabled
            Mode        = $Policy.Mode
            Priority    = $Policy.Priority
            Workload    = $Policy.Workload
        }

    }

    return $Inventory

}

#endregion
#region Main

Write-Host "Microsoft Purview DLP Policy Inventory" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host

try {

    $Policies = @(Get-DlpPolicyInventory)
    Write-Host "Policies Found : $($Policies.Count)"
    Write-Host

    foreach ($Policy in $Policies) {

        Write-Host "------------------------------------------------------------"
        Write-Host "Priority : $($Policy.Priority)"
        Write-Host "Name     : $($Policy.Name)"
        Write-Host "Enabled  : $($Policy.Enabled)"
        Write-Host "Mode     : $($Policy.Mode)"
        Write-Host "Workload : $($Policy.Workload)"
        Write-Host

    }

    if ($PassThru) {

        return [PSCustomObject]@{
            Script    = $MyInvocation.MyCommand.Name
            Generated = Get-Date
            Policies  = $Policies
            Summary = [PSCustomObject]@{
                TotalPolicies = $Policies.Count
            }
        }

    }

}
catch {
    throw
}

#endregion