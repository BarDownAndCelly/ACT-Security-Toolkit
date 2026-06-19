# Remote Worker Fraud Investigation

## Objective

Use AI to assist investigators in identifying indicators of remote worker fraud, unauthorized third-party access, and employment-related deception.

## Scenario

A fully remote employee begins exhibiting unusual access patterns. Investigation reveals activity occurring from multiple geographic locations and systems inconsistent with the employee's known work environment.

## Prompt

You are a Senior Fraud and Insider Threat Investigator.

Review the following activity and determine whether it may indicate remote worker fraud or unauthorized third-party access.

Employee:

John Smith

Department:

Software Engineering

Observed Activity:

* User authenticated from Missouri at 8:03 AM
* User authenticated from Virginia at 8:47 AM
* VPN sessions originated from multiple IP addresses within the same workday
* Endpoint telemetry shows connections from previously unseen devices
* User productivity metrics increased significantly over a two-week period
* Multiple code commits occurred during periods the employee reported being unavailable

Provide:

1. Executive Summary
2. Risk Rating
3. Fraud Indicators
4. Alternative Explanations
5. Recommended Investigative Actions

## Example Output

### Executive Summary

The activity contains multiple indicators associated with potential remote worker fraud or unauthorized third-party access. Geographic inconsistencies, multiple device usage, and unusual productivity patterns warrant further investigation.

### Risk Rating

High

### Fraud Indicators

* Multiple geographic locations within an implausible timeframe
* Multiple VPN source IP addresses
* Previously unseen devices
* Activity occurring while employee reported being unavailable
* Significant deviation from established behavior patterns

### Alternative Explanations

* Corporate VPN routing changes
* Approved travel
* Use of multiple company-issued devices
* Shared development environments
* Legitimate project deadlines increasing productivity

### Recommended Investigative Actions

* Validate employee travel records
* Review endpoint ownership and registration
* Examine authentication logs and MFA activity
* Conduct manager and employee interviews
* Review historical access patterns
* Determine whether unauthorized individuals had access to company resources

## Why AI Helps

AI can quickly identify behavioral anomalies, summarize evidence, and provide investigators with a structured starting point while ensuring both suspicious indicators and legitimate explanations are considered.
