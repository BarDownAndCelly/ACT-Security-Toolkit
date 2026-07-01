# DPRK Remote Worker Investigation

## Objective

Use AI to assist fraud, insider threat, and threat intelligence teams in identifying indicators associated with DPRK-linked remote worker operations, employment fraud, intellectual property theft, and unauthorized access to corporate resources.

## Scenario

A newly hired remote software engineer has attracted attention from Security, Human Resources, and Engineering leadership following several identity verification concerns and unusual access patterns. Investigators are evaluating whether the activity may be consistent with known DPRK remote worker methodologies.

## Prompt

You are a Senior Fraud, Insider Threat, and Threat Intelligence Investigator.

Review the following activity and determine whether it may indicate a DPRK-linked remote worker operation.

Employee:

Michael Johnson

Role:

Senior Software Engineer

Observed Activity:

* Company-issued laptop was shipped to a residential address that differed from the employee's documented location
* Endpoint telemetry identified AnyDesk and remote administration activity within 24 hours of device activation
* Multiple external IP addresses connected to the endpoint through remote access software
* Authentication activity originated from VPN and proxy infrastructure associated with multiple geographic locations
* Employee repeatedly declined live video verification requests citing technical issues
* Source code repositories unrelated to assigned projects were accessed
* Large-scale cloning of internal repositories occurred during the first 60 days of employment
* Payroll direct deposit information was modified three times within six months
* Employee demonstrated strong interview performance but was unable to explain recent technical contributions during follow-up reviews
* Endpoint activity suggested multiple operators interacting with the device during normal business hours

Provide:

1. Executive Summary
2. Risk Rating
3. DPRK-Associated Indicators
4. Alternative Explanations
5. Recommended Investigative Actions
6. Potential Business Risks

## Example Output

### Executive Summary

The activity contains multiple indicators consistent with known DPRK remote worker methodologies. Evidence suggests potential identity deception, remote access facilitation, source code targeting, and possible unauthorized access by multiple operators. Immediate investigation is recommended to determine the scope of activity and potential business impact.

### Risk Rating

Critical

### DPRK-Associated Indicators

* Remote administration software installed on corporate assets
* Multiple operators accessing a single endpoint
* Device shipment and custody anomalies
* Repeated avoidance of live identity verification
* Use of VPN or proxy infrastructure to obscure location
* Excessive source code access outside assigned responsibilities
* Large-scale repository cloning activity
* Payroll account modification anomalies
* Interview-to-performance discrepancies
* Authentication activity inconsistent with employee-provided information

### Alternative Explanations

* Legitimate remote administration software usage
* Approved travel activity
* Technical difficulties during video meetings
* Authorized access to multiple repositories
* Payroll corrections or administrative updates
* Shared development environments

### Recommended Investigative Actions

* Conduct enhanced identity verification procedures
* Review endpoint telemetry and remote administration activity
* Validate device custody and shipping records
* Review source code repository access and cloning activity
* Analyze authentication, VPN, and proxy usage logs
* Coordinate with Human Resources, Legal, and Engineering leadership
* Assess potential intellectual property exposure
* Review payroll and employment documentation

### Potential Business Risks

* Intellectual property theft
* Source code exfiltration
* Exposure of sensitive business information
* Unauthorized access to critical systems
* Supply chain compromise
* Fraudulent employment activity
* Regulatory and contractual violations
* Reputational damage

## Why AI Helps

AI can rapidly correlate authentication activity, endpoint telemetry, repository access, identity verification concerns, and behavioral indicators to generate structured investigative assessments. This enables investigators to focus on evidence validation, stakeholder coordination, and risk management while maintaining a consistent investigative methodology.
