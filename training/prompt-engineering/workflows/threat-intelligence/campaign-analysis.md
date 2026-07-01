# Threat Campaign Analysis

## Objective

Use AI to assist threat intelligence analysts in assessing cyber threat campaigns, identifying attack patterns, evaluating organizational risk, and recommending defensive actions.

## Scenario

Multiple organizations within the same industry report phishing emails, credential theft attempts, and unauthorized cloud account activity. Security leadership wants to determine whether these events are part of a coordinated campaign.

## Prompt

You are a Senior Threat Intelligence Analyst.

Review the following threat activity and determine whether it represents a coordinated campaign.

Observed Activity:

* Phishing emails impersonating Microsoft login pages
* Credential harvesting websites registered within the past 30 days
* Multiple organizations reporting MFA fatigue attacks
* Compromised accounts used to access cloud resources
* Similar phishing lures observed across several victims
* Increased activity targeting North American organizations

Provide:

1. Executive Summary
2. Campaign Overview
3. Observed Tactics, Techniques, and Procedures (TTPs)
4. Potential Organizational Impact
5. Recommended Defensive Actions
6. Intelligence Gaps

## Example Output

### Executive Summary

The activity appears consistent with a coordinated credential theft campaign targeting enterprise organizations. Multiple victims reported similar phishing infrastructure, attack techniques, and identity-focused attack patterns.

### Campaign Overview

The campaign focuses on obtaining user credentials through phishing and MFA abuse. Successful compromises are leveraged to gain access to cloud environments and sensitive business resources.

### Observed Tactics, Techniques, and Procedures (TTPs)

* Phishing
* Credential harvesting
* MFA fatigue attacks
* Cloud account compromise
* Identity abuse
* Social engineering

### Potential Organizational Impact

Organizations may experience unauthorized access, business email compromise, data exposure, operational disruption, and financial loss.

### Recommended Defensive Actions

* Increase monitoring for suspicious authentications
* Review MFA enrollment activity
* Enhance phishing awareness programs
* Block known malicious infrastructure
* Review conditional access policies

### Intelligence Gaps

* Attribution remains unconfirmed
* Final objectives of the campaign are unknown
* Additional victim organizations may exist
* Further infrastructure analysis is required

## Why AI Helps

AI can rapidly correlate reporting from multiple sources, identify common attack patterns, summarize campaign activity, and generate structured intelligence products that support defensive decision-making.
