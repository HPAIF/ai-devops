---
id: REL-YYYY-MM-DD-slug
date: YYYY-MM-DD
product: ""
environment: production
risk: medium                 # low | medium | high
approved_by: ""              # founder, with time of approval of the exact steps below
outcome: ""                  # deployed | rolled back | postponed
---

# Release — <product> <version / short title>

## What changes
| Commit / PR | Summary | Migration? | Feature flag? |
|---|---|---|---|

Who is affected, user-visible changes, timing (not late on a Friday, founder reachable).

## Go / no-go checks
- [ ] CI green on the exact commit being deployed
- [ ] Code reviewed (link)
- [ ] Database migrations reviewed: backward compatible (expand → migrate → contract) or a fresh,
      tested backup taken first
- [ ] Config and secrets present in the target environment (names checked, values never shown)
- [ ] Monitoring and alerts in place for the changed parts; dashboards open
- [ ] Rollback plan written below and possible within the RTO
- [ ] Product / support told what is shipping and when
- [ ] (First launch) production-readiness review done: alerts with runbooks, tested restore,
      on-call owner, capacity estimate, security basics, status page

## Deploy steps (exact — run only after approval of this text)
1. `<command>` — target: … · expected: …
2. …

## Rollback steps (exact)
1. `<command>` — target: … · expected: …
Data written by the new version during the window: how is it handled on rollback?

## Post-deploy verification
- [ ] Smoke checks: …
- [ ] Golden signals normal for … minutes (latency, traffic, errors, saturation)
- [ ] Error tracker: no new error types
- [ ] Announce done / update changelog

## Result
What happened, timestamps, any deviation (deviation → incident record).
