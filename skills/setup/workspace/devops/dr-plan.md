# Backups and disaster recovery plan

> Written by `backup-dr`. Can the company get its data and service back, how much would be lost
> (RPO) and how long it would take (RTO)? A backup that was never restored is a hope, not a plan.

## Targets
| Product / service | RPO (max data loss) | RTO (max downtime) | Agreed with founder on | Contract/SLA commitments (ask lawyer) |
|---|---|---|---|---|

## Backups per data store (3-2-1: 3 copies, 2 media, 1 off-site; + 1 immutable/offline)
| Data store | What is backed up | How (tool, schedule) | Retention | Copies / locations | Off-site? | Immutable / offline? | Encrypted? | Last success | Last restore test |
|---|---|---|---|---|---|---|---|---|---|

## Restore tests
| Date | Data store | Restored to | Time taken | Data checked how | Result | Gaps found |
|---|---|---|---|---|---|---|

## Disaster scenarios
| Scenario | Impact | Recovery steps (runbook) | Who | Est. time | Last rehearsed |
|---|---|---|---|---|---|
| Accidental deletion of production data | | | | | |
| Provider region / account outage | | | | | |
| Account compromise / lost access to provider | | | | | |
| Ransomware or malicious deletion | | | | | |
| Loss of the person who knows how it works | | | | | |

## Things outside the cloud
Source code (remote + another copy), DNS and registrar access, password manager / vault recovery,
CI/CD secrets, signing keys, documentation: where each lives and how to recover it.
