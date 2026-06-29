# PowerShell Automation

PowerShell remains the primary automation language for Microsoft security administration and enterprise environments.

This section provides reusable scripts focused on Microsoft Purview, Microsoft Graph, Microsoft Defender, Entra ID, Exchange Online, and Microsoft 365 security administration.

The goal is to demonstrate production-quality scripting that security engineers can adapt to their own environments.

---

## Tentative Roadmap

### Microsoft Graph

* Get-MicrosoftGraphEnvironment.ps1 -Complete
* Get-MicrosoftGraphLicensing.ps1
* Get-MicrosoftGraphUsers.ps1
* Get-MicrosoftGraphGroups.ps1

### Microsoft Purview

* Get-PurviewEnvironment.ps1
* Get-PurviewConfiguration.ps1
* Export-PurviewConfiguration.ps1

### Data Loss Prevention (DLP)

* Get-DlpPolicies.ps1
* Get-DlpRules.ps1
* Export-DlpPolicies.ps1

### Insider Risk Management

* Get-InsiderRiskSettings.ps1
* Get-InsiderRiskPolicies.ps1
* Get-InsiderRiskIndicators.ps1

### Sensitivity Labels

* Get-SensitivityLabels.ps1
* Get-LabelPolicies.ps1

### Sensitive Information Types

* Get-SensitiveInformationTypes.ps1
* Export-SensitiveInformationTypes.ps1

### Adaptive Protection

* Get-AdaptiveProtectionSettings.ps1

### Communication Compliance

* Get-CommunicationCompliancePolicies.ps1

### Audit

* Get-UnifiedAuditConfiguration.ps1
* Search-UnifiedAuditLog.ps1

### Reporting

* Export-PurviewHealthReport.ps1
* Export-PurviewConfigurationReport.ps1

---

## Script Standards

Every PowerShell script in this repository is designed to include:

* Comment-based help
* Parameter validation
* Error handling
* Verbose logging
* Production-quality formatting
* Reusable functions
* Practical examples

---

## Safety First

Scripts in this repository are intentionally non-invasive by default. Unless explicitly documented otherwise, they do not install software, modify configurations, create or delete resources, or make changes to Microsoft 365 environments. Their primary purpose is to collect information, validate configurations, and assist security professionals in making informed decisions.

---

## Future Direction

As the repository evolves, PowerShell automation will become the foundation for AI-assisted administration, allowing LLMs and AI agents to interact with Microsoft security technologies through structured, repeatable workflows.
