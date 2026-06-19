# Cloud Account Compromise Investigation

## Objective

Use AI to assist incident responders in investigating suspected cloud account compromise incidents involving Microsoft 365, Entra ID, and Azure resources.

## Scenario

A security team receives alerts indicating suspicious authentication activity against a privileged Microsoft 365 account. Additional investigation reveals unusual mailbox activity and administrative actions.

## Prompt

You are a Senior Cloud Incident Responder.

Review the following activity and determine whether it indicates a cloud account compromise.

User:

Jane Smith

Role:

Global Administrator

Observed Activity:

* Successful login from previously unseen country
* Authentication occurred outside normal working hours
* New MFA device enrolled
* Multiple failed login attempts preceded successful authentication
* New inbox forwarding rule created
* Azure administrative actions performed shortly after login
* Several audit logs were deleted

Provide:

1. Executive Summary
2. Risk Rating
3. Indicators of Compromise
4. Potential Attack Progression
5. Recommended Containment Actions
6. Recommended Investigation Steps

## Example Output

### Executive Summary

The activity is highly suspicious and consistent with a cloud account compromise involving a privileged Microsoft 365 account. Evidence suggests successful unauthorized access followed by persistence establishment and administrative activity.

### Risk Rating

Critical

### Indicators of Compromise

* Authentication from unfamiliar geographic location
* Unusual login timing
* MFA enrollment activity
* Failed authentication attempts followed by success
* Unauthorized mailbox forwarding rules
* Administrative actions performed after authentication
* Audit log deletion activity

### Potential Attack Progression

1. Credential theft or password compromise
2. Successful authentication
3. MFA registration or bypass
4. Persistence through mailbox rule creation
5. Privileged administrative activity
6. Evidence tampering through audit log deletion

### Recommended Containment Actions

* Disable affected account
* Revoke active sessions and refresh tokens
* Remove unauthorized MFA devices
* Reset credentials
* Remove malicious mailbox rules
* Review privileged role assignments
* Increase monitoring for related activity

### Recommended Investigation Steps

* Review Entra ID sign-in logs
* Examine audit log activity
* Review mailbox audit events
* Identify accessed cloud resources
* Investigate administrative actions
* Determine whether additional accounts were affected
* Preserve evidence for incident documentation

## Why AI Helps

AI can rapidly correlate authentication events, cloud administration activity, mailbox changes, and audit data to produce structured investigative summaries and response recommendations. This helps responders accelerate cloud investigations while maintaining consistency and thoroughness.
