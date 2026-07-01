# Departing Employee Risk Investigation

## Objective

Use AI to assist insider threat investigators in identifying elevated risk associated with departing employees, including intellectual property theft, unauthorized data access, and suspicious data movement prior to separation.

## Scenario

A software engineer submits a resignation notice and is scheduled to leave the organization in two weeks. During routine monitoring, security teams observe increased access to sensitive repositories and unusual file download activity. An investigation is initiated to determine whether the activity represents legitimate transition work or potential insider risk.

## Prompt

You are a Senior Insider Threat Investigator.

Review the following activity and determine whether it indicates elevated insider risk associated with a departing employee.

Employee:

John Smith

Role:

Senior Software Engineer

Observed Activity:

* Employee submitted resignation notice 14 days ago
* Access to source code repositories increased by 350% compared to historical baseline
* Downloaded over 2,500 files within a seven-day period
* Accessed projects outside assigned responsibilities
* Uploaded archive files to personal cloud storage
* Multiple DLP alerts triggered involving sensitive technical documentation
* USB storage device connected to corporate laptop
* Manager reported activity was inconsistent with transition responsibilities

Provide:

1. Executive Summary
2. Risk Rating
3. Indicators of Elevated Insider Risk
4. Alternative Explanations
5. Recommended Investigative Actions
6. Potential Business Risks

## Example Output

### Executive Summary

The activity contains multiple indicators commonly associated with elevated insider risk involving departing employees. Significant increases in file access, access outside assigned responsibilities, personal cloud storage activity, and DLP violations warrant immediate investigation.

### Risk Rating

High

### Indicators of Elevated Insider Risk

* Resignation event
* Significant increase in repository access
* Large-scale file downloads
* Access outside assigned responsibilities
* Personal cloud storage uploads
* Multiple DLP policy violations
* Removable media usage
* Behavioral deviation from historical baseline

### Alternative Explanations

* Knowledge transfer activities
* Approved project transition work
* Backup of authorized work products
* Manager-approved repository access
* Legitimate business need associated with departure planning

### Recommended Investigative Actions

* Review accessed repositories and downloaded content
* Analyze cloud storage activity
* Review DLP alerts and policy matches
* Examine removable media activity
* Validate business justification with management
* Preserve logs and investigative evidence
* Coordinate with Human Resources and Legal teams

### Potential Business Risks

* Intellectual property theft
* Source code exfiltration
* Loss of proprietary business information
* Competitive disadvantage
* Regulatory or contractual violations
* Reputational damage

## Why AI Helps

AI can rapidly correlate resignation events, access patterns, DLP alerts, file activity, and behavioral changes to generate structured investigative assessments. This enables investigators to focus on evidence validation, stakeholder coordination, and risk mitigation while maintaining consistency across insider threat investigations.
