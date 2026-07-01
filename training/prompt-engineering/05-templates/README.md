# Prompt Templates

## What are Prompt Templates?

Prompt Templates are reusable, standardized prompts designed for recurring tasks. Rather than writing a new prompt each time, analysts define a template with placeholders that can be filled with case-specific information.

Templates improve consistency, reduce prompt-writing effort, and make AI-assisted workflows easier to scale across security teams.

---

## When to Use Prompt Templates

Prompt Templates are most effective when:

* The same task is performed repeatedly.
* Multiple analysts need consistent results.
* Reports follow a standard format.
* AI is integrated into operational workflows.

Common cybersecurity examples include:

* Incident report generation
* Insider threat investigations
* Executive briefings
* Threat intelligence summaries
* Detection engineering
* Microsoft Purview investigations
* Security awareness content

---

## Example

### Template

```text
You are an Insider Threat investigator.

Review the following investigation details and produce a structured summary.

Employee:
{{employee_name}}

Department:
{{department}}

Observed Activity:
{{activity}}

Supporting Evidence:
{{evidence}}

Provide:

• Executive Summary
• Risk Assessment
• Recommended Next Steps
• Suggested Follow-Up Questions
```

### Example Input

```
Employee:
Alice Smith

Department:
Engineering

Observed Activity:
Copied approximately 1,200 files to a removable USB drive after business hours.

Supporting Evidence:
USB audit logs
Microsoft Purview alerts
Endpoint telemetry
```

### Expected Response

```
Executive Summary

The employee copied a large volume of files to removable media outside normal working hours. Based on the available evidence, the activity warrants further investigation for potential unauthorized data transfer.

Risk Assessment

HIGH

Recommended Next Steps

• Review file sensitivity
• Interview the employee
• Correlate with Microsoft Purview activity
• Examine historical USB usage
• Preserve relevant evidence

Suggested Follow-Up Questions

• Was there an approved business purpose?
• Were the files work-related?
• Has similar behavior occurred previously?
```

---

## Why This Works

Prompt Templates provide:

* Consistent AI responses
* Standardized investigation outputs
* Faster documentation
* Reduced prompt-writing effort
* Easier collaboration across security teams

Instead of creating a new prompt for every investigation, analysts simply populate the template with the relevant case information.

---

## Limitations

Prompt Templates become less effective when:

* Every investigation requires a completely different approach.
* Important context is omitted from the template.
* Organizational policies change without updating the template.
* Analysts rely on the template instead of critical thinking.

Templates should support investigations—not replace analytical judgment.

---

## Key Takeaways

Prompt Templates transform effective prompts into repeatable operational workflows. They enable security teams to standardize documentation, improve consistency, and reduce repetitive work while allowing analysts to focus on investigation and decision-making.

---

## Core Principle

**Repeatable workflows produce repeatable outcomes.**

Well-designed Prompt Templates reduce repetitive work while preserving consistency, transparency, and human oversight across cybersecurity operations.
