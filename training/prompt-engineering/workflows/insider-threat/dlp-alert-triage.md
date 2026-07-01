# Data Loss Prevention (DLP) Alert Triage

## Objective

Use AI to assist analysts in reviewing Data Loss Prevention (DLP) alerts and determining whether activity represents a policy violation, legitimate business activity, or potential data exfiltration.

## Scenario

A DLP alert is generated after an employee emails a spreadsheet containing customer information to an external email address.

## Prompt

You are a Senior DLP Analyst.

Review the following alert and assess the potential risk.

User:

John Smith

Department:

Sales

Alert Details:

* Email sent to external address: [john.personal@gmail.com](mailto:john.personal@gmail.com)
* Attachment: Customer_Contacts_Q2.xlsx
* 1,250 customer records detected
* Data classification: Confidential
* User has not previously sent similar files externally

Provide:

1. Executive Summary
2. Risk Rating
3. Key Findings
4. Potential Business Justifications
5. Recommended Actions

## Example Output

### Executive Summary

A confidential spreadsheet containing customer information was sent to a personal email account. The transfer involved a significant number of customer records and falls outside the user's normal behavior pattern.

### Risk Rating

High

### Key Findings

* External email destination
* Confidential data classification
* Large volume of customer information
* Unusual user behavior

### Potential Business Justifications

* Working remotely without approved access methods
* Attempting to continue work after hours
* Accidental recipient selection

### Recommended Actions

* Contact employee and manager
* Validate business need
* Review similar historical activity
* Confirm whether data was further shared
* Document investigation findings

## Why AI Helps

AI can quickly summarize DLP alerts, identify risk indicators, and suggest investigative paths while helping analysts maintain consistent triage decisions across large alert volumes.
