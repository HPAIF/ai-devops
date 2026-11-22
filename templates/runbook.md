---
id: RB-0000
title: ""
service: ""
alert: ""                    # alert in monitoring.md that links here, if any
last_reviewed: YYYY-MM-DD
---

# Runbook — <alert or task>

## When to use
What triggers this runbook (alert condition, symptom, scheduled task).

## Impact if ignored
Who is affected and how fast it gets worse.

## Diagnose (read-only)
1. Check … (where: dashboard / command / console) — expected: …
2. Recent deploys or config changes? (release records, CI history)
3. Provider status page: …

## Fix
1. **[CHANGE — needs founder approval]** <exact step> — target: … · expected effect: … ·
   verify with: … · roll back with: …
2. …

## Verify
How to confirm the service is healthy again (signals, smoke checks, how long to watch).

## Escalate
When to stop and call for human help, and who (see infrastructure.md "Human help in place").

## Notes
Secrets referenced here by location only (e.g. "database password: in the hosting provider's
secret store"). Never paste values.
