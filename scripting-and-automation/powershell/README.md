# PowerShell Scripting and Automation

PowerShell is the primary automation language for the Microsoft ecosystem and remains one of the most valuable tools available to security engineers.

Within the ACT Security Toolkit, PowerShell is used to automate repetitive administrative tasks, validate Microsoft security configurations, accelerate Insider Threat operations, and build reusable engineering solutions that reduce operational overhead.

These scripts are designed to support organizations building and maturing Insider Threat programs through Microsoft Graph, Microsoft Purview, Microsoft Defender, Microsoft Entra ID, Exchange Online, and other Microsoft security technologies.

The objective is simple:

**Write automation that security engineers understand, trust, and can confidently adapt to their own environments.**

---

# Engineering Philosophy

Good automation should make security operations easier—not more confusing.

Every script in this repository is written with the same engineering principles.

- Read-only by default
- Least privilege
- Secure by design
- Production-quality code
- Practical over theoretical
- Modular and reusable
- Transparent and understandable

Automation should reduce repetitive work while remaining maintainable, predictable, and easy to audit.

---

# Getting Started

If you're new to the ACT Security Toolkit, begin here.

## Get-MicrosoftGraphEnvironment.ps1 ✅

This script validates that your environment is ready for Microsoft Graph automation used throughout the toolkit.

It verifies:

- Required Microsoft Graph PowerShell modules
- Microsoft Graph authentication
- Tenant connectivity
- Organization information
- Verified domains

This script establishes the baseline connectivity required before using many of the Microsoft Graph and Microsoft Purview scripts contained within this repository.

---

# Planned Scripts

## Microsoft Graph

- ✅ Get-MicrosoftGraphEnvironment.ps1
- ✅ Get-MicrosoftGraphLicensing.ps1
- Get-MicrosoftGraphUsers.ps1
- Get-MicrosoftGraphGroups.ps1

## Microsoft Purview

- Get-PurviewEnvironment.ps1
- Get-PurviewConfiguration.ps1
- Export-PurviewConfiguration.ps1

## Data Loss Prevention (DLP)

- Get-DlpPolicies.ps1
- Get-DlpRules.ps1
- Export-DlpPolicies.ps1

## Insider Risk Management

- Get-InsiderRiskSettings.ps1
- Get-InsiderRiskPolicies.ps1
- Get-InsiderRiskIndicators.ps1

## Sensitivity Labels

- Get-SensitivityLabels.ps1
- Get-LabelPolicies.ps1

## Sensitive Information Types

- Get-SensitiveInformationTypes.ps1
- Export-SensitiveInformationTypes.ps1

## Adaptive Protection

- Get-AdaptiveProtectionSettings.ps1

## Communication Compliance

- Get-CommunicationCompliancePolicies.ps1

## Audit

- Get-UnifiedAuditConfiguration.ps1
- Search-UnifiedAuditLog.ps1

## Reporting

- Export-PurviewHealthReport.ps1
- Export-PurviewConfigurationReport.ps1

---

# PowerShell Standards

Every PowerShell script in the ACT Security Toolkit follows a consistent engineering standard.

Scripts are expected to include:

- Approved PowerShell verbs
- Complete comment-based help
- Version history
- Strict mode
- Parameter validation
- Robust error handling
- Verbose logging
- Consistent formatting
- Modular, reusable functions
- Practical examples
- Production-ready code

Whenever practical, scripts should return structured PowerShell objects instead of formatted text, allowing them to integrate naturally into larger automation workflows and be consumed by other scripts.

---

# Safety First

Unless explicitly documented otherwise, scripts in this repository are intentionally non-invasive.

By default, they do **not**:

- Install software
- Modify Microsoft 365 configurations
- Create or delete resources
- Change security policies
- Make tenant-wide administrative changes

Their primary purpose is to:

- Validate environments
- Collect configuration information
- Generate reports
- Export configurations
- Help security engineers make informed decisions

Scripts that modify tenant configuration will be clearly documented and include appropriate safeguards.

---

# Engineering Mindset

These scripts are shared to help other security engineers spend less time reinventing the wheel and more time solving problems.

Don't blindly trust code because you found it on GitHub—including mine.

Read it.

Understand it.

Test it.

Adapt it to your environment.

Every organization is different, and every engineer is ultimately responsible for understanding the tools they choose to use.

My goal isn't to give you a black box.

It's to give you the head start that I wish I'd had.

---

# Future Direction

PowerShell is one of the foundational technologies of the ACT Security Toolkit.

As the toolkit grows, these scripts will increasingly integrate with AI to reduce repetitive administrative work while keeping engineers and investigators firmly in control.

Future capabilities include:

- AI-assisted reporting
- AI-generated documentation
- Configuration analysis
- Policy comparison
- Investigation support
- Executive summaries
- AI agents
- Microsoft Graph integrations
- Microsoft Purview automation

AI is another tool available to security professionals.

Like every major technological advancement before it, its value depends entirely on how thoughtfully it is used.

---

> **Human Experience. AI Amplified.**
>
> Practical engineering, Microsoft security automation, and real-world lessons learned to help organizations build, operate, and mature Insider Threat programs.
