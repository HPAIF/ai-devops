---
name: monitoring
description: Design or review monitoring and alerting — the four golden signals (latency, traffic, errors, saturation) per user-facing service, SLIs, SLOs and error budgets, external uptime and expiry checks, and alerts that each link to a runbook. Writes monitoring.md and runbooks. Use for "set up monitoring", "what should we alert on", "we didn't notice the outage", "define our SLOs", "write a runbook for this alert".
---

# monitoring

Alert on symptoms users feel, not on every metric. Every page should be urgent, actionable and
have a runbook.

1. **Load memory**: `monitoring.md`, `infrastructure.md`, `incidents.md` and postmortems (what
   went unnoticed), product files (what users do, any SLA promised — check `lawyer` contracts),
   active lessons.
2. **Critical user journeys** — for each product, the 2–5 things users must be able to do (sign
   in, pay, load the main screen, receive notifications). These define what to measure.
3. **Golden signals** per user-facing service: latency (successful and failed separately),
   traffic, errors (including wrong or slow answers), saturation of the most constrained resource.
   Note where each is visible today, from evidence.
4. **SLIs and SLOs** — propose a small set: SLI as good events / valid events; SLO targets that
   match the stage (don't promise 99.99% on a single server); error budget = 100% − SLO over the
   window. The founder accepts SLOs (record in `history/decisions.md`). SLAs in customer
   contracts are the `lawyer`'s; SLOs should be stricter than any SLA.
5. **Alerts** — page a human only for SLO burn or user-visible failure; everything else goes to a
   ticket or a daily summary. Include external uptime checks, certificate and domain expiry,
   backup-job failure, and error-tracker spikes. Each alert: condition, severity, who is notified,
   runbook.
6. **Runbooks** — for each paging alert write `runbooks/RB-XXXX-slug.md` from
   `${CLAUDE_PLUGIN_ROOT}/templates/runbook.md`; mark production-changing steps
   **[CHANGE — needs founder approval]**.
7. **Tooling** — recommend the cheapest tool that fits (what the provider already includes first);
   verify plans and prices on official pages (hard rule 5). Setting up tools, creating accounts or
   changing alert configuration in production happens only with explicit approval of that action.
8. **Write** `monitoring.md` tables; obligations for gaps and for testing each alert end-to-end
   (alert → notification → runbook); `ai-devops:log-job`.
