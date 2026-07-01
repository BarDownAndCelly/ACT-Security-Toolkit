# Unauthorized Third-Party Access Investigation

## Objective

Use AI to assist investigators in identifying indicators of unauthorized third-party access involving remote employees, contractors, outsourced workers, or undisclosed individuals performing work on behalf of an employee.

## Scenario

A remote employee exhibits unusual authentication, productivity, and endpoint activity. Security leadership requests an investigation to determine whether another individual may be accessing company resources using the employee's credentials or devices.

## Prompt

You are a Senior Fraud and Insider Threat Investigator.

Review the following activity and determine whether it indicates unauthorized third-party access.

Employee:

John Smith

Department:

Software Engineering

Observed Activity:

Observed Activity:

* Employee reports working remotely from Missouri
* Endpoint telemetry identified installation of remote desktop software not approved by IT
* Remote access sessions observed during normal business hours
* Mouse and keyboard activity continued while employee was disconnected from corporate collaboration tools
* Multiple source IP addresses connected to the endpoint through remote administration software
* Source code repository activity occurred during remote access sessions
* Employee could not explain recent development work attributed to their account
* Manager reported inconsistencies between employee performance during meetings and technical work output

Provide:

1. Executive Summary
2. Risk Rating
3. Indicators of Unauthorized Third-Party Access
4. Alternative Explanations
5. Recommended Investigative Actions
6. Potential Business Risks

## Example Output

### Executive Summary

The activity contains multiple indicators consistent with potential unauthorized third-party access. Authentication activity, productivity anomalies, and endpoint evidence suggest another individual may have accessed company resources using the employee's credentials or assigned devices.

### Risk Rating

High

### Indicators of Unauthorized Third-Party Access

* Activity during periods employee reported being unavailable
* Multiple VPN source locations
* Previously unseen endpoint devices
* Significant deviation from historical productivity patterns
* Source code activity inconsistent with reported availability
* Remote administration software present on corporate device

### Alternative Explanations

* Approved travel activity
* Use of multiple corporate devices
* Temporary project deadlines
* Authorized remote administration tools
* Shared development environments

### Recommended Investigative Actions

* Review authentication and VPN logs
* Validate endpoint ownership and registration
* Examine remote administration software usage
* Review source code repository activity
* Conduct employee and manager interviews
* Compare activity against historical behavioral baselines

### Potential Business Risks

* Unauthorized access to corporate resources
* Intellectual property theft
* Data exfiltration
* Regulatory and contractual violations
* Exposure of sensitive customer or business information
* Insider threat and fraud-related activity

## Why AI Helps

AI can rapidly correlate authentication events, endpoint telemetry, productivity patterns, and user behavior to identify indicators of unauthorized access. This allows investigators to focus on evidence validation, stakeholder coordination, and risk assessment while maintaining a consistent investigative methodology.
