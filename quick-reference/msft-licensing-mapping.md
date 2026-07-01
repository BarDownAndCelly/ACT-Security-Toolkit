# Microsoft Licensing Mapping

This reference maps Microsoft licensing to the security capabilities most relevant to Insider Threat programs.

Microsoft licensing can be complex and frequently changes. Rather than documenting every available SKU, this reference focuses on the products, service plans, and capabilities that security engineers are most likely to encounter when working with Microsoft Graph, Microsoft Purview, Microsoft Defender, and Microsoft Entra.

Throughout the ACT Security Toolkit, licensing information is interpreted from an engineering perspective.

Microsoft documentation explains **what** a license includes.

ACT explains **why it matters** to an Insider Threat program.

---

# Microsoft 365

## Microsoft 365 E5

### Common SKU

`SPE_E5`

### Key Capabilities

- Microsoft Purview
- Insider Risk Management
- Data Loss Prevention (DLP)
- Communication Compliance
- eDiscovery (Premium)
- Advanced Audit
- Information Protection
- Sensitivity Labels
- Adaptive Protection
- Microsoft Defender XDR (depending on tenant configuration)
- Microsoft Entra ID P2

### ACT Notes

Microsoft 365 E5 is the primary licensing tier for organizations building a mature Insider Threat program within the Microsoft ecosystem.

Many capabilities demonstrated throughout the ACT Security Toolkit assume Microsoft 365 E5 licensing or equivalent licensing through standalone products.

---

## Microsoft 365 E3

### Common SKU

`SPE_E3`

### Key Capabilities

- Core Microsoft Purview
- Standard Data Loss Prevention
- Retention
- Sensitivity Labels (basic)
- Standard Audit
- Microsoft Graph

### ACT Notes

Microsoft 365 E3 provides a solid security foundation but lacks many advanced Insider Threat capabilities such as Insider Risk Management, Communication Compliance, Advanced Audit, and Adaptive Protection.

---

# Microsoft Entra

## Microsoft Entra ID P1

### Common SKU

`AAD_PREMIUM`

### Key Capabilities

- Conditional Access
- Dynamic Groups
- Self-Service Password Reset
- Basic Identity Governance

### ACT Notes

Provides foundational identity security features commonly used alongside Microsoft Purview.

---

## Microsoft Entra ID P2

### Common SKU

`ENTERPRISEPREMIUM`

### Key Capabilities

- Identity Protection
- Privileged Identity Management (PIM)
- Risk-based Conditional Access
- Access Reviews
- Entitlement Management

### ACT Notes

Strongly recommended for organizations implementing mature Insider Threat programs due to its advanced identity protection capabilities.

---

# Microsoft Purview

## Microsoft Purview

### Key Capabilities

- Insider Risk Management
- Data Loss Prevention
- Information Protection
- Records Management
- Communication Compliance
- eDiscovery
- Data Lifecycle Management

### ACT Notes

Purview serves as the primary Microsoft platform for Insider Threat, data governance, and compliance.

---

# Microsoft Defender

## Microsoft Defender XDR

### Key Capabilities

- Unified security incidents
- Cross-domain investigation
- Threat correlation
- Endpoint telemetry
- Identity telemetry
- Email telemetry
- Cloud application telemetry

### ACT Notes

Defender XDR significantly enhances Insider Threat investigations by providing additional context and telemetry that can be correlated with Microsoft Purview.

---

## Microsoft Defender for Endpoint

### Common SKU

`MDE`

### Key Capabilities

- Endpoint Detection and Response (EDR)
- Device Inventory
- Threat & Vulnerability Management
- Device Timeline

### ACT Notes

Provides endpoint telemetry that is frequently valuable during Insider Threat investigations.

---

## Microsoft Defender for Identity

### Common SKU

`MDI`

### Key Capabilities

- Identity attack detection
- Lateral movement detection
- Credential theft detection
- Identity investigation

### ACT Notes

Adds valuable identity telemetry that complements Insider Risk investigations.

---

## Microsoft Defender for Office 365

### Common SKU

`ATP_ENTERPRISE`

### Key Capabilities

- Safe Links
- Safe Attachments
- Email Threat Investigation
- Attack Simulation

### ACT Notes

Provides email security telemetry that can support Insider Threat investigations involving phishing, exfiltration, or suspicious communications.

---

## Microsoft Defender for Cloud Apps

### Common SKU

`CloudAppSecurity`

### Key Capabilities

- Shadow IT discovery
- OAuth application governance
- Cloud application monitoring
- Session controls

### ACT Notes

Useful for identifying risky cloud application usage and unsanctioned data movement.

---

# Microsoft Graph

## Microsoft Graph

### Licensing

Included with Microsoft 365.

### Key Capabilities

- Directory management
- User management
- Group management
- Security integrations
- Microsoft API access

### ACT Notes

Microsoft Graph serves as the primary API used throughout the ACT Security Toolkit.

---

# Advanced Security Capabilities

| Capability | Typical Licensing |
|------------|-------------------|
| Insider Risk Management | Microsoft 365 E5 or equivalent |
| Data Loss Prevention | Microsoft 365 E3/E5 |
| Communication Compliance | Microsoft 365 E5 |
| Adaptive Protection | Microsoft 365 E5 |
| eDiscovery (Premium) | Microsoft 365 E5 |
| Advanced Audit | Microsoft 365 E5 |
| Information Protection | Microsoft 365 E3/E5 |
| Sensitivity Labels | Microsoft 365 E3/E5 |
| Privileged Identity Management | Entra ID P2 |
| Identity Protection | Entra ID P2 |

---

# Engineering Considerations

Licensing changes over time.

Microsoft frequently renames products, introduces new service plans, and modifies licensing requirements. Before making licensing decisions, always verify current Microsoft documentation.

The ACT Security Toolkit uses this reference to interpret Microsoft licensing from the perspective of an Insider Threat engineer.

The goal is not simply to identify which licenses a tenant owns, but to understand what operational capabilities those licenses enable and how they support building, operating, and maturing an Insider Threat program.