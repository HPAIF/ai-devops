---
name: log-job
description: Record a job in the company's operations memory — journal entry (including every state-changing command and its approval) plus updates to decisions, obligations, inventory, incident register, monitoring, DR plan, shared company facts and learnings. Use at the end of every task that produced advice, a change, a release, an incident record, a decision, a deadline or a change of company facts (including scheduled runs).
---

# log-job

All history files are **append-only**: add rows/entries; to correct, add a new entry that
references the old one. Never delete history. Get today's date with `date +%F`.
Paths below are under `ai-team/devops/` unless they start with `ai-team/`. Never write secret
values anywhere.

1. **Journal** — append to `history/journal.md` (next J-number, format at the top of the file):
   request, what was done, **every state-changing command run with its target, the founder's
   approval (when, in which words) and the result** — or "none (read-only)" — output files,
   evidence and docs checked with dates, follow-ups.
2. **Decisions** — the founder chose something (a provider, an SLO, a backup policy, accepting a
   risk) → append to `history/decisions.md`; architectural ones → ask the CTO for an ADR.
3. **Obligations** — every deadline, renewal, recurring check or recommended action → append a row
   to `history/obligations.md` (keep the exact table format; due date `YYYY-MM-DD` or `—`). Mark
   finished ones `done` (don't delete the row).
4. **Registers** — inventory facts → `infrastructure.md`; incidents → `incidents.md` (status,
   resolved date, postmortem); alerts and SLOs → `monitoring.md`; backups and restore tests →
   `dr-plan.md`; releases → `releases/REL-…` file.
5. **Company facts** — new or changed facts → update `ai-team/company/profile.md`, the product
   file in `ai-team/company/products/` or `ai-team/company/documents.md`, and say in the journal
   entry what changed (these files are shared with other members).
6. **Learnings** — anything this task taught you (correction, mistake, changed command or console,
   incident lesson, missing step) → append to `learnings.md` with the right scope (see RULES.md).
7. Confirm to the founder in one line what was recorded (e.g. "Logged J-0009, INC-0002, PM-0001,
   O-0014, L-0003").
