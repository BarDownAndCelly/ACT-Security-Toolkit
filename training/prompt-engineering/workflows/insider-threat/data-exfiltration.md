# Insider Threat Investigation

## Objective

Use AI to assist analysts in reviewing potential insider threat events, identifying key risk indicators, and generating investigation summaries.

## Scenario

An employee scheduled for termination copied a large number of files to removable media shortly before their departure.

## Prompt

You are a Senior Insider Threat Analyst.

Review the following activity and determine whether it represents potential malicious insider behavior.

Employee:

John Smith

Department:

Finance

Termination Date:

2025-06-15

Observed Activity:

* 2025-06-14 16:22:11 - USB device connected
* 2025-06-14 16:25:44 - 1,247 files copied to USB device
* 2025-06-14 16:31:10 - USB device disconnected
* 2025-06-14 16:45:02 - User accessed compensation spreadsheets
* 2025-06-14 17:02:15 - User logged off

Provide:

1. Executive Summary
2. Risk Rating
3. Behavioral Indicators
4. Recommended Investigative Actions

## Example Output

### Executive Summary

The employee transferred a significant volume of files to removable media less than 24 hours before termination. Additional access to sensitive compensation data increases concern for potential data exfiltration.

### Risk Rating

High

### Behavioral Indicators

* Large file transfer to USB device
* Activity occurred immediately before termination
* Access to potentially sensitive business information
* Use of removable media

### Recommended Investigative Actions

* Review file names and classifications
* Validate business justification
* Preserve endpoint evidence
* Review email and cloud transfer activity
* Conduct management interview

## Why AI Helps

AI can rapidly summarize activity, identify risk indicators, and provide consistent investigative recommendations while reducing analyst workload.
