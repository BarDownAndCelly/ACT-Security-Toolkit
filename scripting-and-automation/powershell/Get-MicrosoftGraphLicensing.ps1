<#
.SYNOPSIS
    Retrieves Microsoft 365 licensing information for the connected tenant.

.DESCRIPTION
    This script validates the Microsoft Graph PowerShell environment,
    retrieves subscribed Microsoft 365 licenses, and presents a
    human-readable licensing summary.

    It is intended to provide security engineers with a quick inventory
    of licensed Microsoft products before performing additional
    Microsoft Graph or Microsoft Purview assessments.

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
    ./Get-MicrosoftGraphLicensing.ps1 -Verbose
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
# 1.0.0    2026-07-02   J Moore    Initial release.
#
# -------------------------------------------------------------------------

#endregion

#region Execution Requirements

# -------------------------------------------------------------------------
# Required Modules
#
#   Microsoft.Graph.Authentication
#   Microsoft.Graph.Identity.DirectoryManagement
#
# Required Microsoft Graph Permissions
#
#   Organization.Read.All
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
#   quick-reference/msft-licensing-mapping.md
#
# -------------------------------------------------------------------------

#endregion

#region Private Functions

function Test-GraphModules {

    [CmdletBinding()]
    param ()

    Write-Verbose "Checking required Microsoft Graph modules..."

    $RequiredModules = @(
        "Microsoft.Graph.Authentication",
        "Microsoft.Graph.Identity.DirectoryManagement"
    )

    $LoadedModules = foreach ($Module in $RequiredModules) {

        $InstalledModule = Get-Module -ListAvailable -Name $Module

        if (-not $InstalledModule) {

            throw @"
Required module '$Module' was not found.

Install it using:

Install-Module $Module -Scope CurrentUser
"@

        }

        Import-Module $Module -ErrorAction Stop

        [PSCustomObject]@{
            Name    = $InstalledModule.Name
            Version = $InstalledModule.Version.ToString()
        }

    }

    return $LoadedModules

}

function Connect-ToolkitGraph {

    [CmdletBinding()]
    param ()

    Write-Verbose "Checking Microsoft Graph connection..."

    $Context = Get-MgContext

    if ($null -ne $Context) {

        Write-Verbose "Using existing Microsoft Graph connection."

        return $Context

    }

    Write-Verbose "Connecting to Microsoft Graph..."

    try {

        Connect-MgGraph `
            -Scopes "Organization.Read.All" `
            -NoWelcome `
            -ErrorAction Stop | Out-Null

        return Get-MgContext

    }
    catch {

        throw @"
Failed to connect to Microsoft Graph.

$($_.Exception.Message)
"@

    }

}

function Get-OrganizationInformation {

    [CmdletBinding()]
    param ()

    Write-Verbose "Retrieving organization information..."

    return Get-MgOrganization -ErrorAction Stop

}

function Get-MicrosoftLicensing {

    [CmdletBinding()]
    param ()

    Write-Verbose "Retrieving Microsoft licensing information..."

    return Get-MgSubscribedSku -ErrorAction Stop

}

function Get-FriendlySkuName {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        [string]$SkuPartNumber,

        [Parameter(Mandatory)]
        [hashtable]$LicensingMap

    )

    if ($LicensingMap.ContainsKey($SkuPartNumber)) {

        return $LicensingMap[$SkuPartNumber].Product

    }

    return $SkuPartNumber

}

function Show-LicensingSummary {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        $GraphContext,

        [Parameter(Mandatory)]
        $Organization,

        [Parameter(Mandatory)]
        $Licenses

    )

    Write-Host ""
    Write-Host "Microsoft Graph Licensing Summary"
    Write-Host "================================="
    Write-Host ""

    Write-Host ("Status       : Healthy")
    Write-Host ("Tenant       : {0}" -f $Organization.DisplayName)
    Write-Host ("Tenant ID    : {0}" -f $Organization.Id)
    Write-Host ("Environment  : {0}" -f $GraphContext.Environment)

    Write-Host ""
    Write-Host "Licensed Products"
    Write-Host "-----------------"
    Write-Host ""

    $Licenses |
        Sort-Object Product |
        Format-Table Product, Sku, Enabled, Consumed, Available -AutoSize

    Write-Host ""
    Write-Host "Recommendations"
    Write-Host "---------------"

    Write-Host "  ✓ Review quick-reference/msft-licensing-mapping.md."
    Write-Host "  ✓ Continue with Get-PurviewEnvironment.ps1."
    Write-Host "  ✓ Licensing information successfully retrieved."

}
function Show-LicensingSummary {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        $GraphContext,

        [Parameter(Mandatory)]
        $Organization,

        [Parameter(Mandatory)]
        $Licenses

    )

    Write-Host ""
    Write-Host "Microsoft Graph Licensing Summary"
    Write-Host "================================="
    Write-Host ""

    Write-Host ("Status       : Healthy")
    Write-Host ("Tenant       : {0}" -f $Organization.DisplayName)
    Write-Host ("Tenant ID    : {0}" -f $Organization.Id)
    Write-Host ("Environment  : {0}" -f $GraphContext.Environment)

    Write-Host ""
    Write-Host "Licensed Products"
    Write-Host "-----------------"
    Write-Host ""

    $Licenses |
        Sort-Object Product |
        Format-Table Product, Sku, Enabled, Consumed, Available -AutoSize

    Write-Host ""
    Write-Host "Recommendations"
    Write-Host "---------------"

    Write-Host "  ✓ Review quick-reference/msft-licensing-mapping.md."
    Write-Host "  ✓ Continue with Get-PurviewEnvironment.ps1."
    Write-Host "  ✓ Licensing information successfully retrieved."

}

#endregion
#region Main

Write-Verbose "Starting Microsoft Graph licensing assessment..."

$GraphModules = Test-GraphModules
$GraphContext = Connect-ToolkitGraph
$Organization = Get-OrganizationInformation
$LicensingMap = Import-PowerShellDataFile `
    (Join-Path $PSScriptRoot "data/MicrosoftLicensingMap.psd1")
$Licenses = foreach ($License in (Get-MicrosoftLicensing)) {
    [PSCustomObject]@{

        Product = Get-FriendlySkuName `
            -SkuPartNumber $License.SkuPartNumber `
            -LicensingMap $LicensingMap
        Sku = $License.SkuPartNumber
        Enabled = $License.PrepaidUnits.Enabled
        Consumed = $License.ConsumedUnits
        Available = ($License.PrepaidUnits.Enabled - $License.ConsumedUnits)

    }

}

Show-LicensingSummary `
    -GraphContext $GraphContext `
    -Organization $Organization `
    -Licenses $Licenses

$Results = [PSCustomObject]@{

    Status = "Healthy"
    ConnectedAccount = $GraphContext.Account
    TenantName = $Organization.DisplayName
    TenantId = $Organization.Id
    Environment = $GraphContext.Environment
    Licenses = $Licenses

}

$Results

#endregion