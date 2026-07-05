#
# ACT Script Purpose
#
# Answers:
#   • What Microsoft Purview Sensitivity Labels exist?
#   • Which labels are currently published?
#   • What protection settings are configured for each label?
#

<#
.SYNOPSIS
    Inventories Microsoft Purview Sensitivity Labels.

.DESCRIPTION
    Retrieves Microsoft Purview Sensitivity Labels from the connected tenant
    and returns a structured inventory of their configuration. This script
    helps administrators understand which sensitivity labels exist and how
    they are configured.

.NOTES
    Author  : ACT Security Toolkit
    Requires: ExchangeOnlineManagement

.LINK
    https://github.com/BarDownAndCelly/ACT-Security-Toolkit

.VERSION
    1.0.0

.EXAMPLE
    ./Get-SensitivityLabels.ps1 -Verbose
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

• Permissions to view Microsoft Purview Sensitivity Labels

This script is read-only and does not modify tenant
configuration.
#>

#endregion

#region Private Functions

function Get-SensitivityLabelInventory {

    <#
    .SYNOPSIS
        Retrieves Microsoft Purview Sensitivity Labels.

    .DESCRIPTION
        Queries Microsoft Purview for Sensitivity Labels and returns a
        standardized collection of PSCustomObjects representing each label.

    .OUTPUTS
        System.Management.Automation.PSCustomObject[]
    #>

    $Labels = @(Get-Label -ErrorAction Stop)

    $Inventory = foreach ($Label in $Labels) {

        [PSCustomObject]@{
            Priority               = $Label.Priority
            Name                   = $Label.Name
            DisplayName            = $Label.DisplayName
            ParentLabel            = $Label.ParentLabelDisplayName
            Mode                   = $Label.Mode
            Disabled               = $Label.Disabled
            ContentType            = $Label.ContentType
            Workload               = $Label.Workload
            IsParent               = $Label.IsParent
            IsLabelGroup           = $Label.IsLabelGroup
            Tooltip                = $Label.Tooltip
        }

    }

    return $Inventory

}

#endregion
#region Main

Write-Host "Microsoft Purview Sensitivity Label Inventory" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host

try {

    $Labels = @(Get-SensitivityLabelInventory)
    Write-Host "Labels Found : $($Labels.Count)"
    Write-Host

    foreach ($Label in $Labels) {

        Write-Host "------------------------------------------------------------"
        Write-Host "Priority     : $($Label.Priority)"
        Write-Host "Display Name : $($Label.DisplayName)"
        Write-Host "Mode         : $($Label.Mode)"
        Write-Host "Disabled     : $($Label.Disabled)"
        Write-Host "Content Type : $($Label.ContentType)"
        Write-Host "Workload     : $($Label.Workload)"

        if ($Label.ParentLabel) {
            Write-Host "Parent Label : $($Label.ParentLabel)"
        }
        if ($Label.IsLabelGroup) {
            Write-Host "Label Group  : True"
        }
        Write-Host

    }

    if ($PassThru) {

        return [PSCustomObject]@{
            Script    = $MyInvocation.MyCommand.Name
            Generated = Get-Date
            Labels    = $Labels
            Summary = [PSCustomObject]@{
                TotalLabels = $Labels.Count
            }
        }

    }

}
catch {
    throw
}

#endregion