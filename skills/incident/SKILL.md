---
name: incident
description: Run incident response when something is broken — triage, severity (SEV1–SEV4), a single coordinator, timeline, safe mitigation proposals that each need the founder's approval, status updates — then write a blameless postmortem (Google SRE practice) with action items. Use for "the site is down", "users can't log in", "errors are spiking", an alert firing, "write the postmortem", or any production problem.
---

# incident

Stabilise first, understand later, blame no one. The founder is the incident commander unless
they name someone else; you are the investigator and scribe. Hard rule 1 still applies in an
emergency: propose, get approval of that exact action, then act.

## During the incident
1. **Open the record now** — next INC-id in `incidents.md`, status `investigating`, start time
   (when it began, if known, and when it was noticed). Start a timeline in
   `ai-team/devops/postmortems/INC-XXXX-timeline.md` (timestamps, what was seen, what was done,
   by whom — facts only).
2. **Triage** — what is broken, for whom, since when, is data at risk? Set severity (see the
   scale in `incidents.md`; when unsure, pick the higher one). SEV1/SEV2 or data at risk → say so
   in the first line, and consider rule 11 (human help, `security`, `lawyer`).
3. **Investigate read-only** — recent deploys and config changes (the most common cause), the
   golden signals, logs and error tracker, provider status pages, the runbook for the alert.
   Never print secrets from logs or environment.
4. **Mitigate** — propose the safest step that restores service (roll back the last change,
   disable a feature flag, scale up, fail over, block abusive traffic) in the RULES format: exact
   command, target, expected effect, verification, rollback. Run it only after the founder
   approves that exact action; log the approval time in the timeline. Prefer reversible steps.
5. **Communicate** — draft short status updates for users and the team (what's affected, what
   we're doing, next update time); the founder sends them (hard rule 10; wording with `product`,
   notification duties with `lawyer`).
6. **Resolve** — verify recovery with the signals, set status `mitigated` then `resolved` with
   the time; set the postmortem column to `due <date>` (within 5 working days) for SEV1/SEV2,
   data loss or security events, otherwise `not needed (why)` and status `closed`.

## Postmortem
7. **Write** `ai-team/devops/postmortems/PM-XXXX-slug.md` from
   `${CLAUDE_PLUGIN_ROOT}/templates/postmortem.md`: summary, impact (users, duration, data,
   money), timeline, detection (how and how fast), root causes and contributing factors (ask "why"
   until you reach the system, not a person), what went well, what went badly, where we got lucky,
   action items (prevent, detect sooner, mitigate faster) each with owner and due date.
   **Blameless** (hard rule 7): describe decisions in the context people had at the time.
8. **Follow through** — every action item → `history/obligations.md`; architectural causes →
   question for `cto` (debt or ADR); missing alerts → `monitoring`; missing runbook → write it;
   set the incident `closed` with the PM link once the founder has reviewed it.
9. `ai-devops:log-job` (and a learning if the incident taught something general).
