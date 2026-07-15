#
# ACT Script Purpose
#
# Answers:
#   • What Microsoft Purview DLP rules exist?
#   • Which DLP policy contains each rule?
#   • What actions and conditions are configured for each rule?
#
<#
.SYNOPSIS
    Inventories Microsoft Purview Data Loss Prevention (DLP) rules.

.DESCRIPTION
    Retrieves Microsoft Purview Data Loss Prevention (DLP) rules from the
    connected tenant and returns a structured inventory of their configuration.
    This script helps administrators understand how DLP policies are configured
    by identifying the rules, their parent policies, and configured actions.

.NOTES
    Author  : ACT Security Toolkit
    Requires: ExchangeOnlineManagement

.LINK
    https://github.com/BarDownAndCelly/ACT-Security-Toolkit

.VERSION
    1.0.0

.EXAMPLE
    ./Get-DlpRules.ps1 -Verbose
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

• Permissions to view Microsoft Purview Data Loss Prevention (DLP) rules

This script is read-only and does not modify tenant
configuration.
#>

#endregion

#region Private Functions

function Get-DlpRuleInventory {

    <#
    .SYNOPSIS
        Retrieves Microsoft Purview DLP rules.

    .DESCRIPTION
        Queries Microsoft Purview for Data Loss Prevention (DLP)
        rules and returns a standardized collection of
        PSCustomObjects representing each rule.

    .OUTPUTS
        System.Management.Automation.PSCustomObject[]
    #>

    $Rules = @(Get-DlpComplianceRule -ErrorAction Stop)

    foreach ($Rule in $Rules) {

        [PSCustomObject]@{
            Priority      = $Rule.Priority
            RuleName      = $Rule.DisplayName
            Policy        = $Rule.ParentPolicyName
            Enabled       = -not $Rule.Disabled
            Mode          = $Rule.Mode
            Workload      = $Rule.Workload

            AdvancedRule  = $Rule.IsAdvancedRule

            GenerateAlert = ($Rule.GenerateAlert.Count -gt 0)
            BlockAccess   = $Rule.BlockAccess
            PortalAccess  = $Rule.EnforcePortalAccess
            Quarantine    = $Rule.Quarantine

            Comment       = $Rule.Comment

            CreatedBy     = $Rule.CreatedBy
            ModifiedBy    = $Rule.LastModifiedBy
            Created        = $Rule.WhenCreated
            Modified       = $Rule.WhenChanged
        }

    }

}

#endregion

#region Main

Write-Host "Microsoft Purview DLP Rule Inventory" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host

try {

    $Rules = @(Get-DlpRuleInventory)

    Write-Host "Rules Found : $($Rules.Count)"
    Write-Host

    foreach ($Rule in $Rules) {

        Write-Host "------------------------------------------------------------"
        Write-Host "Priority       : $($Rule.Priority)"
        Write-Host "Rule Name      : $($Rule.RuleName)"
        Write-Host "Policy         : $($Rule.Policy)"
        Write-Host "Enabled        : $($Rule.Enabled)"
        Write-Host "Mode           : $($Rule.Mode)"
        Write-Host "Workload       : $($Rule.Workload)"
        Write-Host

        Write-Host "Advanced Rule  : $(if($Rule.AdvancedRule){'Yes'}else{'No'})"
        Write-Host

        Write-Host "Generate Alert : $(if($Rule.GenerateAlert){'Yes'}else{'No'})"
        Write-Host "Block Access   : $(if($Rule.BlockAccess){'Yes'}else{'No'})"
        Write-Host "Portal Access  : $(if($Rule.PortalAccess){'Yes'}else{'No'})"
        Write-Host "Quarantine     : $(if($Rule.Quarantine){'Yes'}else{'No'})"
        Write-Host "Comment        : $($Rule.Comment)"
        Write-Host

        Write-Host "Created By     : $($Rule.CreatedBy)"
        Write-Host "Modified By    : $($Rule.ModifiedBy)"
        Write-Host "Created        : $($Rule.Created.ToString('yyyy-MM-dd HH:mm:ss'))"
        Write-Host "Modified       : $($Rule.Modified.ToString('yyyy-MM-dd HH:mm:ss'))"
        Write-Host

    }

    if ($PassThru) {

        return [PSCustomObject]@{
            Script    = $MyInvocation.MyCommand.Name
            Generated = Get-Date
            Rules     = $Rules

            Summary = [PSCustomObject]@{
                TotalRules = $Rules.Count
            }
        }

    }

}
catch {
    throw
}

#endregion