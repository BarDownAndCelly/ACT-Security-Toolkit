# Credential Sharing Investigation

## Objective

Use AI to assist investigators in identifying and assessing potential credential sharing activity involving employees, contractors, or unauthorized individuals.

## Scenario

A remote employee's account exhibits authentication activity from multiple devices and geographic locations that are inconsistent with normal user behavior. Security leadership requests an investigation to determine whether credentials are being shared.

## Prompt

You are a Senior Fraud and Insider Threat Investigator.

Review the following activity and determine whether it indicates potential credential sharing.

Employee:

John Smith

Department:

Software Engineering

Observed Activity:

* Successful VPN login from Missouri at 8:02 AM
* Successful VPN login from Texas at 8:17 AM
* Two different endpoint devices authenticated within 20 minutes
* Multiple active sessions observed simultaneously
* MFA approvals occurred from different mobile devices
* User reported working from home in Missouri

Provide:

1. Executive Summary
2. Risk Rating
3. Indicators of Credential Sharing
4. Alternative Explanations
5. Recommended Investigative Actions
6. Potential Business Risks

## Example Output

### Executive Summary

The activity contains multiple indicators consistent with potential credential sharing. Simultaneous sessions, geographically inconsistent authentications, and MFA activity from multiple devices warrant further investigation.

### Risk Rating

High

### Indicators of Credential Sharing

* Simultaneous active sessions
* Authentication activity from geographically distant locations
* Multiple endpoint devices in use
* MFA approvals from different devices
* User activity inconsistent with stated location

### Alternative Explanations

* Corporate VPN routing anomalies
* Approved use of multiple company devices
* Business travel
* Virtual desktop or remote access solutions
* Shared administrative accounts

### Recommended Investigative Actions

* Review authentication and VPN logs
* Validate device ownership and registration
* Review MFA enrollment history
* Confirm employee location and travel records
* Interview employee and manager
* Review historical authentication patterns

### Potential Business Risks

* Unauthorized access to company resources
* Data exposure or exfiltration
* Violation of employment agreements
* Intellectual property theft
* Regulatory or contractual compliance concerns

## Why AI Helps

AI can rapidly identify behavioral anomalies, summarize authentication activity, and generate structured investigative recommendations while ensuring investigators consider both suspicious indicators and legitimate explanations before reaching conclusions.
