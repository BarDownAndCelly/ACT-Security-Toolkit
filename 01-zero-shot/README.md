# Zero-Shot Prompting

## What is Zero-Shot Prompting?

Zero-shot prompting is a prompt engineering technique where an AI model is given a task without any prior examples. Instead of learning from demonstrations, the model relies entirely on the instructions contained within the prompt and the knowledge it acquired during training.

This approach works best for well-defined tasks where the expected behavior is clear and the required knowledge is commonly understood.

---

## When to Use Zero-Shot Prompting

Zero-shot prompting is most effective when:

- The task is straightforward and clearly defined.
- The output format is simple.
- The AI already possesses the required domain knowledge.
- Speed and token efficiency are important.

Because no examples are included, zero-shot prompts generally consume fewer tokens than one-shot or few-shot approaches, making them both faster and less expensive to execute.

---

## Cybersecurity Use Case

Security analysts frequently classify alerts, review logs, prioritize events, and identify suspicious activity without needing to teach the AI how to recognize common indicators.

For example, identifying malware delivered through a disguised executable is a well-understood security task that requires little additional context.

---

## Example Prompt

**Classify the following security event as LOW, MEDIUM, or HIGH risk. Explain your reasoning briefly.**

> User downloaded **invoice.pdf.exe** from an external email attachment.

---

## Expected Output

**Risk Level:** HIGH

**Reasoning:**

- The file uses a double extension (`.pdf.exe`), a common technique used to disguise executable malware.
- The file originated from an external email attachment.
- This delivery method is frequently associated with phishing and malware campaigns.

---

## Why This Works

The model already recognizes several well-known security indicators, including:

- Double file extensions
- Suspicious email attachments
- Common malware delivery techniques
- Basic security risk classification

No training examples are required because these concepts are widely represented in the model's training data.

---

## Advantages

- Fast to create
- Lowest token usage
- Lowest API cost
- Ideal for common security tasks
- Easy to integrate into automated workflows

---

## Limitations

Zero-shot prompting may perform poorly when:

- The task requires specialized organizational knowledge.
- A very specific output format is required.
- The problem involves nuanced reasoning or complex decision-making.
- Consistency across multiple responses is critical.

In these situations, One-Shot or Few-Shot Prompting will often produce more reliable results.

---

## Core Takeaway

Zero-shot prompting is the simplest form of prompt engineering. It works exceptionally well for routine cybersecurity tasks where the model already understands the concepts and only needs clear instructions to perform the requested task.