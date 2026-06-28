# Few-Shot Prompting

## What is Few-Shot Prompting?

Few-shot prompting is a prompt engineering technique where multiple examples—typically two to five—are provided before the actual task. These examples help the AI recognize patterns, understand expectations, and produce more accurate and consistent responses for complex or specialized tasks.

Few-shot prompting is especially valuable when subtle differences between scenarios affect the desired outcome.

---

## When to Use Few-Shot Prompting

Few-shot prompting is most effective when:

* Tasks involve pattern recognition.
* Multiple scenarios share similar characteristics.
* Consistency is important across many responses.
* Organization-specific workflows or terminology are involved.

Common cybersecurity examples include:

* Insider threat investigations
* Alert triage
* Risk classification
* Threat intelligence analysis
* Detection engineering
* Investigation summaries

---

## Example

### Prompt

```
You are an Insider Threat investigator.

Classify each event as LOW, MEDIUM, or HIGH risk based on user behavior.

Example 1

Event:
Employee mistakenly emailed an internal document to another employee.

Classification:
LOW

Reason:
The recipient is internal and there is no indication of malicious intent.

---

Example 2

Event:
Employee uploaded 15 confidential engineering documents to a personal cloud storage account before submitting their resignation.

Classification:
HIGH

Reason:
Large-scale transfer of sensitive information to an unauthorized location immediately before departure is a common indicator of intellectual property theft.

---

Now classify:

Event:
Employee copied approximately 1,200 files to a removable USB drive after normal business hours and disconnected the device shortly afterward.
```

### Expected Response

```
Classification:
HIGH

Reason:
Large-scale copying of files to removable media outside normal working hours may indicate potential data exfiltration. Review file sensitivity, user intent, historical behavior, and any related investigative evidence.
```

---

## Why This Works

The multiple examples teach the model several important patterns:

* Benign user mistakes should not automatically be treated as malicious.
* Context influences risk more than isolated events.
* Sensitive data movement and behavioral indicators contribute to higher risk classifications.

Rather than memorizing individual examples, the AI learns how to apply similar reasoning to new investigative scenarios.

---

## Limitations

Few-shot prompting becomes less effective when:

* Numerous edge cases require dozens of examples.
* The prompt becomes excessively long.
* Organization-specific policies frequently change.
* The task requires external knowledge or live data.

For highly repeatable workflows, Prompt Templates or AI agents may provide better long-term consistency.

---

## Core Principle

Few-shot prompting is one of the most powerful prompt engineering techniques for cybersecurity because it teaches the AI how to recognize patterns instead of simply following instructions.

It is particularly valuable for investigations where context, user behavior, and subtle differences determine the appropriate response.