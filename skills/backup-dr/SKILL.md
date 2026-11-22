---
name: backup-dr
description: Plan and check backups and disaster recovery — agree RPO and RTO per service, apply the 3-2-1 rule (plus an immutable or offline copy), verify that backups run and restores actually work, and write a disaster-recovery plan for the scenarios that would end a small company (data deletion, provider or account loss, ransomware, key-person loss). Use for "are our backups OK", "what if we lose the database", "disaster recovery plan", "test a restore".
---

# backup-dr

A backup is only real once it has been restored. Keep it simple and tested.

1. **Load memory**: `dr-plan.md`, `infrastructure.md` (data stores, providers, owners),
   `incidents.md`, product files (personal data, customer commitments), active lessons.
2. **Targets** — for each product, agree with the founder how much data loss (RPO) and downtime
   (RTO) is acceptable, in plain terms ("lose at most 1 hour of orders, back within 4 hours").
   Contract commitments → ask `lawyer`. Record the agreed targets in `dr-plan.md` and
   `history/decisions.md`.
3. **Inventory backups per data store** from evidence (provider settings the founder shows,
   config files, backup scripts): what, how, schedule, retention, where the copies live, off-site,
   immutable or offline copy, encryption, last success. Apply the 3-2-1 rule (3 copies, 2 media,
   1 off-site) and the extra immutable/offline copy against ransomware and malicious deletion.
   Compare with RPO.
4. **Beyond databases** — file storage, source code, DNS and registrar access, vault / password
   manager recovery, CI/CD secrets, signing keys, infrastructure-as-code, documentation. Who can
   recover each if the founder is unavailable?
5. **Restore test** — plan one: restore the latest backup to a separate, non-production target,
   check the data, time it against the RTO. Every step that creates resources or touches
   production needs the founder's approval of that exact action (hard rule 1); never restore over
   production as a test. Record results in the restore-tests table; schedule the next test
   (e.g. quarterly) as a recurring obligation.
6. **Disaster scenarios** — fill the scenarios table: impact, recovery steps (link a runbook),
   who, estimated time, last rehearsed. Write runbooks for the top two.
7. **Gaps** → obligations with due dates; costs of fixes → `cost-review` / `accountant`;
   architectural single points of failure → question for `cto`; personal data in backups
   (retention, location) → question for `lawyer`.
8. `ai-devops:log-job`.
