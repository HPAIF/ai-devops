---
name: setup
description: Set up (or repair/upgrade) the AI DevOps engineer in the current project — creates the private ai-team/ workspace (shared company files + ai-team/devops/), maps the products to their repositories and environments, registers DevOps in team.md, and offers privacy, safe permissions and scheduled checks. Use on first use in a project, when the workspace is missing, or after a plugin update that changes the workspace.
---

# setup

Template files are in `${CLAUDE_PLUGIN_ROOT}/skills/setup/workspace/`. Never overwrite an
existing file in `ai-team/` — the workspace may already hold real history. Setup is read-only
towards the infrastructure: it changes nothing outside `ai-team/` and the files the founder
approves below.

1. **Explain** in two lines what will be created (`ai-team/` private workspace), that nothing
   leaves the machine, and that DevOps never runs a production-changing command without approval
   of that exact action.
   **Location:** if an `ai-team/` already exists in this folder or a parent folder, join it —
   never create a second one. Otherwise ask where to create it: in this folder (default), or in a
   parent company folder when this project is one of several products (layout
   `<company>/ai-team/` next to `<company>/projects/<product>/`).
2. **Ask** (one question at a time, skip what is already in `ai-team/team.md` or the company
   files): answer language (default English). DevOps is jurisdiction-neutral — don't ask for one;
   keep any jurisdiction another member recorded.
3. **Create shared files if missing** (another member may have created them already):
   `ai-team/README.md`, `ai-team/team.md`, `ai-team/company/profile.md`,
   `ai-team/company/documents.md`, `ai-team/company/products/_template.md`. If you create
   `team.md`, fill the date and `workspace_contract: 1`; if you create the profile, fill the
   stage date.
4. **Create the member folder** `ai-team/devops/` from the template's `devops/` folder:
   `learnings.md`, `infrastructure.md`, `monitoring.md`, `dr-plan.md`, `incidents.md`,
   `history/{journal,decisions,obligations}.md`, `runbooks/README.md`, `releases/README.md`,
   `postmortems/README.md`, `research/README.md`, `digests/README.md`, `inbox/README.md`.
5. **Map products to repositories.** Read `ai-team/company/products/*.md` (the "Website / repo"
   line), the company `CLAUDE.md`, the `projects/` folder and — if installed — the CTO's
   `ai-team/cto/tech-profile.md`. List what you found and ask the founder to confirm; fill the
   "Repositories and CI/CD" table from what you can read (pipeline files, Dockerfiles, IaC) — no
   cloud commands. Offer to run `infra-inventory` next for the rest.
6. **Register** a row in `team.md`: `devops | ai-devops | ai-devops:devops | ai-team/devops/ |
   <plugin version> | <today> | infrastructure, CI/CD, releases, monitoring, incidents, backups,
   cloud costs`.
7. **First journal entry** `J-0001 · <today> · setup` and obligations `O-0001` "Complete the
   infrastructure inventory (infra-inventory)", `O-0002` "Agree RPO/RTO and check backups
   (backup-dr)" and `O-0003` "Set the cost threshold in devops/infrastructure.md" (due in 14 days).
8. **Offer, don't force** (ask each; do only what is approved):
   - **Privacy:** if the project is a git repo, add `ai-team/` to `.gitignore`; suggest
     `git init` inside `ai-team/` for private history.
   - **Permissions:** merge `${CLAUDE_PLUGIN_ROOT}/skills/setup/permissions.json` into the
     project's `.claude/settings.json`. It allows only read-only git commands and documentation
     sites, and puts deploy, infrastructure, cloud, database and remote-shell commands on
     **ask**, so Claude Code itself asks before each one. Never add an allow rule for a
     state-changing command.
   - **Scheduled runs:** weekly `infra-inventory` check (e.g. Mondays 09:00) and monthly
     `cost-review` (1st of month), both read-only. Create them if a scheduling tool is available
     in this session; otherwise explain how to schedule them in the Claude app.
9. **Upgrade mode** (workspace exists): compare with the template, create only missing files or
   folders, apply migrations listed in `CHANGELOG.md` for versions newer than the one in
   `team.md`, update the version in the DevOps `team.md` row, and log what changed.
10. Finish with a short summary: what exists now, the three most useful first requests (e.g.
    "build the infrastructure inventory", "are our backups OK?", "give me a release checklist for
    tomorrow's deploy"), and `log-job`.
