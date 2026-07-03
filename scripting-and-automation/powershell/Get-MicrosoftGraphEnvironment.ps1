
#
# ACT Script Purpose
#
# Answers:
#
#   • Is my local PowerShell environment ready for Microsoft Graph?
#
#   • Can I successfully authenticate to Microsoft Graph?
#
#   • Can I retrieve basic tenant information required for
#     subsequent ACT automation?
#

<#
.SYNOPSIS
    Validates the local Microsoft Graph PowerShell environment for the
    ACT Security Toolkit.

.DESCRIPTION
    This script verifies that the required Microsoft Graph PowerShell
    modules are installed, establishes a connection to Microsoft Graph,
    retrieves basic tenant information, and confirms that the local
    environment is ready for Microsoft Graph automation.

    This script is intended to be the first Microsoft Graph script
    executed before using other PowerShell automation contained within
    the ACT Security Toolkit.

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
    1.1.0

.EXAMPLE
    ./Get-MicrosoftGraphEnvironment.ps1 -Verbose
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
# 1.1.0    2026-07-02   J Moore    Rebuilt for ACT Security Toolkit.
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
#   User.Read
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
            -Scopes "User.Read" `
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
    try {
        return Get-MgOrganization -ErrorAction Stop
    }
    catch {
        throw @"
Failed to retrieve organization information.

$($_.Exception.Message)
"@

    }

}

function Get-VerifiedDomains {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        $Organization
    )

    Write-Verbose "Retrieving verified domains..."
    return $Organization.VerifiedDomains |
        Sort-Object Name |
        Select-Object -ExpandProperty Name
}

function Show-EnvironmentSummary {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        $GraphContext,

        [Parameter(Mandatory)]
        $GraphModules,

        [Parameter(Mandatory)]
        $Organization,

        [Parameter(Mandatory)]
        [string[]]$VerifiedDomains

    )

    Write-Host ""
    Write-Host "Microsoft Graph Connection Summary"
    Write-Host "=================================="
    Write-Host ""

    Write-Host ("Status            : Healthy")
    Write-Host ("Connected Account : {0}" -f $GraphContext.Account)
    Write-Host ("Tenant Name       : {0}" -f $Organization.DisplayName)
    Write-Host ("Tenant ID         : {0}" -f $Organization.Id)
    Write-Host ("Environment       : {0}" -f $GraphContext.Environment)

    Write-Host ""
    Write-Host "Required Graph Modules"
    Write-Host "----------------------"
    Write-Host ""

    $GraphModules |
        Format-Table Name, Version -AutoSize

    Write-Host ""
    Write-Host "Verified Domains"
    Write-Host "----------------"

    foreach ($Domain in $VerifiedDomains) {

        Write-Host "  • $Domain"

    }

    Write-Host ""
    Write-Host "Notes"
    Write-Host "-----"

    Write-Host "  ✓ Microsoft Graph authentication successful."
    Write-Host "  ✓ Organization information retrieved."
    Write-Host "  ✓ Verified domains retrieved."
    Write-Host "  ✓ Environment ready for Microsoft Graph automation."

}

#endregion
#region Main

Write-Verbose "Starting Microsoft Graph environment validation..."
$GraphModules = Test-GraphModules
$GraphContext = Connect-ToolkitGraph
$Organization = Get-OrganizationInformation
$VerifiedDomains = Get-VerifiedDomains -Organization $Organization
Show-EnvironmentSummary `
    -GraphContext $GraphContext `
    -GraphModules $GraphModules `
    -Organization $Organization `
    -VerifiedDomains $VerifiedDomains

$ConnectionSummary = [PSCustomObject]@{
    Status = "Healthy"
    ConnectedAccount = $GraphContext.Account
    TenantName = $Organization.DisplayName
    TenantId = $Organization.Id
    GraphEnvironment = $GraphContext.Environment
    GraphModules = $GraphModules
    VerifiedDomains = $VerifiedDomains
    Notes = @(
        "Microsoft Graph authentication successful."
        "Organization information retrieved."
        "Verified domains retrieved."
        "Environment ready for Microsoft Graph automation."
    )
}

$ConnectionSummary
#endregion
