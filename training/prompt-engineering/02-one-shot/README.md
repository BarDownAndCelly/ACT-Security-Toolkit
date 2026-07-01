# One-Shot Prompting

## What is One-Shot Prompting?

One-shot prompting is a prompt engineering technique where the AI is given a single example before being asked to complete a similar task. The example demonstrates both the desired behavior and the expected output format.

Providing one example helps reduce ambiguity and produces more consistent responses than zero-shot prompting while remaining relatively efficient in terms of token usage.

---

## When to Use One-Shot Prompting

One-shot prompting is most effective when:

- A specific output format is required.
- The task is straightforward but benefits from an example.
- Consistency is important.
- You want to minimize token usage while improving accuracy.

One-shot prompting strikes a balance between simplicity and reliability, making it an excellent choice for many cybersecurity workflows.

---

## Cybersecurity Use Case

Security analysts frequently need AI to produce structured output that can be consumed by automation platforms, scripts, SIEMs, ticketing systems, or reporting tools.

Rather than simply extracting information, analysts often require the response to follow a predictable schema such as JSON, CSV, or Markdown.

---

## Example Prompt

**Extract vulnerability information as JSON.**

Example:

**Input**

> SQL injection in login.php line 47

**Output**

```json
{
  "type": "SQL injection",
  "file": "login.php",
  "line": 47
}
```

Now extract:

> XSS vulnerability in search.js line 203

---

## Expected Output

```json
{
  "type": "XSS vulnerability",
  "file": "search.js",
  "line": 203
}
```

---

## Why This Works

The example teaches the model:

- Which information to extract
- Which fields to include
- The required JSON structure
- The expected formatting

Instead of inferring the desired response, the model simply follows the demonstrated pattern.

---

## Advantages

- Produces more consistent output than zero-shot prompting
- Improves adherence to required formats
- Excellent for structured data extraction
- Works well with automation and scripting
- Still relatively inexpensive in terms of token usage

---

## Limitations

One-shot prompting may be less effective when:

- Multiple patterns need to be demonstrated.
- The task involves significant complexity or ambiguity.
- Organizational context or specialized terminology is required.
- Edge cases are common.

In these situations, Few-Shot Prompting often provides better results.

---

## Core Takeaway

One-shot prompting teaches the model through a single example. When consistent formatting or predictable structure is required, it often provides a significant improvement over zero-shot prompting while keeping prompts concise and efficient.