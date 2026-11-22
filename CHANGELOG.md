# Changelog

All notable changes to the AI DevOps engineer. Versions follow semver: patch = fixes and wording,
minor = new skill / workspace files, major = breaking workspace change.
Entries that need a workspace change list a **Migration** step; `setup` (upgrade mode) applies it.

## 0.1.2 — 2026-11-23
- Ask colleagues directly, never through the founder: @mention in group chats, the Agent tool
  as main agent, "Question for @member" when called by the lead.

## 0.1.1 — 2026-11-23
- Rule "Be concise": shortest answer that keeps all important information (warnings, numbers,
  dates, sources, decisions); long only when the content needs it.

## 0.1.0 — 2026-11-22
- Basic version, to be specialised later.
- Agent `devops`, rules (`RULES.md`) with the hard rule that no destructive or
  production-changing command runs without the founder's explicit approval of that exact action.
- Skills: setup, infra-inventory, delivery, monitoring, incident, backup-dr, cost-review,
  log-job, improve.
- Workspace folder `ai-team/devops/` (AI Team workspace contract v1): infrastructure inventory,
  monitoring, DR plan, incident register, runbooks, releases, postmortems, history, learnings;
  found in the project folder or any parent.
- Templates: release checklist, runbook, postmortem, status update.
- `skills/setup/permissions.json`: read-only allows; deploy, infrastructure, cloud, database and
  remote-shell commands on "ask".
- Session hook: obligations and renewals, open incidents and postmortems due, journal, inbox,
  pending learnings. Silent outside AI Team projects.
