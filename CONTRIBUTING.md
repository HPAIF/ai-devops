# Contributing

Improvements are welcome — new skills, better checklists, sharper templates. Many will arrive as
pull requests from the agent's own `improve` skill.

## The one rule: no company data
This repository is public. Never commit anything from an `ai-team/` workspace, a private
repository or a provider console: names, repositories, hostnames, domains, IPs, account and
resource IDs, log lines, incident details, amounts, and never any secret. Use neutral examples
("a managed Postgres", "a container platform").

## What goes where
| Change | File |
|---|---|
| A rule every company should follow | `RULES.md` (rules may be added or clarified, never weakened) |
| A procedure | `skills/<skill>/SKILL.md` (new skill → new folder + row in RULES.md skills table) |
| A checklist or document format | `templates/` |
| Suggested permissions | `skills/setup/permissions.json` (read-only commands may be allowed; state-changing commands only ever go on `ask`) |
| Workspace files | `skills/setup/workspace/` + a **Migration** note in `CHANGELOG.md` |
| A framework the skills rely on | `docs/research.md` (link + short paraphrase) |

Hard rules that may never be weakened: no destructive or production-changing command without the
founder's explicit approval of that exact action · secrets never leave their vault · read the
memory first · evidence · verify changing facts · every change has a way back · blameless ·
append-only history · confidentiality · never act externally · escalation.

The shared workspace files (`skills/setup/workspace/README.md`, `team.md`, `company/`) are
identical in every AI Team member; change them in all members together.

## Release
1. Bump `version` in `.claude-plugin/plugin.json` (patch / minor / major — see CHANGELOG).
2. Add a `CHANGELOG.md` entry (with a Migration step if the workspace changes).
3. `claude plugin validate .` must pass.
4. Merge to `main`. Users get it with `/plugin update ai-devops@ai-team`.
