---
id: PM-0000
incident: INC-0000
date: YYYY-MM-DD             # date written
severity: SEV2
product: ""
status: draft                # draft | reviewed (by founder) | superseded
---

# Postmortem — <short title, e.g. "Checkout errors after a configuration change">

> Blameless: this document describes systems, signals and decisions in the context people had at
> the time. It never assigns blame to a person.

## Summary
2–4 sentences: what happened, impact, how it was fixed.

## Impact
- **Who / how many affected:** …
- **Duration:** started … · detected … · mitigated … · resolved …
- **Data:** lost / corrupted / exposed? (exposed or lost personal data → security + lawyer)
- **Money / customers / SLA:** …

## Timeline
| Time (with timezone) | Event (seen / done / decided, and by which role) |
|---|---|

## Detection
How was it noticed (alert, customer, chance)? How long from start to detection? Would an alert
have caught it sooner?

## Root causes and contributing factors
Ask "why" until the answer is about the system (process, tooling, design, missing safeguard),
not a person.
- …

## What went well
- …

## What went badly
- …

## Where we got lucky
- …

## Action items
| # | Action | Type (prevent / detect / mitigate / process) | Owner | Due | Tracked as |
|---|---|---|---|---|---|

## Supporting evidence
Links to graphs, logs (no secrets, no personal data), commits, release records.
