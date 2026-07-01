# MITRE ATLAS Technique Mapping

## Objective

Use AI to assist threat intelligence analysts in mapping observed adversarial AI activity to the MITRE ATLAS framework and identifying risks to AI-enabled systems.

## Scenario

An organization deploys an internal large language model (LLM) to assist employees with knowledge management and software development tasks. Security teams observe repeated attempts to bypass system restrictions and access information outside the intended scope of the application.

## Prompt

You are a Senior Threat Intelligence Analyst specializing in AI Security.

Review the following activity and map observed behaviors to the MITRE ATLAS framework.

Observed Activity:

* User repeatedly submits prompts designed to override system instructions
* Multiple attempts made to reveal hidden system prompts
* User requests sensitive internal information unrelated to assigned responsibilities
* Prompt variations are systematically tested to bypass safety controls
* Responses are copied and compared to identify hidden functionality
* Activity volume significantly exceeds normal usage patterns

Provide:

1. Executive Summary
2. Observed Adversarial AI Behaviors
3. Potential MITRE ATLAS Techniques
4. Attack Progression
5. Detection Opportunities
6. Defensive Recommendations

## Example Output

### Executive Summary

The activity demonstrates behavior consistent with adversarial interaction against a generative AI system. Evidence suggests attempts to bypass safety controls, extract restricted information, and discover internal system behavior.

### Observed Adversarial AI Behaviors

* Prompt injection attempts
* System prompt extraction efforts
* Information gathering and reconnaissance
* Safety control bypass testing
* Excessive probing of model behavior

### Potential MITRE ATLAS Techniques

* Prompt Injection
* Information Gathering
* AI System Reconnaissance
* Information Disclosure
* LLM Safety Guardrail Evasion

### Attack Progression

1. User probes AI system behavior
2. Multiple prompt injection attempts are executed
3. Hidden instructions and system behavior are targeted
4. Safety controls are tested using prompt variations
5. Sensitive information is requested
6. Responses are analyzed to identify additional attack opportunities

### Detection Opportunities

* High-frequency prompt activity
* Repeated prompt injection patterns
* Attempts to access restricted information
* Prompt similarity analysis
* Excessive conversation depth and iteration

### Defensive Recommendations

* Implement prompt monitoring and alerting
* Review system prompt exposure risks
* Strengthen guardrail controls
* Monitor for anomalous AI usage patterns
* Conduct adversarial AI testing exercises
* Establish AI security governance procedures

## Why AI Helps

AI can rapidly analyze user interactions, identify adversarial behavior patterns, and map observed activity to MITRE ATLAS concepts. This enables security teams to better understand threats targeting AI systems and improve defensive controls.
