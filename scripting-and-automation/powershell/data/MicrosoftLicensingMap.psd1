#
# -------------------------------------------------------------------------
#
# ACT Security Toolkit
#
# Microsoft Licensing Mapping
#
# This PowerShell data file contains a mapping of common Microsoft
# licensing SKUs to human-readable product names used throughout the
# ACT Security Toolkit.
#
# The purpose of this file is to provide a centralized data source for
# PowerShell scripts that need to translate Microsoft SKU identifiers
# into friendly product names without duplicating lookup tables.
#
# Documentation:
#
#   quick-reference/msft-licensing-mapping.md
#
# -------------------------------------------------------------------------
#
# Author: J Moore
# Project: ACT Security Toolkit
#
# -------------------------------------------------------------------------
#
# Notes
#
# • This file is intended for import using:
#
#       Import-PowerShellDataFile
#
# • Product names should match Microsoft branding whenever practical.
#
# • Additional properties may be added over time (Capabilities,
#   Categories, Service Plans, etc.) without requiring changes to
#   consuming scripts.
#
# -------------------------------------------------------------------------
#

@{

    #
    # Microsoft 365
    #

    SPE_E5 = @{

        Product  = "Microsoft 365 E5"
        Category = "Microsoft 365"

    }

    SPE_E3 = @{

        Product  = "Microsoft 365 E3"
        Category = "Microsoft 365"

    }

    M365_F1 = @{

        Product  = "Microsoft 365 F1"
        Category = "Microsoft 365"

    }

    M365_F3 = @{

        Product  = "Microsoft 365 F3"
        Category = "Microsoft 365"

    }

    #
    # Microsoft Entra
    #

    ENTERPRISEPREMIUM = @{

        Product  = "Microsoft Entra ID P2"
        Category = "Microsoft Entra"

    }

    AAD_PREMIUM = @{

        Product  = "Microsoft Entra ID P1"
        Category = "Microsoft Entra"

    }

    #
    # Enterprise Mobility + Security
    #

    EMSPREMIUM = @{

        Product  = "Enterprise Mobility + Security E5"
        Category = "Enterprise Mobility + Security"

    }

    EMS = @{

        Product  = "Enterprise Mobility + Security E3"
        Category = "Enterprise Mobility + Security"

    }

    #
    # Microsoft Defender
    #

    ATP_ENTERPRISE = @{

        Product  = "Microsoft Defender for Office 365"
        Category = "Microsoft Defender"

    }

    IDENTITY_THREAT_PROTECTION = @{

        Product  = "Microsoft Defender for Identity"
        Category = "Microsoft Defender"

    }

    MDE = @{

        Product  = "Microsoft Defender for Endpoint"
        Category = "Microsoft Defender"

    }

    WIN_DEF_ATP = @{

        Product  = "Microsoft Defender for Endpoint"
        Category = "Microsoft Defender"

    }

    CloudAppSecurity = @{

        Product  = "Microsoft Defender for Cloud Apps"
        Category = "Microsoft Defender"

    }

    #
    # Microsoft Purview
    #

    INFORMATION_PROTECTION_COMPLIANCE = @{

        Product  = "Microsoft Purview Information Protection"
        Category = "Microsoft Purview"

    }

    #
    # Power Platform
    #

    POWER_BI_PRO = @{

        Product  = "Power BI Pro"
        Category = "Power Platform"

    }

    #
    # Microsoft Teams
    #

    MCOMEETADV = @{

        Product  = "Microsoft Teams Audio Conferencing"
        Category = "Microsoft Teams"

    }

}