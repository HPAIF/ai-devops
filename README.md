# AI DevOps

A DevOps / site-reliability engineer for founders, running in Claude Code. Part of the
**[AI Team](https://github.com/HPAIF/ai-team)** — agents that work together for your company.

It keeps an **infrastructure inventory** (what you run, who owns it, when it expires), designs
**CI/CD** and **release checklists**, sets up **monitoring and alerting**, runs **incidents** and
writes **blameless postmortems**, plans **backups and disaster recovery**, and reviews your
**cloud costs**. It cites what it observed, and gets better from what it learns.

> **It never runs a deploy, migration, deletion or infrastructure change without your explicit
> approval of that exact action** — it shows you the command, the target, the expected effect
> and the rollback first. It never prints or stores secret values. It is an AI assistant, not an
> accountable on-call engineer: for possible data loss, suspected breaches and long outages it
> tells you to bring in a human expert.

## Install

In Claude Code:

```
/plugin marketplace add HPAIF/ai-team
/plugin install ai-devops@ai-team
```

Then, in your project (or your company folder), say **"set up the AI DevOps"**. The `setup` skill
creates — or joins — the private `ai-team/` workspace, maps your products to their repositories,
and offers `.gitignore`, safe permissions (deploy, cloud and database commands always ask) and
scheduled read-only checks. Nothing leaves your machine.

To share the setup with your team, commit this to the project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "ai-team": { "source": { "source": "github", "repo": "HPAIF/ai-team" } }
  },
  "enabledPlugins": { "ai-devops@ai-team": true }
}
```

## Use it

Talk normally — Claude hands operations work to the `ai-devops:devops` agent — or start a session
as DevOps: `claude --agent ai-devops:devops`.

| You say | What happens (skill) |
|---|---|
| "What do we run on?" / "when does our domain expire?" | infrastructure inventory + renewals as deadlines (`infra-inventory`) |
| "Set up CI" / "review our pipeline" | continuous-delivery assessment + DORA baseline (`delivery`) |
| "We're deploying tomorrow" | release checklist with exact deploy and rollback steps, for your approval (`delivery`) |
| "What should we alert on?" / "define our SLOs" | golden signals, SLOs, alerts with runbooks (`monitoring`) |
| "The site is down!" | triage, severity, timeline, approved mitigation, status update draft (`incident`) |
| "Write the postmortem" | blameless postmortem with action items (`incident`) |
| "Are our backups OK?" / "test a restore" | RPO/RTO, 3-2-1 check, restore-test plan, DR plan (`backup-dr`) |
| "Why is the cloud bill so high?" | cost review with savings to approve + ops briefing (`cost-review`) |
| "We moved the database" / "renewed the domain" | history and inventory updated (`log-job`) |
| "Improve yourself" | anonymised upgrade proposal for this plugin (`improve`) |

Each session in a project with a workspace starts with overdue and upcoming deadlines and renewals,
open incidents and postmortems due, recent jobs and pending learnings (session hook).

**Scheduled runs** (offered by `setup`, read-only): weekly `infra-inventory` check and monthly
`cost-review`.

## How it is built

```
RULES.md                 hard rules: approval of the exact action before any production change,
                         secrets never leave their vault, rollback plans, blameless, never invent…
agents/devops.md         the agent (reads RULES.md and the workspace)
skills/                  setup · infra-inventory · delivery · monitoring · incident · backup-dr ·
                         cost-review · log-job · improve
skills/setup/permissions.json   read-only allows; deploy / cloud / database / shell commands on "ask"
templates/               release checklist, runbook, postmortem, status update
hooks/                   session-start context
docs/research.md         the frameworks behind the skills, with links
```

Frameworks it relies on: continuous delivery and DORA's software-delivery metrics, production
readiness reviews, Google SRE (golden signals, SLOs and error budgets, blameless postmortems),
PagerDuty's incident response practice, the 3-2-1 backup rule with RPO/RTO, the Twelve-Factor
App, the FinOps framework and AWS Well-Architected pillars. See
[docs/research.md](docs/research.md).

Your data lives in **your project**, never in the plugin. Code, pipelines and infrastructure code
stay in their own repositories (`projects/<product>/` in the company layout):

```
ai-team/
├── team.md                  installed members
├── company/                 shared with other members: profile, documents, products/<product>.md
└── devops/                  learnings, infrastructure, monitoring, dr-plan, incidents, history
                             (journal, decisions, obligations), runbooks, releases, postmortems,
                             research, digests, inbox
```

See the [workspace contract](https://github.com/HPAIF/ai-team/blob/main/docs/workspace.md).

## Privacy
- The plugin is public; your workspace, configs and logs are private. Keep `ai-team/` out of
  public repositories (`setup` offers to add it to `.gitignore`) — `git init` inside it for a
  private history.
- Secret values are never written to the workspace — only where each secret lives.
- DevOps searches the web for the *technical question*, never your hostnames, logs or account
  details.
- Files the agent reads are processed by the model you use in Claude Code.

## Self-improvement
1. After corrections, mistakes, changed consoles, incidents or missing steps, DevOps writes a
   lesson to `ai-team/devops/learnings.md` and applies it from then on.
2. Lessons useful to everyone are marked `general`. The `improve` skill turns them into an
   anonymised pull request to this repository — only after you approve the exact text, and never
   one that weakens the hard rules or loosens the approval of production changes.
3. Merged improvements reach every user with the next plugin update.

## Team hand-offs
The `cto` decides the architecture; DevOps runs it. Leaked secrets and vulnerabilities go to
`security`, release timing and user communication to `product`, notification duties and SLAs to
`lawyer`, cloud invoices and commitments to `accountant`; `lead` is the entry point. If a member
isn't installed, DevOps names the plugin (`ai-<member>`).

## Upgrading
`/plugin marketplace update ai-team`, then `/plugin update ai-devops@ai-team` (restart Claude
Code). Run "set up the AI DevOps" again to apply workspace migrations; it never overwrites your
history.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md). License: [MIT](LICENSE).
