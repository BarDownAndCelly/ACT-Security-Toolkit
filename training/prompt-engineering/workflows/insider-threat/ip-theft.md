# Microsoft Purview Investigation: Intellectual Property Theft

## Objective

Use AI to assist investigators in reviewing Microsoft Purview Insider Risk alerts associated with potential intellectual property theft and unauthorized data movement.

## Scenario

A software engineer recently accepted a position with a competitor. During the final two weeks of employment, multiple Microsoft Purview alerts were generated involving source code repositories, cloud storage uploads, and unusual file access activity.

## Prompt

You are a Senior Insider Risk Analyst specializing in Microsoft Purview.

Review the following activity and assess the risk of intellectual property theft.

Employee:

Jane Doe

Department:

Engineering

Recent Activity:

* Downloaded 4,200 files from engineering SharePoint sites
* Accessed source code repositories outside normal working hours
* Uploaded compressed archive files to a personal cloud storage account
* Downloaded technical design documentation not previously accessed
* Submitted resignation notice seven days earlier

Purview Indicators:

* Data Exfiltration Indicator
* Unusual Volume of Downloads
* Departing User Indicator
* Sensitive Information Access

Provide:

1. Executive Summary
2. Risk Rating
3. Key Risk Indicators
4. Potential Business Impact
5. Recommended Investigative Actions

## Example Output

### Executive Summary

The activity presents multiple indicators commonly associated with potential intellectual property theft. The employee significantly increased access to engineering resources after submitting a resignation notice and transferred large volumes of data to a personal cloud storage service.

### Risk Rating

High

### Key Risk Indicators

* Departing employee behavior
* Large-scale data collection activity
* Access to sensitive engineering documentation
* Use of personal cloud storage
* After-hours access patterns

### Potential Business Impact

If proprietary source code or technical documentation was transferred outside the organization, competitive advantage, intellectual property protections, and customer trust could be affected.

### Recommended Investigative Actions

* Review file classifications and sensitivity labels
* Validate business justification for accessed content
* Review cloud upload telemetry
* Preserve audit logs and endpoint evidence
* Coordinate with Legal, HR, and Engineering leadership

## Why AI Helps

AI can rapidly summarize Purview alerts, identify behavioral patterns, and generate consistent investigative recommendations while reducing manual review effort for Insider Risk teams.
