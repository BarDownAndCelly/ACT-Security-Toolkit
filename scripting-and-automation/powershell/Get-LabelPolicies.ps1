#
# ACT Script Purpose
#
# Answers:
#   • Which Microsoft Purview sensitivity label policies exist?
#   • Which users or groups receive each policy?
#   • Which sensitivity labels are published by each policy?
#   • Which policy settings are configured?
#

#Requires -Version 7.4

[CmdletBinding()]
param(
    [switch]$PassThru
)

Set-StrictMode -Version Latest

function Get-LabelPolicyInventory {

    <#
    .SYNOPSIS
        Retrieves Microsoft Purview Sensitivity Label Policies.

    .DESCRIPTION
        Queries Microsoft Purview for Sensitivity Label Policies and
        returns a standardized collection of PSCustomObjects
        representing each policy.

    .OUTPUTS
        System.Management.Automation.PSCustomObject[]
    #>

    $Policies = @(Get-LabelPolicy -ErrorAction Stop)

    foreach ($Policy in $Policies) {

        [PSCustomObject]@{
            Priority       = $Policy.Priority
            Name           = $Policy.Name
            Enabled        = $Policy.Enabled
            Mode           = $Policy.Mode
            Status         = $Policy.DistributionSyncStatus

            Labels         = if ($Policy.Labels.Count) { $Policy.Labels -join ", " } else { "None" }

            Workload       = $Policy.Workload

            Exchange       = if ($Policy.ExchangeLocation.Count) { $Policy.ExchangeLocation -join ", " } else { "None" }
            SharePoint     = if ($Policy.SharePointLocation.Count) { $Policy.SharePointLocation -join ", " } else { "None" }
            OneDrive       = if ($Policy.OneDriveLocation.Count) { $Policy.OneDriveLocation -join ", " } else { "None" }
            Teams          = if ($Policy.ModernGroupLocation.Count) { $Policy.ModernGroupLocation -join ", " } else { "None" }

            CreatedBy      = $Policy.CreatedBy
            ModifiedBy     = $Policy.LastModifiedBy
            Created        = $Policy.CreationTimeUtc
            Modified       = $Policy.ModificationTimeUtc

            Comment        = $Policy.Comment
        }

    }

}

#region Main

Write-Inventory "Microsoft Purview Sensitivity Label Policy Inventory" -ForegroundColor Cyan
Write-Inventory "===================================================" -ForegroundColor Cyan
Write-Inventory

try {

    $Policies = @(Get-LabelPolicyInventory)

    $EnabledCount  = @($Policies | Where-Object Enabled).Count
    $DisabledCount = @($Policies | Where-Object { -not $_.Enabled }).Count

    $EnforceCount = @($Policies | Where-Object Mode -eq "Enforce").Count
    $TestCount    = @($Policies | Where-Object Mode -like "Test*").Count

    Write-Inventory "Label Policies Found : $($Policies.Count)"
    Write-Inventory

    Write-Inventory "Summary" -ForegroundColor Yellow
    Write-Inventory "-------"
    Write-Inventory "Enabled Policies : $EnabledCount"
    Write-Inventory "Disabled Policies: $DisabledCount"
    Write-Inventory
    Write-Inventory "Enforced Policies: $EnforceCount"
    Write-Inventory "Test Policies    : $TestCount"
    Write-Inventory

    foreach ($Policy in $Policies) {

        Write-Inventory "------------------------------------------------------------"
        Write-Inventory "Priority        : $($Policy.Priority)"
        Write-Inventory "Policy Name     : $($Policy.Name)"
        Write-Inventory "Enabled         : $(if($Policy.Enabled){'Yes'}else{'No'})"
        Write-Inventory "Mode            : $($Policy.Mode)"
        Write-Inventory "Status          : $($Policy.Status)"
        Write-Inventory

        Write-Inventory "Published Labels"
        Write-Inventory "----------------"

        foreach ($Label in ($Policy.Labels -split ", ")) {
            Write-Inventory "  • $Label"
        }

        Write-Inventory
        Write-Inventory "Created By      : $($Policy.CreatedBy)"
        Write-Inventory "Modified By     : $($Policy.ModifiedBy)"
        Write-Inventory "Created         : $($Policy.Created.ToString('yyyy-MM-dd HH:mm:ss'))"
        Write-Inventory "Modified        : $($Policy.Modified.ToString('yyyy-MM-dd HH:mm:ss'))"
        Write-Inventory

        if (![string]::IsNullOrWhiteSpace($Policy.Comment)) {
            Write-Inventory "Comment"
            Write-Inventory "-------"
            Write-Inventory $Policy.Comment
            Write-Inventory
        }

    }

    if ($PassThru) {

        return [PSCustomObject]@{
            Script    = $MyInvocation.MyCommand.Name
            Generated = Get-Date
            Policies  = $Policies

            Summary = [PSCustomObject]@{
                TotalPolicies    = $Policies.Count
                EnabledPolicies  = $EnabledCount
                DisabledPolicies = $DisabledCount
                EnforcedPolicies = $EnforceCount
                TestPolicies     = $TestCount
            }
        }

    }

}
catch {
    throw
}

#endregion