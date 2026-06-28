# Prompt Engineering Quick Reference

This page provides a quick reference for the prompt engineering techniques used throughout this repository.

If you're new to prompt engineering, start with the individual technique guides. This page is intended as a concise refresher once you're familiar with the concepts.

---

## Zero-Shot Prompting

**Best For**

* Simple classification
* Alert triage
* Log summaries
* Risk scoring

**Prompt Pattern**

```text
You are a cybersecurity analyst.

<Classify | Summarize | Explain> the following event:

<event details>
```

**When to Use**

When the task is straightforward and no examples are needed.

---

## One-Shot Prompting

**Best For**

* Standardized reports
* Executive summaries
* Consistent formatting
* Structured outputs

**Prompt Pattern**

```text
Example

Input:
...

Output:
...

Now analyze:

...
```

**When to Use**

When one example is enough to teach the AI the desired format or style.

---

## Few-Shot Prompting

**Best For**

* Insider Threat investigations
* Threat intelligence
* Risk classification
* Pattern recognition

**Prompt Pattern**

```text
Example 1
...

Example 2
...

Example 3
...

Now analyze:

...
```

**When to Use**

When multiple examples improve consistency or help the AI recognize patterns.

---

## Chain-of-Thought Prompting

**Best For**

* Incident investigations
* Root cause analysis
* Threat hunting
* Complex security decisions

**Prompt Pattern**

```text
Review the following evidence.

Explain your analysis before providing a final assessment.
```

**When to Use**

When transparency and structured reasoning are more important than speed.

---

## Prompt Templates

**Best For**

* Repeatable workflows
* Investigation reports
* Microsoft Purview
* Executive reporting
* Automation

**Prompt Pattern**

```text
Analyst:
{{analyst}}

Case:
{{case}}

Evidence:
{{evidence}}

Produce:
- Summary
- Risk
- Recommendations
```

**When to Use**

When the same prompt will be used repeatedly across investigations or by multiple analysts.

---

## Choosing the Right Technique

| Technique        | Best Used When                                 |
| ---------------- | ---------------------------------------------- |
| Zero-Shot        | The task is simple and well understood.        |
| One-Shot         | One example establishes the expected format.   |
| Few-Shot         | Multiple examples improve pattern recognition. |
| Chain-of-Thought | The AI should explain its reasoning.           |
| Prompt Templates | The workflow is repeated frequently.           |

---

## Operational Considerations

Different prompting techniques require different amounts of context, which directly impacts token usage, response latency, and API cost when using commercial LLMs.

| Technique | Prompt Size | Cost | Speed |
|-----------|-------------|------|-------|
| Zero-Shot | Low | Lowest | Fastest |
| One-Shot | Low-Medium | Low | Fast |
| Few-Shot | Medium-High | Moderate | Moderate |
| Chain-of-Thought | Medium | Moderate | Moderate |
| Prompt Templates | Varies | Depends on template size | Varies |

As prompts become longer and include more examples or context, token consumption generally increases. Larger prompts may improve consistency and reasoning but also increase inference time and operational cost.

When designing AI-assisted security workflows, choose the simplest prompting technique that reliably produces the desired result.

Effective prompt engineering is about balancing accuracy, consistency, speed, and cost—not simply writing the longest prompt possible.

## Core Principle

**Choose the simplest prompting technique that reliably accomplishes the task.**

More complex prompts are not inherently better. Begin with Zero-Shot prompting and increase complexity only when the task requires additional context, consistency, or structured reasoning.
