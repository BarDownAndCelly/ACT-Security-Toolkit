
# Zero-Shot Prompting

## What is Zero-Shot Prompting?

Zero-shot prompting is a technique where the AI is given a task without any examples. The model relies entirely on its training data and the instructions provided in the prompt.

## Security Use Case

Security analysts frequently need to classify alerts, logs, and events without providing examples. Zero-shot prompting is useful when the task is straightforward and well understood.

## Example Prompt

Classify the following security event as LOW, MEDIUM, or HIGH risk:

"User downloaded invoice.pdf.exe from an external email attachment."

## Expected Output

HIGH

## Why This Works

The model recognizes:

* Double file extension (.pdf.exe)
* External email delivery
* Common malware delivery techniques

No examples are required because the task is simple and the indicators are well known.

