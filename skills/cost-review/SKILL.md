---
name: cost-review
description: Monthly (or on request) cloud cost review and ops briefing — FinOps cycle (inform, optimise, operate): costs by provider, product and environment, trend and anomalies, waste (idle, oversized, orphaned resources, forgotten trials), commitments and credits expiring, plus a short ops status (incidents, DORA trend, backups, renewals). Proposes savings; never changes or buys anything. Runs monthly on a schedule; also use for "why is our cloud bill so high", "cost review", "ops status".
---

# cost-review

Every unit of spend should be known, owned and worth it. Read-only: you propose, the founder
decides and acts (hard rules 1 and 10). Scheduled runs never ask questions — they record them as
obligations.

1. **Load memory**: `infrastructure.md` (providers, plans, owners, cost threshold), previous
   `digests/*-cost-review.md`, `incidents.md`, `dr-plan.md`, `monitoring.md`,
   `history/obligations.md`, the product files (costs and suppliers table), active lessons; the
   accountant's registers for cloud invoices if installed (read only).
2. **Inform** — gather the month's costs from evidence: invoices or cost exports in `inbox/`,
   billing pages the founder shares, or read-only billing commands the founder approves. Break down
   by provider → product → environment → service. Show the arithmetic (a small script beats mental
   math). Compare with last month and the trend; flag anomalies and anything above the threshold
   (rule 11). Unknown spend → owner question.
3. **Optimise** — look for: idle or orphaned resources (unattached volumes, old snapshots, stopped
   but billed instances, unused IPs, forgotten preview environments), oversized instances and
   databases (compare with saturation from `monitoring.md`), storage tiers and retention, data
   transfer, paid plans no longer used, trials about to convert, free credits expiring.
   Commitments or reserved capacity only when usage is steady — the money side goes to the
   `accountant`. Verify prices on official pages (hard rule 5). Estimate each saving and its risk.
4. **Operate** — owners and tags for each cost line, a budget alert per provider (proposing it;
   creating it needs approval), the next review date.
5. **Ops status** — open incidents and postmortems, DORA trend (from `delivery`), last backup
   success and restore test, renewals in the next 60 days, pending general learnings (if any,
   propose `ai-devops:improve`).
6. **Write** `ai-team/devops/digests/YYYY-MM-DD-cost-review.md`:
   ```
   # Cost review and ops briefing — YYYY-MM-DD (period: …)
   ## Spend this period (by provider / product / environment) and trend
   ## Anomalies and items above threshold
   ## Savings proposed (estimate, risk, needs approval)
   ## Commitments, credits and renewals (next 60 days)
   ## Ops status (incidents, delivery trend, backups, monitoring gaps)
   ## Questions for other team members
   ## Agent self-improvement (pending learnings)
   ```
7. **Never** delete resources, change plans, buy commitments or contact providers — each saving is
   a proposed action for the founder's approval. New obligations for each accepted saving;
   `ai-devops:log-job` with request "scheduled: cost-review" when run on schedule.
