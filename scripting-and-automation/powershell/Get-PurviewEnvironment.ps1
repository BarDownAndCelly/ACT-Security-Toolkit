#
# ACT Script Purpose
#
# Answers:
#
#   • Can I successfully connect to Microsoft Purview?
#
#   • Is my PowerShell environment ready for Microsoft
#     Purview administration?
#
#   • Can subsequent ACT Purview automation execute successfully?
#

<#
.SYNOPSIS
    Validates the Microsoft Purview PowerShell environment for the
    ACT Security Toolkit.

.DESCRIPTION
    This script verifies that the required PowerShell modules are
    installed, establishes a connection to Microsoft Purview, and
    validates that the PowerShell session is capable of administering
    core Microsoft Purview workloads.

    This script is intended to be the first Microsoft Purview script
    executed before using other Purview automation contained within
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
    1.0.0

.EXAMPLE
    ./Get-PurviewEnvironment.ps1 -Verbose
#>

#Requires -Version 7.4

[CmdletBinding()]
[CmdletBinding()]
param(

    [switch]$PassThru

)

Set-StrictMode -Version Latest

#region Version History

# -------------------------------------------------------------------------
# Version History
#
# Version  Date         Author     Notes
# -------  ----------   --------   -----------------------------------------
# 1.0.0    2026-07-03   J Moore    Initial release.
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

function Test-PurviewModules {

    [CmdletBinding()]
    param ()

    Write-Verbose "Checking required PowerShell modules..."

    $RequiredModules = @(
        "ExchangeOnlineManagement"
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

function Connect-Purview {

    [CmdletBinding()]
    param(
    [switch]$PassThru

)

    Write-Verbose "Checking Microsoft Purview connection..."

    try {

        Connect-IPPSSession `
            -ShowBanner:$false `
            -ErrorAction Stop | Out-Null

    }
    catch {

        throw @"
Failed to establish a Microsoft Purview PowerShell session.

$($_.Exception.Message)
"@

    }

}

function Test-PurviewCapabilities {

    [CmdletBinding()]
    param ()

    Write-Verbose "Validating Microsoft Purview capabilities..."

    $RequiredCmdlets = @(
        "Get-DlpCompliancePolicy"
        "Get-Label"
        "Get-RetentionCompliancePolicy"
    )

    $Results = foreach ($Cmdlet in $RequiredCmdlets) {

        $Available = [bool](Get-Command $Cmdlet -ErrorAction SilentlyContinue)

        [PSCustomObject]@{

            Name      = $Cmdlet

            Available = $Available

        }

    }

    $Missing = $Results | Where-Object { -not $_.Available }

    if ($Missing) {

        throw @"
One or more required Microsoft Purview cmdlets are unavailable.

Missing Cmdlets:

$($Missing.Name -join "`n")
"@

    }

    return $Results

}

function Show-PurviewEnvironmentSummary {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory)]
        $Modules,

        [Parameter(Mandatory)]
        $Capabilities

    )

    Write-Host ""
    Write-Host "Microsoft Purview Environment Summary"
    Write-Host "====================================="
    Write-Host ""

    Write-Host "Status : Healthy"

    Write-Host ""
    Write-Host "Required Modules"
    Write-Host "----------------"
    Write-Host ""

    $Modules |
        Format-Table Name, Version -AutoSize

    Write-Host ""
    Write-Host "Validated Capabilities"
    Write-Host "----------------------"
    Write-Host ""

    foreach ($Capability in $Capabilities) {

        Write-Host ("  ✓ {0}" -f $Capability.Name)

    }

    Write-Host ""
    Write-Host "Recommendations"
    Write-Host "---------------"

    Write-Host "  ✓ Microsoft Purview PowerShell session established."
    Write-Host "  ✓ Core Microsoft Purview cmdlets are available."
    Write-Host "  ✓ Continue with Get-PurviewConfiguration.ps1."

}

#region Main

Write-Verbose "Starting Microsoft Purview environment validation..."

$Modules = Test-PurviewModules

Connect-Purview

$Capabilities = Test-PurviewCapabilities

Show-PurviewEnvironmentSummary `
    -Modules $Modules `
    -Capabilities $Capabilities

$Results = [PSCustomObject]@{

    Status = "Healthy"

    Connected = $true

    Modules = $Modules

    Capabilities = $Capabilities

    Notes = @(
        "Microsoft Purview PowerShell session established."
        "Required Microsoft Purview cmdlets validated."
        "Environment ready for ACT Microsoft Purview automation."
    )

}

if ($PassThru) {
    return $Results
}

$Results

#endregion