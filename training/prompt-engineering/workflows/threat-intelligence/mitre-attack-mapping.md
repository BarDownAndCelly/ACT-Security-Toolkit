# MITRE ATT&CK Technique Mapping

## Objective

Use AI to assist threat intelligence analysts in mapping observed adversary activity to the MITRE ATT&CK framework and identifying defensive opportunities.

## Scenario

A threat intelligence analyst receives incident data containing authentication anomalies, privilege escalation activity, and data access events. Leadership requests a MITRE ATT&CK-based assessment to better understand adversary behavior.

## Prompt

You are a Senior Threat Intelligence Analyst.

Review the following activity and map observed behaviors to the MITRE ATT&CK framework.

Observed Activity:

* User received phishing email containing malicious link
* Credentials harvested through fake login page
* Attacker authenticated to Microsoft 365 account
* New MFA device enrolled
* Privileged role assigned to compromised account
* Sensitive files downloaded from SharePoint
* Data uploaded to external cloud storage

Provide:

1. Executive Summary
2. Observed Tactics
3. Potential ATT&CK Techniques
4. Attack Progression
5. Detection Opportunities
6. Defensive Recommendations

## Example Output

### Executive Summary

The activity demonstrates a likely identity-focused intrusion that progressed from phishing and credential theft to privilege escalation and data exfiltration.

### Observed Tactics

* Initial Access
* Credential Access
* Persistence
* Privilege Escalation
* Collection
* Exfiltration

### Potential ATT&CK Techniques

* T1566 – Phishing
* T1078 – Valid Accounts
* T1098 – Account Manipulation
* T1068 – Privilege Escalation
* T1213 – Data from Information Repositories
* T1567 – Exfiltration to Cloud Storage

### Attack Progression

1. Phishing email delivered
2. User credentials harvested
3. Account compromise achieved
4. MFA enrollment established persistence
5. Privileged access obtained
6. Sensitive information collected
7. Data exfiltrated to external storage

### Detection Opportunities

* Suspicious authentication activity
* New MFA enrollment events
* Privileged role assignment monitoring
* Unusual SharePoint download activity
* Cloud storage upload detection

### Defensive Recommendations

* Strengthen phishing protections
* Review MFA enrollment controls
* Monitor privileged account changes
* Enhance cloud activity monitoring
* Conduct ATT&CK-based detection gap assessments

## Why AI Helps

AI can rapidly correlate observed activity with ATT&CK tactics and techniques, generate structured assessments, and help analysts identify detection and response opportunities across the attack lifecycle.
