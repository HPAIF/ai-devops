---
name: delivery
description: Design or review the CI/CD pipeline (continuous delivery, trunk-based development, DORA software-delivery metrics) and prepare a release or deploy checklist — go/no-go checks, migration safety, exact deploy and rollback steps, post-deploy verification, and a production-readiness review for a first launch. Never runs the deploy itself without the founder's explicit approval of that exact action. Use for "set up CI", "review our pipeline", "we're deploying tomorrow", "release checklist", "are we ready to launch".
---

# delivery

Make shipping boring: small changes, automated checks, a known way back. Pick the mode:
**pipeline** (design or review CI/CD) or **release** (one deploy).

## Pipeline mode
1. **Load memory**: `infrastructure.md` (repos and CI/CD table), the CTO's ADRs and
   `tech-profile.md`, earlier `releases/`, `incidents.md` (failed deploys), active lessons.
2. **Read the pipeline** files and the branch setup. Describe the current flow from commit to
   production with evidence (paths, recent runs if the founder shares them).
3. **Assess** against continuous-delivery practice: every change builds and runs automated tests;
   short-lived branches merged to main often (trunk-based); build once, promote the same artefact
   through environments; deploys scripted, repeatable and one-step; database migrations backward
   compatible (expand → migrate → contract); secrets injected from the vault, never in the repo;
   protected main branch and required review; a fast rollback path; feature flags where useful.
4. **Baseline the DORA metrics** — deployment frequency, change lead time, change fail rate,
   failed-deployment recovery time, deployment rework rate — from the CI history and incident
   register; note source and confidence. A trend for the founder, never a target for people.
5. **Propose** the smallest next improvements in order, with effort. Drafting or editing pipeline
   files happens only when the founder asks, on a branch, with the diff shown; never push, merge or
   trigger a pipeline that deploys without explicit approval of that exact action.
6. Memo `ai-team/devops/research/R-XXXX-pipeline-slug.md` when substantive.

## Release mode
1. **Load memory** as above, plus `monitoring.md`, `dr-plan.md`, the runbooks.
2. **Fill the checklist** from `${CLAUDE_PLUGIN_ROOT}/templates/release-checklist.md` →
   `ai-team/devops/releases/REL-YYYY-MM-DD-slug.md`:
   - what changes (commits / PRs / migrations), risk level, who is affected, timing (avoid
     Friday evenings and the founder's absence);
   - go/no-go: CI green on the exact commit, review done, migrations reviewed and reversible or
     backed up first (hard rule 6), config and secrets in place, monitoring and alerts ready,
     support/product told (→ `product`);
   - the exact deploy commands and the exact rollback commands, with targets;
   - post-deploy verification: smoke checks, golden signals for N minutes, error tracker.
3. **First launch** — add a production-readiness review: monitoring and alerting with runbooks,
   tested restore, on-call owner, capacity estimate, security basics (→ `security`), status page
   and support path.
4. **Approval** — present the checklist and ask the founder to approve the deploy **as written**
   (hard rule 1). Run only the approved steps, one by one, stopping at the first unexpected
   result; anything not in the approved text needs a new approval. The founder may prefer to run
   the steps themselves — then you watch the signals and verify.
5. **Record** the outcome in the release file (approved by, when, result, verification), any
   failure as an incident (`incident`), and `ai-devops:log-job`.
