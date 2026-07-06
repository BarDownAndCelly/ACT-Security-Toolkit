# ACT Security Toolkit

### Augmented Cognition Technologies
### *Human Experience. AI Amplified.*

The **ACT Security Toolkit** is an open-source collection of tools, prompts, automations, and practical guidance designed to help security professionals **build, operate, and mature Insider Threat programs**.
Built from real-world experience engineering Insider Threat capabilities, this toolkit focuses on applying modern AI, Microsoft security technologies, and automation to reduce repetitive work, improve consistency, and accelerate investigations—while keeping human expertise at the center of every decision.
Although Insider Threat is the primary focus, the toolkit also includes resources for Microsoft Graph, Microsoft Purview, PowerShell, Python, prompt engineering, reporting, and defensive security engineering.
This project is intended for security analysts, Insider Threat investigators, Microsoft security administrators, engineers, architects, and leaders looking to responsibly integrate AI into modern security operations.

---

# Vision

The ACT Security Toolkit aims to become the definitive open-source resource for building, operating, and maturing Insider Threat programs.
By combining practical engineering, Microsoft security technologies, automation, and responsible use of artificial intelligence, the toolkit helps organizations reduce operational overhead, improve investigative consistency, and strengthen Insider Threat capabilities.
Whether you're:

- Learning what an Insider Threat program is
- Building your first program
- Expanding an existing capability
- Administering Microsoft Purview
- Automating repetitive workflows
- Exploring responsible uses of AI in security

the ACT Security Toolkit provides practical, real-world resources that can immediately improve Insider Threat operations.

---

# Project Goals

The ACT Security Toolkit aims to:

- Help organizations build and mature Insider Threat programs
- Demonstrate practical uses of AI throughout the investigative lifecycle
- Simplify Microsoft Purview administration and reporting
- Provide reusable Microsoft Graph, PowerShell, and Python automation
- Teach prompt engineering through realistic security scenarios
- Share engineering practices used by modern security teams
- Create an open educational resource for AI-assisted Insider Threat operations

---

# Core Focus Areas

## Insider Threat

- Program development
- Investigative workflows
- Risk indicators
- Behavioral analysis
- Case management
- Reporting
- Operational maturity

## Microsoft Purview

- Insider Risk Management
- Data Loss Prevention (DLP)
- Sensitivity Labels
- Sensitive Information Types
- Adaptive Protection
- Communication Compliance
- Audit
- Configuration reporting

## Microsoft Graph

- Environment discovery
- Identity reporting
- User and group administration
- Licensing insights
- Automation

## Security Automation

- PowerShell
- Python
- Reporting
- Configuration management
- Workflow automation

## AI & Prompt Engineering

- Zero-Shot Prompting
- One-Shot Prompting
- Few-Shot Prompting
- Chain-of-Thought Prompting
- Prompt Templates
- Investigation workflows
- AI-assisted reporting
- AI-assisted documentation

---

# Repository Structure

```text
docs/

quick-reference/

training/
├── prompt-engineering/
└── insider-threat-fundamentals/

scripting-and-automation/
├── powershell/
│   ├── data/
│   ├── Get-MicrosoftGraphEnvironment.ps1
│   ├── Get-MicrosoftGraphLicensing.ps1
│   ├── Get-PurviewEnvironment.ps1
│   ├── Get-PurviewConfiguration.ps1
│   ├── Get-DlpPolicies.ps1
│   ├── Get-SensitivityLabels.ps1
│   └── ...
└── python/

use-cases/
├── Insider Threat/
├── Incident Response/
├── Microsoft 365/
├── RemoteWorkers/
├── Reporting/
└── ThreatIntel/
```

---


# Roadmap

The ACT Security Toolkit is actively expanding.

Planned content includes:

## Insider Threat

- Program maturity guidance
- Investigation playbooks
- AI-assisted investigations
- Risk scoring concepts
- Reporting templates
- Metrics and KPIs
- Executive dashboards

## Microsoft Graph

- Environment discovery
- Identity reporting
- User administration
- Group administration
- Licensing insights

## Microsoft Purview

- Environment discovery
- Configuration reporting
- Health assessments
- Policy exports
- Backup automation

## Insider Risk Management

- Policy reporting
- Indicator reporting
- Alert triage
- Investigation automation

## Data Loss Prevention

- Policy reporting
- Rule exports
- Configuration auditing

## Security Automation

- PowerShell toolkit
- Python toolkit
- Reporting automation
- Investigation automation

## Artificial Intelligence

- Prompt engineering
- AI investigation playbooks
- AI-assisted report writing
- AI-assisted policy review
- AI agents
- MCP integrations
- Insider Threat copilots

---

# Guiding Principles

The ACT Security Toolkit is built around five core principles.

## Human-First Security

AI augments defenders—it does not replace them.

Human judgment, investigative integrity, and critical thinking always remain the final authority.

## Practical Engineering

Every prompt, script, and workflow should solve a real operational problem.

Theory is valuable, but practical implementation is the goal.

## Secure by Design

The toolkit emphasizes least privilege, defensive engineering, secure coding practices, and responsible AI usage.

## Open Education

Knowledge should be shared.

The ACT Security Toolkit exists to help security professionals learn, build, improve, and contribute.

## Continuous Improvement

Insider Threat programs mature over time.

This toolkit is designed to grow alongside them.

---

# Why AI?

Security professionals spend a significant amount of time performing repetitive tasks such as:

- Reviewing telemetry
- Writing reports
- Summarizing investigations
- Classifying alerts
- Reviewing Microsoft Purview data
- Preparing executive briefings
- Creating investigation documentation

Artificial intelligence has the potential to dramatically reduce that overhead.

Rather than replacing investigators, AI enables security professionals to spend more time analyzing evidence, identifying risk, making informed decisions, and improving program maturity.

The ACT Security Toolkit explores practical, responsible, and defensible ways to integrate AI into Insider Threat and Microsoft security workflows.

As the project evolves, AI will become increasingly integrated throughout the toolkit—not as a replacement for human expertise, but as a trusted force multiplier for security professionals.

---

# Project Status

🚧 **Actively Under Development**

The ACT Security Toolkit is in active development.

New prompt engineering examples, automation scripts, Microsoft Graph tooling, Microsoft Purview resources, Insider Threat playbooks, AI agents, reporting capabilities, and engineering guidance will continue to be added as the project evolves.

Contributions, suggestions, discussions, and constructive feedback are always welcome.

---

# Disclaimer

The prompts, scripts, workflows, examples, and guidance contained within this repository are provided for educational and defensive cybersecurity purposes.

They are intended to demonstrate AI-assisted Insider Threat operations, Microsoft security engineering, prompt engineering, and automation techniques—not to replace professional judgment, organizational policy, legal guidance, or established investigative procedures.

Before using AI within any security environment:

- **Validate all inputs.** Never provide sensitive, regulated, proprietary, or otherwise protected information to an AI service unless authorized by your organization.

- **Validate all outputs.** AI-generated content may contain inaccuracies, omissions, or hallucinations. Always independently verify recommendations, code, investigative findings, and technical conclusions.

- **Preserve investigative integrity.** AI can assist with analysis, documentation, summarization, and hypothesis generation, but investigators remain responsible for evidence preservation, chain of custody, investigative documentation, and validating findings using independently verified evidence.

---

> **Human Experience. AI Amplified.**
>
> Building better Insider Threat programs—one investigation, one automation, and one prompt at a time.
