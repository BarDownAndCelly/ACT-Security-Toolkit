# Ransomware Investigation

## Objective

Use AI to assist incident responders in analyzing ransomware incidents, identifying key indicators, assessing business impact, and recommending response actions.

## Scenario

A user reports that files on their workstation have become inaccessible and now contain a ".locked" extension. Multiple systems begin generating similar reports within a short period.

## Prompt

You are a Senior Incident Responder.

Review the following incident details and assess the ransomware event.

Incident Details:

* Initial report received at 09:12 AM
* User opened an email attachment labeled "Invoice_2025.zip"
* PowerShell execution detected shortly afterward
* Multiple outbound connections to unknown external IP addresses
* 23 workstations impacted
* Files renamed with ".locked" extension
* Ransom note discovered on affected systems
* Backup systems remain operational

Provide:

1. Executive Summary
2. Risk Rating
3. Indicators of Compromise (IOCs)
4. Business Impact
5. Recommended Containment Actions
6. Recommended Recovery Actions

## Example Output

### Executive Summary

A ransomware incident impacted 23 workstations following the execution of a malicious email attachment. The attack resulted in file encryption across multiple endpoints, but backup infrastructure remained unaffected.

### Risk Rating

Critical

### Indicators of Compromise (IOCs)

* Malicious ZIP attachment
* PowerShell execution
* Suspicious outbound network connections
* File extension changes to ".locked"
* Presence of ransom notes

### Business Impact

The incident disrupted user productivity and temporarily affected business operations. No evidence currently indicates backup compromise, improving recovery prospects.

### Recommended Containment Actions

* Isolate affected systems immediately
* Block identified malicious IP addresses
* Disable compromised accounts if applicable
* Preserve forensic evidence
* Increase monitoring across the environment

### Recommended Recovery Actions

* Validate backup integrity
* Restore impacted systems from clean backups
* Remove malicious artifacts
* Reset affected credentials
* Conduct post-incident review

## Why AI Helps

AI can rapidly summarize ransomware incidents, identify critical indicators, prioritize response actions, and generate consistent reporting for both technical teams and leadership during high-pressure situations.
