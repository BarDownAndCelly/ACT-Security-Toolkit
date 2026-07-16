#
# ACT Script Purpose
#
# Answers:
#   • Which Microsoft Purview sensitivity label policies exist?
#   • Which users or groups receive each policy?
#   • Which sensitivity labels are published by each policy?
#   • Which policy settings are configured?
#
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

Write-Host "Microsoft Purview Sensitivity Label Policy Inventory" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host

try {

    $Policies = @(Get-LabelPolicyInventory)

    $EnabledCount  = @($Policies | Where-Object Enabled).Count
    $DisabledCount = @($Policies | Where-Object { -not $_.Enabled }).Count

    $EnforceCount = @($Policies | Where-Object Mode -eq "Enforce").Count
    $TestCount    = @($Policies | Where-Object Mode -like "Test*").Count

    Write-Host "Label Policies Found : $($Policies.Count)"
    Write-Host

    Write-Host "Summary" -ForegroundColor Yellow
    Write-Host "-------"
    Write-Host "Enabled Policies : $EnabledCount"
    Write-Host "Disabled Policies: $DisabledCount"
    Write-Host
    Write-Host "Enforced Policies: $EnforceCount"
    Write-Host "Test Policies    : $TestCount"
    Write-Host

    foreach ($Policy in $Policies) {

        Write-Host "------------------------------------------------------------"
        Write-Host "Priority        : $($Policy.Priority)"
        Write-Host "Policy Name     : $($Policy.Name)"
        Write-Host "Enabled         : $(if($Policy.Enabled){'Yes'}else{'No'})"
        Write-Host "Mode            : $($Policy.Mode)"
        Write-Host "Status          : $($Policy.Status)"
        Write-Host

        Write-Host "Published Labels"
        Write-Host "----------------"

        foreach ($Label in ($Policy.Labels -split ", ")) {
            Write-Host "  • $Label"
        }

        Write-Host
        Write-Host "Created By      : $($Policy.CreatedBy)"
        Write-Host "Modified By     : $($Policy.ModifiedBy)"
        Write-Host "Created         : $($Policy.Created.ToString('yyyy-MM-dd HH:mm:ss'))"
        Write-Host "Modified        : $($Policy.Modified.ToString('yyyy-MM-dd HH:mm:ss'))"
        Write-Host

        if (![string]::IsNullOrWhiteSpace($Policy.Comment)) {
            Write-Host "Comment"
            Write-Host "-------"
            Write-Host $Policy.Comment
            Write-Host
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