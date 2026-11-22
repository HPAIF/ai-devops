# Research behind the AI DevOps engineer

What DevOps / SRE work an early-stage company needs, and which established frameworks the rules
and skills rely on. Links plus short paraphrases; read the sources for the details. Researched
2026-11-22.

## What DevOps means for an early-stage startup

There is rarely a dedicated DevOps person at seed stage; the founder or the first engineers carry
it. The recurring needs across the sources below are the same few: know what you run and who owns
it, ship small changes safely and repeatably, notice problems before customers do, respond calmly
and learn from incidents, be able to restore data, and keep the cloud bill under control. The
AI DevOps engineer covers these with one skill each, and treats every production change as the
founder's decision.

## Software delivery: continuous delivery and DORA

- [DORA — continuous delivery capability](https://dora.dev/capabilities/continuous-delivery/):
  continuous delivery keeps software releasable at any time; it is distinct from continuous
  deployment; it lowers risk, and DORA research links it to better reliability. DORA's
  trunk-based development guidance: few active branches, merged to mainline within about a day.
- [DORA — software delivery performance metrics](https://dora.dev/guides/dora-metrics-four-keys/):
  the original four keys have become five — change lead time, deployment frequency,
  failed-deployment recovery time (replacing MTTR), change fail rate and deployment rework rate —
  read together so speed is balanced by stability.
- [Martin Fowler — Software Delivery Guide](https://www.martinfowler.com/delivery.html):
  deployment pipelines break the build into stages that add confidence step by step.
- [Atlassian — DORA metrics](https://www.atlassian.com/devops/frameworks/dora-metrics):
  practitioners warn against using the metrics as team targets.

**Used for:** the `delivery` skill (pipeline assessment, build-once-promote, expand/contract
migrations, DORA baseline as a trend, never a target) and `templates/release-checklist.md`.

## Production readiness

- [Google SRE book — The Evolving SRE Engagement Model](https://sre.google/sre-book/evolving-sre-engagement-model/):
  the production readiness review checks that a service meets operational standards before SRE
  takes it on.
- [GitLab — Production Readiness Review](https://handbook.gitlab.com/handbook/engineering/infrastructure/production/readiness)
  and [Grafana Labs — building a PRR process](https://grafana.com/blog/how-were-building-a-production-readiness-review-process-at-grafana-labs/):
  public checklists covering monitoring, on-call, alert → page → runbook tested end to end, and
  performance under realistic load; keep the review short and start it early.

**Used for:** the first-launch section of `delivery` and the release checklist.

## Monitoring: golden signals, SLOs and error budgets

- [Google SRE book — Monitoring Distributed Systems](https://sre.google/sre-book/monitoring-distributed-systems/):
  the four golden signals — latency, traffic, errors, saturation; a page should be urgent,
  actionable, about a user-visible (or imminent) problem and need human judgment.
- [Google SRE book — Service Level Objectives](https://sre.google/sre-book/service-level-objectives/)
  and [SRE Workbook — Implementing SLOs](https://sre.google/workbook/implementing-slos/): SLI is a
  measured indicator, SLO a target for it, the error budget is 100% minus the SLO and balances
  feature work against reliability; [Alerting on SLOs](https://sre.google/workbook/alerting-on-slos/)
  introduces burn-rate alerts.

**Used for:** the `monitoring` skill, `monitoring.md` (SLO and golden-signal tables, alerts that
link runbooks) and `templates/runbook.md`.

## Incident response and blameless postmortems

- [PagerDuty Incident Response Guide — severity levels](https://docs.pagerduty.com/ops-guides/incident-response-guide/severity-levels)
  and [the guide's home](https://response.pagerduty.com): open-sourced practice — numbered
  severity levels defined by customer impact, a single incident commander coordinating, and "when
  unsure, treat it as the higher severity; don't debate it during the incident".
- [Google SRE book — Postmortem Culture](https://sre.google/sre-book/postmortem-culture/) and
  [SRE Workbook — Postmortem Culture](https://sre.google/workbook/postmortem-culture/):
  blameless postmortems look for contributing causes in systems and processes, not people; the
  practice came from fields like healthcare and aviation; a truly blameless culture produces more
  reliable systems.

**Used for:** hard rule 7, the `incident` skill (SEV1–SEV4 scale simplified from PagerDuty's
five levels for a small company, founder as incident commander, timeline, approved mitigations,
postmortem within 5 working days), `incidents.md`, `templates/postmortem.md` and
`templates/status-update.md`.

## Backups and disaster recovery

- [CISA — Back up business data](https://www.cisa.gov/back-business-data): recommends the 3-2-1
  rule (three copies, two media, one off-site), automated regular backups, encryption, offline
  copies and tested restores.
- [Acronis — the 3-2-1 backup rule](https://www.acronis.com/en-us/articles/backup-rule/) and
  [Datto — 3-2-1 backup rule](https://www.datto.com/blog/3-2-1-backup-rule/) (vendor sources):
  the 3-2-1-1-0 extension adds one immutable/offline copy against ransomware and zero errors on
  restore verification; 3-2-1 covers redundancy but not how fast you recover — that is what RPO
  (acceptable data loss) and RTO (acceptable downtime) are for.

**Used for:** the `backup-dr` skill and `dr-plan.md` (RPO/RTO per service, 3-2-1 + immutable
copy, restore-test log, disaster scenarios including account loss and key-person loss).

## Twelve-Factor App

- [12factor.net](https://12factor.net/): config in the environment, backing services as attached
  resources, dev/prod parity, logs as streams, disposability, and more.

**Used for:** the config check in `infra-inventory` and the "secrets injected from the vault"
item in `delivery`.

## Cloud cost: FinOps and Well-Architected

- [FinOps Foundation — Framework phases](https://www.finops.org/framework/phases/): Inform
  (visibility and allocation), Optimize (efficiency and value), Operate (make it part of how the
  company works) — an iterative cycle, not a sequence of gates.
- [AWS Well-Architected — definitions](https://docs.aws.amazon.com/wellarchitected/latest/framework/definitions.html):
  six pillars including operational excellence (small reversible changes, operations as code,
  learn from failures), reliability (automatic recovery, test recovery procedures) and cost
  optimisation.

**Used for:** the `cost-review` skill (inform → optimise → operate, owners and budget alerts) and
hard rule 6 (every change has a way back).

## Not adopted (for now)

- Full ITIL change management, formal on-call rotations and error-budget policies with release
  freezes: too heavy for a founder-led team. Revisit when the plugin is specialised for teams
  with dedicated on-call.
