# Account Compromise Investigation

## Objective

Use AI to assist incident responders in investigating potential account compromise incidents, identifying indicators of unauthorized access, and recommending containment actions.

## Scenario

An employee reports receiving multiple unexpected MFA prompts. Shortly afterward, suspicious activity is observed within the user's Microsoft 365 account.

## Prompt

You are a Senior Incident Responder.

Review the following activity and determine whether it indicates account compromise.

User:

Jane Smith

Observed Activity:

* User reported repeated MFA prompts
* Successful login from unfamiliar IP address
* New MFA device enrolled
* Inbox rules created automatically
* Multiple emails forwarded to an external account
* Login activity occurred outside normal working hours

Provide:

1. Executive Summary
2. Risk Rating
3. Indicators of Compromise
4. Potential Business Impact
5. Recommended Containment Actions
6. Recommended Investigation Steps

## Example Output

### Executive Summary

Evidence suggests a likely account compromise. The account exhibited unauthorized authentication activity, enrollment of a new MFA device, and suspicious email forwarding behavior consistent with post-compromise persistence.

### Risk Rating

High

### Indicators of Compromise

* MFA fatigue activity
* Authentication from unfamiliar locations
* Unauthorized MFA enrollment
* Suspicious inbox rules
* External email forwarding
* After-hours account activity

### Potential Business Impact

An attacker may have gained access to sensitive communications, internal documents, and business information. Additional phishing activity may have originated from the compromised account.

### Recommended Containment Actions

* Disable active sessions
* Reset credentials
* Remove unauthorized MFA devices
* Remove malicious inbox rules
* Block unauthorized forwarding rules
* Increase monitoring for related activity

### Recommended Investigation Steps

* Review authentication logs
* Examine mailbox audit logs
* Identify accessed resources
* Review outbound email activity
* Investigate lateral movement opportunities
* Preserve evidence for incident documentation

## Why AI Helps

AI can quickly summarize authentication events, identify compromise indicators, and generate structured response recommendations, helping responders accelerate investigation and containment efforts.
