# Infrastructure inventory

> Everything the products run on, who owns it and when it expires. Written by `infra-inventory`
> and `log-job`. `?` = unknown. **Never write secret values here** — only where a secret lives,
> who owns it and when it was rotated. Renewal dates also go to `history/obligations.md`.

## Providers and accounts
| Provider | What for | Account owner (role) | Billing owner | Plan / tier | MFA on? | Renews / expires | Notes |
|---|---|---|---|---|---|---|---|

## Environments and services
| Product | Environment | Service / component | Runs on (provider, region) | Deployed how | Config source | Owner | Notes |
|---|---|---|---|---|---|---|---|

## Data stores
| Product | Store (type, engine + version) | Environment | Holds personal data? | Backups (see dr-plan.md) | Notes |
|---|---|---|---|---|---|

## Domains, DNS and certificates
| Domain | Registrar | DNS host | Expires | Certificate (issuer, auto-renew?) | Cert expires | Notes |
|---|---|---|---|---|---|---|

## Repositories and CI/CD
| Product | Repository | CI/CD system | Pipeline file | Deploy target | Protected main branch? | Notes |
|---|---|---|---|---|---|---|

## Secrets (locations only)
| Secret (name / purpose) | Stored in | Used by | Owner | Last rotated | Notes |
|---|---|---|---|---|---|

## Access
| Person / role | Systems | Level | Granted | Review by |
|---|---|---|---|---|

## Escalation settings
- **Cost threshold:** escalate any monthly cost increase above **TBD** (local currency) or any
  prepaid commitment / plan upgrade above **TBD**.
- **Human help in place:** none yet (on-call contractor, managed-service support plan, agency).
- **Production access for the agent:** none / read-only / as approved per action (record what the
  founder grants; hard rule 1 applies whatever access exists).

## Change log
Changes to this file are recorded in the journal (J-xxxx).
