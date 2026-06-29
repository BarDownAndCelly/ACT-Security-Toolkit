<#
.SYNOPSIS
    Tests connectivity and authentication to Microsoft Graph.

.DESCRIPTION
    Validates the local PowerShell environment, verifies that the
    required Microsoft Graph PowerShell modules are installed,
    authenticates to Microsoft Graph, and retrieves basic tenant
    information.

.NOTES
    Author: J Moore
    Project: AI Security Prompt Playbook
    License: MIT

.LINK
    https://github.com/BarDownAndCelly/AI-Security-Prompt-Playbook

.VERSION
    1.2.0

.EXAMPLE
    ./Test-MicrosoftGraphConnection.ps1 -Verbose
#>

#Requires -Version 7.4

[CmdletBinding()]
param()

Set-StrictMode -Version Latest

#region Version History

# -------------------------------------------------------------------------
# Version History
#
# Version  Date         Author     Notes
# -------  ----------   --------   -----------------------------------------
# 1.0.0    2026-06-29   J Moore    Initial release.
# -------------------------------------------------------------------------

#endregion

#region Execution Requirements

# Required Modules
#   Microsoft.Graph.Authentication
#   Microsoft.Graph.Identity.DirectoryManagement
#
# Required Graph Permissions
#   User.Read

#endregion

#region Constants

$StatusHealthy = "Healthy"
$StatusWarning = "Warning"
$StatusFailed  = "Failed"

#endregion

#region Private Functions

function Test-GraphModule {

    [CmdletBinding()]
    param()

    Write-Verbose "Checking required Microsoft Graph modules..."

    $RequiredModules = @(
        "Microsoft.Graph.Authentication"
        "Microsoft.Graph.Identity.DirectoryManagement"
    )

    $InstalledModules = foreach ($ModuleName in $RequiredModules) {

        $Module = Get-Module -ListAvailable -Name $ModuleName

        if (-not $Module) {
            throw @"
Required Microsoft Graph module not found:

    $ModuleName

Install it using:

    Install-Module $ModuleName -Scope CurrentUser
"@
        }

        [PSCustomObject]@{
            Name    = $Module.Name
            Version = $Module.Version.ToString()
        }
    }

    return $InstalledModules
}

function Connect-ToolkitGraph {

    [CmdletBinding()]
    param()

    Write-Verbose "Connecting to Microsoft Graph..."

    try {

        Connect-MgGraph `
            -Scopes "User.Read" `
            -NoWelcome `
            -ErrorAction Stop | Out-Null

        Get-MgContext

    }
    catch {
        throw @"
Failed to connect to Microsoft Graph.

$($_.Exception.Message)
"@
    }
}

function Show-ConnectionSummary {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSCustomObject]$Summary
    )

    Write-Host ""
    Write-Host "Microsoft Graph Connection Summary"
    Write-Host "=================================="
    Write-Host ("Status            : {0}" -f $Summary.Status)
    Write-Host ("Connected Account : {0}" -f $Summary.ConnectedAccount)
    Write-Host ("Tenant Name       : {0}" -f $Summary.TenantName)
    Write-Host ("Tenant ID         : {0}" -f $Summary.TenantId)
    Write-Host ("Environment       : {0}" -f $Summary.GraphEnvironment)

    Write-Host ""
    Write-Host "Required Graph Modules"
    Write-Host "----------------------"
    $Summary.GraphModules | Format-Table -AutoSize

    Write-Host ""
    Write-Host "Verified Domains"
    Write-Host "----------------"
    foreach ($Domain in $Summary.VerifiedDomains) {
        Write-Host "  • $Domain"
    }

    Write-Host ""
    Write-Host "Notes"
    Write-Host "-----"
    foreach ($Note in $Summary.Notes) {
        Write-Host "  ✓ $Note"
    }

    Write-Host ""
}

#endregion
#region Main

Write-Verbose "Starting Microsoft Graph connectivity test..."

$GraphModules = Test-GraphModule
$GraphContext = Connect-ToolkitGraph

Write-Verbose "Retrieving tenant information..."

$Organization = Get-MgOrganization -ErrorAction Stop
$Domains      = Get-MgDomain -ErrorAction Stop

$ConnectionSummary = [PSCustomObject]@{

    Status = $StatusHealthy
    ConnectedAccount = $GraphContext.Account
    TenantName = $Organization.DisplayName
    TenantId = $Organization.Id
    GraphEnvironment = $GraphContext.Environment
    GraphModules = $GraphModules
    VerifiedDomains = (
        $Domains |
            Where-Object IsVerified |
            Select-Object -ExpandProperty Id
    )

    Notes = @(
        "Microsoft Graph authentication successful."
        "Organization information retrieved."
        "Verified domains retrieved."
        "Environment ready for Microsoft Graph automation."
    )

}

$ConnectionSummary

#endregion