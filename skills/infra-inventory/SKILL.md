---
name: infra-inventory
description: Build or check the infrastructure inventory in ai-team/devops/infrastructure.md — providers and accounts, environments and services, data stores, domains, DNS and certificates, repositories and pipelines, secret locations (never values), access and owners — with a Twelve-Factor config check, and turn every expiry and renewal into an obligation. Runs weekly in check mode on a schedule; also use for "what do we run on", "map our infrastructure", "when does our domain/certificate expire".
---

# infra-inventory

Two modes: **build** (with the founder, fills the inventory) and **check** (scheduled, read-only,
no questions — writes a digest). Both are read-only towards the infrastructure (hard rule 1).

## Build mode
1. **Load memory**: `infrastructure.md`, the product files, the CTO's `tech-profile.md` and ADRs
   (if installed), `dr-plan.md`, `monitoring.md`, active lessons.
2. **Read what is in the repositories first** — pipeline files, Dockerfiles, compose files,
   infrastructure-as-code, deploy scripts, `.env.example` (variable names only, never values),
   README deploy notes. Cite paths.
3. **Ask the founder for the rest**, one area at a time: providers and who owns each account and
   its billing; MFA on each account; environments; domains and registrar; where secrets are kept;
   who has access. Offer read-only ways to confirm (a console screenshot, an export, a read-only
   CLI command the founder runs or approves). Never ask for secret values.
4. **Twelve-Factor config check** for each deployable service: config in the environment (not in
   code), backing services as attached resources, dev/prod parity, logs as streams. Gaps → a
   question for `cto` (architecture) or an obligation (ops fix).
5. **Owners and single points of failure** — every account should be owned by the company (not a
   contractor's personal account) with at least two people able to recover access. Flag gaps.
6. **Fill** the tables in `infrastructure.md`; mark unknowns `?`.

## Check mode (weekly)
1. Read `infrastructure.md`, `history/obligations.md`, `dr-plan.md`, `monitoring.md`,
   `incidents.md` and the previous `digests/*-infra-check.md`.
2. List expiries within 60 days: domains, certificates (and whether auto-renew is on), provider
   plans, credits, support contracts; runtimes or databases reaching end of life (verify dates on
   the official source or endoflife.date — hard rule 5); access reviews and restore tests due.
3. Write `ai-team/devops/digests/YYYY-MM-DD-infra-check.md`:
   ```
   # Infra check — YYYY-MM-DD
   ## Expiring within 60 days
   ## Overdue checks (restore tests, access reviews, rotations)
   ## Open incidents / postmortems due
   ## Inventory gaps (unknowns that matter)
   ## Sources checked
   ```
   Nothing new → say so in one line and still list what was checked.

## Both modes
- Every renewal date and recurring check → a row in `history/obligations.md` (dated).
- Secret values seen anywhere → stop, tell the founder, hand to `security` (hard rule 2).
- `ai-devops:log-job`.
